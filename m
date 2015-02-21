From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 15:02:58 +0100
Subject: [Buildroot] [git commit] fltk: fix build issue caused by rpath
Message-ID: <20150221142217.D07198043E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a125d213b4809e02b68d1b636e86cc6f8bb307d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The fltk build system has some logic that causes it to pass
-Wl,-rpath,/usr/lib when --libdir is not /usr/lib. However, in our
case, libdir is ${exec_prefix}/lib, and is not expanded to /usr/lib
before the rpath related test is done. Rather than fixing the fltk
build system, this commit works around the problem by explicitly
passing --libdir=/usr/lib.

Fixes:

  http://autobuild.buildroot.org/results/8d1/8d1b202a182e3fb5dee21f20afc9f749c2defa1a/

and many other similar build failures that have been occuring since 1+
year.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fltk/fltk.mk |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/package/fltk/fltk.mk b/package/fltk/fltk.mk
index 44e0f97..d1acb86 100644
--- a/package/fltk/fltk.mk
+++ b/package/fltk/fltk.mk
@@ -8,8 +8,15 @@ FLTK_VERSION = 1.3.2
 FLTK_SOURCE = fltk-$(FLTK_VERSION)-source.tar.gz
 FLTK_SITE = http://fltk.org/pub/fltk/$(FLTK_VERSION)
 FLTK_INSTALL_STAGING = YES
+# We force --libdir=/usr/lib, because by default, it is set to
+# ${exec_prefix}/lib, which doesn't match the condition used by the
+# fltk build system to decide whether it should pass a -rpath,/usr/lib
+# or not. Since this rpath breaks the build, we want the fltk build
+# system to not pass it, which requires having --libdir set to
+# /usr/lib.
 FLTK_CONF_OPTS = --enable-threads --with-x --disable-gl \
-	--disable-localjpeg --disable-localpng --disable-localzlib
+	--disable-localjpeg --disable-localpng --disable-localzlib \
+	--libdir=/usr/lib
 FLTK_DEPENDENCIES = jpeg libpng xlib_libX11 xlib_libXext xlib_libXt
 FLTK_CONFIG_SCRIPTS = fltk-config
 FLTK_LICENSE = LGPLv2 with exceptions
