From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 01:18:13 +0200
Subject: [Buildroot] [git commit] package/libpqxx: bump version to 6.2.5
Message-ID: <20181023231921.BA75C88651@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19f6c7e53b76e943977a44575c3b32a9c244975f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch applied upstream:
https://github.com/jtv/libpqxx/commit/44970d7331e4f369e160af0135a2d1fc16f27a21

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ude-sys-time.h-outside-fallback-select-55.patch | 119 ---------------------
 package/libpqxx/libpqxx.hash                       |   2 +-
 package/libpqxx/libpqxx.mk                         |   2 +-
 3 files changed, 2 insertions(+), 121 deletions(-)

diff --git a/package/libpqxx/0001-include-sys-time.h-outside-fallback-select-55.patch b/package/libpqxx/0001-include-sys-time.h-outside-fallback-select-55.patch
deleted file mode 100644
index 4c635759e0..0000000000
--- a/package/libpqxx/0001-include-sys-time.h-outside-fallback-select-55.patch
+++ /dev/null
@@ -1,119 +0,0 @@
-From 44970d7331e4f369e160af0135a2d1fc16f27a21 Mon Sep 17 00:00:00 2001
-From: jdknight-rockwellcollins <james.knight@rockwellcollins.com>
-Date: Mon, 15 Jan 2018 12:41:25 -0500
-Subject: [PATCH] include sys/time.h outside fallback select (#55)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The implementation of 'wait_fd' (inside 'connection_base.cxx') always
-relies on the existence of the 'timeval' structure. In Linux, this
-structure is provided by the header 'sys/time.h'. If polling or select
-capabilities are detected, the structure is never included into the
-source and will result in a compilation error (GCC 7.x):
-
-    connection_base.cxx:1153:28: error: ???{anonymous}::tv_milliseconds??? declared as an ???inline??? variable
-     inline int tv_milliseconds(timeval *tv = nullptr)
-                                ^~~~~~~
-    ...
-
-The following moves the 'HAVE_SYS_TIME_H' check outside the
-select-fallback case so that the header can be included no matter the
-event-function feature is used.
-
-Signed-off-by: James Knight <james.knight@rockwellcollins.com>
----
- configure               | 28 ++++++++++++----------------
- configure.ac            |  6 +-----
- src/connection_base.cxx |  2 +-
- 3 files changed, 14 insertions(+), 22 deletions(-)
-
-diff --git a/configure b/configure
-index 7d6d96a98e0fcb7dde1e05adf034afe624ada6d6..dd2a33cb54dba5d3223fc2b4c8d03be7c8abde4e 100755
---- a/configure
-+++ b/configure
-@@ -17285,22 +17285,6 @@ fi
- done
- 
- 
--if test "$select_h" != "yes"
--then
--for ac_header in sys/time.h
--do :
--  ac_fn_cxx_check_header_mongrel "$LINENO" "sys/time.h" "ac_cv_header_sys_time_h" "$ac_includes_default"
--if test "x$ac_cv_header_sys_time_h" = xyes; then :
--  cat >>confdefs.h <<_ACEOF
--#define HAVE_SYS_TIME_H 1
--_ACEOF
--
--fi
--
--done
--
--fi
--
- # Some systems keep select() in a separate library which is not linked by
- # default.  See if we need one of those.
- socklibok=no
-@@ -17419,6 +17403,18 @@ fi
- 
- fi # No poll()
- 
-+for ac_header in sys/time.h
-+do :
-+  ac_fn_cxx_check_header_mongrel "$LINENO" "sys/time.h" "ac_cv_header_sys_time_h" "$ac_includes_default"
-+if test "x$ac_cv_header_sys_time_h" = xyes; then :
-+  cat >>confdefs.h <<_ACEOF
-+#define HAVE_SYS_TIME_H 1
-+_ACEOF
-+
-+fi
-+
-+done
-+
- 
- # Add options to compiler command line, if compiler accepts them.
- add_compiler_opts_if_ok() {
-diff --git a/configure.ac b/configure.ac
-index 8977c3d3900a5de66b580365d8fe7d133cd1042d..6649f7fa0ed0572489a0db09517c659012ce707c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -117,11 +117,6 @@ then
- select_h=no
- AC_CHECK_HEADERS([sys/select.h], [select_h=yes])
- 
--if test "$select_h" != "yes"
--then
--AC_CHECK_HEADERS([sys/time.h])
--fi
--
- # Some systems keep select() in a separate library which is not linked by
- # default.  See if we need one of those.
- socklibok=no
-@@ -150,6 +145,7 @@ fi
- 
- fi # No poll()
- 
-+AC_CHECK_HEADERS([sys/time.h])
- 
- # Add options to compiler command line, if compiler accepts them.
- add_compiler_opts_if_ok() {
-diff --git a/src/connection_base.cxx b/src/connection_base.cxx
-index 37ed7728ffd02e1fded3b5d64d6fb2d5fd74d5ed..0ec55bc5bd761690f66b67396cfbf3e3c56ba618 100644
---- a/src/connection_base.cxx
-+++ b/src/connection_base.cxx
-@@ -38,10 +38,10 @@
- #if defined(HAVE_UNISTD_H)
- #include <unistd.h>
- #endif
-+#endif
- #if defined(HAVE_SYS_TIME_H)
- #include <sys/time.h>
- #endif
--#endif
- 
- #include "libpq-fe.h"
- 
--- 
-1.8.3.msysgit.0
-
diff --git a/package/libpqxx/libpqxx.hash b/package/libpqxx/libpqxx.hash
index 372be603c5..b04e3c3198 100644
--- a/package/libpqxx/libpqxx.hash
+++ b/package/libpqxx/libpqxx.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	81cac92458efd799fadb0374107464320d93eba71de05aedf21afb9c8dda7c3a	libpqxx-6.0.0.tar.gz
+sha256	36fcf8439ac7f7cc68b21e95b20e921ece4487cda1cc1d09b798a84e7cb3a4b7	libpqxx-6.2.5.tar.gz
 sha256	9e1c78fa302e4e9738bf3315b130429035c03fcb0f046531ccd977cb474f6b31	COPYING
diff --git a/package/libpqxx/libpqxx.mk b/package/libpqxx/libpqxx.mk
index ccafa9ce71..9e0f84db82 100644
--- a/package/libpqxx/libpqxx.mk
+++ b/package/libpqxx/libpqxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPQXX_VERSION = 6.0.0
+LIBPQXX_VERSION = 6.2.5
 LIBPQXX_SITE = $(call github,jtv,libpqxx,$(LIBPQXX_VERSION))
 LIBPQXX_INSTALL_STAGING = YES
 LIBPQXX_DEPENDENCIES = postgresql
