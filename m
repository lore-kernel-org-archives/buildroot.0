From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 15 Aug 2017 06:20:04 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/mtd: test programs need threads
Message-ID: <20170815042004.12226-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The test programs depend on pthreads:
http://git.infradead.org/mtd-utils.git/blob/1bfee8660131fca7a18f68e9548a18ca6b3378a0:/configure.ac#l43

Also propagate the threads dependency to BR2_PACKAGE_MTD_INTEGCK.

Fixes
http://autobuild.buildroot.net/results/879/879c79e505f65387a46c4be263dc8783c8ca61bf/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: add threads dependency to BR2_PACKAGE_MTD_TESTS as well (Thomas)
v2: threads are only needed for test programs (Baruch)

 package/mtd/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index a1df4cfc0..a89925c63 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -24,6 +24,7 @@ config BR2_PACKAGE_MTD_UBIFS_UTILS
 
 config BR2_PACKAGE_MTD_TESTS
 	bool
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 
 comment "MTD tools selection"
 
@@ -174,9 +175,13 @@ config BR2_PACKAGE_MTD_UBIBLOCK
 
 config BR2_PACKAGE_MTD_INTEGCK
 	bool "integck"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # mtd-tests
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_MTD_TESTS
 	help
 	  Install the integck test program.
 
+comment "integck needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 endif
-- 
2.11.0
