From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 31 Oct 2018 12:46:13 +0100
Subject: [Buildroot] [PATCH v2,1/1] libxmlrpc: bump to version 1.43.08
Message-ID: <20181031114613.30749-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove first patch and pass CC_FOR_BUILD and other variables in
  LIBXMLRPC_MAKE_OPTS instead of LIBXMLRPC_MAKE_ENV because a similar
  solution is already in version thanks to
  https://sourceforge.net/p/xmlrpc-c/code/2905
- Remove second patch (already in version thanks to
  https://sourceforge.net/p/xmlrpc-c/code/2908)
- Remove third path (already in version thanks to
  https://sourceforge.net/p/xmlrpc-c/code/2909)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix commit log and replace LIBXMLRPC_CONV_xxx by LIBXMLRPC_MAKE_xxx

 .../libxmlrpc/0001-fix-gennmtab-build.patch   | 25 -----------------
 ...tch => 0001-use-correct-curl-config.patch} |  0
 ...ix-shared-libraries-build-for-uClibc.patch | 27 ------------------
 .../0003-fix-ar-ranlib-handling.patch         | 28 -------------------
 package/libxmlrpc/libxmlrpc.hash              |  3 +-
 package/libxmlrpc/libxmlrpc.mk                |  6 ++--
 6 files changed, 5 insertions(+), 84 deletions(-)
 delete mode 100644 package/libxmlrpc/0001-fix-gennmtab-build.patch
 rename package/libxmlrpc/{0004-use-correct-curl-config.patch => 0001-use-correct-curl-config.patch} (100%)
 delete mode 100644 package/libxmlrpc/0002-config.mk.in-fix-shared-libraries-build-for-uClibc.patch
 delete mode 100644 package/libxmlrpc/0003-fix-ar-ranlib-handling.patch

diff --git a/package/libxmlrpc/0001-fix-gennmtab-build.patch b/package/libxmlrpc/0001-fix-gennmtab-build.patch
deleted file mode 100644
index e98e5cbf58..0000000000
--- a/package/libxmlrpc/0001-fix-gennmtab-build.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Fix build of host tool
-
-genmtab is a tool that needs to be built for the host as it is used
-during the compilation process of libxmlrpc. Its Makefile needs a bit
-of tuning to use the conventional CC_FOR_BUILD, CFLAGS_FOR_BUILD and
-LDFLAGS_FOR_BUILD variables.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/lib/expat/gennmtab/Makefile
-===================================================================
---- a/lib/expat/gennmtab/Makefile
-+++ b/lib/expat/gennmtab/Makefile
-@@ -40,9 +40,9 @@
- dep: dep-common
- 
- gennmtab.o:%.o:%.c
--	$(BUILDTOOL_CC) -c $< -o $@ $(CFLAGS_ALL) $(INCLUDES)
-+	$(CC_FOR_BUILD) -c $< -o $@ $(CFLAGS_FOR_BUILD) $(INCLUDES)
- 
- gennmtab:%:%.o
--	$(BUILDTOOL_CCLD) -o $@ $(LDFLAGS_ALL) $^
-+	$(CC_FOR_BUILD) -o $@ $(LDFLAGS_FOR_BUILD) $^
- 
- include depend.mk
diff --git a/package/libxmlrpc/0004-use-correct-curl-config.patch b/package/libxmlrpc/0001-use-correct-curl-config.patch
similarity index 100%
rename from package/libxmlrpc/0004-use-correct-curl-config.patch
rename to package/libxmlrpc/0001-use-correct-curl-config.patch
diff --git a/package/libxmlrpc/0002-config.mk.in-fix-shared-libraries-build-for-uClibc.patch b/package/libxmlrpc/0002-config.mk.in-fix-shared-libraries-build-for-uClibc.patch
deleted file mode 100644
index 5970df51a9..0000000000
--- a/package/libxmlrpc/0002-config.mk.in-fix-shared-libraries-build-for-uClibc.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 5d68179a54b0a34d989722dcbe3b6eb962feb27d Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Tue, 23 Dec 2014 16:04:18 +0100
-Subject: [PATCH] config.mk.in: fix shared libraries build for uClibc
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- config.mk.in | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/config.mk.in b/config.mk.in
-index c5d4160..45461cf 100644
---- a/config.mk.in
-+++ b/config.mk.in
-@@ -166,7 +166,8 @@ shliblefn = $(1:%=%.shlibledummy)
- # HOST_OS is usually has a version number suffix, e.g. "aix5.3.0.0", so
- # we compare based on prefix.
- 
--ifeq ($(patsubst linux-gnu%,linux-gnu,$(HOST_OS)),linux-gnu)
-+# linux-uclibc is also a linux
-+ifeq ($(patsubst linux-%,linux-,$(HOST_OS)),linux-)
-   # Assume linker is GNU Compiler (gcc)
-   SHARED_LIB_TYPE = unix
-   MUST_BUILD_SHLIB = Y
--- 
-1.9.3
-
diff --git a/package/libxmlrpc/0003-fix-ar-ranlib-handling.patch b/package/libxmlrpc/0003-fix-ar-ranlib-handling.patch
deleted file mode 100644
index 1e58d24780..0000000000
--- a/package/libxmlrpc/0003-fix-ar-ranlib-handling.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Fix detection of AR and RANLIB
-
-The configure.in script assumes that ranlib and ar are necessarily
-prefixed by ${ac_tool_prefix}, which is the value of --host. However,
-it's not necessarily the case.
-
-So instead, use AC_CHECK_TOOL to check for AR, and AC_PROG_RANLIB to
-check for RANLIB.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/configure.in
-===================================================================
---- a/configure.in
-+++ b/configure.in
-@@ -621,10 +621,8 @@
- BUILDDIR=$(pwd)
- AC_SUBST(BUILDDIR)
- 
--AR=${ac_tool_prefix}ar
--AC_SUBST([AR])
--RANLIB=${ac_tool_prefix}ranlib
--AC_SUBST([RANLIB])
-+AC_CHECK_TOOL([AR], [ar])
-+AC_PROG_RANLIB
- 
- dnl =======================================================================
- dnl Output our results.
diff --git a/package/libxmlrpc/libxmlrpc.hash b/package/libxmlrpc/libxmlrpc.hash
index 3003622ac8..093da67bbf 100644
--- a/package/libxmlrpc/libxmlrpc.hash
+++ b/package/libxmlrpc/libxmlrpc.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 d830f3264a832dfe09f629cc64036acfd08121692526d0fabe090f7ff881ce08 xmlrpc-c-1.39.12.tgz
+sha256 c9f5b584a42493877ae0f09ed680d94e035ab389e8fa1873b1ec42118d5cfca3 xmlrpc-c-1.43.08.tgz
+sha256 db7a6d3f187b218c3534010a83424c6bcdef88e6a0b6b1aa3a8762238bd642e6 doc/COPYING
diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
index 80acfb8eaa..90791bd671 100644
--- a/package/libxmlrpc/libxmlrpc.mk
+++ b/package/libxmlrpc/libxmlrpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXMLRPC_VERSION = 1.39.12
+LIBXMLRPC_VERSION = 1.43.08
 LIBXMLRPC_SOURCE = xmlrpc-c-$(LIBXMLRPC_VERSION).tgz
 LIBXMLRPC_SITE = http://downloads.sourceforge.net/project/xmlrpc-c/Xmlrpc-c%20Super%20Stable/$(LIBXMLRPC_VERSION)
 LIBXMLRPC_LICENSE = BSD-3-Clause (xml-rpc main code and abyss web server), BSD like (lib/expat), Python 1.5.2 license (parts of xmlrpc_base64.c)
@@ -29,7 +29,7 @@ LIBXMLRPC_CONF_OPTS = \
 
 # Our package uses autoconf, but not automake, so we need to pass
 # those variables at compile time as well.
-LIBXMLRPC_MAKE_ENV = \
+LIBXMLRPC_MAKE_OPTS = \
 	CC_FOR_BUILD="$(HOSTCC)" \
 	LD_FOR_BUILD="$(HOSTLD)" \
 	CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
@@ -39,7 +39,7 @@ ifeq ($(BR2_STATIC_LIBS),y)
 LIBXMLRPC_STATIC_OPTS = SHARED_LIB_TYPE=NONE MUST_BUILD_SHLIB=N
 endif
 
-LIBXMLRPC_MAKE_OPTS = $(LIBXMLRPC_STATIC_OPTS)
+LIBXMLRPC_MAKE_OPTS += $(LIBXMLRPC_STATIC_OPTS)
 LIBXMLRPC_INSTALL_STAGING_OPTS = $(LIBXMLRPC_STATIC_OPTS) \
 	DESTDIR=$(STAGING_DIR) install
 LIBXMLRPC_INSTALL_TARGET_OPTS = $(LIBXMLRPC_STATIC_OPTS) \
-- 
2.17.1
