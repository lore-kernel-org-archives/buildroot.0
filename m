From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Thu, 31 Jul 2014 17:24:43 +0400
Subject: [Buildroot] [PATCH v2 2/9] cairo: Add dependency on atomic
	intrinsics
In-Reply-To: <1406813090-32472-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <20140730084548.05bd6dec@free-electrons.com>
 <1406813090-32472-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <1406813090-32472-2-git-send-email-Anton.Kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cairo requires GCC built-in atomic functions which are architecture specific
and may not be implemented.

This fixes:
http://autobuild.buildroot.net/results/fadfaa9916724d310d0dda555a1db31bee1601d0/

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 package/cairo/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/cairo/Config.in b/package/cairo/Config.in
index 0c87a29..2aeaa2a 100644
--- a/package/cairo/Config.in
+++ b/package/cairo/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_CAIRO
 	bool "cairo"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
@@ -13,6 +14,9 @@ config BR2_PACKAGE_CAIRO
 
 	  http://cairographics.org/
 
+comment "cairo needs a toolchain with atomic intrinsics"
+	depends on !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
+
 if BR2_PACKAGE_CAIRO
 
 config BR2_PACKAGE_CAIRO_PS
-- 
1.8.4.1
