From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri,  3 Jan 2020 16:18:39 +0100
Subject: [Buildroot] [PATCH 02/11] support/scripts/pkg-stats: store pkg dir
 path
In-Reply-To: <20200103151849.10956-1-heiko.thiery@gmail.com>
References: <20200103151849.10956-1-heiko.thiery@gmail.com>
Message-ID: <20200103151849.10956-3-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use this value where it make sense.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 support/scripts/pkg-stats | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 8c64993aaf..9cfbcf1acc 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -51,6 +51,7 @@ class Package:
     def __init__(self, name, path):
         self.name = name
         self.path = path
+        self.pkg_path = os.path.dirname(path)
         self.infras = None
         self.has_license = False
         self.has_license_files = False
@@ -71,9 +72,9 @@ class Package:
         Fills in the .url field
         """
         self.url_status = "No Config.in"
-        for filename in os.listdir(os.path.dirname(self.path)):
+        for filename in os.listdir(self.pkg_path):
             if fnmatch.fnmatch(filename, 'Config.*'):
-                fp = open(os.path.join(os.path.dirname(self.path), filename), "r")
+                fp = open(os.path.join(self.pkg_path, filename), "r")
                 for config_line in fp:
                     if URL_RE.match(config_line):
                         self.url = config_line.strip()
@@ -88,7 +89,7 @@ class Package:
         Fills in the .infras field
         """
         self.infras = list()
-        with open(self.path, 'r') as f:
+        with open(os.path.join(self.pkg_path, self.name + '.mk'), 'r') as f:
             lines = f.readlines()
             for l in lines:
                 match = INFRA_RE.match(l)
@@ -139,8 +140,7 @@ class Package:
         Fills in the .warnings field
         """
         cmd = ["./utils/check-package"]
-        pkgdir = os.path.dirname(self.path)
-        for root, dirs, files in os.walk(pkgdir):
+        for root, dirs, files in os.walk(self.pkg_path):
             for f in files:
                 if f.endswith(".mk") or f.endswith(".hash") or f == "Config.in" or f == "Config.in.host":
                     cmd.append(os.path.join(root, f))
@@ -732,6 +732,8 @@ def __main__():
                                       'HEAD']).splitlines()[0]
     print("Build package list ...")
     packages = get_pkglist(args.npackages, package_list)
+    print("Getting developers...")
+    developers = parse_developers()
     print("Getting package make info ...")
     package_init_make_info()
     print("Getting package details ...")
-- 
2.20.1
