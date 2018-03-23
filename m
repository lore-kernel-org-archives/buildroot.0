From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Mar 2018 21:54:54 +0100
Subject: [Buildroot] [PATCH v3 4/5] support/scripts/pkg-stats-new: add
 latest upstream version information
In-Reply-To: <20180323205455.24789-1-thomas.petazzoni@bootlin.com>
References: <20180323205455.24789-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180323205455.24789-5-thomas.petazzoni@bootlin.com>
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
Changes since v2:
- Use the "timeout" argument of urllib2.urlopen() in order to make
  sure that the requests terminate at some point, even if
  release-monitoring.org is stuck.
- Move a lot of the logic as methods of the Package() class.

Changes since v1:
- Fix flake8 warnings
- Add missing newline in HTML
---
 support/scripts/pkg-stats-new | 138 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/support/scripts/pkg-stats-new b/support/scripts/pkg-stats-new
index 43f7e8d543..830040a485 100755
--- a/support/scripts/pkg-stats-new
+++ b/support/scripts/pkg-stats-new
@@ -24,8 +24,13 @@ from collections import defaultdict
 import re
 import subprocess
 import sys
+import json
+import urllib2
+from Queue import Queue
+from threading import Thread
 
 INFRA_RE = re.compile("\$\(eval \$\(([a-z-]*)-package\)\)")
+RELEASE_MONITORING_API = "http://release-monitoring.org/api"
 
 
 class Package:
@@ -43,6 +48,7 @@ class Package:
         self.patch_count = 0
         self.warnings = 0
         self.current_version = None
+        self.latest_version = None
 
     def pkgvar(self):
         return self.name.upper().replace("-", "_")
@@ -116,6 +122,43 @@ class Package:
                 self.warnings = int(m.group(1))
                 return
 
+    def get_latest_version_by_distro(self):
+        try:
+            req = urllib2.Request(os.path.join(RELEASE_MONITORING_API, "project", "Buildroot", self.name))
+            f = urllib2.urlopen(req, timeout=15)
+        except:
+            # Exceptions can typically be a timeout, or a 404 error if not project
+            return (False, None, None)
+        data = json.loads(f.read())
+        if len(data['versions']) > 0:
+            return (True, data['versions'][0], data['id'])
+        else:
+            return (True, None, data['id'])
+
+    def get_latest_version_by_guess(self):
+        try:
+            req = urllib2.Request(os.path.join(RELEASE_MONITORING_API, "projects", "?pattern=%s" % self.name))
+            f = urllib2.urlopen(req, timeout=15)
+        except:
+            # Exceptions can typically be a timeout, or a 404 error if not project
+            return (False, None, None)
+        data = json.loads(f.read())
+        for p in data['projects']:
+            if p['name'] == self.name and len(p['versions']) > 0:
+                return (False, p['versions'][0], p['id'])
+        return (False, None, None)
+
+    def set_latest_version(self):
+        # We first try by using the "Buildroot" distribution on
+        # release-monitoring.org, if it has a mapping for the current
+        # package name.
+        self.latest_version = self.get_latest_version_by_distro()
+        if self.latest_version == (False, None, None):
+            # If that fails because there is no mapping or because we had a
+            # request timeout, we try to search in all packages for a package
+            # of this name.
+            self.latest_version = self.get_latest_version_by_guess()
+
     def __eq__(self, other):
         return self.path == other.path
 
@@ -255,6 +298,41 @@ def package_init_make_info():
         Package.all_versions[pkgvar] = value
 
 
+def set_version_worker(q):
+    while True:
+        pkg = q.get()
+        pkg.set_latest_version()
+        print " [%04d] %s => %s" % (q.qsize(), pkg.name, str(pkg.latest_version))
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
+        t = Thread(target=set_version_worker, args=[q])
+        t.daemon = True
+        t.start()
+    q.join()
+
+
 def calculate_stats(packages):
     stats = defaultdict(int)
     for pkg in packages:
@@ -279,6 +357,16 @@ def calculate_stats(packages):
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
 
@@ -311,6 +399,15 @@ td.somepatches {
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
@@ -413,6 +510,34 @@ def dump_html_pkg(f, pkg):
         current_version = pkg.current_version
     f.write("  <td class=\"centered\">%s</td>\n" % current_version)
 
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
@@ -436,6 +561,7 @@ def dump_html_all_pkgs(f, packages):
 <td class=\"centered\">License files</td>
 <td class=\"centered\">Hash file</td>
 <td class=\"centered\">Current version</td>
+<td class=\"centered\">Latest version</td>
 <td class=\"centered\">Warnings</td>
 </tr>
 """)
@@ -465,6 +591,16 @@ def dump_html_stats(f, stats):
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
 
 
@@ -517,6 +653,8 @@ def __main__():
         pkg.set_patch_count()
         pkg.set_check_package_warnings()
         pkg.set_current_version()
+    print "Getting latest versions ..."
+    add_latest_version_info(packages)
     print "Calculate stats"
     stats = calculate_stats(packages)
     print "Write HTML"
-- 
2.14.3
