From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  4 Mar 2017 15:15:58 +0100
Subject: [Buildroot] [PATCH] sngrep: use pkg-config to discover OpenSSL to
	fix static linking
Message-ID: <1488636958-5291-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building sngrep with OpenSSL support in static linking configurations
currently fails due to undefined symbols in the OpenSSL library. It's
the usual problem with using AC_CHECK_LIB() to discover libraries
instead of the pkg-config based PKG_CHECK_MODULES().

Therefore, this commit introduces a patch that switches to using
pkg-config to discover OpenSSL. A preliminary patch is needed, without
which appending to LIBS/CFLAGS doesn't work. Both patches have been
submitted upstream.

Fixes:

  http://autobuild.buildroot.net/results/911143de823b2c749ac0a59dfa06adb6ddd3de50/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-src-Makefile.am-don-t-use-VPATH.patch     | 43 +++++++++++++
 ...e.ac-switch-to-pkg-config-to-find-openssl.patch | 75 ++++++++++++++++++++++
 package/sngrep/sngrep.mk                           |  2 +-
 3 files changed, 119 insertions(+), 1 deletion(-)
 create mode 100644 package/sngrep/0001-src-Makefile.am-don-t-use-VPATH.patch
 create mode 100644 package/sngrep/0002-configure.ac-switch-to-pkg-config-to-find-openssl.patch

