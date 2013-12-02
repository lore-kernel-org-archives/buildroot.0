From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  2 Dec 2013 08:51:48 -0300
Subject: [Buildroot] [PATCH] tar: bump to version 1.27.1
Message-ID: <1385985108-17570-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/tar/tar-1.26-no-gets.patch | 47 --------------------------------------
 package/tar/tar.mk                 |  4 ++--
 2 files changed, 2 insertions(+), 49 deletions(-)
 delete mode 100644 package/tar/tar-1.26-no-gets.patch

diff --git a/package/tar/tar-1.26-no-gets.patch b/package/tar/tar-1.26-no-gets.patch
deleted file mode 100644
index fb9d188..0000000
--- a/package/tar/tar-1.26-no-gets.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-Since the 2.16 release of the glibc, 'gets' is not any more defined in the gnulib.
-No tar version synchronized with gnulib since [1] has been released yet.
-
-This patch avoids the following error occurs when building tar <=1.4.16 on host using
-a glibc >=2.16:
-
-make[5]: Entering directory `/home/samuel/data/workspace/src/buildroot/master/output/build/host-tar-1.26/gnu'
-  CC     areadlink.o
-  CC     areadlinkat.o
-  CC     argp-ba.o
-  CC     argp-eexst.o
-  CC     argp-fmtstream.o
-  CC     argp-fs-xinl.o
-In file included from argp.h:24:0,
-                 from argp-eexst.c:27:
-./stdio.h:479:1: error ?gets? undeclared here (not in a function)
-make[5]: *** [argp-eexst.o] Error 1
-make[5]: *** Waiting for unfinished jobs....
-In file included from argp-fmtstream.h:29:0,
-                 from argp-fs-xinl.c:28:
-./stdio.h:479:1: error ?gets? undeclared here (not in a function)
-make[5]: *** [argp-fs-xinl.o] Error 1
-In file included from argp-fmtstream.h:29:0,
-                 from argp-fmtstream.c:35:
-./stdio.h:479:1: error ?gets? undeclared here (not in a function)
-make[5]: *** [argp-fmtstream.o] Error 1
-
-References:
-[1] http://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=commitdiff;h=66712c23388e93e5c518ebc8515140fa0c807348
-[2] http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-devel/m4/files/m4-1.4.16-no-gets.patch?diff_format=h&revision=1.1&view=markup
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-
----
-diff -purN host-tar-1.26.orig/gnu/stdio.in.h host-tar-1.26/gnu/stdio.in.h
---- host-tar-1.26.orig/gnu/stdio.in.h	2012-07-21 21:17:12.392403084 +0200
-+++ host-tar-1.26/gnu/stdio.in.h	2012-07-21 21:18:27.991993525 +0200
-@@ -164,7 +164,9 @@ _GL_WARN_ON_USE (fflush, "fflush is not
-    so any use of gets warrants an unconditional warning.  Assume it is
-    always declared, since it is required by C89.  */
- #undef gets
-+#if defined(__GLIBC__) && !defined(__UCLIBC__) && !__GLIBC_PREREQ(2, 16)
- _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
-+#endif
- 
- #if @GNULIB_FOPEN@
- # if @REPLACE_FOPEN@
diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index 6198ffd..f748724 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAR_VERSION = 1.26
+TAR_VERSION = 1.27.1
 TAR_SITE = $(BR2_GNU_MIRROR)/tar
 TAR_LICENSE = GPLv3+
 TAR_LICENSE_FILES = COPYING
@@ -23,7 +23,7 @@ HOST_TAR_SOURCE = tar-$(TAR_VERSION).cpio.gz
 define HOST_TAR_EXTRACT_CMDS
 	mkdir -p $(@D)
 	cd $(@D) && \
-		$(call suitable-extractor,$(HOST_TAR_SOURCE)) $(DL_DIR)/$(HOST_TAR_SOURCE) | cpio -i
+		$(call suitable-extractor,$(HOST_TAR_SOURCE)) $(DL_DIR)/$(HOST_TAR_SOURCE) | cpio -i --preserve-modification-time
 	mv $(@D)/tar-$(TAR_VERSION)/* $(@D)
 	rmdir $(@D)/tar-$(TAR_VERSION)
 endef
-- 
1.8.3.2
