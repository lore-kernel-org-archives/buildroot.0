From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 5 May 2019 22:45:54 +0200
Subject: [Buildroot] [git commit] package/minicom: bump to version
 1e84585e8e7710677b6ff9a70dce5f3ad3e23540
Message-ID: <20190505204143.3F16E811F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04a11ca1b826f55a1e0311d76fd7e2c5003d43c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove both patches since they've been upstreamed.

Add host-pkgconf to MINICOM_DEPENDENCIES and remove:
`MINICOM_CONF_ENV = PKG_CONFIG=/bin/false` since now pkg-config is
needed to build.

Shortlog follows:
git shortlog --no-merges  19ab49422f3431102c31fea01549121385113f80..
Adam Lackorzynski (9):
      Update project URL
      Updated translations
      Updated translations: pl and sv
      Translations: regen update
      Update danish translation
      Update of danish translation
      Update README
      Formatting fix
      More friendly mbslength test

Fabrice Fontaine (1):
      src/Makefile.am: fix ascii-xfr link with lintl

Giulio Benetti (2):
      TODO: remove Utf8 bug.
      sysdep1: check if RS485 is support before setting its parameters

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...ck-if-RS485-is-support-before-setting-its.patch | 36 ------------------
 ...Makefile.am-fix-ascii-xfr-link-with-lintl.patch | 44 ----------------------
 package/minicom/minicom.hash                       |  2 +-
 package/minicom/minicom.mk                         | 10 +----
 4 files changed, 3 insertions(+), 89 deletions(-)

