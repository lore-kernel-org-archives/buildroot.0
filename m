From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri,  3 Jan 2020 16:18:43 +0100
Subject: [Buildroot] [PATCH 06/11] support/scripts/pkg-stats: store licences
 of package
In-Reply-To: <20200103151849.10956-1-heiko.thiery@gmail.com>
References: <20200103151849.10956-1-heiko.thiery@gmail.com>
Message-ID: <20200103151849.10956-7-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 support/scripts/pkg-stats | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index d520da6807..a5e87a7167 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -89,7 +89,7 @@ def parse_developers(basepath=None):
     return developers
 
 class Package:
-    all_licenses = list()
+    all_licenses = dict()
     all_license_files = list()
     all_versions = dict()
 
@@ -98,6 +98,7 @@ class Package:
         self.path = path
         self.pkg_path = os.path.dirname(path)
         self.infras = None
+        self.license = None
         self.has_license = False
         self.has_license_files = False
         self.has_hash = False
@@ -154,6 +155,7 @@ class Package:
         var = self.pkgvar()
         if var in self.all_licenses:
             self.has_license = True
+            self.license = self.all_licenses[var]
         if var in self.all_license_files:
             self.has_license_files = True
 
@@ -302,7 +304,7 @@ def package_init_make_info():
             if value == "unknown":
                 continue
             pkgvar = pkgvar[:-8]
-            Package.all_licenses.append(pkgvar)
+            Package.all_licenses[pkgvar] = value
 
         elif pkgvar.endswith("_LICENSE_FILES"):
             if pkgvar.endswith("_MANIFEST_LICENSE_FILES"):
@@ -785,8 +787,6 @@ def __main__():
     date = datetime.datetime.utcnow()
     commit = subprocess.check_output(['git', 'rev-parse',
                                       'HEAD']).splitlines()[0]
-    print("Getting developers...")
-    developers = parse_developers()
     print("Build package list ...")
     packages = get_pkglist(args.npackages, package_list)
     print("Getting developers...")
-- 
2.20.1
