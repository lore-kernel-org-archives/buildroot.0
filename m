From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Oct 2014 15:45:11 +0200
Subject: [Buildroot] [PATCH 1/8] package/apr: Bump version to 1.5.1
Message-ID: <1412516718-12597-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

apr-0001-cross-compile.patch: Fix cross compilation
Fix top_builddir in usr/build-1/apr_rules.mk

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/apr/apr-0001-cross-compile.patch |   53 ++++++++++++++++++++++++++++++
 package/apr/apr.mk                       |    7 +++-
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 package/apr/apr-0001-cross-compile.patch

diff --git a/package/apr/apr-0001-cross-compile.patch b/package/apr/apr-0001-cross-compile.patch
new file mode 100644
index 0000000..6bd1194
--- /dev/null
+++ b/package/apr/apr-0001-cross-compile.patch
@@ -0,0 +1,53 @@
+Fix cross-compilation
+
+Patch submitted upstream:
+https://issues.apache.org/bugzilla/show_bug.cgi?id=57058
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr apr-1.5.1.org/configure.in apr-1.5.1/configure.in
+--- apr-1.5.1.org/configure.in	2014-01-25 16:17:29.000000000 +0100
++++ apr-1.5.1/configure.in	2014-10-05 11:20:40.080746760 +0200
+@@ -118,6 +118,16 @@
+ echo "Configuring APR library"
+ echo "Platform: $host"
+ 
++dnl In case of cross compilation we set CC_FOR_BUILD to cc unless
++dnl we got already CC_FOR_BUILD from environment.
++if test "x${build_alias}" != "x${host_alias}"; then
++  if test "x${CC_FOR_BUILD}" = "x"; then
++    CC_FOR_BUILD=cc
++  fi
++fi
++AC_SUBST(CC_FOR_BUILD)
++AC_SUBST(CFLAGS_FOR_BUILD)
++
+ dnl Some initial steps for configuration.  We setup the default directory
+ dnl and which files are to be configured.
+ 
+diff -uNr apr-1.5.1.org/Makefile.in apr-1.5.1/Makefile.in
+--- apr-1.5.1.org/Makefile.in	2014-03-17 16:10:26.000000000 +0100
++++ apr-1.5.1/Makefile.in	2014-10-05 11:22:53.031070519 +0200
+@@ -8,6 +8,8 @@
+ # APR (Apache Portable Runtime) library Makefile.
+ #
+ CPP = @CPP@
++CC_FOR_BUILD = @CC_FOR_BUILD@
++CFLAGS_FOR_BUILD = @CFLAGS_FOR_BUILD@
+ 
+ # get substituted into some targets
+ APR_MAJOR_VERSION=@APR_MAJOR_VERSION@
+@@ -134,8 +136,13 @@
+ 
+ OBJECTS_gen_test_char = tools/gen_test_char.lo $(LOCAL_LIBS)
+ tools/gen_test_char.lo: make_tools_dir
++ifdef CC_FOR_BUILD
++tools/gen_test_char at EXEEXT@: tools/gen_test_char.c $(LOCAL_LIBS)
++	$(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) -DCROSS_COMPILE -o $@ $<
++else
+ tools/gen_test_char at EXEEXT@: $(OBJECTS_gen_test_char)
+ 	$(LINK_PROG) $(OBJECTS_gen_test_char) $(ALL_LIBS)
++endif
+ 
+ include/private/apr_escape_test_char.h: tools/gen_test_char@EXEEXT@
+ 	$(APR_MKDIR) include/private
diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index 1a4c0e2..bdf4c78 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -4,12 +4,15 @@
 #
 ################################################################################
 
-APR_VERSION = 1.4.8
+APR_VERSION = 1.5.1
 APR_SITE = http://archive.apache.org/dist/apr
 APR_LICENSE = Apache-2.0
 APR_LICENSE_FILES = LICENSE
 APR_INSTALL_STAGING = YES
+APR_AUTORECONF = YES
 APR_CONF_ENV = \
+	CC_FOR_BUILD="$(HOSTCC)" \
+	CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
 	ac_cv_file__dev_zero=yes \
 	ac_cv_func_setpgrp_void=yes \
 	apr_cv_process_shared_works=yes \
@@ -35,6 +38,8 @@ define APR_FIXUP_RULES_MK
 		$(STAGING_DIR)/usr/build-1/apr_rules.mk
 	$(SED) 's%apr_builders=%apr_builders=$(STAGING_DIR)%' \
 		$(STAGING_DIR)/usr/build-1/apr_rules.mk
+	$(SED) 's%top_builddir=%top_builddir=$(STAGING_DIR)%' \
+		$(STAGING_DIR)/usr/build-1/apr_rules.mk
 endef
 
 APR_POST_INSTALL_STAGING_HOOKS += APR_FIXUP_RULES_MK
-- 
1.7.10.4
