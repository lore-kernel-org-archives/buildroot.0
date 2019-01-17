From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 17 Jan 2019 23:12:31 +0100
Subject: [Buildroot] [git commit] package/openvmtools: bump version to 10.3.5
Message-ID: <20190117221303.976798E01A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f0f0f7e4f3362a3695d5876d0f41125a2544285
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes build against glibc 2.28: closes #11546
http://autobuild.buildroot.net/results/f2c/f2c73480b5a1060bb17ac260ef82c3e641fad085/
http://autobuild.buildroot.net/results/e21/e219b8bacb52bb661eb6663b82f549ed941f26fe/

Use released tarball rather than github helper.  The tarball does not
contain the open-vm-tools sub directory, so adjust the paths in the patches
to match and drop OPENVMTOOLS_SUBDIR.

Drop 0001-has_bsd_printf.patch: msgList.c has been removed upstream since:
https://github.com/vmware/open-vm-tools/commit/dc81979e78e1b8f42639aeb7aaec69f7ea49eb79

Drop 0004-uclibc_secure_getenv.sh: uClibc-ng provides secure_getenv() since
1.0.22.

Renumber remaining patches.

Add hash for license file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvmtools/0001-has_bsd_printf.patch      | 26 ----------------------
 ...gs_werror.patch => 0001-no_cflags_werror.patch} |  4 ++--
 ...pflags.patch => 0002-dont-force-cppflags.patch} |  4 ++--
 .../openvmtools/0004-uclibc_secure_getenv.patch    | 18 ---------------
 package/openvmtools/openvmtools.hash               |  3 ++-
 package/openvmtools/openvmtools.mk                 | 11 ++++-----
 6 files changed, 12 insertions(+), 54 deletions(-)

diff --git a/package/openvmtools/0001-has_bsd_printf.patch b/package/openvmtools/0001-has_bsd_printf.patch
deleted file mode 100644
index df23f00414..0000000000
--- a/package/openvmtools/0001-has_bsd_printf.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-lib/misc/msgList.c: missing #ifdef
-
-This macro checks for BSD style printf(), which is not present
-when compiling for uClibc. The linked functions are unnecessary in
-this case, and they break compilation.
-
-Signed-off-by: Karoly Kasza <kaszak@gmail.com>
-
---- openvmtools-stable-9.10.0.orig/open-vm-tools/lib/misc/msgList.c	2015-06-17 10:01:00.000000000 +0200
-+++ openvmtools-stable-9.10.0/open-vm-tools/lib/misc/msgList.c		2015-06-17 10:01:00.000000000 +0200
-@@ -487,6 +487,7 @@
-    return messages->id;
- }
- 
-+#ifdef HAS_BSD_PRINTF
- 
- /*
-  *----------------------------------------------------------------------
-@@ -566,6 +567,7 @@
-    }
- }
- 
-+#endif
- 
- /*
-  *----------------------------------------------------------------------
diff --git a/package/openvmtools/0002-no_cflags_werror.patch b/package/openvmtools/0001-no_cflags_werror.patch
similarity index 65%
rename from package/openvmtools/0002-no_cflags_werror.patch
rename to package/openvmtools/0001-no_cflags_werror.patch
index 1621574f81..3378cb8e7d 100644
--- a/package/openvmtools/0002-no_cflags_werror.patch
+++ b/package/openvmtools/0001-no_cflags_werror.patch
@@ -4,8 +4,8 @@ Disable the mandatory flag -Werror in configure.ac.
 
 Signed-off-by: Karoly Kasza <kaszak@gmail.com>
 
---- openvmtools-stable-9.10.0.orig/open-vm-tools/configure.ac	2015-06-17 10:02:00.000000000 +0200
-+++ openvmtools-stable-9.10.0/open-vm-tools/configure.ac	2015-06-17 10:02:00.000000000 +0200
+--- open-vm-tools/configure.ac	2015-06-17 10:02:00.000000000 +0200
++++ open-vm-tools/configure.ac	2015-06-17 10:02:00.000000000 +0200
 @@ -935,7 +935,7 @@
  
  ### General flags / actions
diff --git a/package/openvmtools/0003-dont-force-cppflags.patch b/package/openvmtools/0002-dont-force-cppflags.patch
similarity index 73%
rename from package/openvmtools/0003-dont-force-cppflags.patch
rename to package/openvmtools/0002-dont-force-cppflags.patch
index c8fa6b17c1..eb2fe16ba9 100644
--- a/package/openvmtools/0003-dont-force-cppflags.patch
+++ b/package/openvmtools/0002-dont-force-cppflags.patch
@@ -4,8 +4,8 @@ This is so horribly broken for cross-compilation. :-(
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 
---- openvmtools-stable-9.10.0.orig/open-vm-tools/m4/vmtools.m4	2015-06-17 10:03:00.000000000 +0200
-+++ openvmtools-stable-9.10.0/open-vm-tools/m4/vmtools.m4	2015-06-17 10:03:00.000000000 +0200
+--- open-vm-tools/m4/vmtools.m4	2015-06-17 10:03:00.000000000 +0200
++++ open-vm-tools/m4/vmtools.m4	2015-06-17 10:03:00.000000000 +0200
 @@ -281,10 +281,10 @@
        if test "$os" = freebsd; then
           CUSTOM_$1_CPPFLAGS="-I/usr/local/include"
diff --git a/package/openvmtools/0004-uclibc_secure_getenv.patch b/package/openvmtools/0004-uclibc_secure_getenv.patch
deleted file mode 100644
index 6fb9ebd723..0000000000
--- a/package/openvmtools/0004-uclibc_secure_getenv.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-lib/misc/idLinux.c: add uClibc support
-
-uClibc does not have a secure_getenv function, so we use the
-Android method.
-
-Signed-off-by: Karoly Kasza <kaszak@gmail.com>
-
---- openvmtools-stable-9.10.0.orig/open-vm-tools/lib/misc/idLinux.c	2015-06-17 10:04:00.000000000 +0200
-+++ openvmtools-stable-9.10.0/open-vm-tools/lib/misc/idLinux.c		2015-06-17 10:04:00.000000000 +0200
-@@ -997,7 +997,7 @@
- static Bool
- IdIsSetUGid(void)
- {
--#if defined(__ANDROID__)
-+#if defined(__ANDROID__) || defined(__UCLIBC__)
-    /* Android does not have a secure_getenv, so be conservative. */
-    return TRUE;
- #else
diff --git a/package/openvmtools/openvmtools.hash b/package/openvmtools/openvmtools.hash
index bf344e506b..bd81d1f05c 100644
--- a/package/openvmtools/openvmtools.hash
+++ b/package/openvmtools/openvmtools.hash
@@ -1,2 +1,3 @@
 # locally computed
