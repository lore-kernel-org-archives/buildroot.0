From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 17:46:37 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/squid: security
 bump to version 4.8
Message-ID: <20190902161353.173FC88EF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d02c82dfda395d2837fa13acf151e5db5c3c41f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

- Add a patch to fix cross-compilation
- Fix the following CVEs:
  - SQUID-2019:6 (CVE-2019-13345), Jul 12, 2019
    Fixed from 4.8
    Multiple Cross-Site Scripting issues in cachemgr.cgi
  - SQUID-2019:5 (CVE-2019-12527), Jul 12, 2019
    Fixed from 4.8
    Heap Overflow issue in HTTP Basic Authentication processing
  - SQUID-2019:3 (CVE-2019-12525), Jul 12, 2019
    Fixed from 4.8
    Denial of Service in HTTP Digest Authentication processing
  - SQUID-2019:2 (CVE-2019-12529), Jul 12, 2019
    Fixed from 4.8
    Denial of Service in HTTP Basic Authentication processing
  - SQUID-2019:1 (CVE-2019-12824), Jul 12, 2019
    Fixed from 4.8
    Denial of Service issue in cachemgr.cgi

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7792c4f1bc8ec0827d07dc75f60668b2ec81a785)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...cinclude-os-deps.m4-fix-cross-compilation.patch | 42 ++++++++++++++++++++++
 package/squid/squid.hash                           |  8 ++---
 package/squid/squid.mk                             |  4 ++-
 3 files changed, 49 insertions(+), 5 deletions(-)

diff --git a/package/squid/0001-acinclude-os-deps.m4-fix-cross-compilation.patch b/package/squid/0001-acinclude-os-deps.m4-fix-cross-compilation.patch
new file mode 100644
index 0000000000..4c4fd5c8d5
--- /dev/null
+++ b/package/squid/0001-acinclude-os-deps.m4-fix-cross-compilation.patch
@@ -0,0 +1,42 @@
+From 5dbaf8eebc5b66230e0131b09651c7e40bf0e9de Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 20 Aug 2019 21:41:16 +0200
+Subject: [PATCH] acinclude/os-deps.m4: fix cross-compilation
+
+Do not check check file descriptor maximum value through AC_RUN_IFELSE
+when cross-compiling as this will raise an error
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/squid-cache/squid/pull/464]
+---
+ acinclude/os-deps.m4 | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/acinclude/os-deps.m4 b/acinclude/os-deps.m4
+index b50717517..ec10a54c6 100644
+--- a/acinclude/os-deps.m4
++++ b/acinclude/os-deps.m4
+@@ -169,7 +169,9 @@ AC_MSG_CHECKING(Maximum number of filedescriptors we can open)
+ SQUID_STATE_SAVE(maxfd)
+ dnl FreeBSD pthreads break dup2().
+   AS_CASE([$host_os],[freebsd],[ LDFLAGS=`echo $LDFLAGS | sed -e "s/-pthread//"` ])
+-  AC_RUN_IFELSE([AC_LANG_SOURCE([[
++  dnl AC_RUN_IFELSE can't be run when cross-compiling
++  AS_CASE([$cross_compiling],[no],[
++    AC_RUN_IFELSE([AC_LANG_SOURCE([[
+ #include <stdio.h>
+ #include <unistd.h>
+ #include <stdlib.h>
+@@ -231,7 +233,8 @@ int main(int argc, char **argv) {
+ 	fprintf (fp, "%d\n", i & ~0x3F);
+ 	return 0;
+ }
+-  ]])],[squid_filedescriptors_limit=`cat conftestval`],[],[])
++    ]])],[squid_filedescriptors_limit=`cat conftestval`],[],[])
++  ])
+   dnl Microsoft MSVCRT.DLL supports 2048 maximum FDs
+   AS_CASE(["$host_os"],[mingw|mingw32],[squid_filedescriptors_limit="2048"])
+   AC_MSG_RESULT($squid_filedescriptors_limit)
+-- 
+2.20.1
+
diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index d69e9b2ab0..ff694da6ab 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,6 +1,6 @@
-# From http://www.squid-cache.org/Versions/v4/squid-4.6.tar.xz.asc
-md5 e25e7cc37754ad14d8aa368c0c210e54 squid-4.6.tar.xz
-sha1 0396fe8077049000407d13aca8efdd9228e69d98 squid-4.6.tar.xz
+# From http://www.squid-cache.org/Versions/v4/squid-4.8.tar.xz.asc
+md5 08e018f2d8db4911ee90591284fa1ca5 squid-4.8.tar.xz
+sha1 4ff1390eee3ec20cefa5565cbb56e1a89a12bfc1 squid-4.8.tar.xz
 # Locally calculated
-sha256 015bade5d3a4905142c4c605df5c4216471e3d8338079955e0e44b0ae0303d41 squid-4.6.tar.xz
+sha256 78cdb324d93341d36d09d5f791060f6e8aaa5ff3179f7c949cd910d023a86210 squid-4.8.tar.xz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 0331b83888..2e9945faa2 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################
 
-SQUID_VERSION = 4.6
+SQUID_VERSION = 4.8
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v4
 SQUID_LICENSE = GPL-2.0+
 SQUID_LICENSE_FILES = COPYING
 SQUID_DEPENDENCIES = libcap host-libcap libxml2 host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
+# We're patching acinclude/os-deps.m4 
+SQUID_AUTORECONF = YES
 SQUID_CONF_ENV = \
 	ac_cv_epoll_works=yes \
 	ac_cv_func_setresuid=yes \