diff --git a/package/minicom/0001-sysdep1-check-if-RS485-is-support-before-setting-its.patch b/package/minicom/0001-sysdep1-check-if-RS485-is-support-before-setting-its.patch
deleted file mode 100644
index 39f68350c8..0000000000
--- a/package/minicom/0001-sysdep1-check-if-RS485-is-support-before-setting-its.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 238bbe98558bcd5ed9ab73ef03db82b57ab056ab Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@micronovasrl.com>
-Date: Fri, 31 Aug 2018 15:18:22 +0200
-Subject: [PATCH] sysdep1: check if RS485 is support before setting its
- parameters
-
-Not every kernel supports RS485, so better check it before setting its
-parameters.
-
-Test if RS485 is supported by checking if these 3 macros are defined:
-- SER_RS485_ENABLED
-- TIOCGRS485
-- TIOCSRS485
-If they're not defined m_set485parms becomes a dummy function.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
----
- src/sysdep1.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/sysdep1.c b/src/sysdep1.c
-index 798b006..b03b442 100644
---- a/src/sysdep1.c
-+++ b/src/sysdep1.c
-@@ -599,7 +599,7 @@ void m_set485parms(int fd, int en, int rts_on_snd, int rts_aft_snd,
-                    int rx_dur_tx, int term_bus, char *del_rts_bef_snd,
-                    char *del_rts_aft_snd)
- {
--#ifdef SER_RS485_ENABLED
-+#if defined (SER_RS485_ENABLED) && defined (TIOCGRS485) && defined (TIOCSRS485)
-   struct serial_rs485 rs485conf;
- 
-   if (ioctl(fd, TIOCGRS485, &rs485conf))
--- 
-2.17.1
-
diff --git a/package/minicom/0002-src-Makefile.am-fix-ascii-xfr-link-with-lintl.patch b/package/minicom/0002-src-Makefile.am-fix-ascii-xfr-link-with-lintl.patch
deleted file mode 100644
index efc880d2e7..0000000000
--- a/package/minicom/0002-src-Makefile.am-fix-ascii-xfr-link-with-lintl.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 6fe734c5a1d51e2d4a3c1cd4d7a61cc246faa3f2 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 20 Apr 2019 13:34:23 +0200
-Subject: [PATCH] src/Makefile.am: fix ascii-xfr link with lintl
-
-ascii-xfr needs to link with lintl if needed:
-
-/home/dawncrow/buildroot-test/scripts/instance-0/output/host/bin/m68k-linux-gcc  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2   -W -Wall -Wextra -std=gnu99 -Wno-format-truncation   -o ascii-xfr ascii-xfr.o ../lib/libport.a -lncurses
-ascii-xfr.o: In function `stats':
-ascii-xfr.c:(.text+0x4c): undefined reference to `libintl_gettext'
-ascii-xfr.c:(.text+0xb2): undefined reference to `libintl_gettext'
-ascii-xfr.o: In function `usage':
-ascii-xfr.c:(.text+0x10e): undefined reference to `libintl_gettext'
-ascii-xfr.o: In function `asend':
-ascii-xfr.c:(.text+0x534): undefined reference to `libintl_gettext'
-ascii-xfr.o: In function `main':
-ascii-xfr.c:(.text.startup+0xc8): undefined reference to `libintl_gettext'
-ascii-xfr.o:ascii-xfr.c:(.text.startup+0x1a8): more undefined references to `libintl_gettext' follow
-
-Fixes:
- - http://autobuild.buildroot.org/results/e64cdcf648764be53a3e951304bb89dc9410db23
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://salsa.debian.org/minicom-team/minicom/merge_requests/7]
----
- src/Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 19b1888..ba92f71 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -29,6 +29,7 @@ confdir = @MINICOM_CONFDIR@
- AM_CPPFLAGS = @CPPFLAGS@ -I$(top_srcdir)/lib -DCONFDIR=\"$(confdir)\" \
-               -DLOCALEDIR=\"$(datadir)/locale\"
- 
-+ascii_xfr_LDADD = @LIBINTL@
- minicom_LDADD = @LIBINTL@ $(LIBICONV) $(MINICOM_LIBPORT) $(LOCKDEV_LIBS)
- minicom_keyserv_LDADD = @LIBINTL@ $(MINICOM_LIBPORT)
- runscript_LDADD = @LIBINTL@ $(MINICOM_LIBPORT)
--- 
-2.20.1
-
diff --git a/package/minicom/minicom.hash b/package/minicom/minicom.hash
index c566f4be52..ec2a1812ff 100644
--- a/package/minicom/minicom.hash
+++ b/package/minicom/minicom.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 3bd58b594ac66545649c13ab2b728a4df0f78612eb030680d4152f7627d1f177  minicom-19ab49422f3431102c31fea01549121385113f80.tar.gz
+sha256 3f2100099e852c17e18c1249fa516c9806b3491f345b7661ba9bbf3e66313dc3  minicom-1e84585e8e7710677b6ff9a70dce5f3ad3e23540.tar.gz
 sha256 cf80a758014eefbf068afffe3d462fc34ff4f528527524d8e100329c42094e15  COPYING
diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index 000597f8a9..a3c58d2d4e 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -4,21 +4,15 @@
 #
 ################################################################################
 
-MINICOM_VERSION = 19ab49422f3431102c31fea01549121385113f80
+MINICOM_VERSION = 1e84585e8e7710677b6ff9a70dce5f3ad3e23540
 MINICOM_SITE = https://salsa.debian.org/minicom-team/minicom.git
 MINICOM_SITE_METHOD = git
 MINICOM_LICENSE = GPL-2.0+
 MINICOM_LICENSE_FILES = COPYING
 MINICOM_AUTORECONF = YES
 
-# pkg-config is only used to check for liblockdev, which we don't have
-# in BR, so instead of adding host-pkgconf as a dependency, simply make
-# sure the host version isn't used so we don't end up with problems if
-# people have liblockdev1-dev installed
-MINICOM_CONF_ENV = PKG_CONFIG=/bin/false
-
 MINICOM_DEPENDENCIES = ncurses $(if $(BR2_ENABLE_LOCALE),,libiconv) \
-	$(TARGET_NLS_DEPENDENCIES)
+	$(TARGET_NLS_DEPENDENCIES) host-pkgconf
 # add host-gettext for AM_ICONV macro
 MINICOM_DEPENDENCIES += host-gettext
 
