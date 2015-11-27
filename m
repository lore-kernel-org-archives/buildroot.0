From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Nov 2015 15:36:04 +0100
Subject: [Buildroot] [git commit] package/mono: bump to version 4.2.1.102
Message-ID: <20151201232123.25F3A81952@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=88308834bea39c7103809043f6e460396abfb80a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps to version 4.2.1.102 and updates
accompaining patches accordingly.

* Removed upstreamed patch 0003-fix-parallel-install.patch
* Adding patch to fix eglib linking option (upstreamed here
  https://github.com/mono/mono/pull/1971 but not included in
  this release)
* Adding patch to remove compilation of unit-tests

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mono/0003-fix-parallel-install.patch       | 40 ----------------------
 ...glib-checking-for-locale_charset-function.patch | 28 +++++++++++++++
 ...6-Remove-unit-tests-from-mono-compilation.patch | 29 ++++++++++++++++
 package/mono/Config.in                             |  1 -
 package/mono/mono.hash                             |  2 +-
 package/mono/mono.mk                               |  2 +-
 6 files changed, 59 insertions(+), 43 deletions(-)

diff --git a/package/mono/0003-fix-parallel-install.patch b/package/mono/0003-fix-parallel-install.patch
deleted file mode 100644
index c151173..0000000
--- a/package/mono/0003-fix-parallel-install.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-mcs: fix installation with parallel make
-
-In mcs/ the install of xbuild_12 and xbuild_14 will end-up installing
-the same files:
-    ${NETFRAMEWORK_DIR}/v2.0/RedistList/FrameworkList.xml
-    ${NETFRAMEWORK_DIR}/v3.0/RedistList/FrameworkList.xml
-    ${NETFRAMEWORK_DIR}/v3.5/RedistList/FrameworkList.xml
-    ${NETFRAMEWORK_DIR}/v4.0/Profile/Client/RedistList/FrameworkList.xml
-    ${NETFRAMEWORK_DIR}/v4.0/RedistList/FrameworkList.xml
-    ${NETFRAMEWORK_DIR}/v4.5.1/RedistList/FrameworkList.xml
-    ${NETFRAMEWORK_DIR}/v4.5/RedistList/FrameworkList.xml
-
-This is because there is no atomicity when installing each file, and
-xbuild_12 and xbuild_14 may well run in parallel, each trying to install
-each of those files; but the 'install' utility will first check if the
-target file exists or not, and behaves differently if it does than if it
-does not, thus leading to build failures like so:
-    http://autobuild.buildroot.org/results/c32/c3288c5d1fb94474f14a4a889e76135878d403bc/build-end.log
-
-So, ensure ordering of the install of xbuild_12 and xbuild_14 (the
-ordering is completely arbitrary, either way gives the same installed
-files).
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
-
-diff -durN host-mono-4.0.0.orig/mcs/Makefile host-mono-4.0.0/mcs/Makefile
---- host-mono-4.0.0.orig/mcs/Makefile	2015-04-09 16:55:53.000000000 +0200
-+++ host-mono-4.0.0/mcs/Makefile	2015-05-16 17:25:44.475542483 +0200
-@@ -43,6 +43,10 @@
- profile-do--%:
- 	$(MAKE) PROFILE=$(subst --, ,$*)
- 
-+# xbuild_12 and xbuild_14 will try to install the same files, so they need
-+# to be ordered
-+profile-do--xbuild_14--install: profile-do--xbuild_12--install
-+
- # We don't want to run the tests in parallel.  We want behaviour like -k.
- profiles-do--run-test:
- 	ret=:; $(foreach p,$(PROFILES), { $(MAKE) PROFILE=$(p) run-test || ret=false; }; ) $$ret
diff --git a/package/mono/0005-eglib-checking-for-locale_charset-function.patch b/package/mono/0005-eglib-checking-for-locale_charset-function.patch
new file mode 100644
index 0000000..52d5638
--- /dev/null
+++ b/package/mono/0005-eglib-checking-for-locale_charset-function.patch
@@ -0,0 +1,28 @@
+From 026a8c44d332b3595814ce0aceba255467cd7b6d Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+Date: Sat, 5 Sep 2015 08:57:21 +0200
+Subject: [PATCH] eglib: checking for locale_charset function
+
+This patch checks if locale_charset function is availabe in
+libiconv or libcharset and changes the linking options accordingly.
+
+Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+---
+ eglib/configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/eglib/configure.ac b/eglib/configure.ac
+index 9d094ea..5ea220e 100644
+--- a/eglib/configure.ac
++++ b/eglib/configure.ac
+@@ -182,6 +182,7 @@ fi
+ AC_SUBST(G_HAVE_ISO_VARARGS)
+ 
+ AC_CHECK_HEADERS(getopt.h sys/select.h sys/time.h sys/wait.h pwd.h langinfo.h iconv.h localcharset.h sys/types.h sys/resource.h)
++AC_CHECK_LIB([iconv], [locale_charset],[],[AC_CHECK_LIB([charset], [locale_charset],[LIBS+="-liconv -lcharset"])])
+ AC_CHECK_HEADER(alloca.h, [HAVE_ALLOCA_H=1], [HAVE_ALLOCA_H=0])
+ AC_SUBST(HAVE_ALLOCA_H)
+ 
+-- 
+1.9.1
+
diff --git a/package/mono/0006-Remove-unit-tests-from-mono-compilation.patch b/package/mono/0006-Remove-unit-tests-from-mono-compilation.patch
new file mode 100644
index 0000000..3714b65
--- /dev/null
+++ b/package/mono/0006-Remove-unit-tests-from-mono-compilation.patch
@@ -0,0 +1,29 @@
+From 155f96953d1b898f04a4e708c9ebc1e450b2f63e Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+Date: Tue, 24 Nov 2015 23:11:10 +0100
+Subject: [PATCH] Remove unit-tests from mono compilation
+
+This patch fixes compiling errors with unit-tests under linux.
+
+Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+---
+ mono/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/mono/Makefile.am b/mono/Makefile.am
+index ef41dfe..7129507 100644
+--- a/mono/Makefile.am
++++ b/mono/Makefile.am
+@@ -30,7 +30,7 @@ monotouch-do-clean:
+ 	  (cd $$subdir && $(MAKE) $(AM_MAKEFLAGS) $$target); \
+     done;
+ else
+-SUBDIRS = arch utils io-layer cil metadata $(sgen_dirs) mini dis tests unit-tests benchmark profiler
++SUBDIRS = arch utils io-layer cil metadata $(sgen_dirs) mini dis tests benchmark profiler
+ endif
+ endif
+-DIST_SUBDIRS = arch utils io-layer cil metadata $(sgen_dirs) mini dis tests unit-tests benchmark profiler
++DIST_SUBDIRS = arch utils io-layer cil metadata $(sgen_dirs) mini dis tests benchmark profiler
+-- 
+1.9.1
+
diff --git a/package/mono/Config.in b/package/mono/Config.in
index 0f57703..cf18a03 100644
--- a/package/mono/Config.in
+++ b/package/mono/Config.in
@@ -8,7 +8,6 @@ config BR2_PACKAGE_MONO
 	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  An open source, cross-platform, implementation of C#
 	  and the CLR that is binary compatible with Microsoft.NET.
diff --git a/package/mono/mono.hash b/package/mono/mono.hash
index cf8e0d5..001f6be 100644
--- a/package/mono/mono.hash
+++ b/package/mono/mono.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 b074584eea5bbaaf29362486a69d70abe53d0d2feb334f231fa9c841cf6fd651  mono-4.0.2.5.tar.bz2
+sha256 b7b461fe04375f621d88166ba8c6f1cb33c439fd3e17136460f7d087a51ed792  mono-4.2.1.102.tar.bz2
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 8668aa0..8f99983 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONO_VERSION = 4.0.2.5
+MONO_VERSION = 4.2.1.102
 MONO_SITE = http://download.mono-project.com/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
 MONO_LICENSE = GPLv2 or MIT (compiler, tools), LGPLv2 (runtime libs), MIT (class libs) or commercial
