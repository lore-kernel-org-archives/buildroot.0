From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Jan 2019 21:07:24 +0100
Subject: [Buildroot] [git commit] package/libva-intel-driver: bump to
 version 2.3.0
Message-ID: <20190116200933.22E498DE61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=347318db1580f9b2156aa9d5c43df6d4292ac3e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patch to fix build without stack-protector support which is upstream.
Add backported patch to fix libva-intel-driver when using wayland.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0001-Check-the-interface-from-libva-first.patch | 71 ++++++++++++++++++++++
 package/libva-intel-driver/0001-check-ssp.patch    | 65 --------------------
 package/libva-intel-driver/libva-intel-driver.hash |  4 +-
 package/libva-intel-driver/libva-intel-driver.mk   |  4 +-
 4 files changed, 74 insertions(+), 70 deletions(-)

diff --git a/package/libva-intel-driver/0001-Check-the-interface-from-libva-first.patch b/package/libva-intel-driver/0001-Check-the-interface-from-libva-first.patch
new file mode 100644
index 0000000000..81591fbbd4
--- /dev/null
+++ b/package/libva-intel-driver/0001-Check-the-interface-from-libva-first.patch
@@ -0,0 +1,71 @@
+From 3db0c4838fe30fcee5beb8b31ca67d5cf7d77fb3 Mon Sep 17 00:00:00 2001
+From: Haihao Xiang <haihao.xiang@intel.com>
+Date: Fri, 7 Dec 2018 13:31:43 +0800
+Subject: [PATCH 1/1] Check the interface from libva first
+
+This fixes https://github.com/intel/intel-vaapi-driver/issues/419
+
+Signed-off-by: Haihao Xiang <haihao.xiang@intel.com>
+[james.hilliard1 at gmail.com: backport from upstream commit
+f139dafa59172d40543f2ec469a035d3de9fdc6a]
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ src/i965_output_wayland.c | 27 ++++++++++++++++-----------
+ 1 file changed, 16 insertions(+), 11 deletions(-)
+
+diff --git a/src/i965_output_wayland.c b/src/i965_output_wayland.c
+index 122db95..a637552 100644
+--- a/src/i965_output_wayland.c
++++ b/src/i965_output_wayland.c
+@@ -397,6 +397,7 @@ i965_output_wayland_init(VADriverContextP ctx)
+     struct i965_driver_data * const i965 = i965_driver_data(ctx);
+     struct dso_handle *dso_handle;
+     struct wl_vtable *wl_vtable;
++    struct VADriverVTableWayland * const vtable = ctx->vtable_wayland;
+ 
+     static const struct dso_symbol libegl_symbols[] = {
+         {
+@@ -465,25 +466,29 @@ i965_output_wayland_init(VADriverContextP ctx)
+     if (!i965->wl_output)
+         goto error;
+ 
+-    i965->wl_output->libegl_handle = dso_open(LIBEGL_NAME);
+-    if (!i965->wl_output->libegl_handle) {
+-        i965->wl_output->libegl_handle = dso_open(LIBEGL_NAME_FALLBACK);
+-        if (!i965->wl_output->libegl_handle)
++    wl_vtable = &i965->wl_output->vtable;
++
++    if (vtable->wl_interface)
++        wl_vtable->drm_interface = vtable->wl_interface;
++    else {
++        i965->wl_output->libegl_handle = dso_open(LIBEGL_NAME);
++        if (!i965->wl_output->libegl_handle) {
++            i965->wl_output->libegl_handle = dso_open(LIBEGL_NAME_FALLBACK);
++            if (!i965->wl_output->libegl_handle)
++                goto error;
++        }
++
++        dso_handle = i965->wl_output->libegl_handle;
++        if (!dso_get_symbols(dso_handle, wl_vtable, sizeof(*wl_vtable),
++                             libegl_symbols))
+             goto error;
+     }
+ 
+-    dso_handle = i965->wl_output->libegl_handle;
+-    wl_vtable  = &i965->wl_output->vtable;
+-    if (!dso_get_symbols(dso_handle, wl_vtable, sizeof(*wl_vtable),
+-                         libegl_symbols))
+-        goto error;
+-
+     i965->wl_output->libwl_client_handle = dso_open(LIBWAYLAND_CLIENT_NAME);
+     if (!i965->wl_output->libwl_client_handle)
+         goto error;
+ 
+     dso_handle = i965->wl_output->libwl_client_handle;
+-    wl_vtable  = &i965->wl_output->vtable;
+     if (!dso_get_symbols(dso_handle, wl_vtable, sizeof(*wl_vtable),
+                          libwl_client_symbols))
+         goto error;
+-- 
+2.7.4
+
diff --git a/package/libva-intel-driver/0001-check-ssp.patch b/package/libva-intel-driver/0001-check-ssp.patch
deleted file mode 100644
index c801ed3148..0000000000
--- a/package/libva-intel-driver/0001-check-ssp.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From bf08643583520b763150af9ed20166b7fe272fd5 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 29 Jul 2018 20:55:23 +0200
-Subject: [PATCH] Check for -fstack-protector
-
-Not all toolchains provide support for -fstack-protector. This patch
-provides a configure check to avoid build errors like
-
-/home/buildroot/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/6.4.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: cannot find -lssp_nonshared
-/home/buildroot/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/6.4.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: cannot find -lssp
-
-Patch sent upstream as PR 408.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- configure.ac    | 17 +++++++++++++++++
- src/Makefile.am |  5 ++++-
- 2 files changed, 21 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index c76060c7..5471aee7 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -86,6 +86,23 @@ AC_SEARCH_LIBS([dlopen], [dl], [], [
-   AC_MSG_ERROR([unable to find the dlopen() function])
- ])
- 
-+
-+# Check for -fstack-protector
-+ssp_cc=yes
-+if test "X$CC-cc" != "X"; then
-+    AC_MSG_CHECKING([whether ${CC-cc} accepts -fstack-protector])
-+    ssp_old_cflags="$CFLAGS"
-+    CFLAGS="$CFLAGS -fstack-protector"
-+    AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[alloca(100);]])], [], [ssp_cc=no])
-+    AC_MSG_RESULT([$ssp_cc])
-+    if test "X$ssp_cc" = "Xno"; then
-+        CFLAGS="$ssp_old_cflags"
-+    else
-+        AC_DEFINE([ENABLE_SSP_CC], 1, [Define if SSP C support is enabled.])
-+    fi
-+fi
-+AM_CONDITIONAL(USE_SSP, test "$ssp_cc" = "yes")
-+
- dnl Check for recent enough DRM
- LIBDRM_VERSION=libdrm_version
- PKG_CHECK_MODULES([DRM], [libdrm >= $LIBDRM_VERSION libdrm_intel])
-diff --git a/src/Makefile.am b/src/Makefile.am
-index c26293dd..5c52658a 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -35,9 +35,12 @@ AM_CPPFLAGS = \
- driver_cflags = \
- 	-Wall			\
- 	-fvisibility=hidden	\
--	-fstack-protector	\
- 	$(NULL)
- 
-+if USE_SSP
-+driver_cflags += -fstack-protector
-+endif
-+
- driver_ldflags = \
- 	-avoid-version		\
- 	-no-undefined		\
diff --git a/package/libva-intel-driver/libva-intel-driver.hash b/package/libva-intel-driver/libva-intel-driver.hash
index 0509ff8d60..8c01271aeb 100644
--- a/package/libva-intel-driver/libva-intel-driver.hash
+++ b/package/libva-intel-driver/libva-intel-driver.hash
@@ -1,5 +1,5 @@
 # From https://github.com/intel/intel-vaapi-driver/releases
