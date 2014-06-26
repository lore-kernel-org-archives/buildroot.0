From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 15:06:39 -0300
Subject: [Buildroot] [PATCHv2] bmon: bump to version 3.2
Message-ID: <1403805999-3011-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And add license information, homepage and switch upstream source.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bmon/Config.in          | 14 +++++++++++---
 package/bmon/bmon-curses.patch  | 26 --------------------------
 package/bmon/bmon-gcc4.patch    | 36 ------------------------------------
 package/bmon/bmon-nolibnl.patch | 24 ------------------------
 package/bmon/bmon-nostrip.patch | 12 ------------
 package/bmon/bmon.mk            | 23 ++++++++---------------
 6 files changed, 19 insertions(+), 116 deletions(-)
 delete mode 100644 package/bmon/bmon-curses.patch
 delete mode 100644 package/bmon/bmon-gcc4.patch
 delete mode 100644 package/bmon/bmon-nolibnl.patch
 delete mode 100644 package/bmon/bmon-nostrip.patch

diff --git a/package/bmon/Config.in b/package/bmon/Config.in
index 9f0dfa7..6aeca54 100644
--- a/package/bmon/Config.in
+++ b/package/bmon/Config.in
@@ -1,10 +1,18 @@
 config BR2_PACKAGE_BMON
 	bool "bmon"
 	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBCONFUSE
+	select BR2_PACKAGE_LIBNL
+	select BR2_PACKAGE_NCURSES
 	help
-	  Linux bandwidth monitor
+	  bmon is a bandwidth monitor capable of retrieving statistics from
+	  various input modules. It provides various output methods
+	  including a curses based interface.
 
