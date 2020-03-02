From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon,  2 Mar 2020 15:50:05 +0100
Subject: [Buildroot] [PATCH v4 03/12] support/scripts/pkg-stats: set
 developers info
In-Reply-To: <20200302145013.9574-1-heiko.thiery@gmail.com>
References: <20200302145013.9574-1-heiko.thiery@gmail.com>
Message-ID: <20200302145013.9574-4-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the function 'parse_developers' function from getdeveloperlib that
collect the information about the developers and the files they
maintain. Then set the maintainer(s) to each package.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 support/scripts/pkg-stats | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 4116622c98..c40fe61d9e 100755
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
 
@@ -891,6 +905,8 @@ def __main__():
                                       'HEAD']).splitlines()[0]
     print("Build package list ...")
     packages = get_pkglist(args.npackages, package_list)
+    print("Getting developers ...")
+    developers = parse_developers()
     print("Getting package make info ...")
     package_init_make_info()
     print("Getting package details ...")
@@ -902,6 +918,7 @@ def __main__():
         pkg.set_check_package_warnings()
         pkg.set_current_version()
         pkg.set_url()
+        pkg.set_developers(developers)
     print("Checking URL status")
     check_package_urls(packages)
     print("Getting latest versions ...")
-- 
2.20.1
