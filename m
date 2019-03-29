From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 29 Mar 2019 13:44:46 +0300
Subject: [Buildroot] [PATCH 1/2] package/mtd: fix build without openssl
Message-ID: <4dfb0750e6edabebc3180054ac16ef875d7f41a0.1553856287.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch that removes dependency on openssl header when openssl is
not installed.

Fixes:
http://autobuild.buildroot.net/results/a78/a78544def5c17edccdf5db821318b8efa3fc7b8f/
http://autobuild.buildroot.net/results/ed8/ed82ef6c15d7f59c9b93d237f53fc09513ed5c4f/
http://autobuild.buildroot.net/results/ede/ede17d68948fd478c366673b7d22f07cee3bd09a/

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...mkfs.ubifs-fix-build-without-openssl.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/mtd/0001-mkfs.ubifs-fix-build-without-openssl.patch

diff --git a/package/mtd/0001-mkfs.ubifs-fix-build-without-openssl.patch b/package/mtd/0001-mkfs.ubifs-fix-build-without-openssl.patch
new file mode 100644
index 000000000000..863383080632
--- /dev/null
+++ b/package/mtd/0001-mkfs.ubifs-fix-build-without-openssl.patch
@@ -0,0 +1,38 @@
+From 451b6fd8f6b619ae75d283df02edd835c8e3c627 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Fri, 29 Mar 2019 13:29:41 +0300
+Subject: [PATCH] mkfs.ubifs: fix build without openssl
+
+Exclude openssl headers when WITH_CRYPTO is not defined.
+
+Fixes this build failure:
+
+In file included from ubifs-utils/mkfs.ubifs/mkfs.ubifs.c:25:0:
+ubifs-utils/mkfs.ubifs/mkfs.ubifs.h:49:10: fatal error: openssl/rand.h: No such file or directory
+ #include <openssl/rand.h>
+          ^~~~~~~~~~~~~~~~
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: http://lists.infradead.org/pipermail/linux-mtd/2019-March/088508.html
+
+ ubifs-utils/mkfs.ubifs/mkfs.ubifs.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
+index aa032392155b..8f0186043079 100644
+--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
++++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
+@@ -46,7 +46,9 @@
+ #include <uuid.h>
+ #include <sys/file.h>
+ 
++#ifdef WITH_CRYPTO
+ #include <openssl/rand.h>
++#endif
+ 
+ #include <mtd/ubifs-media.h>
+ 
+-- 
+2.20.1
+
-- 
2.20.1
