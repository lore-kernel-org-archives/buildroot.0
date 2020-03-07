From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Mar 2020 15:59:14 +0100
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: store latest
 version in a dict
Message-ID: <20200309140909.91DB18894D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c46e7071829a5af934e0b7d894d74988b0c0631e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch changes the type of the latest_version variable to a dict.
This is for better readability/usability of the data. With this the json
output is more descriptive in later processing of the json output.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 8a67e509e1..95ec9e86bd 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -71,7 +71,7 @@ class Package:
         self.url_status = None
         self.url_worker = None
         self.cves = list()
-        self.latest_version = (RM_API_STATUS_ERROR, None, None)
+        self.latest_version = {'status': RM_API_STATUS_ERROR, 'version': None, 'id': None}
 
     def pkgvar(self):
         return self.name.upper().replace("-", "_")
@@ -462,9 +462,8 @@ def check_package_latest_version(packages):
     """
     Fills in the .latest_version field of all Package objects
 
-    This field has a special format:
-      (status, version, id)
-    with:
+    This field is a dict and has the following keys:
+
     - status: one of RM_API_STATUS_ERROR,
       RM_API_STATUS_FOUND_BY_DISTRO, RM_API_STATUS_FOUND_BY_PATTERN,
       RM_API_STATUS_NOT_FOUND
@@ -480,7 +479,7 @@ def check_package_latest_version(packages):
     worker_pool = Pool(processes=64)
     results = worker_pool.map(check_package_latest_version_worker, (pkg.name for pkg in packages))
     for pkg, r in zip(packages, results):
-        pkg.latest_version = r
+        pkg.latest_version = dict(zip(['status', 'version', 'id'], r))
     worker_pool.terminate()
     del http_pool
 
@@ -519,13 +518,13 @@ def calculate_stats(packages):
             stats["hash"] += 1
         else:
             stats["no-hash"] += 1
-        if pkg.latest_version[0] == RM_API_STATUS_FOUND_BY_DISTRO:
+        if pkg.latest_version['status'] == RM_API_STATUS_FOUND_BY_DISTRO:
             stats["rmo-mapping"] += 1
         else:
             stats["rmo-no-mapping"] += 1
-        if not pkg.latest_version[1]:
+        if not pkg.latest_version['version']:
             stats["version-unknown"] += 1
-        elif pkg.latest_version[1] == pkg.current_version:
+        elif pkg.latest_version['version'] == pkg.current_version:
             stats["version-uptodate"] += 1
         else:
             stats["version-not-uptodate"] += 1
@@ -691,29 +690,29 @@ def dump_html_pkg(f, pkg):
     f.write("  <td class=\"centered\">%s</td>\n" % current_version)
 
     # Latest version
-    if pkg.latest_version[0] == RM_API_STATUS_ERROR:
+    if pkg.latest_version['status'] == RM_API_STATUS_ERROR:
         td_class.append("version-error")
-    if pkg.latest_version[1] is None:
+    if pkg.latest_version['version'] is None:
         td_class.append("version-unknown")
-    elif pkg.latest_version[1] != pkg.current_version:
+    elif pkg.latest_version['version'] != pkg.current_version:
         td_class.append("version-needs-update")
     else:
         td_class.append("version-good")
 
-    if pkg.latest_version[0] == RM_API_STATUS_ERROR:
+    if pkg.latest_version['status'] == RM_API_STATUS_ERROR:
         latest_version_text = "<b>Error</b>"
-    elif pkg.latest_version[0] == RM_API_STATUS_NOT_FOUND:
+    elif pkg.latest_version['status'] == RM_API_STATUS_NOT_FOUND:
         latest_version_text = "<b>Not found</b>"
     else:
-        if pkg.latest_version[1] is None:
+        if pkg.latest_version['version'] is None:
             latest_version_text = "<b>Found, but no version</b>"
         else:
             latest_version_text = "<a href=\"https://release-monitoring.org/project/%s\"><b>%s</b></a>" % \
-                (pkg.latest_version[2], str(pkg.latest_version[1]))
+                (pkg.latest_version['id'], str(pkg.latest_version['version']))
 
         latest_version_text += "<br/>"
 
-        if pkg.latest_version[0] == RM_API_STATUS_FOUND_BY_DISTRO:
+        if pkg.latest_version['status'] == RM_API_STATUS_FOUND_BY_DISTRO:
             latest_version_text += "found by <a href=\"https://release-monitoring.org/distro/Buildroot/\">distro</a>"
         else:
             latest_version_text += "found by guess"
