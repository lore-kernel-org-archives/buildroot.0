From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Sep 2017 17:18:35 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/pinentry: bump version to 1.0.0
Message-ID: <20170917151836.3661-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch applied upstream:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=commitdiff;h=f0db3192463cccf4541820de36d985629c4df6ee

Added sha256 hash.

Added dependencies to libassuan & libgpg-error needed after
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=commit;h=302903f76b8d62b1e07219a203f7219cb3aff7d8

Removed CXXFLAGS added for gcc >= 5.x as noted by Thomas:
https://git.buildroot.net/buildroot/commit/package/pinentry?id=9694305ae0b2a7dbdcc74e2c646d392ceed9876f

Renamed configure option -pinentry-qt4 to -pinentry-qt after
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=commit;h=abb59f50abf698ff1e56490fb39bcc98c26ab44b
Qt5 support, also added by this upstream commit, will be added to this
package with a subsequent commit.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: Added rename of configure option -pinentry-qt4 to -pinentry-qt

 ...1-remove-hard-wired-ncursesw-include-path.patch | 32 ----------------------
 package/pinentry/Config.in                         |  4 +++
 package/pinentry/pinentry.hash                     |  4 ++-
 package/pinentry/pinentry.mk                       | 21 ++++++--------
 4 files changed, 16 insertions(+), 45 deletions(-)
 delete mode 100644 package/pinentry/0001-remove-hard-wired-ncursesw-include-path.patch

diff --git a/package/pinentry/0001-remove-hard-wired-ncursesw-include-path.patch b/package/pinentry/0001-remove-hard-wired-ncursesw-include-path.patch
deleted file mode 100644
index c9903c4573..0000000000
--- a/package/pinentry/0001-remove-hard-wired-ncursesw-include-path.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From cf84bf3ef505059d42184b22cf38f89336bec43d Mon Sep 17 00:00:00 2001
-From: Gergely Imreh <imrehg@gmail.com>
-Date: Mon, 22 Jun 2015 07:51:17 +0000
-Subject: [PATCH 1/1] remove hard-wired ncursesw include path
-
-Don't assume that the ncursesw headers are in ../usr/include/ncursesw/..,
-and pkg-config finds the correct include path anyways.
-
-Signed-off-by: Gergely Imreh <imrehg@gmail.com>
----
- pinentry/pinentry-curses.c | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/pinentry/pinentry-curses.c b/pinentry/pinentry-curses.c
-index 235435a..bdcd0f4 100644
---- a/pinentry/pinentry-curses.c
-+++ b/pinentry/pinentry-curses.c
-@@ -22,11 +22,7 @@
- #include <config.h>
- #endif
- #include <assert.h>
--#ifdef HAVE_NCURSESW
--#include <ncursesw/curses.h>
--#else
- #include <curses.h>
--#endif
- #include <signal.h>
- #include <fcntl.h>
- #include <unistd.h>
--- 
-1.9.1
-
diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index f5a8159762..a92cd82a22 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -1,5 +1,9 @@
 menuconfig BR2_PACKAGE_PINENTRY
 	bool "pinentry"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpg-error
+	depends on BR2_USE_MMU # libassuan
+	select BR2_PACKAGE_LIBASSUAN
+	select BR2_PACKAGE_LIBGPG_ERROR
 	# At least one backend is needed to avoid build breakage
 	select BR2_PACKAGE_PINENTRY_NCURSES if !BR2_PACKAGE_PINENTRY_GTK2 && !BR2_PACKAGE_PINENTRY_QT4
 	help
diff --git a/package/pinentry/pinentry.hash b/package/pinentry/pinentry.hash
index d544efd7f0..ef450b3c41 100644
--- a/package/pinentry/pinentry.hash
+++ b/package/pinentry/pinentry.hash
@@ -1,2 +1,4 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  0c47f0ddea4631bcba01ebbeca8bffe0bf43e440  pinentry-0.9.4.tar.bz2
+sha1  85d9ac81ebad3fb082514c505c90c39a0456f1f6  pinentry-1.0.0.tar.bz2
+# Locally computed
+sha256 1672c2edc1feb036075b187c0773787b2afd0544f55025c645a71b4c2f79275a  pinentry-1.0.0.tar.bz2
diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index 7e6878db4d..3f3b24c682 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -4,22 +4,19 @@
 #
 ################################################################################
 
-PINENTRY_VERSION = 0.9.4
+PINENTRY_VERSION = 1.0.0
 PINENTRY_SOURCE = pinentry-$(PINENTRY_VERSION).tar.bz2
-PINENTRY_SITE = ftp://ftp.gnupg.org/gcrypt/pinentry
+PINENTRY_SITE = https://www.gnupg.org/ftp/gcrypt/pinentry
 PINENTRY_LICENSE = GPL-2.0+
 PINENTRY_LICENSE_FILES = COPYING
 PINENTRY_DEPENDENCIES = \
+	libassuan libgpg-error \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	host-pkgconf
-PINENTRY_CONF_OPTS += --without-libcap       # requires PAM
-
-# pinentry uses some std::string functionality that needs C++11
-# support when gcc >= 5.x. This should be removed when bumping
-# pinentry, since newer versions no longer use std::string.
-ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5),y)
-PINENTRY_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=gnu++11"
-endif
+PINENTRY_CONF_OPTS += \
+	--with-libassuan-prefix=$(STAGING_DIR)/usr \
+	--with-libgpg-error-prefix=$(STAGING_DIR)/usr \
+	--without-libcap       # requires PAM
 
 # build with X if available
 ifeq ($(BR2_PACKAGE_XORG7),y)
@@ -56,10 +53,10 @@ ifeq ($(BR2_PACKAGE_PINENTRY_QT4),y)
 # -pthread needs to be passed for certain toolchains
 # http://autobuild.buildroot.net/results/6be/6be109ccedec603a67cebdb31b55865dcce0e128/
 PINENTRY_CONF_OPTS += LIBS=-pthread MOC=$(HOST_DIR)/bin/moc
-PINENTRY_CONF_OPTS += --enable-pinentry-qt4
+PINENTRY_CONF_OPTS += --enable-pinentry-qt
 PINENTRY_DEPENDENCIES += qt
 else
-PINENTRY_CONF_OPTS += --disable-pinentry-qt4
+PINENTRY_CONF_OPTS += --disable-pinentry-qt
 endif
 
 $(eval $(autotools-package))
-- 
2.11.0
