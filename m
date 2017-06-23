From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 22 Jun 2017 23:52:31 -0300
Subject: [Buildroot] [PATCH] util-linux: bump to version 2.30
Message-ID: <20170623025231.26094-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Update the "basic set" description to include fincore, which is built
  by default, and remove tailf, which was removed in this version.
- Add configuration options for the new utilities "chmem" and "lsmem".
- Add a patch to revert the assumption that ncursesw headers are under
  /usr/include/ncursesw/ only. That's necessary to have both versions
  for ABI/API compatibility but does not make sense on embedded systems.
- Drop autoreconf, since the patch on term-utils/Makemodule.am is gone.

The patch is a bit drastic but it solves the problem of using ncursews
while we discuss a better solution in the util-linux mailing list.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 ...-Revert-build-sys-ncurses-headers-cleanup.patch | 191 +++++++++++++++++++++
 ...-sys-use-lm-for-scriptreplay-if-necessary.patch |  30 ----
 package/util-linux/Config.in                       |  24 ++-
 package/util-linux/util-linux.hash                 |   4 +-
 package/util-linux/util-linux.mk                   |  12 +-
 5 files changed, 218 insertions(+), 43 deletions(-)
 create mode 100644 package/util-linux/0001-Revert-build-sys-ncurses-headers-cleanup.patch
 delete mode 100644 package/util-linux/0001-build-sys-use-lm-for-scriptreplay-if-necessary.patch