diff --git a/package/sngrep/0001-src-Makefile.am-don-t-use-VPATH.patch b/package/sngrep/0001-src-Makefile.am-don-t-use-VPATH.patch
new file mode 100644
index 0000000..3d98203
--- /dev/null
+++ b/package/sngrep/0001-src-Makefile.am-don-t-use-VPATH.patch
@@ -0,0 +1,43 @@
+From b6dcae8ec4334e2436cfa19a8052c3473f57a586 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 4 Mar 2017 15:02:43 +0100
+Subject: [PATCH 1/2] src/Makefile.am: don't use VPATH
+
+VPATH is a mechanism used to allow out-of-tree build, not to use source
+code from a different directory. For this purpose, one should simply use
+the "subdir-objects" AUTOMAKE_OPTIONS, and reference the source code of
+the sub-directory in the <prog>_SOURCES variable.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Upstream-status: https://github.com/irontec/sngrep/pull/176
+---
+ src/Makefile.am | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 931ee06..961f4a0 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -1,5 +1,5 @@
++AUTOMAKE_OPTIONS=subdir-objects
+ bin_PROGRAMS=sngrep
+-VPATH=curses
+ sngrep_SOURCES=capture.c
+ if USE_EEP
+ sngrep_SOURCES+=capture_eep.c
+@@ -12,8 +12,8 @@ sngrep_SOURCES+=capture_openssl.c
+ endif
+ sngrep_SOURCES+=address.c packet.c sip.c sip_call.c sip_msg.c sip_attr.c main.c
+ sngrep_SOURCES+=option.c group.c filter.c keybinding.c media.c setting.c rtp.c
+-sngrep_SOURCES+=util.c hash.c vector.c ui_panel.c scrollbar.c
+-sngrep_SOURCES+=ui_manager.c ui_call_list.c ui_call_flow.c ui_call_raw.c
+-sngrep_SOURCES+=ui_stats.c ui_filter.c ui_save.c ui_msg_diff.c
+-sngrep_SOURCES+=ui_column_select.c ui_settings.c
++sngrep_SOURCES+=util.c hash.c vector.c curses/ui_panel.c curses/scrollbar.c
++sngrep_SOURCES+=curses/ui_manager.c curses/ui_call_list.c curses/ui_call_flow.c curses/ui_call_raw.c
++sngrep_SOURCES+=curses/ui_stats.c curses/ui_filter.c curses/ui_save.c curses/ui_msg_diff.c
++sngrep_SOURCES+=curses/ui_column_select.c curses/ui_settings.c
+ 
+-- 
+2.7.4
+
diff --git a/package/sngrep/0002-configure.ac-switch-to-pkg-config-to-find-openssl.patch b/package/sngrep/0002-configure.ac-switch-to-pkg-config-to-find-openssl.patch
new file mode 100644
index 0000000..b51581f
--- /dev/null
+++ b/package/sngrep/0002-configure.ac-switch-to-pkg-config-to-find-openssl.patch
@@ -0,0 +1,75 @@
+From 22b08ab1a45eb3773b3c90dc37a31a7574520daa Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 4 Mar 2017 14:56:53 +0100
+Subject: [PATCH 2/2] configure.ac: switch to pkg-config to find openssl
+
+Using AC_CHECK_LIB() doesn't work properly for static linking, because
+it doesn't return information on transitive dependencies of
+libraries. For example, if library A internally uses library B, then
+with dynamic linking, doing -lA is sufficient. However, with static
+linking, one must do -lA -lB, and AC_CHECK_LIB() will only give the -lA
+information. This for example causes a build failure when building
+sngrep statically with openssl enabled:
+
+checking for SSL_new in -lssl... no
+configure: error:  You need to have libssl installed to compile sngrep
+
+due to undefined symbols in the OpenSSL library.
+
+The proper solution for this is to discover the library using
+pkg-config, because pkg-config properly returns the list of necessary
+libraries, as it understands the concept of "list of libraries needed
+when dynamic linking" and "list of libraries needed for static linking".
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Upstream-status: https://github.com/irontec/sngrep/pull/176
+---
+ configure.ac    | 9 +--------
+ src/Makefile.am | 4 ++++
+ 2 files changed, 5 insertions(+), 8 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 42e00e9..9f8e6d2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -129,14 +129,7 @@ AS_IF([test "x$WITH_OPENSSL" == "xyes"], [
+ 	AS_IF([test "x$WITH_GNUTLS" == "xyes"], [
+ 	    AC_MSG_ERROR([ GnuTLS and OpenSSL can not be enabled at the same time ])
+ 	], [])
+-
+-	AC_CHECK_LIB([ssl], [SSL_new], [], [
+-	    AC_MSG_ERROR([ You need to have libssl installed to compile sngrep])
+-	])
+-
+-	AC_CHECK_LIB([crypto], [EVP_get_cipherbyname], [], [
+-	    AC_MSG_ERROR([ You need to have libcrypto installed to compile sngrep])
+-	])
++	PKG_CHECK_MODULES([SSL], [libssl libcrypto])
+ 	AC_DEFINE([WITH_OPENSSL],[],[Compile With Openssl compatibility])
+ ], [])
+ 
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 961f4a0..3a471b7 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -1,6 +1,8 @@
+ AUTOMAKE_OPTIONS=subdir-objects
+ bin_PROGRAMS=sngrep
+ sngrep_SOURCES=capture.c
++sngrep_CFLAGS=
++sngrep_LDADD=
+ if USE_EEP
+ sngrep_SOURCES+=capture_eep.c
+ endif
+@@ -9,6 +11,8 @@ sngrep_SOURCES+=capture_gnutls.c
+ endif
+ if WITH_OPENSSL
+ sngrep_SOURCES+=capture_openssl.c
++sngrep_CFLAGS+=$(SSL_CFLAGS)
++sngrep_LDADD+=$(SSL_LIBS)
+ endif
+ sngrep_SOURCES+=address.c packet.c sip.c sip_call.c sip_msg.c sip_attr.c main.c
+ sngrep_SOURCES+=option.c group.c filter.c keybinding.c media.c setting.c rtp.c
+-- 
+2.7.4
+
diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index b82d8ce..1e0e051 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -9,7 +9,7 @@ SNGREP_SITE = $(call github,irontec,sngrep,$(SNGREP_VERSION))
 SNGREP_LICENSE = GPLv3+
 SNGREP_LICENSE_FILES = LICENSE
 SNGREP_AUTORECONF = YES
-SNGREP_DEPENDENCIES = libpcap ncurses
+SNGREP_DEPENDENCIES = libpcap ncurses host-pkgconf
 
 SNGREP_CONF_ENV += \
 	$(if $(BR2_STATIC_LIBS),LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --libs`")
-- 
2.7.4
