From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Thu, 31 Jul 2014 17:24:46 +0400
Subject: [Buildroot] [PATCH v2 5/9] libftdi: Add dependency on atomic
	intrinsics
In-Reply-To: <1406813090-32472-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <20140730084548.05bd6dec@free-electrons.com>
 <1406813090-32472-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <1406813090-32472-5-git-send-email-Anton.Kolesov@synopsys.com>
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
 1 file changed, 3 insertions(+), 2 deletions(-)

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
-- 
1.8.4.1
