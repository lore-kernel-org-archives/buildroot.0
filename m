From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 24 Jun 2021 14:57:03 +0200
Subject: [Buildroot] [PATCH] support/scripts/pkg-stats: add infra_coinfig to
 json_output
Message-ID: <20210624125702.22106-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When we use the statistics output to generate a CVE/CPE customer report
showing whether a product is affected by CVEs, we are primarily interested
in whether they are relevant to the target system. Currently we cannot see
if the package is configured for the build (infra==host) and/or the
target system (infra==target).

Therefore, in case of a given configuration, this information is also
stored in the JSON output.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 support/scripts/pkg-stats | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index cc91d13167..f4dd034bd9 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -89,6 +89,7 @@ class Package:
         self.path = path
         self.pkg_path = os.path.dirname(path)
         self.infras = None
+        self.infra_config = None
         self.license = None
         self.has_license = False
         self.has_license_files = False
@@ -146,9 +147,9 @@ class Package:
             return False
         return True
 
-    def set_infra(self):
+    def set_infra(self, config_info):
         """
-        Fills in the .infras field
+        Fills in the .infras and ..infra_config fields
         """
         self.infras = list()
         with open(os.path.join(brpath, self.path), 'r') as f:
@@ -163,6 +164,13 @@ class Package:
                 else:
                     self.infras.append(("target", infra))
 
+        if config_info:
+            for pkg_name in config_info:
+                if config_info[pkg_name]['name'] == self.name:
+                    if self.infra_config == None:
+                        self.infra_config = list()
+                    self.infra_config.append(config_info[pkg_name]['type'])
+
     def set_license(self):
         """
         Fills in the .status['license'] and .status['license-files'] fields
@@ -369,8 +377,8 @@ def get_pkglist(npackages, package_list):
 
 def get_config_packages():
     cmd = ["make", "--no-print-directory", "show-info"]
-    js = json.loads(subprocess.check_output(cmd))
-    return set([v["name"] for v in js.values()])
+    config_info = json.loads(subprocess.check_output(cmd))
+    return (config_info, set([v["name"] for v in config_info.values()]))
 
 
 def package_init_make_info():
@@ -1115,10 +1123,11 @@ def __main__():
     if args.nvd_path:
         import cve as cvecheck
 
+    config_info = None
     if args.packages:
         package_list = args.packages.split(",")
     elif args.configpackages:
-        package_list = get_config_packages()
+        (config_info, package_list) = get_config_packages()
     else:
         package_list = None
     date = datetime.datetime.utcnow()
@@ -1137,7 +1146,7 @@ def __main__():
     package_init_make_info()
     print("Getting package details ...")
     for pkg in packages:
-        pkg.set_infra()
+        pkg.set_infra(config_info)
         pkg.set_license()
         pkg.set_hash_info()
         pkg.set_patch_count()
-- 
2.30.0