-comment "bmon needs a toolchain w/ IPv6"
+	  http://www.infradead.org/~tgr/bmon/
+
+comment "bmon needs a toolchain w/ IPv6, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_INET_IPV6
+	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/bmon/bmon-curses.patch b/package/bmon/bmon-curses.patch
deleted file mode 100644
index 0eb164e..0000000
--- a/package/bmon/bmon-curses.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-[PATCH] fix build without curses
-
-bmon supports a --disable-curses configure option, but still #error
-out if curses wasn't detected, even though the rest of the code is
-written to work without curses support.
-
-Fix it by removing the bogus #error line.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- include/bmon/config.h |    2 --
- 1 file changed, 2 deletions(-)
-
-Index: bmon-2.1.0/include/bmon/config.h
-===================================================================
---- bmon-2.1.0.orig/include/bmon/config.h
-+++ bmon-2.1.0/include/bmon/config.h
-@@ -118,8 +118,6 @@
- #  endif /* !HAVE_CURSES */
- #elif defined HAVE_CURSES
- #  include <curses.h>
--#else
--#  error "*** ERROR: Neither ncurses nor curses is present on your system. ***"
- #endif /* HAVE_[N]CURSES */
- 
- #if defined HAVE_RRD
diff --git a/package/bmon/bmon-gcc4.patch b/package/bmon/bmon-gcc4.patch
deleted file mode 100644
index 23c12b5..0000000
--- a/package/bmon/bmon-gcc4.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-diff -ru bmon-2.1.0~/src/out_audio.c bmon-2.1.0/src/out_audio.c
---- bmon-2.1.0~/src/out_audio.c	2008-07-26 20:06:24.000000000 +0200
-+++ bmon-2.1.0/src/out_audio.c	2008-07-26 20:09:42.000000000 +0200
-@@ -141,7 +141,7 @@
- 	.om_draw = audio_draw,
- 	.om_set_opts = audio_set_opts,
- 	.om_probe = audio_probe,
--	.om_shutdown audio_shutdown,
-+	.om_shutdown = audio_shutdown
- };
- 
- static void __init audio_init(void)
-diff -ru bmon-2.1.0~/src/out_db.c bmon-2.1.0/src/out_db.c
---- bmon-2.1.0~/src/out_db.c	2008-07-26 20:06:24.000000000 +0200
-+++ bmon-2.1.0/src/out_db.c	2008-07-26 20:07:44.000000000 +0200
-@@ -679,7 +679,7 @@
- 	.om_draw = db_draw,
- 	.om_set_opts = db_set_opts,
- 	.om_probe = db_probe,
--	.om_shutdown db_shutdown,
-+	.om_shutdown = db_shutdown,
- };
- 
- static void __init db_init(void)
-diff -ru bmon-2.1.0~/src/out_xml_event.c bmon-2.1.0/src/out_xml_event.c
---- bmon-2.1.0~/src/out_xml_event.c	2008-07-26 20:06:24.000000000 +0200
-+++ bmon-2.1.0/src/out_xml_event.c	2008-07-26 20:09:42.000000000 +0200
-@@ -127,7 +127,7 @@
- 	.om_draw = xml_event_draw,
- 	.om_set_opts = xml_event_set_opts,
- 	.om_probe = xml_event_probe,
--	.om_shutdown xml_event_shutdown,
-+	.om_shutdown = xml_event_shutdown
- };
- 
- static void __init xml_event_init(void)
diff --git a/package/bmon/bmon-nolibnl.patch b/package/bmon/bmon-nolibnl.patch
deleted file mode 100644
index 4925cd4..0000000
--- a/package/bmon/bmon-nolibnl.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-diff -Nura bmon/configure bmon.libnl/configure
---- bmon/configure	2005-04-05 12:01:33.000000000 -0300
-+++ bmon.libnl/configure	2009-06-10 16:10:52.000000000 -0300
-@@ -7327,13 +7327,13 @@
- echo "${ECHO_T}$ac_cv_lib_nl_nl_connect" >&6
- if test $ac_cv_lib_nl_nl_connect = yes; then
- 
--
--cat >>confdefs.h <<_ACEOF
--#define HAVE_NL "1"
--_ACEOF
--
--	LIBNL="-lnl"
--	NL="Yes"
-+	case ${target_os} in
-+	    *linux*)
-+		echo
-+		echo "*** Warning: Building bmon on Linux w/o libnl ***"
-+		echo
-+	    ;;
-+	esac
- 
- else
- 
diff --git a/package/bmon/bmon-nostrip.patch b/package/bmon/bmon-nostrip.patch
deleted file mode 100644
index d457e84..0000000
--- a/package/bmon/bmon-nostrip.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -Nura bmon/GNUmakefile bmon.nostrip/GNUmakefile
---- bmon/GNUmakefile	2005-04-05 12:01:33.000000000 -0300
-+++ bmon.nostrip/GNUmakefile	2009-06-10 16:12:04.000000000 -0300
-@@ -50,7 +50,7 @@
- install:
- 	./install-sh -d -m 0755 $(DESTDIR)$(prefix)/bin
- 	./install-sh -d -m 0755 $(DESTDIR)$(mandir)/man1
--	./install-sh -c -s -m 0755 src/bmon $(DESTDIR)$(prefix)/bin
-+	./install-sh -c -m 0755 src/bmon $(DESTDIR)$(prefix)/bin
- 	./install-sh -c    -m 0644 man/bmon.1 $(DESTDIR)$(mandir)/man1
- 
- show: Makefile.opts
diff --git a/package/bmon/bmon.mk b/package/bmon/bmon.mk
index 39a6977..93a5c68 100644
--- a/package/bmon/bmon.mk
+++ b/package/bmon/bmon.mk
@@ -4,23 +4,16 @@
 #
 ################################################################################
 
-BMON_VERSION = 2.1.0
-BMON_SITE = http://distfiles.gentoo.org/distfiles
+BMON_VERSION = 3.2
+BMON_SITE = $(call github,tgraf,bmon,v$(BMON_VERSION))
+# configure not shipped
+BMON_AUTORECONF = YES
+BMON_DEPENDENCIES = host-pkgconf libconfuse libnl ncurses
+BMON_LICENSE = BSD-2c
+BMON_LICENSE_FILES = LICENSE
 
-ifeq ($(BR2_PACKAGE_NCURSES),y)
-BMON_DEPENDENCIES += ncurses
-else
-BMON_CONF_OPT += --disable-curses
-endif
-
-ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
-BMON_DEPENDENCIES += alsa-lib
-else
-BMON_CONF_OPT += --disable-asound
-endif
-
-ifneq ($(BR2_PREFER_STATIC_LIB),y)
 # link dynamically unless explicitly requested otherwise
+ifeq ($(BR2_PREFER_STATIC_LIB),)
 BMON_CONF_OPT += --disable-static
 endif
 
-- 
1.8.5.5
