From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Mar 2020 21:36:08 +0100
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: set developers
 info
Message-ID: <20200309140909.A40848894D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1fc827934a828179ae73f3b94bbc9d780cb4755
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the function 'parse_developers' function from getdeveloperlib that
collect the information about the developers and the files they
maintain. Then set the maintainer(s) to each package.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 87018eabd3..e34841fc7c 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -30,10 +30,14 @@ import certifi
 import distutils.version
 import time
 import gzip
+import sys
 from urllib3 import HTTPSConnectionPool
 from urllib3.exceptions import HTTPError
 from multiprocessing import Pool
 
+sys.path.append('utils/')
+from getdeveloperlib import parse_developers
+
 NVD_START_YEAR = 2002
 NVD_JSON_VERSION = "1.0"
 NVD_BASE_URL = "https://nvd.nist.gov/feeds/json/cve/" + NVD_JSON_VERSION
@@ -171,6 +175,16 @@ class Package:
         """
         return cve in self.all_ignored_cves.get(self.pkgvar(), [])
 
+    def set_developers(self, developers):
+        """
+        Fills in the .developers field
+        """
+        self.developers = [
+            dev.name
+            for dev in developers
+            if dev.hasfile(self.path)
+        ]
+
     def __eq__(self, other):
         return self.path == other.path
 
@@ -894,6 +908,8 @@ def __main__():
                                       'HEAD']).splitlines()[0].decode()
     print("Build package list ...")
     packages = get_pkglist(args.npackages, package_list)
+    print("Getting developers ...")
+    developers = parse_developers()
     print("Getting package make info ...")
     package_init_make_info()
     print("Getting package details ...")
@@ -905,6 +921,7 @@ def __main__():
         pkg.set_check_package_warnings()
         pkg.set_current_version()
         pkg.set_url()
+        pkg.set_developers(developers)
     print("Checking URL status")
     check_package_urls(packages)
     print("Getting latest versions ...")
