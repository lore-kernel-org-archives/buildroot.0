From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 22:01:36 +0200
Subject: [Buildroot] [git commit] sngrep: bump version to v1.4.3
Message-ID: <20170601202900.AA006818F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3b5baee36c349b16fcef2b4ba1c5f56abc26795
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The two patches were committed upstream.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-src-Makefile.am-don-t-use-VPATH.patch     | 43 -------------
 ...e.ac-switch-to-pkg-config-to-find-openssl.patch | 75 ----------------------
 package/sngrep/sngrep.hash                         |  2 +-
 package/sngrep/sngrep.mk                           |  2 +-
 4 files changed, 2 insertions(+), 120 deletions(-)

diff --git a/package/sngrep/0001-src-Makefile.am-don-t-use-VPATH.patch b/package/sngrep/0001-src-Makefile.am-don-t-use-VPATH.patch
deleted file mode 100644
index 3d98203..0000000
--- a/package/sngrep/0001-src-Makefile.am-don-t-use-VPATH.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From b6dcae8ec4334e2436cfa19a8052c3473f57a586 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 4 Mar 2017 15:02:43 +0100
-Subject: [PATCH 1/2] src/Makefile.am: don't use VPATH
-
-VPATH is a mechanism used to allow out-of-tree build, not to use source
-code from a different directory. For this purpose, one should simply use
-the "subdir-objects" AUTOMAKE_OPTIONS, and reference the source code of
-the sub-directory in the <prog>_SOURCES variable.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Upstream-status: https://github.com/irontec/sngrep/pull/176
----
- src/Makefile.am | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 931ee06..961f4a0 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -1,5 +1,5 @@
-+AUTOMAKE_OPTIONS=subdir-objects
- bin_PROGRAMS=sngrep
--VPATH=curses
- sngrep_SOURCES=capture.c
- if USE_EEP
- sngrep_SOURCES+=capture_eep.c
-@@ -12,8 +12,8 @@ sngrep_SOURCES+=capture_openssl.c
- endif
- sngrep_SOURCES+=address.c packet.c sip.c sip_call.c sip_msg.c sip_attr.c main.c
- sngrep_SOURCES+=option.c group.c filter.c keybinding.c media.c setting.c rtp.c
--sngrep_SOURCES+=util.c hash.c vector.c ui_panel.c scrollbar.c
--sngrep_SOURCES+=ui_manager.c ui_call_list.c ui_call_flow.c ui_call_raw.c
--sngrep_SOURCES+=ui_stats.c ui_filter.c ui_save.c ui_msg_diff.c
--sngrep_SOURCES+=ui_column_select.c ui_settings.c
-+sngrep_SOURCES+=util.c hash.c vector.c curses/ui_panel.c curses/scrollbar.c
-+sngrep_SOURCES+=curses/ui_manager.c curses/ui_call_list.c curses/ui_call_flow.c curses/ui_call_raw.c
-+sngrep_SOURCES+=curses/ui_stats.c curses/ui_filter.c curses/ui_save.c curses/ui_msg_diff.c
-+sngrep_SOURCES+=curses/ui_column_select.c curses/ui_settings.c
- 
--- 
-2.7.4
-
diff --git a/package/sngrep/0002-configure.ac-switch-to-pkg-config-to-find-openssl.patch b/package/sngrep/0002-configure.ac-switch-to-pkg-config-to-find-openssl.patch
deleted file mode 100644
index b51581f..0000000
--- a/package/sngrep/0002-configure.ac-switch-to-pkg-config-to-find-openssl.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 22b08ab1a45eb3773b3c90dc37a31a7574520daa Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 4 Mar 2017 14:56:53 +0100
-Subject: [PATCH 2/2] configure.ac: switch to pkg-config to find openssl
-
-Using AC_CHECK_LIB() doesn't work properly for static linking, because
-it doesn't return information on transitive dependencies of
-libraries. For example, if library A internally uses library B, then
-with dynamic linking, doing -lA is sufficient. However, with static
-linking, one must do -lA -lB, and AC_CHECK_LIB() will only give the -lA
-information. This for example causes a build failure when building
-sngrep statically with openssl enabled:
-
-checking for SSL_new in -lssl... no
-configure: error:  You need to have libssl installed to compile sngrep
-
-due to undefined symbols in the OpenSSL library.
-
-The proper solution for this is to discover the library using
-pkg-config, because pkg-config properly returns the list of necessary
-libraries, as it understands the concept of "list of libraries needed
-when dynamic linking" and "list of libraries needed for static linking".
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Upstream-status: https://github.com/irontec/sngrep/pull/176
----
- configure.ac    | 9 +--------
- src/Makefile.am | 4 ++++
- 2 files changed, 5 insertions(+), 8 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 42e00e9..9f8e6d2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -129,14 +129,7 @@ AS_IF([test "x$WITH_OPENSSL" == "xyes"], [
- 	AS_IF([test "x$WITH_GNUTLS" == "xyes"], [
- 	    AC_MSG_ERROR([ GnuTLS and OpenSSL can not be enabled at the same time ])
- 	], [])
--
--	AC_CHECK_LIB([ssl], [SSL_new], [], [
--	    AC_MSG_ERROR([ You need to have libssl installed to compile sngrep])
--	])
--
--	AC_CHECK_LIB([crypto], [EVP_get_cipherbyname], [], [
--	    AC_MSG_ERROR([ You need to have libcrypto installed to compile sngrep])
--	])
-+	PKG_CHECK_MODULES([SSL], [libssl libcrypto])
- 	AC_DEFINE([WITH_OPENSSL],[],[Compile With Openssl compatibility])
- ], [])
- 
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 961f4a0..3a471b7 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -1,6 +1,8 @@
- AUTOMAKE_OPTIONS=subdir-objects
- bin_PROGRAMS=sngrep
- sngrep_SOURCES=capture.c
-+sngrep_CFLAGS=
-+sngrep_LDADD=
- if USE_EEP
- sngrep_SOURCES+=capture_eep.c
- endif
-@@ -9,6 +11,8 @@ sngrep_SOURCES+=capture_gnutls.c
- endif
- if WITH_OPENSSL
- sngrep_SOURCES+=capture_openssl.c
-+sngrep_CFLAGS+=$(SSL_CFLAGS)
-+sngrep_LDADD+=$(SSL_LIBS)
- endif
- sngrep_SOURCES+=address.c packet.c sip.c sip_call.c sip_msg.c sip_attr.c main.c
- sngrep_SOURCES+=option.c group.c filter.c keybinding.c media.c setting.c rtp.c
--- 
-2.7.4
-
diff --git a/package/sngrep/sngrep.hash b/package/sngrep/sngrep.hash
index dd75f89..bc28545 100644
--- a/package/sngrep/sngrep.hash
+++ b/package/sngrep/sngrep.hash
@@ -1 +1 @@
-sha256 30fbfb4f90ed8805194b39683a8a2ed465776ffd60df4482bd029d63b316b3f1 sngrep-v1.4.2.tar.gz
+sha256 7385ac202de6d6a1feffb2fd514600563133d9dfa7fb47be052de839abcc1d52 sngrep-v1.4.3.tar.gz
diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index 74b05b1..560872f 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNGREP_VERSION = v1.4.2
+SNGREP_VERSION = v1.4.3
 SNGREP_SITE = $(call github,irontec,sngrep,$(SNGREP_VERSION))
 SNGREP_LICENSE = GPL-3.0+
 SNGREP_LICENSE_FILES = LICENSE
