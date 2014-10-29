From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Oct 2014 21:41:54 +0100
Subject: [Buildroot] [git commit] cryptsetup: bump to version 1.6.6
Message-ID: <20141029204206.67BD3B1F88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=40c341da78f3315fa31e4ea56b470753bf915a31
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patch, add hash file, switch to kernel.org mirror.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ryptsetup-0002-mkdir.patch => 0001-mkdir.patch} |    0
 ...p-0001-link-against-lrt-for-clock_gettime.patch |   33 --------------------
 package/cryptsetup/cryptsetup.hash                 |    2 +
 package/cryptsetup/cryptsetup.mk                   |    7 ++--
 4 files changed, 6 insertions(+), 36 deletions(-)

diff --git a/package/cryptsetup/cryptsetup-0002-mkdir.patch b/package/cryptsetup/0001-mkdir.patch
similarity index 100%
rename from package/cryptsetup/cryptsetup-0002-mkdir.patch
rename to package/cryptsetup/0001-mkdir.patch
diff --git a/package/cryptsetup/cryptsetup-0001-link-against-lrt-for-clock_gettime.patch b/package/cryptsetup/cryptsetup-0001-link-against-lrt-for-clock_gettime.patch
deleted file mode 100644
index ae9a522..0000000
--- a/package/cryptsetup/cryptsetup-0001-link-against-lrt-for-clock_gettime.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 715186bee512f25715e6d1c58ce03cc32e0efae3 Mon Sep 17 00:00:00 2001
-From: Axel Lin <axel.lin@ingics.com>
-Date: Mon, 30 Dec 2013 18:10:03 +0800
-Subject: [PATCH] Link against -lrt for clock_gettime
-
-Fix undefined reference to `clock_gettime' error.
-This is required since commit f3e398afc549 "Rewrite cipher benchmark loop.".
-
-Below is the build error report:
-http://autobuild.buildroot.net/results/9ca/9cad1cf49ee6b5c58d8260ee33beef2e6c1ada4d/build-end.log
-
-Signed-off-by: Axel Lin <axel.lin@ingics.com>
----
- configure.ac | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 1c456be..aa4c10f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -49,7 +49,8 @@ AC_CHECK_LIB(uuid, uuid_clear, ,[AC_MSG_ERROR([You need the uuid library.])])
- AC_SUBST(UUID_LIBS, $LIBS)
- LIBS=$saved_LIBS
- 
--AC_CHECK_FUNCS([posix_memalign])
-+AC_SEARCH_LIBS([clock_gettime],[rt posix4])
-+AC_CHECK_FUNCS([posix_memalign clock_gettime])
- 
- if test "x$enable_largefile" = "xno" ; then
-   AC_MSG_ERROR([Building with --disable-largefile is not supported, it can cause data corruption.])
--- 
-1.8.1.2
-
diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
new file mode 100644
index 0000000..f288082
--- /dev/null
+++ b/package/cryptsetup/cryptsetup.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/utils/cryptsetup/v1.6/sha256sums.asc
+sha256	2d2ce28e4e1137dd599d87884b62ef6dbf14fd7848b2a2bf7d61cf125fbd8e6f	cryptsetup-1.6.6.tar.xz
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index e365d43..f43bbca 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-CRYPTSETUP_VERSION = 1.6.3
-CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.bz2
-CRYPTSETUP_SITE = http://cryptsetup.googlecode.com/files
+CRYPTSETUP_VERSION_MAJOR = 1.6
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).6
+CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
+CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
 CRYPTSETUP_DEPENDENCIES = lvm2 popt e2fsprogs libgcrypt host-pkgconf \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
