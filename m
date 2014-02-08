From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  8 Feb 2014 15:34:53 +0100
Subject: [Buildroot] [PATCH v1 4/6] vlc: fix libgcrypt support
In-Reply-To: <1391870095-3738-1-git-send-email-s.martin49@gmail.com>
References: <1391870095-3738-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1391870095-3738-5-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch allows to override the libgcrypt-config location instead of
using the one found in the PATH, which is usually the host system one.

Fixes:
  http://autobuild.buildroot.org/results/5e4/5e42d1139bbbed2421193d8acc52df9442c43730/build-end.log

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 ...ac-add-check-for-libgcrypt-config-program.patch | 43 ++++++++++++++++++++++
 package/vlc/vlc.mk                                 |  3 ++
 2 files changed, 46 insertions(+)
 create mode 100644 package/vlc/vlc-0002-configure.ac-add-check-for-libgcrypt-config-program.patch

diff --git a/package/vlc/vlc-0002-configure.ac-add-check-for-libgcrypt-config-program.patch b/package/vlc/vlc-0002-configure.ac-add-check-for-libgcrypt-config-program.patch
new file mode 100644
index 0000000..1ad6712
--- /dev/null
+++ b/package/vlc/vlc-0002-configure.ac-add-check-for-libgcrypt-config-program.patch
@@ -0,0 +1,43 @@
+From 88bf3313850bc7f0e6db21daee2b8d8e607b7bb4 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sat, 8 Feb 2014 14:33:27 +0100
+Subject: [PATCH] configure.ac: add check for libgcrypt-config program
+
+This allows to override the default libgcrypt-config location (which is
+useful when cross-compiling), instead of using the one from the host
+system.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ configure.ac | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 02fb8aa..5a2267b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3943,16 +3943,17 @@ dnl
+ AC_ARG_ENABLE(libgcrypt,
+   [  --disable-libgcrypt     gcrypt support (default enabled)])
+ AS_IF([test "${enable_libgcrypt}" != "no"], [
++  AC_PATH_PROG(GCRYPT_CONFIG,libgcrypt-config,libgcrypt-config)
+   AC_CHECK_DECL([GCRYCTL_SET_THREAD_CBS], [
+-    libgcrypt-config --version >/dev/null || \
++    ${GCRYPT_CONFIG} --version >/dev/null || \
+         AC_MSG_ERROR([gcrypt.h present but libgcrypt-config could not be found])
+     AC_CHECK_LIB(gcrypt, gcry_control, [
+       have_libgcrypt="yes"
+-      GCRYPT_CFLAGS="`libgcrypt-config --cflags`"
+-      GCRYPT_LIBS="`libgcrypt-config --libs`"
++      GCRYPT_CFLAGS="`${GCRYPT_CONFIG} --cflags`"
++      GCRYPT_LIBS="`${GCRYPT_CONFIG} --libs`"
+     ], [
+       AC_MSG_ERROR([libgcrypt not found. Install libgcrypt or use --disable-libgcrypt. Have a nice day.])
+-    ], [`libgcrypt-config --libs`])
++    ], [`${GCRYPT_CONFIG} --libs`])
+   ], [
+     AC_MSG_ERROR([libgcrypt version 1.1.94 or higher not found. Install libgcrypt or use --disable-libgcrypt. Have a nice day.])
+   ], [#include <gcrypt.h>]
+-- 
+1.8.5.4
+
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index feee82d..65aab36 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -10,6 +10,7 @@ VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPLv2+ LGPLv2.1+
 VLC_LICENSE_FILES = COPYING COPYING.LIB
 VLC_DEPENDENCIES = host-pkgconf
+VLC_AUTORECONF = YES
 
 VLC_CONF_OPT += \
 	--disable-a52 \
@@ -110,6 +111,8 @@ endif
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 VLC_CONF_OPT += --enable-libgcrypt
 VLC_DEPENDENCIES += libgcrypt
+VLC_CONF_ENV += \
+	GCRYPT_CONFIG="$(STAGING_DIR)/usr/bin/libgcrypt-config"
 else
 VLC_CONF_OPT += --disable-libgcrypt
 endif
-- 
1.8.5.4
