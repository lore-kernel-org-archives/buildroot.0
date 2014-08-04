From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Mon,  4 Aug 2014 16:16:30 +0400
Subject: [Buildroot] [PATCH v3 3/4] libftdi: Add dependency on atomic
	intrinsics
In-Reply-To: <1407154591-12753-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <20140803113216.03e0fb94@free-electrons.com>
 <1407154591-12753-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <1407154591-12753-3-git-send-email-Anton.Kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libftdi requires GCC built-in atomic functions which are architecture specific
and may not be implemented.

This fixes:
http://autobuild.buildroot.net/results/6cb25ed954840109c9d0e582e922b0ba9d07e174/

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 package/libftdi/Config.in | 5 +++--
 package/openocd/Config.in | 4 ++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/libftdi/Config.in b/package/libftdi/Config.in
index dc81514..ce65158 100644
--- a/package/libftdi/Config.in
+++ b/package/libftdi/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBFTDI
 	bool "libftdi"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
@@ -18,5 +19,5 @@ config BR2_PACKAGE_LIBTFDI_CPP
 
 endif # BR2_PACKAGE_LIBFTDI
 
-comment "libftdi needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "libftdi needs a toolchain w/ threads, atomic intrinsics"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index 7f96ef8..e692d2d 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -14,11 +14,15 @@ comment "Adapters"
 
 config BR2_PACKAGE_OPENOCD_FT2XXX
 	bool "FT2xxx/FT4xxx Based JTAG Programmer"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS # libftdi
 	select BR2_PACKAGE_LIBFTDI
 	help
 	  Enable building support for FT2232 based devices
 	  using the libftdi driver, opensource alternate of FTD2XX
 
+comment "FT2232 support needs a toolchain w/ atomic intrinsics"
+        depends on !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
+
 config BR2_PACKAGE_OPENOCD_JLINK
 	bool "Segger J-Link JTAG Programmer"
 	help
-- 
1.8.4.1
