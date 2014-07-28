From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Mon, 28 Jul 2014 22:02:04 +0400
Subject: [Buildroot] [PATCH 5/9] libftdi: arc: Disable if ARC atomics are
	disabled
In-Reply-To: <1406570528-31516-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <1406570528-31516-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <1406570528-31516-5-git-send-email-Anton.Kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libftdi requires GCC built-in atomic functions which are optional in ARC
toolchain.

This fixes:
http://autobuild.buildroot.net/results/6cb25ed954840109c9d0e582e922b0ba9d07e174/

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 package/libftdi/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libftdi/Config.in b/package/libftdi/Config.in
index dc81514..8bc79e1 100644
--- a/package/libftdi/Config.in
+++ b/package/libftdi/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBFTDI
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
+	depends on !BR2_arc || BR2_ARC_ATOMIC_EXT
 	help
 	  Userspace access to FTDI USB interface chips
 
@@ -20,3 +21,6 @@ endif # BR2_PACKAGE_LIBFTDI
 
 comment "libftdi needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "libftdi needs an ARC CPU w/ atomic extension"
+	depends on BR2_arc && !BR2_ARC_ATOMIC_EXT
-- 
1.8.4.1
