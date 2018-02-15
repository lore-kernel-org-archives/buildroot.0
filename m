From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Feb 2018 23:03:44 +0100
Subject: [Buildroot] [PATCH next 4/5] support/scripts/pkg-stats-new: add
 latest upstream version information
In-Reply-To: <20180215220345.8532-1-thomas.petazzoni@bootlin.com>
References: <20180215220345.8532-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180215220345.8532-5-thomas.petazzoni@bootlin.com>
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
 support/scripts/pkg-stats-new | 120 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/support/scripts/pkg-stats-new b/support/scripts/pkg-stats-new
index 32227a8906..0d682656df 100755
--- a/support/scripts/pkg-stats-new
+++ b/support/scripts/pkg-stats-new
@@ -7,6 +7,10 @@ from collections import defaultdict
 import re
 import subprocess
 import sys
+import json
+import urllib2
+from Queue import Queue
+from threading import Thread
 
 class Package:
     def __init__(self, name):
@@ -19,6 +23,7 @@ class Package:
         self.patch_count = 0
         self.warnings = 0
         self.current_version = None
+        self.latest_version = None
     def __str__(self):
         return "%s (path='%s', license='%s', license_files='%s', hash='%s', patches=%d)" % \
             (self.name, self.path, self.has_license, self.has_license_files, self.has_hash, self.patch_count)
@@ -211,6 +216,70 @@ def add_check_package_warnings(packages):
     for name, pkg in packages.iteritems():
         pkg.warnings = get_check_package_warnings(os.path.dirname(pkg.path))
 
+RELEASE_MONITORING_API = "http://release-monitoring.org/api"
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
+def get_latest_version_by_guess(package):
+    req = urllib2.Request(os.path.join(RELEASE_MONITORING_API, "projects", "?pattern=%s" % package))
+    f = urllib2.urlopen(req)
+    data = json.loads(f.read())
+    for p in data['projects']:
+        if p['name'] == package and len(p['versions']) > 0:
+            return (False, p['versions'][0], p['id'])
+    return (False, None, None)
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
+def get_version_worker(q):
+    while True:
+        name, pkg = q.get()
+        pkg.latest_version = get_latest_version(name)
+        print " [%04d] %s  => %s" % (q.qsize(), name, str(pkg.latest_version))
+        q.task_done()
+
+# Fills in the .latest_version field of all Package objects
+#
+# This field has a special format:
+#   (mapping, version, id)
+# with:
+#  - mapping: boolean that indicates whether release-monitoring.org
+#    has a mapping for this package name in the Buildroot distribution
+#    or not
+#  - version: string containing the latest version known by
+#    release-monitoring.org for this package
+#  - id: string containing the id of the project corresponding to this
+#    package, as known by release-monitoring.org
+def add_latest_version_info(packages):
+    q = Queue()
+    for name, pkg in packages.iteritems():
+        q.put((name, pkg))
+    # Since release-monitoring.org is rather slow, we create 8 threads
+    # that do HTTP requests to the site.
+    for i in range(8):
+        t = Thread(target=get_version_worker, args=[q])
+        t.daemon = True
+        t.start()
+    q.join()
 
 def calculate_stats(packages):
     stats = defaultdict(int)
@@ -236,6 +305,16 @@ def calculate_stats(packages):
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
 
@@ -371,6 +450,34 @@ def dump_html_pkg(f, pkg):
     # Current version
     f.write("  <td class=\"centered\">%s</td>" % pkg.current_version)
 
+    # Latest version
+    if pkg.latest_version[1] == None:
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
+    f.write("  <td class=\"%s\">%s</td>" % \
+            (" ".join(td_class), latest_version_text))
+
     # Warnings
     td_class = ["centered"]
     if pkg.warnings == 0:
@@ -393,6 +500,7 @@ def dump_html_all_pkgs(f, packages):
 <td class=\"centered\">License files</td>
 <td class=\"centered\">Hash file</td>
 <td class=\"centered\">Current version</td>
+<td class=\"centered\">Latest version</td>
 <td class=\"centered\">Warnings</td>
 </tr>""")
     for name, pkg in sorted(packages.iteritems()):
@@ -419,6 +527,16 @@ def dump_html_stats(f, stats):
             stats["no-hash"])
     f.write("<tr><td>Total number of patches</td><td>%s</td></tr>" %
             stats["patches"])
+    f.write("<tr><td>Packages having a mapping on <i>release-monitoring.org</i></td><td>%s</td></tr>" %
+            stats["rmo-mapping"])
+    f.write("<tr><td>Packages lacking a mapping on <i>release-monitoring.org</i></td><td>%s</td></tr>" %
+            stats["rmo-no-mapping"])
+    f.write("<tr><td>Packages that are up-to-date</td><td>%s</td></tr>" %
+            stats["version-uptodate"])
+    f.write("<tr><td>Packages that are not up-to-date</td><td>%s</td></tr>" %
+            stats["version-not-uptodate"])
+    f.write("<tr><td>Packages with no known upstream version</td><td>%s</td></tr>" %
+            stats["version-unknown"])
     f.write("</table>")
 
 def dump_html(packages, stats, output):
@@ -459,6 +577,8 @@ def __main__():
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
