From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 9 Jan 2014 12:12:07 +0100
Subject: [Buildroot] [git commit] cryptsetup: fix build error after bump
	version
Message-ID: <20140109112550.42FB59C405@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d66c981aaa2248b7e20a4f802f3643435a1761ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/9ca/9cad1cf49ee6b5c58d8260ee33beef2e6c1ada4d/

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...p-0001-link-against-lrt-for-clock_gettime.patch |   33 ++++++++++++++++++++
 package/cryptsetup/cryptsetup-0002-mkdir.patch     |   18 +++++++++++
 package/cryptsetup/cryptsetup.mk                   |    2 +
 3 files changed, 53 insertions(+), 0 deletions(-)

diff --git a/package/cryptsetup/cryptsetup-0001-link-against-lrt-for-clock_gettime.patch b/package/cryptsetup/cryptsetup-0001-link-against-lrt-for-clock_gettime.patch
new file mode 100644
index 0000000..ae9a522
--- /dev/null
+++ b/package/cryptsetup/cryptsetup-0001-link-against-lrt-for-clock_gettime.patch
@@ -0,0 +1,33 @@
+From 715186bee512f25715e6d1c58ce03cc32e0efae3 Mon Sep 17 00:00:00 2001
+From: Axel Lin <axel.lin@ingics.com>
+Date: Mon, 30 Dec 2013 18:10:03 +0800
+Subject: [PATCH] Link against -lrt for clock_gettime
+
+Fix undefined reference to `clock_gettime' error.
+This is required since commit f3e398afc549 "Rewrite cipher benchmark loop.".
+
+Below is the build error report:
+http://autobuild.buildroot.net/results/9ca/9cad1cf49ee6b5c58d8260ee33beef2e6c1ada4d/build-end.log
+
+Signed-off-by: Axel Lin <axel.lin@ingics.com>
+---
+ configure.ac | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1c456be..aa4c10f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -49,7 +49,8 @@ AC_CHECK_LIB(uuid, uuid_clear, ,[AC_MSG_ERROR([You need the uuid library.])])
+ AC_SUBST(UUID_LIBS, $LIBS)
+ LIBS=$saved_LIBS
+ 
+-AC_CHECK_FUNCS([posix_memalign])
++AC_SEARCH_LIBS([clock_gettime],[rt posix4])
++AC_CHECK_FUNCS([posix_memalign clock_gettime])
+ 
+ if test "x$enable_largefile" = "xno" ; then
+   AC_MSG_ERROR([Building with --disable-largefile is not supported, it can cause data corruption.])
+-- 
+1.8.1.2
+
diff --git a/package/cryptsetup/cryptsetup-0002-mkdir.patch b/package/cryptsetup/cryptsetup-0002-mkdir.patch
new file mode 100644
index 0000000..d4d7052
--- /dev/null
+++ b/package/cryptsetup/cryptsetup-0002-mkdir.patch
@@ -0,0 +1,18 @@
+$(mkdir_p) is obsolete for newer automake, use $(MKDIR_P) instead.
+Upstream should really gettextize with a newer version before packing up.
+
+[base on a similar patch from Gustavo Zacarias for Linux-PAM-1.1.7]
+Signed-off-by: Axel Lin <axel.lin@ingics.com>
+
+diff -Nura cryptsetup-1.6.3.ori/po/Makefile.in.in cryptsetup-1.6.3/po/Makefile.in.in
+--- cryptsetup-1.6.3.ori/po/Makefile.in.in	2013-12-30 11:53:22.731942516 +0800
++++ cryptsetup-1.6.3/po/Makefile.in.in	2014-01-09 09:46:13.594071188 +0800
+@@ -31,7 +31,7 @@
+ INSTALL = @INSTALL@
+ INSTALL_DATA = @INSTALL_DATA@
+ mkinstalldirs = $(SHELL) @install_sh@ -d
+-mkdir_p = @mkdir_p@
++mkdir_p = @MKDIR_P@
+ 
+ GMSGFMT_ = @GMSGFMT@
+ GMSGFMT_no = @GMSGFMT@
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 6ea3aae..e365d43 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -13,6 +13,8 @@ CRYPTSETUP_DEPENDENCIES = lvm2 popt e2fsprogs libgcrypt host-pkgconf \
 CRYPTSETUP_LICENSE = GPLv2+ (programs), LGPLv2.1+ (library)
 CRYPTSETUP_LICENSE_FILES = COPYING COPYING.LGPL
 
+CRYPTSETUP_AUTORECONF = YES
+
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lintl"
 endif