-sha256  ff384ab0c11e19db0fd6ddab60e8ae48a4591b141fb3a8e8f1d4e1a489dd293f  openvmtools-5a9033ddfa95786d867e4d02bbb9a29bac8fb64f.tar.gz
+sha256  364cd0fdfa5a05e872d08609659e6231ec99788669f7ebba24bfb8c94168daef  open-vm-tools-10.3.5-10430147.tar.gz
+sha256  f734933bd7d49aef25aaf897ed7281ee822e8635056e69b895a7d2e668937fc5  COPYING
diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index 9501ef3361..0dc2956d02 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-OPENVMTOOLS_VERSION = 5a9033ddfa95786d867e4d02bbb9a29bac8fb64f
-OPENVMTOOLS_SITE = $(call github,vmware,open-vm-tools,$(OPENVMTOOLS_VERSION))
-OPENVMTOOLS_SUBDIR = open-vm-tools
+OPENVMTOOLS_VERSION_MAJOR = 10.3.5
+OPENVMTOOLS_VERSION = $(OPENVMTOOLS_VERSION_MAJOR)-10430147
+OPENVMTOOLS_SITE = https://github.com/vmware/open-vm-tools/releases/download/stable-$(OPENVMTOOLS_VERSION_MAJOR)
+OPENVMTOOLS_SOURCE = open-vm-tools-$(OPENVMTOOLS_VERSION).tar.gz
 OPENVMTOOLS_LICENSE = LGPL-2.1
-OPENVMTOOLS_LICENSE_FILES = $(OPENVMTOOLS_SUBDIR)/COPYING
+OPENVMTOOLS_LICENSE_FILES = COPYING
 
-# Autoreconf needed or config/missing will run configure again at buildtime
+# configure.ac is patched
 OPENVMTOOLS_AUTORECONF = YES
 OPENVMTOOLS_CONF_OPTS = --with-dnet \
 	--without-icu --without-x --without-gtk2 \