diff --git a/package/util-linux/0001-Revert-build-sys-ncurses-headers-cleanup.patch b/package/util-linux/0001-Revert-build-sys-ncurses-headers-cleanup.patch
new file mode 100644
index 000000000..a344ee903
--- /dev/null
+++ b/package/util-linux/0001-Revert-build-sys-ncurses-headers-cleanup.patch
@@ -0,0 +1,191 @@
+From 51157b7416cd9d09cb21ee8cebf5750b48f44201 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.ind.br>
+Date: Thu, 22 Jun 2017 20:53:55 -0300
+Subject: [PATCH] Revert "build-sys: ncurses headers cleanup"
+
+This reverts commit 3947ca4ca9737d830f54658ef353f5626c0d0282.
+---
+ configure.ac         |  8 +++++---
+ lib/colors.c         | 15 ++++-----------
+ misc-utils/cal.c     |  8 ++++----
+ term-utils/setterm.c |  8 ++++----
+ text-utils/more.c    |  8 ++++----
+ text-utils/pg.c      | 16 +++++++++-------
+ text-utils/ul.c      |  8 ++++----
+ 7 files changed, 34 insertions(+), 37 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 53d25b8ab..3512162df 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -803,8 +803,9 @@ have_ncursesw_header=no
+ AS_IF([test "x$with_ncursesw" != xno], [
+   UL_NCURSES_CHECK([ncursesw])
+   AS_IF([test "x$have_ncursesw" = xyes], [
+-    AC_CHECK_HEADERS([ncursesw/ncurses.h], [have_ncursesw_header=yes])
+-    AC_CHECK_HEADERS([ncursesw/term.h])
++    AC_CHECK_HEADERS([ncursesw/ncurses.h ncurses.h],
++		     [have_ncursesw_header=yes])
++    AC_CHECK_HEADERS([ncursesw/term.h term.h])
+     AS_IF([test "x$have_ncursesw_header" = xno], [have_ncursesw=no])
+   ])
+   AS_IF([test "x$have_ncursesw" = xyes], [
+@@ -829,7 +830,8 @@ AS_CASE([$with_ncurses:$build_widechar],
+ AS_IF([test "x$have_ncursesw" = xno -a "x$with_ncurses" != xno ], [
+   UL_NCURSES_CHECK([ncurses])
+   AS_IF([test "x$have_ncurses" = xyes], [
+-    AC_CHECK_HEADERS([ncurses/ncurses.h ncurses.h], [have_ncurses_header=yes])
++    AC_CHECK_HEADERS([ncurses/ncurses.h ncurses.h],
++		     [have_ncurses_header=yes])
+     AC_CHECK_HEADERS([ncurses/term.h term.h])
+     AS_IF([test "x$have_ncurses_header" = xno], [have_ncurses=no])
+   ])
+diff --git a/lib/colors.c b/lib/colors.c
+index f82496d7a..72c5158cb 100644
+--- a/lib/colors.c
++++ b/lib/colors.c
+@@ -12,19 +12,12 @@
+ #include <ctype.h>
+ 
+ #if defined(HAVE_LIBNCURSES) || defined(HAVE_LIBNCURSESW)
+-# if defined(HAVE_NCURSESW_NCURSES_H)
+-#  include <ncursesw/ncurses.h>
+-# elif defined(HAVE_NCURSES_NCURSES_H)
+-#  include <ncurses/ncurses.h>
+-# elif defined(HAVE_NCURSES_H)
+-#  include <ncurses.h>
+-# endif
+-# if defined(HAVE_NCURSESW_TERM_H)
+-#  include <ncursesw/term.h>
++# ifdef HAVE_TERM_H
++#  include <term.h>
+ # elif defined(HAVE_NCURSES_TERM_H)
+ #  include <ncurses/term.h>
+-# elif defined(HAVE_TERM_H)
+-#  include <term.h>
++# elif defined(HAVE_NCURSESW_TERM_H)
++#  include <ncursesw/term.h>
+ # endif
+ #endif
+ 
+diff --git a/misc-utils/cal.c b/misc-utils/cal.c
+index 604eb26a7..2b16979db 100644
+--- a/misc-utils/cal.c
++++ b/misc-utils/cal.c
+@@ -80,12 +80,12 @@ static int has_term = 0;
+ static const char *Senter = "", *Sexit = "";	/* enter and exit standout mode */
+ 
+ #if defined(HAVE_LIBNCURSES) || defined(HAVE_LIBNCURSESW)
+-# if defined(HAVE_NCURSESW_TERM_H)
+-#  include <ncursesw/term.h>
++# ifdef HAVE_TERM_H
++#  include <term.h>
+ # elif defined(HAVE_NCURSES_TERM_H)
+ #  include <ncurses/term.h>
+-# elif defined(HAVE_TERM_H)
+-#  include <term.h>
++# elif defined(HAVE_NCURSESW_TERM_H)
++#  include <ncursesw/term.h>
+ # endif
+ #endif
+ 
+diff --git a/term-utils/setterm.c b/term-utils/setterm.c
+index 9f60e5693..53826f954 100644
+--- a/term-utils/setterm.c
++++ b/term-utils/setterm.c
+@@ -60,12 +60,12 @@
+ #include <termios.h>
+ #include <unistd.h>
+ 
+-#if defined(HAVE_NCURSESW_TERM_H)
+-# include <ncursesw/term.h>
++#ifdef HAVE_TERM_H
++# include <term.h>
+ #elif defined(HAVE_NCURSES_TERM_H)
+ # include <ncurses/term.h>
+-#elif defined(HAVE_TERM_H)
+-# include <term.h>
++#elif defined(HAVE_NCURSESW_TERM_H)
++# include <ncursesw/term.h>
+ #endif
+ 
+ #ifdef HAVE_LINUX_TIOCL_H
+diff --git a/text-utils/more.c b/text-utils/more.c
+index 72dd96bf4..cc53075f6 100644
+--- a/text-utils/more.c
++++ b/text-utils/more.c
+@@ -190,12 +190,12 @@ static struct {
+ } context, screen_start;
+ extern char PC;			/* pad character */
+ 
+-#if defined(HAVE_NCURSESW_TERM_H)
+-# include <ncursesw/term.h>
++#ifdef HAVE_TERM_H
++# include <term.h>
+ #elif defined(HAVE_NCURSES_TERM_H)
+ # include <ncurses/term.h>
+-#elif defined(HAVE_TERM_H)
+-# include <term.h>
++#elif defined(HAVE_NCURSESW_TERM_H)
++#  include <ncursesw/term.h>
+ #endif
+ 
+ #define TERM_AUTO_RIGHT_MARGIN    "am"
+diff --git a/text-utils/pg.c b/text-utils/pg.c
+index 1b9b8d7dd..bc485e2fe 100644
+--- a/text-utils/pg.c
++++ b/text-utils/pg.c
+@@ -59,20 +59,22 @@
+ #include <signal.h>
+ #include <setjmp.h>
+ 
+-#if defined(HAVE_NCURSESW_NCURSES_H)
++#ifdef HAVE_NCURSESW_H
++# include <ncursesw.h>
++#elif defined(HAVE_NCURSES_H)
++# include <ncurses.h>
++#elif defined(HAVE_NCURSESW_NCURSES_H)
+ # include <ncursesw/ncurses.h>
+ #elif defined(HAVE_NCURSES_NCURSES_H)
+ # include <ncurses/ncurses.h>
+-#elif defined(HAVE_NCURSES_H)
+-# include <ncurses.h>
+ #endif
+ 
+-#if defined(HAVE_NCURSESW_TERM_H)
+-# include <ncursesw/term.h>
++#ifdef HAVE_TERM_H
++# include <term.h>
+ #elif defined(HAVE_NCURSES_TERM_H)
+ # include <ncurses/term.h>
+-#elif defined(HAVE_TERM_H)
+-# include <term.h>
++#elif defined(HAVE_NCURSESW_TERM_H)
++# include <ncursesw/term.h>
+ #endif
+ 
+ #include "nls.h"
+diff --git a/text-utils/ul.c b/text-utils/ul.c
+index 3986b4206..3d1518cea 100644
+--- a/text-utils/ul.c
++++ b/text-utils/ul.c
+@@ -49,12 +49,12 @@
+ #include <errno.h>
+ #include <getopt.h>
+ 
+-#if defined(HAVE_NCURSESW_TERM_H)
+-# include <ncursesw/term.h>
++#ifdef HAVE_TERM_H
++# include <term.h>
+ #elif defined(HAVE_NCURSES_TERM_H)
+ # include <ncurses/term.h>
+-#elif defined(HAVE_TERM_H)
+-# include <term.h>
++#elif defined(HAVE_NCURSESW_TERM_H)
++# include <ncursesw/term.h>
+ #endif
+ 
+ #include "nls.h"
+-- 
+2.11.0
+
diff --git a/package/util-linux/0001-build-sys-use-lm-for-scriptreplay-if-necessary.patch b/package/util-linux/0001-build-sys-use-lm-for-scriptreplay-if-necessary.patch
deleted file mode 100644
index cbf1a8191..000000000
--- a/package/util-linux/0001-build-sys-use-lm-for-scriptreplay-if-necessary.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 02283be90292b2f57183aa930c4d69375f1d905d Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Wed, 18 Jan 2017 13:17:21 +0100
-Subject: [PATCH] build-sys: use -lm for scriptreplay if necessary
-
-Reported-by: Bert van Hall <bert.vanhall@avionic-design.de>
-Addresses: https://github.com/karelzak/util-linux/pull/397
-Signed-off-by: Karel Zak <kzak@redhat.com>
-(cherry picked from commit feda4342df1ced25df3d200ed23469e740196c86)
-Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
----
- term-utils/Makemodule.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/term-utils/Makemodule.am b/term-utils/Makemodule.am
-index 1b7c5fc..ad1bb1f 100644
---- a/term-utils/Makemodule.am
-+++ b/term-utils/Makemodule.am
-@@ -21,7 +21,7 @@ if BUILD_SCRIPTREPLAY
- usrbin_exec_PROGRAMS += scriptreplay
- dist_man_MANS += term-utils/scriptreplay.1
- scriptreplay_SOURCES = term-utils/scriptreplay.c
--scriptreplay_LDADD = $(LDADD) libcommon.la
-+scriptreplay_LDADD = $(LDADD) libcommon.la $(MATH_LIBS)
- endif # BUILD_SCRIPTREPLAY
- 
- 
--- 
-2.7.4
-
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 86db3722c..6ba239efb 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -55,12 +55,12 @@ config BR2_PACKAGE_UTIL_LINUX_BINARIES
 	  Install the basic set of util-linux binaries.
 
 	  blkdiscard, blkid, blockdev, chcpu, col, colcrt, colrm,
-	  column, ctrlaltdel, dmesg, fdisk, findfs, findmnt, flock,
-	  fsfreeze, fstrim, getopt, hexdump, ipcmk, isosize, ldattach,
-	  look, lsblk, lscpu, lsipc, lslocks, lsns, mcookie, mkfs,
-	  mkswap, namei, prlimit, readprofile, renice, rev, rtcwake,
-	  script, scriptreplay, setarch, setsid, sfdisk, swaplabel,
-	  swapoff, swapon, tailf, uuidgen, whereis, wipefs
+	  column, ctrlaltdel, dmesg, fdisk, fincore, findfs, findmnt,
+	  flock, fsfreeze, fstrim, getopt, hexdump, ipcmk, isosize,
+	  ldattach, look, lsblk, lscpu, lsipc, lslocks, lsns, mcookie,
+	  mkfs, mkswap, namei, prlimit, readprofile, renice, rev,
+	  rtcwake, script, scriptreplay, setarch, setsid, sfdisk,
+	  swaplabel, swapoff, swapon, uuidgen, whereis, wipefs
 
 	  The setarch utility also installs architecture-specific
 	  symlinks like linux32, linux64, uname26, i386 and x86_64.
@@ -95,6 +95,11 @@ comment "chfn/chsh needs a uClibc or glibc toolchain w/ wchar, locale, dynamic l
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
 		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
 
+config BR2_PACKAGE_UTIL_LINUX_CHMEM
+	bool "chmem"
+	help
+	  Sets a particular size or range of memory online or offline
+
 config BR2_PACKAGE_UTIL_LINUX_CRAMFS
 	bool "cramfs utilities"
 	select BR2_PACKAGE_ZLIB
@@ -194,6 +199,13 @@ config BR2_PACKAGE_UTIL_LINUX_LSLOGINS
 	help
 	  Display information about known users in the system
 
+config BR2_PACKAGE_UTIL_LINUX_LSMEM
+	bool "lsmem"
+	depends on BR2_USE_MMU # libsmartcols
+	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
+	help
+	  List the ranges of available memory with their online status
+
 config BR2_PACKAGE_UTIL_LINUX_MESG
 	bool "mesg"
 	help
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index 71b4982f0..02b82f600 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,2 +1,2 @@
-# From https://www.kernel.org/pub/linux/utils/util-linux/v2.29/sha256sums.asc
-sha256 accea4d678209f97f634f40a93b7e9fcad5915d1f4749f6c47bee6bf110fe8e3  util-linux-2.29.2.tar.xz
+# From https://www.kernel.org/pub/linux/utils/util-linux/v2.30/sha256sums.asc
+sha256 c208a4ff6906cb7f57940aa5bc3a6eed146e50a7cc0a092f52ef2ab65057a08d  util-linux-2.30.tar.xz
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 325d0fe8e..d55ee7cb3 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-UTIL_LINUX_VERSION_MAJOR = 2.29
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
+UTIL_LINUX_VERSION_MAJOR = 2.30
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
-# 0001-build-sys-use-lm-for-scriptreplay-if-necessary.patch
+# 0001-Revert-build-sys-ncurses-headers-cleanup.patch
 UTIL_LINUX_AUTORECONF = YES
 
 # README.licensing claims that some files are GPL-2.0 only, but this is not true.
@@ -48,10 +48,10 @@ ifeq ($(BR2_PACKAGE_NCURSES),y)
 UTIL_LINUX_DEPENDENCIES += ncurses
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
 UTIL_LINUX_CONF_OPTS += --with-ncursesw
-UTIL_LINUX_CONF_ENV += NCURSESW5_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
+UTIL_LINUX_CONF_ENV += NCURSESW6_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
 else
 UTIL_LINUX_CONF_OPTS += --without-ncursesw --with-ncurses --disable-widechar
-UTIL_LINUX_CONF_ENV += NCURSES5_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
+UTIL_LINUX_CONF_ENV += NCURSES6_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
 endif
 else
 ifeq ($(BR2_USE_WCHAR),y)
@@ -104,6 +104,7 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_BFS),--enable-bfs,--disable-bfs) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_CAL),--enable-cal,--disable-cal) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_CHFN_CHSH),--enable-chfn-chsh,--disable-chfn-chsh) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_CHMEM),--enable-chmem,--disable-chmem) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_CRAMFS),--enable-cramfs,--disable-cramfs) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_EJECT),--enable-eject,--disable-eject) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FALLOCATE),--enable-fallocate,--disable-fallocate) \
@@ -124,6 +125,7 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),--enable-last --enable-login --enable-runuser --enable-su --enable-sulogin,--disable-last --disable-login --disable-runuser --disable-su --disable-sulogin) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOSETUP),--enable-losetup,--disable-losetup) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LSLOGINS),--enable-lslogins,--disable-lslogins) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LSMEM),--enable-lsmem,--disable-lsmem) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MESG),--enable-mesg,--disable-mesg) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MINIX),--enable-minix,--disable-minix) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MORE),--enable-more,--disable-more) \
-- 
2.11.0
