From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Mon, 28 Jul 2014 22:02:01 +0400
Subject: [Buildroot] [PATCH 2/9] cairo: arc: Disable if ARC atomics are
	disabled
In-Reply-To: <1406570528-31516-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <1406570528-31516-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <1406570528-31516-2-git-send-email-Anton.Kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cairo requires GCC built-in atomic functions which are optional in ARC
toolchain.

This fixes:
http://autobuild.buildroot.net/results/fadfaa9916724d310d0dda555a1db31bee1601d0/

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 package/cairo/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/cairo/Config.in b/package/cairo/Config.in
index 0c87a29..7c1cbac 100644
--- a/package/cairo/Config.in
+++ b/package/cairo/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
+	depends on !BR2_arc || BR2_ARC_ATOMIC_EXT
 	help
 	  Cairo is a 2D graphics library with support for multiple
 	  output devices. Currently supported output targets include
@@ -13,6 +14,9 @@ config BR2_PACKAGE_CAIRO
 
 	  http://cairographics.org/
 
+comment "cairo needs an ARC CPU w/ atomic extension"
+	depends on BR2_arc && !BR2_ARC_ATOMIC_EXT
+
 if BR2_PACKAGE_CAIRO
 
 config BR2_PACKAGE_CAIRO_PS
-- 
1.8.4.1