-sha1 0934f97ddcaf4e633f59d049226723239b645b33  intel-vaapi-driver-2.2.0.tar.bz2
+sha1 89096f99da753ac5858304e6c17f5dd9e7581d5b  intel-vaapi-driver-2.3.0.tar.bz2
 # Locally computed
-sha256 e8a5f54694eb76aad42653b591030b8a53b1513144c09a80defb3d8d8c875c18  intel-vaapi-driver-2.2.0.tar.bz2
+sha256 5c2e5deab024a0a6ae81dfe77ef455542a88d824eda7bfd07684337407ecdfe3  intel-vaapi-driver-2.3.0.tar.bz2
 sha256 c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva-intel-driver/libva-intel-driver.mk b/package/libva-intel-driver/libva-intel-driver.mk
index 48564ca488..76cdfee382 100644
--- a/package/libva-intel-driver/libva-intel-driver.mk
+++ b/package/libva-intel-driver/libva-intel-driver.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-LIBVA_INTEL_DRIVER_VERSION = 2.2.0
+LIBVA_INTEL_DRIVER_VERSION = 2.3.0
 LIBVA_INTEL_DRIVER_SOURCE = intel-vaapi-driver-$(LIBVA_INTEL_DRIVER_VERSION).tar.bz2
 LIBVA_INTEL_DRIVER_SITE = \
 	https://github.com/intel/intel-vaapi-driver/releases/download/$(LIBVA_INTEL_DRIVER_VERSION)
 LIBVA_INTEL_DRIVER_LICENSE = MIT
 LIBVA_INTEL_DRIVER_LICENSE_FILES = COPYING
-# 0001-check-ssp.patch
-LIBVA_INTEL_DRIVER_AUTORECONF = YES
 LIBVA_INTEL_DRIVER_DEPENDENCIES = host-pkgconf libdrm libva
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
