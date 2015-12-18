From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Dec 2015 22:04:58 +0100
Subject: [Buildroot] [git commit] libgdiplus: fix cross-compilation error
Message-ID: <20151218210522.4EB9281D35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e6dfc0c68ad70c7f933061e1f0ec2eb04909fff7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When cross-compiling with toolchains that validate things like headers
and libraries paths, we were getting errors like:

sh-linux-gnu-gcc: ERROR: unsafe header/library path used in
cross-compilation: '/lib'

That's because there was an error in the configure script that was not
generating ldflags correctly, and the generated Makefile was trying to
link with -L/lib.

Also, it is necessary to pass a prefix when compiling with libjpeg and
libtiff support.

A patch has already been sent upstream.

Fixes:
http://autobuild.buildroot.org/results/58cad610b1bde68de82e44bf3c87d7bfcc1fa816/
http://autobuild.buildroot.org/results/649c258c05293fa5203d7d2c7b20a4265c2815ab/

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...01-Fix-compile-error-when-cross-compiling.patch | 35 ++++++++++++++++++++++
 package/libgdiplus/libgdiplus.mk                   |  4 +--
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/package/libgdiplus/0001-Fix-compile-error-when-cross-compiling.patch b/package/libgdiplus/0001-Fix-compile-error-when-cross-compiling.patch
new file mode 100644
index 0000000..db67d46
--- /dev/null
+++ b/package/libgdiplus/0001-Fix-compile-error-when-cross-compiling.patch
@@ -0,0 +1,35 @@
+From daf96b07c02734dceaf3c3b78c10e4e758b74d9e Mon Sep 17 00:00:00 2001
+From: Sergio Prado <sergio.prado@e-labworks.com>
+Date: Fri, 18 Dec 2015 15:08:58 -0200
+Subject: [PATCH 1/1] Fix compile error when cross-compiling.
+
+When cross-compiling with libjpeg enabled, we can get errors like the
+following when linking:
+
+sh-linux-gnu-gcc: ERROR: unsafe header/library path used in
+cross-compilation: '/lib'
+
+That's because there is an error in the configure script that are not
+generating ldflags correctly, and are trying to link with -L/lib.
+
+Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 772d5fc9d87a..58d55ade48e3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -223,7 +223,7 @@ AC_ARG_WITH([libjpeg],
+         jpeg_ok=no)
+       AC_MSG_RESULT($jpeg_ok)
+       if test "$jpeg_ok" = yes; then
+-        JPEG='jpeg'; LIBJPEG='-L${libjpeg_prefix}/lib -ljpeg'
++        JPEG='jpeg'; LIBJPEG="-L${libjpeg_prefix}/lib -ljpeg"
+       else
+         AC_MSG_WARN(*** JPEG loader will not be built (JPEG header file not found) ***)
+       fi
+--
+1.9.1
+
diff --git a/package/libgdiplus/libgdiplus.mk b/package/libgdiplus/libgdiplus.mk
index 3f7b2d7..fdb5b5c 100644
--- a/package/libgdiplus/libgdiplus.mk
+++ b/package/libgdiplus/libgdiplus.mk
@@ -40,14 +40,14 @@ LIBGDIPLUS_CONF_OPTS += --without-libexif
 endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
-LIBGDIPLUS_CONF_OPTS += --with-libjpeg
+LIBGDIPLUS_CONF_OPTS += --with-libjpeg=$(STAGING_DIR)/usr
 LIBGDIPLUS_DEPENDENCIES += jpeg
 else
 LIBGDIPLUS_CONF_OPTS += --without-libjpeg
 endif
 
 ifeq ($(BR2_PACKAGE_TIFF),y)
-LIBGDIPLUS_CONF_OPTS += --with-libtiff
+LIBGDIPLUS_CONF_OPTS += --with-libtiff=$(STAGING_DIR)/usr
 LIBGDIPLUS_DEPENDENCIES += tiff
 else
 LIBGDIPLUS_CONF_OPTS += --without-libtiff
