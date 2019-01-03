From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  3 Jan 2019 09:38:18 +0100
Subject: [Buildroot] [PATCH v5] support/scripts/pkg-stats: add latest
 upstream version information
Message-ID: <20190103083818.19702-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds fetching the latest upstream version of each package
from release-monitoring.org.

The fetching process first tries to use the package mappings of the
"Buildroot" distribution [1]. This mapping mechanism allows to tell
release-monitoring.org what is the name of a package in a given
distribution/build-system. For example, the package xutil_util-macros
in Buildroot is named xorg-util-macros on release-monitoring.org. This
mapping can be seen in the section "Mappings" of
https://release-monitoring.org/project/15037/.

If there is no mapping, then it does a regular search, and within the
search results, looks for a package whose name matches the Buildroot
name.

Even though fetching from release-monitoring.org is a bit slow, using
multiprocessing.Pool has proven to not be reliable, with some requests
ending up with an exception. So we keep a serialized approach, but
with a single HTTPSConnectionPool() for all queries. Long term, we
hope to be able to use a database dump of release-monitoring.org
instead.

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
Changes since v4:
- Don't use multiprocessing.Pool(), stick to a serialized approach,
  which is more reliable.
- Handle errors/exceptions properly.
- Improve the layout of the resulting table column.

Changes since v3:
- Use Pool(), like is done for the upstream URL checking added by Matt
  Weber
- Use the requests Python module instead of the urllib2 Python module,
  so that we use the same module as the one used for the upstream URL
  checking
- Adjusted to work with the latest pkg-stats code

Changes since v2:
- Use the "timeout" argument of urllib2.urlopen() in order to make
  sure that the requests terminate at some point, even if
  release-monitoring.org is stuck.
- Move a lot of the logic as methods of the Package() class.

Changes since v1:
- Fix flake8 warnings
- Add missing newline in HTML
---
 support/scripts/pkg-stats | 137 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index d0b06b1e74..d32087cda1 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -25,11 +25,19 @@ import re
 import subprocess
 import sys
 import requests  # URL checking
+import json
+import certifi
+from urllib3 import HTTPSConnectionPool
 from multiprocessing import Pool
 
 INFRA_RE = re.compile("\$\(eval \$\(([a-z-]*)-package\)\)")
 URL_RE = re.compile("\s*https?://\S*\s*$")
+RELEASE_MONITORING_API = "http://release-monitoring.org/api"
 
+RM_API_STATUS_ERROR = 1
+RM_API_STATUS_FOUND_BY_DISTRO = 2
+RM_API_STATUS_FOUND_BY_PATTERN = 3
+RM_API_STATUS_NOT_FOUND = 4
 
 class Package:
     all_licenses = list()
@@ -49,6 +57,7 @@ class Package:
         self.url = None
         self.url_status = None
         self.url_worker = None
+        self.latest_version = None
 
     def pkgvar(self):
         return self.name.upper().replace("-", "_")
@@ -297,6 +306,66 @@ def check_package_urls(packages):
     for pkg in packages:
         pkg.url_status = pkg.url_worker.get(timeout=3600)
 
+def release_monitoring_get_latest_version_by_distro(pool, name):
+    try:
+        req = pool.request('GET', "/api/project/Buildroot/%s" % name)
+    except:
+        return (RM_API_STATUS_ERROR, None, None)
+
+    if req.status != 200:
+        return (RM_API_STATUS_NOT_FOUND, None, None)
+
+    data = json.loads(req.data)
+
+    if len(data['versions']) > 0:
+        return (RM_API_STATUS_FOUND_BY_DISTRO, data['versions'][0], data['id'])
+    else:
+        return (RM_API_STATUS_FOUND_BY_DISTRO, None, data['id'])
+
+def release_monitoring_get_latest_version_by_guess(pool, name):
+    try:
+        req = pool.request('GET', "/api/projects/?pattern=%s" % name)
+    except:
+        print("Exception release_monitoring_get_latest_version_by_guess for '%s': %s" % (name, err))
+        return (RM_API_STATUS_ERROR, None, None)
+
+    if req.status != 200:
+        return (RM_API_STATUS_NOT_FOUND, None, None)
+
+    data = json.loads(req.data)
+
+    for p in data['projects']:
+        if p['name'] == name and len(p['versions']) > 0:
+            return (RM_API_STATUS_FOUND_BY_PATTERN, p['versions'][0], p['id'])
+
+    return (RM_API_STATUS_NOT_FOUND, None, None)
+
+def check_package_latest_version(packages):
+    """
+    Fills in the .latest_version field of all Package objects
+
+    This field has a special format:
+      (status, version, id)
+    with:
+    - status: one of RM_API_STATUS_ERROR,
+      RM_API_STATUS_FOUND_BY_DISTRO, RM_API_STATUS_FOUND_BY_PATTERN,
+      RM_API_STATUS_NOT_FOUND
+    - version: string containing the latest version known by
+      release-monitoring.org for this package
+    - id: string containing the id of the project corresponding to this
+      package, as known by release-monitoring.org
+    """
+    pool = HTTPSConnectionPool('release-monitoring.org', port=443,
+                               cert_reqs='CERT_REQUIRED', ca_certs=certifi.where())
+    count = 0
+    for pkg in packages:
+        v = release_monitoring_get_latest_version_by_distro(pool, pkg.name)
+        if v[0] == RM_API_STATUS_NOT_FOUND:
+            v = release_monitoring_get_latest_version_by_guess(pool, pkg.name)
+
+        pkg.latest_version = v
+        print("[%d/%d] Package %s" % (count, len(packages), pkg.name))
+        count += 1
 
 def calculate_stats(packages):
     stats = defaultdict(int)
