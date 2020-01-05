From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun,  5 Jan 2020 10:23:25 +0100
Subject: [Buildroot] [PATCH v2 3/8] support/scripts/pkg-stats: set
 developers info
In-Reply-To: <20200105092329.6288-1-heiko.thiery@gmail.com>
References: <20200105092329.6288-1-heiko.thiery@gmail.com>
Message-ID: <20200105092329.6288-4-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 support/scripts/pkg-stats | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 6e250556e9..43d14785a1 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -26,10 +26,14 @@ import subprocess
 import requests  # URL checking
 import json
 import certifi
+import sys
 from urllib3 import HTTPSConnectionPool
 from urllib3.exceptions import HTTPError
 from multiprocessing import Pool
 
+sys.path.append('utils/')
+from getdeveloperlib import parse_developers
+
 INFRA_RE = re.compile(r"\$\(eval \$\(([a-z-]*)-package\)\)")
 URL_RE = re.compile(r"\s*https?://\S*\s*$")
 
@@ -153,6 +157,15 @@ class Package:
                 self.warnings = int(m.group(1))
                 return
 
+    def set_developers(self, developers):
+        """
+        Fills in the .developers field
+        """
+        self.developers = list()
+        for dev in developers:
+            if dev.hasfile(self.path):
+                self.developers.append((dev.name))
+
     def __eq__(self, other):
         return self.path == other.path
 
@@ -733,6 +746,8 @@ def __main__():
                                       'HEAD']).splitlines()[0]
     print("Build package list ...")
     packages = get_pkglist(args.npackages, package_list)
+    print("Getting developers ...")
+    developers = parse_developers()
     print("Getting package make info ...")
     package_init_make_info()
     print("Getting package details ...")
@@ -744,6 +759,7 @@ def __main__():
         pkg.set_check_package_warnings()
         pkg.set_current_version()
         pkg.set_url()
+        pkg.set_developers(developers)
     print("Checking URL status")
     check_package_urls(packages)
     print("Getting latest versions ...")
-- 
2.20.1
