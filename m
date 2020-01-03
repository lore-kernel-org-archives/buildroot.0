From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  3 Jan 2020 19:54:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/pcsc-lite: bump to version 1.8.26
Message-ID: <20200103185400.2109742-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch (already in version) and so drop autoreconf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...001-Add-disable-documentation-option.patch | 63 -------------------
 package/pcsc-lite/pcsc-lite.hash              |  2 +-
 package/pcsc-lite/pcsc-lite.mk                |  3 +-
 3 files changed, 2 insertions(+), 66 deletions(-)
 delete mode 100644 package/pcsc-lite/0001-Add-disable-documentation-option.patch

diff --git a/package/pcsc-lite/0001-Add-disable-documentation-option.patch b/package/pcsc-lite/0001-Add-disable-documentation-option.patch
deleted file mode 100644
index 6a083f5aa0..0000000000
--- a/package/pcsc-lite/0001-Add-disable-documentation-option.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 77ac8fcb78e3085577cd4eb5c4ac7746a5444f13 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 17 May 2019 15:48:35 +0200
-Subject: [PATCH] Add --disable-documentation option
-
-This option allows the user to disable man pages which can be useful if
-podman is not available
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/LudovicRousseau/PCSC/pull/60]
----
- configure.ac        | 7 +++++++
- src/spy/Makefile.am | 2 ++
- 2 files changed, 9 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 0fa5168..7d20c6e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -144,6 +144,12 @@ esac
- AC_DEFINE_UNQUOTED(PCSC_ARCH, "$PCSC_ARCH", [PC/SC target architecture])
- PCSCLITE_FEATURES="${PCSCLITE_FEATURES} $PCSC_ARCH $host"
- 
-+# --disable-documentation
-+AC_ARG_ENABLE(documentation,
-+	AS_HELP_STRING([--disable-documentation],[do not build documentation]),
-+	[ enable_doc="${enableval}" ], [ enable_doc="yes" ] )
-+AM_CONDITIONAL(ENABLE_DOC, test "$enable_doc" != "no")
-+
- # See if socket() is found from libsocket
- AC_CHECK_LIB(socket, socket, [LIBS="$LIBS -lsocket"])
- 
-@@ -446,6 +452,7 @@ use libsystemd:         ${use_libsystemd}
- systemd unit directory: ${with_systemdsystemunitdir}
- serial config dir.:     ${confdir_exp}
- filter:                 ${use_filter}
-+documentation:          ${enable_doc}
- 
- PCSCLITE_FEATURES:      ${PCSCLITE_FEATURES}
- 
-diff --git a/src/spy/Makefile.am b/src/spy/Makefile.am
-index 3c3daee..0a83371 100644
---- a/src/spy/Makefile.am
-+++ b/src/spy/Makefile.am
-@@ -6,6 +6,7 @@ dist_bin_SCRIPTS = pcsc-spy
- libpcscspy_la_SOURCES = \
- 	libpcscspy.c
- 
-+if ENABLE_DOC
- man_MANS = pcsc-spy.1
- 
- pcsc-spy.1: pcsc-spy.pod
-@@ -13,6 +14,7 @@ pcsc-spy.1: pcsc-spy.pod
- 		--center="PC/SC lite" \
- 		--release="$(PACKAGE_NAME) $(PACKAGE_VERSION)" \
- 		$(srcdir)/pcsc-spy.pod > $@
-+endif
- 
- EXTRA_DIST = install_spy.sh uninstall_spy.sh pcsc-spy.pod
- CLEANFILES = pcsc-spy.1
--- 
-2.20.1
-
diff --git a/package/pcsc-lite/pcsc-lite.hash b/package/pcsc-lite/pcsc-lite.hash
index 7e209f8cd2..5df6a93582 100644
--- a/package/pcsc-lite/pcsc-lite.hash
+++ b/package/pcsc-lite/pcsc-lite.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 d76d79edc31cf76e782b9f697420d3defbcc91778c3c650658086a1b748e8792  pcsc-lite-1.8.25.tar.bz2
+sha256 3eb7be7d6ef618c0a444316cf5c1f2f9d7227aedba7a192f389fe3e7c0dfbbd9  pcsc-lite-1.8.26.tar.bz2
 sha256 40d4358bb8dc8d30f5365ae6d999b6f820bbc051b292912482f2e4d0ebd837e1  COPYING
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-3.0.txt
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index 08aab466fc..96fa3f937a 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -4,14 +4,13 @@
 #
 ################################################################################
 
-PCSC_LITE_VERSION = 1.8.25
+PCSC_LITE_VERSION = 1.8.26
 PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
 PCSC_LITE_SITE = https://pcsclite.apdu.fr/files
 PCSC_LITE_INSTALL_STAGING = YES
 PCSC_LITE_DEPENDENCIES = host-pkgconf
 PCSC_LITE_LICENSE = BSD-2-Clause (auth), BSD-3-Clause, GPL-3.0+ (demo, spy, tests), ISC (simclist)
 PCSC_LITE_LICENSE_FILES = COPYING GPL-3.0.txt
-PCSC_LITE_AUTORECONF = YES
 
 # - libudev and libusb are optional
 # - libudev and libusb can't be used together
-- 
2.24.0
