From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Feb 2018 23:13:41 +0100
Subject: [Buildroot] [PATCH next v2 4/5] support/scripts/pkg-stats-new: add
 latest upstream version information
In-Reply-To: <20180221221342.15683-1-thomas.petazzoni@bootlin.com>
References: <20180221221342.15683-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180221221342.15683-5-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds fetching the latest upstream version of each package
from release-monitoring.org.

The fetching process first tries to use the package mappings of the
"Buildroot" distribution [1]. If there is no result, then it does a
regular search, and within the search results, looks for a package
whose name matches the Buildroot name.

Since release-monitoring.org is a bit slow, we have 8 threads that
fetch information in parallel.

From an output point of view, the latest version column:

 - Is green when the version in Buildroot matches the latest upstream
   version

 - Is orange when the latest upstream version is unknown because the
   package was not found on release-monitoring.org

 - Is red when the version in Buildroot doesn't match the latest
   upstream version. Note that we are not doing anything smart here:
   we are just testing if the strings are equal or not.

 - The cell contains the link to the project on release-monitoring.org
   if found.

 - The cell indicates if the match was done using a distro mapping, or
   through a regular search.

[1] https://release-monitoring.org/distro/Buildroot/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Changes since v1:
- Fix flake8 warnings
- Add missing newline in HTML
---
 support/scripts/pkg-stats-new | 142 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/support/scripts/pkg-stats-new b/support/scripts/pkg-stats-new
index c4174877aa..b27f4df9a8 100755
--- a/support/scripts/pkg-stats-new
+++ b/support/scripts/pkg-stats-new
@@ -24,6 +24,10 @@ from collections import defaultdict
 import re
 import subprocess
 import sys
+import json
+import urllib2
+from Queue import Queue
+from threading import Thread
 
 
 class Package:
@@ -37,6 +41,7 @@ class Package:
         self.patch_count = 0
         self.warnings = 0
         self.current_version = None
+        self.latest_version = None
 
     def __eq__(self, other):
         return self.path == other.path
@@ -259,6 +264,83 @@ def add_check_package_warnings(packages):
         pkg.warnings = get_check_package_warnings(os.path.dirname(pkg.path))
 
 
+RELEASE_MONITORING_API = "http://release-monitoring.org/api"
+
+
+def get_latest_version_by_distro(package):
+    req = urllib2.Request(os.path.join(RELEASE_MONITORING_API, "project", "Buildroot", package))
+    f = urllib2.urlopen(req)
+    data = json.loads(f.read())
+    if len(data['versions']) > 0:
+        return (True, data['versions'][0], data['id'])
+    else:
+        return (True, None, data['id'])
+
+
+def get_latest_version_by_guess(package):
+    req = urllib2.Request(os.path.join(RELEASE_MONITORING_API, "projects", "?pattern=%s" % package))
+    f = urllib2.urlopen(req)
+    data = json.loads(f.read())
+    for p in data['projects']:
+        if p['name'] == package and len(p['versions']) > 0:
+            return (False, p['versions'][0], p['id'])
+    return (False, None, None)
+
+
+def get_latest_version(package):
+    try:
+        # We first try by using the "Buildroot" distribution on
+        # release-monitoring.org, if it has a mapping for the current
+        # package name.
+        return get_latest_version_by_distro(package)
+    except urllib2.HTTPError, e:
+        # If that fails because there is no mapping, we try to search
+        # in all packages for a package of this name.
+        if e.code == 404:
+            return get_latest_version_by_guess(package)
+        else:
+            return (False, None, None)
+
+
+def get_version_worker(q):
+    while True:
+        pkg = q.get()
+        try:
+            pkg.latest_version = get_latest_version(pkg.name)
+            print " [%04d] %s => %s" % (q.qsize(), pkg.name, str(pkg.latest_version))
+        except ValueError:
+            pkg.latest_version = (False, None, None)
+            print " [%04d] %s => Value Error" % (q.qsize(), pkg.name)
+        q.task_done()
+
+
+def add_latest_version_info(packages):
+    """
+    Fills in the .latest_version field of all Package objects
+
+    This field has a special format:
+      (mapping, version, id)
+    with:
+    - mapping: boolean that indicates whether release-monitoring.org
+      has a mapping for this package name in the Buildroot distribution
+      or not
+    - version: string containing the latest version known by
+      release-monitoring.org for this package
+    - id: string containing the id of the project corresponding to this
+      package, as known by release-monitoring.org
+    """
+    q = Queue()
+    for pkg in packages:
+        q.put(pkg)
+    # Since release-monitoring.org is rather slow, we create 8 threads
+    # that do HTTP requests to the site.
+    for i in range(8):
+        t = Thread(target=get_version_worker, args=[q])
+        t.daemon = True
+        t.start()
+    q.join()
+
+
 def calculate_stats(packages):
     stats = defaultdict(int)
     for pkg in packages:
@@ -283,6 +365,16 @@ def calculate_stats(packages):
             stats["hash"] += 1
         else:
             stats["no-hash"] += 1
+        if pkg.latest_version[0]:
+            stats["rmo-mapping"] += 1
+        else:
+            stats["rmo-no-mapping"] += 1
+        if not pkg.latest_version[1]:
+            stats["version-unknown"] += 1
+        elif pkg.latest_version[1] == pkg.current_version:
+            stats["version-uptodate"] += 1
+        else:
+            stats["version-not-uptodate"] += 1
         stats["patches"] += pkg.patch_count
     return stats
 
@@ -315,6 +407,15 @@ td.somepatches {
 td.lotsofpatches {
   background: #ff9a69;
 }
+td.version-good {
+  background: #d2ffc4;
+}
+td.version-needs-update {
+  background: #ff9a69;
+}
+td.version-unknown {
+ background: #ffd870;
+}
 </style>
 <title>Statistics of Buildroot packages</title>
 </head>
@@ -413,6 +514,34 @@ def dump_html_pkg(f, pkg):
     # Current version
     f.write("  <td class=\"centered\">%s</td>\n" % pkg.current_version)
 
+    # Latest version
+    if pkg.latest_version[1] is None:
+        td_class.append("version-unknown")
+    elif pkg.latest_version[1] != pkg.current_version:
+        td_class.append("version-needs-update")
+    else:
+        td_class.append("version-good")
+
+    if pkg.latest_version[1] is None:
+        latest_version_text = "<b>Unknown</b>"
+    else:
+        latest_version_text = "<b>%s</b>" % str(pkg.latest_version[1])
+
+    latest_version_text += "<br/>"
+
+    if pkg.latest_version[2]:
+        latest_version_text += "<a href=\"https://release-monitoring.org/project/%s\">link</a>, " % pkg.latest_version[2]
+    else:
+        latest_version_text += "no link, "
+
+    if pkg.latest_version[0]:
+        latest_version_text += "has <a href=\"https://release-monitoring.org/distro/Buildroot/\">mapping</a>"
+    else:
+        latest_version_text += "has <a href=\"https://release-monitoring.org/distro/Buildroot/\">no mapping</a>"
+
+    f.write("  <td class=\"%s\">%s</td>\n" %
+            (" ".join(td_class), latest_version_text))
+
     # Warnings
     td_class = ["centered"]
     if pkg.warnings == 0:
@@ -436,6 +565,7 @@ def dump_html_all_pkgs(f, packages):
 <td class=\"centered\">License files</td>
 <td class=\"centered\">Hash file</td>
 <td class=\"centered\">Current version</td>
+<td class=\"centered\">Latest version</td>
 <td class=\"centered\">Warnings</td>
 </tr>
 """)
@@ -465,6 +595,16 @@ def dump_html_stats(f, stats):
             stats["no-hash"])
     f.write(" <tr><td>Total number of patches</td><td>%s</td></tr>\n" %
             stats["patches"])
+    f.write("<tr><td>Packages having a mapping on <i>release-monitoring.org</i></td><td>%s</td></tr>\n" %
+            stats["rmo-mapping"])
+    f.write("<tr><td>Packages lacking a mapping on <i>release-monitoring.org</i></td><td>%s</td></tr>\n" %
+            stats["rmo-no-mapping"])
+    f.write("<tr><td>Packages that are up-to-date</td><td>%s</td></tr>\n" %
+            stats["version-uptodate"])
+    f.write("<tr><td>Packages that are not up-to-date</td><td>%s</td></tr>\n" %
+            stats["version-not-uptodate"])
+    f.write("<tr><td>Packages with no known upstream version</td><td>%s</td></tr>\n" %
+            stats["version-unknown"])
     f.write("</table>\n")
 
 
@@ -517,6 +657,8 @@ def __main__():
     add_patch_count(packages)
     print "Get package warnings ..."
     add_check_package_warnings(packages)
+    print "Get latest version ..."
+    add_latest_version_info(packages)
     print "Calculate stats"
     stats = calculate_stats(packages)
     print "Write HTML"
-- 
2.14.3
