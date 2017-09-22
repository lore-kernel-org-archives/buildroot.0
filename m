From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Sep 2017 18:15:09 +0200
Subject: [Buildroot] [git commit] package/owfs: bump version to 3.2p1
Message-ID: <20170922161618.629EB807C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08ac3e134f88ebf7560299566c7d35ec1a88c593
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch applied upstream:
https://sourceforge.net/p/owfs/code/ci/6ff4da75c2f507e3d94fa9e01a253ccebd00b916/

Added md5 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-configure.ac-check-for-localtime_r.patch  | 12 +++--
 ...t.h-only-include-compat_netdb.h-if-needed.patch | 58 ----------------------
 package/owfs/owfs.hash                             |  7 +--
 package/owfs/owfs.mk                               |  2 +-
 4 files changed, 12 insertions(+), 67 deletions(-)

diff --git a/package/owfs/0001-configure.ac-check-for-localtime_r.patch b/package/owfs/0001-configure.ac-check-for-localtime_r.patch
index c4c3844..b25aa59 100644
--- a/package/owfs/0001-configure.ac-check-for-localtime_r.patch
+++ b/package/owfs/0001-configure.ac-check-for-localtime_r.patch
@@ -11,6 +11,8 @@ Upstream-Status: Submitted
 https://sourceforge.net/p/owfs/mailman/message/34873667/
 
 Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+[Bernd: rebased against version 3.2p1]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -19,15 +21,15 @@ diff --git a/configure.ac b/configure.ac
 index c22dde9..12fdd18 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1529,7 +1529,7 @@ AC_FUNC_SELECT_ARGTYPES
+@@ -1646,7 +1646,7 @@
  AC_FUNC_STRFTIME
  AC_FUNC_STRTOD
  AC_TYPE_SIGNAL
--AC_CHECK_FUNCS([accept daemon getaddrinfo freeaddrinfo gethostbyname2_r gethostbyaddr_r gethostbyname_r getservbyname_r getopt getopt_long gettimeofday inet_ntop inet_pton memchr memset select socket strcasecmp strchr strdup strncasecmp strtol strtoul twalk tsearch tfind tdelete tdestroy vasprintf strsep vsprintf vsnprintf writev getline])
-+AC_CHECK_FUNCS([accept daemon getaddrinfo freeaddrinfo gethostbyname2_r gethostbyaddr_r gethostbyname_r getservbyname_r getopt getopt_long gettimeofday inet_ntop inet_pton memchr memset select socket strcasecmp strchr strdup strncasecmp strtol strtoul twalk tsearch tfind tdelete tdestroy vasprintf strsep vsprintf vsnprintf writev getline localtime_r])
+-AC_CHECK_FUNCS([accept daemon getaddrinfo freeaddrinfo gethostbyname2_r gethostbyaddr_r gethostbyname_r getservbyname_r getopt getopt_long gmtime_r gettimeofday localtime_r inet_ntop inet_pton memchr memset select socket strcasecmp strchr strdup strncasecmp strtol strtoul twalk tsearch tfind tdelete tdestroy vasprintf strsep vsprintf vsnprintf writev getline])
++AC_CHECK_FUNCS([accept daemon getaddrinfo freeaddrinfo gethostbyname2_r gethostbyaddr_r gethostbyname_r getservbyname_r getopt getopt_long gmtime_r gettimeofday localtime_r inet_ntop inet_pton memchr memset select socket strcasecmp strchr strdup strncasecmp strtol strtoul twalk tsearch tfind tdelete tdestroy vasprintf strsep vsprintf vsnprintf writev getline localtime_r])
  
- if test "${ENABLE_ZERO}" = "true" ; then
- 	AC_SEARCH_LIBS(dlopen, dl, AC_DEFINE(HAVE_DLOPEN, 1, [Define if you have dlopen]))
+ save_LIBS="$LIBS"
+ LIBS=""
 -- 
 2.7.0
 
