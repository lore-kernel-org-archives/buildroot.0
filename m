From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Feb 2020 08:36:30 +0100
Subject: [Buildroot] [git commit] package/squid: security bump to version
 4.10
Message-ID: <20200229072735.7B4AF81191@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df1d834420b7af4624331ae7fbe174ad9a84875f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)
Update indentation of hash file (two spaces)

Fix the following issues:
 - CVE-2020-8517: Buffer Overflow issue in ext_lm_group_acl helper.
 - CVE-2019-12528: Information Disclosure issue in FTP Gateway.
 - CVE-2020-8449, CVE-2020-8450: Improper Input Validation issues in
   HTTP Request processing.
 - CVE-2019-18679: Information Disclosure issue in HTTP Digest
   Authentication.
 - CVE-2019-18678: HTTP Request Splitting issue in HTTP message
   processing.
 - CVE-2019-18677: Cross-Site Request Forgery issue in HTTP Request
   processing.
 - CVE-2019-12523, CVE-2019-18676: Multiple issues in URI processing.
 - CVE-2019-12526: Heap Overflow issue in URN processing.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...cinclude-os-deps.m4-fix-cross-compilation.patch | 42 ----------------------
 package/squid/squid.hash                           | 10 +++---
 package/squid/squid.mk                             |  4 +--
 3 files changed, 6 insertions(+), 50 deletions(-)

diff --git a/package/squid/0001-acinclude-os-deps.m4-fix-cross-compilation.patch b/package/squid/0001-acinclude-os-deps.m4-fix-cross-compilation.patch
deleted file mode 100644
index 4c4fd5c8d5..0000000000
--- a/package/squid/0001-acinclude-os-deps.m4-fix-cross-compilation.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 5dbaf8eebc5b66230e0131b09651c7e40bf0e9de Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 20 Aug 2019 21:41:16 +0200
-Subject: [PATCH] acinclude/os-deps.m4: fix cross-compilation
-
-Do not check check file descriptor maximum value through AC_RUN_IFELSE
-when cross-compiling as this will raise an error
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/squid-cache/squid/pull/464]
----
- acinclude/os-deps.m4 | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/acinclude/os-deps.m4 b/acinclude/os-deps.m4
-index b50717517..ec10a54c6 100644
---- a/acinclude/os-deps.m4
-+++ b/acinclude/os-deps.m4
-@@ -169,7 +169,9 @@ AC_MSG_CHECKING(Maximum number of filedescriptors we can open)
- SQUID_STATE_SAVE(maxfd)
- dnl FreeBSD pthreads break dup2().
-   AS_CASE([$host_os],[freebsd],[ LDFLAGS=`echo $LDFLAGS | sed -e "s/-pthread//"` ])
--  AC_RUN_IFELSE([AC_LANG_SOURCE([[
-+  dnl AC_RUN_IFELSE can't be run when cross-compiling
-+  AS_CASE([$cross_compiling],[no],[
-+    AC_RUN_IFELSE([AC_LANG_SOURCE([[
- #include <stdio.h>
- #include <unistd.h>
- #include <stdlib.h>
-@@ -231,7 +233,8 @@ int main(int argc, char **argv) {
- 	fprintf (fp, "%d\n", i & ~0x3F);
- 	return 0;
- }
--  ]])],[squid_filedescriptors_limit=`cat conftestval`],[],[])
-+    ]])],[squid_filedescriptors_limit=`cat conftestval`],[],[])
-+  ])
-   dnl Microsoft MSVCRT.DLL supports 2048 maximum FDs
-   AS_CASE(["$host_os"],[mingw|mingw32],[squid_filedescriptors_limit="2048"])
-   AC_MSG_RESULT($squid_filedescriptors_limit)
--- 
-2.20.1
-
diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index ff694da6ab..765e67cf3d 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,6 +1,6 @@
-# From http://www.squid-cache.org/Versions/v4/squid-4.8.tar.xz.asc
-md5 08e018f2d8db4911ee90591284fa1ca5 squid-4.8.tar.xz
-sha1 4ff1390eee3ec20cefa5565cbb56e1a89a12bfc1 squid-4.8.tar.xz
+# From http://www.squid-cache.org/Versions/v4/squid-4.10.tar.xz.asc
+md5  af7ac6e70f9bd03ae4fcec0c9b99c38a  squid-4.10.tar.xz
+sha1  b8b267771550bb8c7f2b2968b305118090e7217a  squid-4.10.tar.xz
 # Locally calculated
-sha256 78cdb324d93341d36d09d5f791060f6e8aaa5ff3179f7c949cd910d023a86210 squid-4.8.tar.xz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
+sha256  98f0100afd8a42ea5f6b81eb98b0e4b36d7a54beab1c73d2f1705ab49b025f1f  squid-4.10.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 34a463d80d..aeaec425e4 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-SQUID_VERSION = 4.8
+SQUID_VERSION = 4.10
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v4
 SQUID_LICENSE = GPL-2.0+
 SQUID_LICENSE_FILES = COPYING
 SQUID_DEPENDENCIES = libcap host-libcap libxml2 host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
-# We're patching acinclude/os-deps.m4
-SQUID_AUTORECONF = YES
 SQUID_CONF_ENV = \
 	ac_cv_epoll_works=yes \
 	ac_cv_func_setresuid=yes \
