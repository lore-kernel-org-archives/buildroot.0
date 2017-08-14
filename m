From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 14 Aug 2017 21:01:23 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/mtd: integck needs threads
Message-ID: <20170814190123.6828-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The test programs depend on pthreads:
http://git.infradead.org/mtd-utils.git/blob/1bfee8660131fca7a18f68e9548a18ca6b3378a0:/configure.ac#l43

Our option BR2_PACKAGE_MTD_INTEGCK is the only option which enables
building the test programs so it needs to depend on threads because
BR2_PACKAGE_MTD_TESTS as a hidden option cannot be selected.

Fixes
http://autobuild.buildroot.net/results/879/879c79e505f65387a46c4be263dc8783c8ca61bf/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: threads are only needed for test programs (Baruch)

 package/mtd/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index a1df4cfc0..15057a00e 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -174,9 +174,13 @@ config BR2_PACKAGE_MTD_UBIBLOCK
 
 config BR2_PACKAGE_MTD_INTEGCK
 	bool "integck"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
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
