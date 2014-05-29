From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 29 May 2014 14:26:33 +0200
Subject: [Buildroot] [PATCH 2/2] package/webkit: Broken on raspberry pi
In-Reply-To: <1401366393-5815-1-git-send-email-bernd.kuhls@t-online.de>
References: <1401366393-5815-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1401366393-5815-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Linking libwebkitgtk-1.0.so fails

./.libs/libwebkitgtk-1.0.so: undefined reference to `WebCore::GLContext::GLContext()'
./.libs/libwebkitgtk-1.0.so: undefined reference to `WebCore::GLContext::sharedX11Display()'
./.libs/libwebkitgtk-1.0.so: undefined reference to `WebCore::GLContext::~GLContext()'
./.libs/libwebkitgtk-1.0.so: undefined reference to `WebCore::GLContext::makeContextCurrent()'

This link error occurred after fixing the configure problem
http://autobuild.buildroot.net/results/bc0/bc0f9114f9dacf68a510f1e01f2dc3661c34f536/

webkit-1.x apparently is missing support for raspberry pi.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/webkit/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index c86eb94..95c621d 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	default y if BR2_i386 || BR2_mips || BR2_mipsel || \
 		BR2_sh || BR2_sparc || BR2_x86_64
 	depends on BR2_USE_MMU # libgail -> pango -> libglib2
+	depends on !BR2_PACKAGE_RPI_USERLAND
 
 # disabled on powerpc due to bug https://bugs.webkit.org/show_bug.cgi?id=113638
 
-- 
1.7.10.4
