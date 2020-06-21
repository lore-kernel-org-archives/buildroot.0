From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Jun 2020 23:04:50 +0200
Subject: [Buildroot] [git commit] package/keepalived: bump to version 2.1.2
Message-ID: <20200621210415.523397F9B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f466a7dbc1d68959fcfb3e108ba80b3801f084de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version) and so autoreconf
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...that-lm-linker-library-flag-is-always-set.patch | 62 ----------------------
 package/keepalived/keepalived.hash                 |  4 +-
 package/keepalived/keepalived.mk                   |  4 +-
 3 files changed, 3 insertions(+), 67 deletions(-)

diff --git a/package/keepalived/0001-Ensure-that-lm-linker-library-flag-is-always-set.patch b/package/keepalived/0001-Ensure-that-lm-linker-library-flag-is-always-set.patch
deleted file mode 100644
index 3c6bc72a2a..0000000000
--- a/package/keepalived/0001-Ensure-that-lm-linker-library-flag-is-always-set.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From dea6cfba122439b29cdcb833a59868dd51a4eae4 Mon Sep 17 00:00:00 2001
-From: Quentin Armitage <quentin@armitage.org.uk>
-Date: Mon, 13 May 2019 14:25:26 +0100
-Subject: [PATCH] Ensure that -lm linker library flag is always set
-
-configure was testing whether it was necessary to add the -lm option,
-but for some reason gcc adds it itself if -Os is not specified, but
-does not add it if -Os is specified. Consequently if configure was
-run without -Os, and make was run with -Os the link failed.
-
-The commit ensures that -lm is always used.
-
-Signed-off-by: Quentin Armitage <quentin@armitage.org.uk>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/acassen/keepalived/commit/dea6cfba122439b29cdcb833a59868dd51a4eae4]
----
- configure.ac | 24 +++---------------------
- 1 file changed, 3 insertions(+), 21 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5023900f4..ae420d5a6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -340,6 +340,9 @@ WARNINGS_EXTRA="aggregate-return conversion padded pedantic sign-conversion stri
- # We want _GNU_SOURCE defined always
- add_to_var([CFLAGS], [-D_GNU_SOURCE])
- 
-+# fpclassify() needs -lm
-+add_to_var([KA_LIBS], [-lm])
-+
- # Some sanity checks on configure options
- AS_IF([test .$enable_vrrp = .no],
-   [
-@@ -779,27 +782,6 @@ AC_LINK_IFELSE([AC_LANG_SOURCE([[
-     LDFLAGS=$SAV_LDFLAGS
-   ])
- 
--# Check if fpclassify() requires -lm
--CFLAGS=
--LDFLAGS=
--AC_MSG_CHECKING([whether fpclassify() requires -lm])
--AC_LINK_IFELSE([AC_LANG_SOURCE([[
--  # include <math.h>
--  int main(int argc, char **argv)
--  {
--    double zero = 0.0;
--    if (fpclassify(zero) == FP_ZERO)
--      return 0;
--    return 1;
--  }
--  ]])],
--  AC_MSG_RESULT([no]),
--  AC_MSG_RESULT([yes])
--    add_to_var([KA_LIBS], [-lm])
--  )
--CFLAGS=$SAV_CFLAGS
--LDFLAGS=$SAV_LDFLAGS
--
- # Checks for header files.
- AC_CHECK_HEADERS([arpa/inet.h fcntl.h limits.h netdb.h netinet/in.h stdint.h stdlib.h string.h sys/ioctl.h sys/param.h sys/prctl.h sys/socket.h sys/time.h syslog.h unistd.h],
-   [], [AC_MSG_ERROR([Missing/unusable system header file <$ac_header>])])
diff --git a/package/keepalived/keepalived.hash b/package/keepalived/keepalived.hash
index 091821467b..feac0cce61 100644
--- a/package/keepalived/keepalived.hash
+++ b/package/keepalived/keepalived.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	933ee01bc6346aa573453b998f87510d3cce4aba4537c9642b24e6dbfba5c6f4  keepalived-2.0.15.tar.gz
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  fdf57a5766f52bd7f7bb917e06baede2e81efb96060b4dd1714170fbca32d58f  keepalived-2.1.2.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index 02c5a0cf39..c67eda3709 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-KEEPALIVED_VERSION = 2.0.15
+KEEPALIVED_VERSION = 2.1.2
 KEEPALIVED_SITE = http://www.keepalived.org/software
 KEEPALIVED_DEPENDENCIES = host-pkgconf openssl
 KEEPALIVED_LICENSE = GPL-2.0+
 KEEPALIVED_LICENSE_FILES = COPYING
 KEEPALIVED_CONF_OPTS = --disable-hardening
-# We're patching configure.ac
-KEEPALIVED_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_JSON_C),y)
 KEEPALIVED_DEPENDENCIES += json-c
