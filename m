From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 01 Dec 2017 21:00:57 -0000
Subject: [Buildroot] [git commit] libnl: bump to version 3.4.0
Message-ID: <20171201205331.6C48B7FBCD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=58ebc2629ba7c74c5620de240f8a7e66765a1782
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop static build fix patch; upstream fixed static build in a different
way (https://github.com/thom311/libnl/pull/141).

Following the patch removal, autoreconf is not needed anymore.

Add license hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...rt-build-enable-building-cli-during-tests.patch | 115 ---------------------
 package/libnl/libnl.hash                           |   6 +-
 package/libnl/libnl.mk                             |   4 +-
 3 files changed, 5 insertions(+), 120 deletions(-)

diff --git a/package/libnl/0003-Revert-build-enable-building-cli-during-tests.patch b/package/libnl/0003-Revert-build-enable-building-cli-during-tests.patch
deleted file mode 100644
index f715bb8..0000000
--- a/package/libnl/0003-Revert-build-enable-building-cli-during-tests.patch
+++ /dev/null
@@ -1,115 +0,0 @@
-From 68f8393bd356a3d0598cf77e1044b7e8b98aa4d8 Mon Sep 17 00:00:00 2001
-Message-Id: <68f8393bd356a3d0598cf77e1044b7e8b98aa4d8.1493920165.git.baruch@tkos.co.il>
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 4 May 2017 15:56:14 +0300
-Subject: [PATCH] Revert "build: enable building cli during tests"
-
-This reverts commit 3cb28534d34392ceec4adead0cfa97039796ccb7.
-
-Contrary to what 3cb28534d commit log claims, the cli programs depend on
-dynamic libraries support of the toolchain. Enabling cli programs
-unconditionally breaks static build as follows:
-
-In file included from lib/cli/cls/basic.c:12:0:
-./include/netlink/cli/utils.h:25:19: fatal error: dlfcn.h: No such file or directory
-compilation terminated.
-Makefile:3666: recipe for target 'lib/cli/cls/lib_cli_cls_basic_la-basic.lo' failed
-make[1]: *** [lib/cli/cls/lib_cli_cls_basic_la-basic.lo] Error 1
-
-Revert that commit to restore the ability of static only build of libnl, and
-its dependencies.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://github.com/thom311/libnl/pull/141
-
- Makefile.am | 21 ++++++---------------
- 1 file changed, 6 insertions(+), 15 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 1b95a559304f..279548394650 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -3,8 +3,6 @@
- ACLOCAL_AMFLAGS = -I m4
- 
- lib_LTLIBRARIES =
--noinst_LTLIBRARIES =
--check_LTLIBRARIES =
- 
- check_PROGRAMS =
- check_programs =
-@@ -500,6 +498,8 @@ EXTRA_lib_libnl_xfrm_3_la_DEPENDENCIES = \
- lib_libnl_xfrm_3_la_LIBADD = \
- 	lib/libnl-3.la
- 
-+if ENABLE_CLI
-+
- lib_cli_ltlibraries_cls = \
- 	lib/cli/cls/basic.la \
- 	lib/cli/cls/cgroup.la
-@@ -513,15 +513,11 @@ lib_cli_ltlibraries_qdisc = \
- 	lib/cli/qdisc/pfifo.la \
- 	lib/cli/qdisc/plug.la
- 
--if ENABLE_CLI
- pkglib_clsdir = $(pkglibdir)/cli/cls
- pkglib_qdiscdir = $(pkglibdir)/cli/qdisc
- pkglib_cls_LTLIBRARIES = $(lib_cli_ltlibraries_cls)
- pkglib_qdisc_LTLIBRARIES = $(lib_cli_ltlibraries_qdisc)
--else
--noinst_LTLIBRARIES += \
--	$(lib_cli_ltlibraries_cls) \
--	$(lib_cli_ltlibraries_qdisc)
-+
- endif
- 
- lib_cli_ldflags = \
-@@ -550,13 +546,8 @@ lib_cli_qdisc_plug_la_LDFLAGS       = $(lib_cli_ldflags)
- 
- ###############################################################################
- 
--src_lib_ldflags =
--
- if ENABLE_CLI
- lib_LTLIBRARIES += src/lib/libnl-cli-3.la
--src_lib_ldflags += -version-info $(LT_CURRENT):$(LT_REVISION):$(LT_AGE)
--else
--check_LTLIBRARIES += src/lib/libnl-cli-3.la
- endif
- 
- src_lib_libnl_cli_3_la_SOURCES = \
-@@ -583,7 +574,7 @@ src_lib_libnl_cli_3_la_CPPFLAGS = \
- 	-I$(srcdir)/include \
- 	-I$(builddir)/include
- src_lib_libnl_cli_3_la_LDFLAGS = \
--	$(src_lib_ldflags) \
-+	-version-info $(LT_CURRENT):$(LT_REVISION):$(LT_AGE) \
- 	-Wl,--version-script=$(srcdir)/libnl-cli-3.sym
- src_lib_libnl_cli_3_la_LIBADD = \
- 	lib/libnl-3.la \
-@@ -668,8 +659,6 @@ else
- noinst_PROGRAMS += $(cli_programs)
- endif
- endif
--else
--check_PROGRAMS += $(cli_programs)
- endif
- 
- src_genl_ctrl_list_CPPFLAGS =       $(src_cppflags)
-@@ -847,10 +836,12 @@ tests_test_complex_HTB_with_hash_filters_LDADD    = $(tests_ldadd)
- tests_test_u32_filter_with_actions_CPPFLAGS       = $(tests_cppflags)
- tests_test_u32_filter_with_actions_LDADD          = $(tests_ldadd)
- 
-+if ENABLE_CLI
- check_PROGRAMS += \
- 	tests/test-cache-mngr \
- 	tests/test-genl \
- 	tests/test-nf-cache-mngr
-+endif
- 
- tests_cli_ldadd = \
- 	$(tests_ldadd) \
--- 
-2.11.0
-
diff --git a/package/libnl/libnl.hash b/package/libnl/libnl.hash
index ae502c2..b9c6260 100644
--- a/package/libnl/libnl.hash
+++ b/package/libnl/libnl.hash
@@ -1,2 +1,4 @@
-# From https://github.com/thom311/libnl/releases/download/libnl3_3_0/libnl-3.3.0.tar.gz.sha256sum
-sha256	705468b5ae4cd1eb099d2d1c476d6a3abe519bc2810becf12fb1e32de1e074e4	libnl-3.3.0.tar.gz
+# From https://github.com/thom311/libnl/releases/download/libnl3_4_0/libnl-3.4.0.tar.gz.sha256sum
+sha256	b7287637ae71c6db6f89e1422c995f0407ff2fe50cecd61a312b6a9b0921f5bf	libnl-3.4.0.tar.gz
+# Locally calculated
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index e1a37aa..397910c 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-LIBNL_VERSION = 3.3.0
+LIBNL_VERSION = 3.4.0
 LIBNL_SITE = https://github.com/thom311/libnl/releases/download/libnl$(subst .,_,$(LIBNL_VERSION))
 LIBNL_LICENSE = LGPL-2.1+
 LIBNL_LICENSE_FILES = COPYING
 LIBNL_INSTALL_STAGING = YES
 LIBNL_DEPENDENCIES = host-bison host-flex host-pkgconf
-# Patching Makefile.am
-LIBNL_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_LIBNL_TOOLS),y)
 LIBNL_CONF_OPTS += --enable-cli