diff --git a/package/owfs/0002-compat.h-only-include-compat_netdb.h-if-needed.patch b/package/owfs/0002-compat.h-only-include-compat_netdb.h-if-needed.patch
deleted file mode 100644
index 7ae7932..0000000
--- a/package/owfs/0002-compat.h-only-include-compat_netdb.h-if-needed.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From d24e63eea4f4d234f313145e40668a5e2f64e49c Mon Sep 17 00:00:00 2001
-From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
-Date: Wed, 9 Mar 2016 23:20:11 +0100
-Subject: [PATCH] compat.h: only include compat_netdb.h if needed
-
-compat_netdb.h is added for only one reason: to provide the definitions
-for getaddrinfo, in case it is not provided by the system.
-compat_netdb.h is just a copy from an old glibc version, but that makes
-it incompatible with other standard C libraries. For example, uClibc
-without RPC support doesn't have the rpc/netdb.h header. This leads to
-build errors.
-
-To work around this, only include compat_netdb.h when needed, i.e.
-when getaddrinfo isn't provided natively.
-
-Note that this getaddrinfo compat was introduced in commit bc54c431 to
-support Solaris 7. Starting from Solaris 8, however, getaddrinfo is
-available natively, and it's available on MacOS, Windows and any other
-POSIX-2001 compliant system as well. So it may be worhtwhile to remove
-it altogether.
-
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- module/owlib/src/include/compat.h   | 2 ++
- module/ownet/c/src/include/compat.h | 2 ++
- 2 files changed, 4 insertions(+)
-
-diff --git a/module/owlib/src/include/compat.h b/module/owlib/src/include/compat.h
-index c55bc96..e95e16f 100644
---- a/module/owlib/src/include/compat.h
-+++ b/module/owlib/src/include/compat.h
-@@ -57,7 +57,9 @@
- #include <features.h>
- #endif
- 
-+#ifndef HAVE_GETADDRINFO
- #include "compat_netdb.h"
-+#endif
- #include "compat_getopt.h"
- 
- #ifndef HAVE_STRSEP
-diff --git a/module/ownet/c/src/include/compat.h b/module/ownet/c/src/include/compat.h
-index c45d852..f8ae759 100644
---- a/module/ownet/c/src/include/compat.h
-+++ b/module/ownet/c/src/include/compat.h
-@@ -58,7 +58,9 @@ $Id$
- #include <features.h>
- #endif
- 
-+#ifndef HAVE_GETADDRINFO
- #include "compat_netdb.h"
-+#endif
- #include "compat_getopt.h"
- 
- #ifndef HAVE_STRSEP
--- 
-2.7.0
-
diff --git a/package/owfs/owfs.hash b/package/owfs/owfs.hash
index 3991eec..1e57e29 100644
--- a/package/owfs/owfs.hash
+++ b/package/owfs/owfs.hash
@@ -1,4 +1,5 @@
-# From https://sourceforge.net/projects/owfs/files/owfs/3.1p1/
-sha1  80892ca3e72fef2979b8f0a04db15fd24a2cbda6  owfs-3.1p1.tar.gz
+# From https://sourceforge.net/projects/owfs/files/owfs/3.2p1/
+md5 fb42ce3b8a49f0b62711d8e3f5f04880  owfs-3.2p1.tar.gz
+sha1 4ee76e686bec769acde5bfbda148a8693df244c6  owfs-3.2p1.tar.gz
 # Locally calculated
-sha256  e69421ae534565c1f8530a2447f583401f4d0d4b1cf3cb8cf399a57133ed7f81  owfs-3.1p1.tar.gz
+sha256 33220b25db36969a717cd27e750d73dee376795e13a5f3677f05111b745832ea  owfs-3.2p1.tar.gz
diff --git a/package/owfs/owfs.mk b/package/owfs/owfs.mk
index dceb6b6..47626ce 100644
--- a/package/owfs/owfs.mk
+++ b/package/owfs/owfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OWFS_VERSION = 3.1p1
+OWFS_VERSION = 3.2p1
 OWFS_SITE = http://downloads.sourceforge.net/project/owfs/owfs/$(OWFS_VERSION)
 OWFS_DEPENDENCIES = host-pkgconf
 OWFS_CONF_OPTS = --disable-owperl --without-perl5 --disable-owtcl --without-tcl