@@ -322,6 +391,16 @@ def calculate_stats(packages):
             stats["hash"] += 1
         else:
             stats["no-hash"] += 1
+        if pkg.latest_version[0] == RM_API_STATUS_FOUND_BY_DISTRO:
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
 
@@ -354,6 +433,7 @@ td.somepatches {
 td.lotsofpatches {
   background: #ff9a69;
 }
+
 td.good_url {
   background: #d2ffc4;
 }
@@ -363,6 +443,20 @@ td.missing_url {
 td.invalid_url {
   background: #ff9a69;
 }
+
+td.version-good {
+  background: #d2ffc4;
+}
+td.version-needs-update {
+  background: #ff9a69;
+}
+td.version-unknown {
+ background: #ffd870;
+}
+td.version-error {
+ background: #ccc;
+}
+
 </style>
 <title>Statistics of Buildroot packages</title>
 </head>
@@ -465,6 +559,36 @@ def dump_html_pkg(f, pkg):
         current_version = pkg.current_version
     f.write("  <td class=\"centered\">%s</td>\n" % current_version)
 
+    # Latest version
+    if pkg.latest_version[0] == RM_API_STATUS_ERROR:
+        td_class.append("version-error")
+    if pkg.latest_version[1] is None:
+        td_class.append("version-unknown")
+    elif pkg.latest_version[1] != pkg.current_version:
+        td_class.append("version-needs-update")
+    else:
+        td_class.append("version-good")
+
+    if pkg.latest_version[0] == RM_API_STATUS_ERROR:
+        latest_version_text = "<b>Error</b>"
+    elif pkg.latest_version[0] == RM_API_STATUS_NOT_FOUND:
+        latest_version_text = "<b>Not found</b>"
+    else:
+        if pkg.latest_version[1] is None:
+            latest_version_text = "<b>Found, but not version</b>"
+        else:
+            latest_version_text = "<a href=\"https://release-monitoring.org/project/%s\"><b>%s</b></a>" % (pkg.latest_version[2], str(pkg.latest_version[1]))
+
+        latest_version_text += "<br/>"
+
+        if pkg.latest_version[0] == RM_API_STATUS_FOUND_BY_DISTRO:
+            latest_version_text += "found by <a href=\"https://release-monitoring.org/distro/Buildroot/\">distro</a>"
+        else:
+            latest_version_text += "found by guess"
+
+    f.write("  <td class=\"%s\">%s</td>\n" %
+            (" ".join(td_class), latest_version_text))
+
     # Warnings
     td_class = ["centered"]
     if pkg.warnings == 0:
@@ -502,6 +626,7 @@ def dump_html_all_pkgs(f, packages):
 <td class=\"centered\">License files</td>
 <td class=\"centered\">Hash file</td>
 <td class=\"centered\">Current version</td>
+<td class=\"centered\">Latest version</td>
 <td class=\"centered\">Warnings</td>
 <td class=\"centered\">Upstream URL</td>
 </tr>
@@ -532,6 +657,16 @@ def dump_html_stats(f, stats):
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
 
 
@@ -587,6 +722,8 @@ def __main__():
         pkg.set_url()
     print("Checking URL status")
     check_package_urls(packages)
+    print("Getting latest versions ...")
+    check_package_latest_version(packages)
     print("Calculate stats")
     stats = calculate_stats(packages)
     print("Write HTML")
-- 
2.20.1
