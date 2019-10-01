From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  1 Oct 2019 07:42:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXfont2: disable usage
 of libbsd
Message-ID: <20191001054210.28371-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream added optional support for libbsd:
"Add strlcat & strlcpy fallbacks if not provided by libc nor libbsd"
https://cgit.freedesktop.org/xorg/lib/libXfont/commit/?id=d4c941ea8b1dc07a14efce656bff58d31a14c985

In the case that libbsd was built before xlib_libXfont2 it gets picked
up by configure:

checking for library containing strlcat... -lbsd
checking for reallocarray... yes
checking for strlcat... yes
checking for strlcpy... yes

which leads to build errors.

Building without libbsd being built before succeeds:

checking for library containing strlcat... no
checking for reallocarray... yes
checking for strlcat... no
checking for strlcpy... no

Instead of fixing a problem in the xlib_libXfont2 code we disable the
usage of libbsd altogether:

checking for library containing strlcat... (cached) no

and force xlib_libXfont2 to use its internal headers.

Fixes:
http://autobuild.buildroot.net/results/165/165f9f948419fc69fbf6b9281d759b37bb7d40c6/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXfont2/xlib_libXfont2.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
index cc3f474c64..30d27b40e6 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
@@ -33,7 +33,9 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 XLIB_LIBXFONT2_CFLAGS += -O0
 endif
 
-XLIB_LIBXFONT2_CONF_ENV = CFLAGS="$(XLIB_LIBXFONT2_CFLAGS)"
+XLIB_LIBXFONT2_CONF_ENV = \
+	CFLAGS="$(XLIB_LIBXFONT2_CFLAGS)" \
+	ac_cv_search_strlcat=no
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.20.1
