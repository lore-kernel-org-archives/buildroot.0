From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 22 Feb 2020 09:57:15 +0100
Subject: [Buildroot] [PATCH v3 11/12] support/scripts/pkg-stats: initialize
 all package status checks
In-Reply-To: <20200222085715.23769-1-heiko.thiery@gmail.com>
References: <20200222085715.23769-1-heiko.thiery@gmail.com>
Message-ID: <20200222085715.23769-12-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also the list of status checks is added to the json output.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 support/scripts/pkg-stats | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index be3b6d7e71..ed22f6b650 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -87,6 +87,11 @@ class Package:
     all_license_files = dict()
     all_versions = dict()
     all_ignored_cves = dict()
+    # This is the list of all possible checks. Add new checks to this list so
+    # a tool that post-processeds the json output knows the checks before
+    # iterating over the packages.
+    status_checks = ['cve', 'developers', 'hash', 'hash-license', 'license',
+                     'license-files', 'patches', 'pkg-check', 'url', 'version']
 
     def __init__(self, name, path):
         self.name = name
@@ -103,7 +108,15 @@ class Package:
         self.url_worker = None
         self.cves = list()
         self.latest_version = {'status': RM_API_STATUS_ERROR, 'version': None, 'id': None}
+        self.init_check_status()
+
+    def init_check_status(self):
+        """
+        Set the status of all check to 'na'.
+        """
         self.status = {}
+        for check in self.status_checks:
+            self.status[check] = ("na", "no status check done")
 
     def pkgvar(self):
         return self.name.upper().replace("-", "_")
@@ -975,6 +988,7 @@ def dump_json(packages, defconfigs, stats, date, commit, output):
     final = {'packages': pkgs,
              'stats': statistics,
              'defconfigs': defconfigs,
+             'package_status_checks': Package.status_checks,
              'commit': commit,
              'date': str(date)}
 
-- 
2.20.1
