From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 May 2019 13:58:42 +0200
Subject: [Buildroot] [git commit] package/keepalived: fix build with -Os
Message-ID: <20190525115302.E83078D1F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c002feeb6cbe469f1981d4a60c9a16d095d452e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/955aef1c25b977d6697fdf8cd1e710f40c7e60a3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...that-lm-linker-library-flag-is-always-set.patch | 62 ++++++++++++++++++++++
 package/keepalived/keepalived.mk                   |  2 +
 2 files changed, 64 insertions(+)

diff --git a/package/keepalived/0001-Ensure-that-lm-linker-library-flag-is-always-set.patch b/package/keepalived/0001-Ensure-that-lm-linker-library-flag-is-always-set.patch
new file mode 100644
index 0000000000..3c6bc72a2a
--- /dev/null
+++ b/package/keepalived/0001-Ensure-that-lm-linker-library-flag-is-always-set.patch
@@ -0,0 +1,62 @@
+From dea6cfba122439b29cdcb833a59868dd51a4eae4 Mon Sep 17 00:00:00 2001
+From: Quentin Armitage <quentin@armitage.org.uk>
+Date: Mon, 13 May 2019 14:25:26 +0100
+Subject: [PATCH] Ensure that -lm linker library flag is always set
+
+configure was testing whether it was necessary to add the -lm option,
+but for some reason gcc adds it itself if -Os is not specified, but
+does not add it if -Os is specified. Consequently if configure was
+run without -Os, and make was run with -Os the link failed.
+
+The commit ensures that -lm is always used.
+
+Signed-off-by: Quentin Armitage <quentin@armitage.org.uk>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/acassen/keepalived/commit/dea6cfba122439b29cdcb833a59868dd51a4eae4]
+---
+ configure.ac | 24 +++---------------------
+ 1 file changed, 3 insertions(+), 21 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5023900f4..ae420d5a6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -340,6 +340,9 @@ WARNINGS_EXTRA="aggregate-return conversion padded pedantic sign-conversion stri
+ # We want _GNU_SOURCE defined always
+ add_to_var([CFLAGS], [-D_GNU_SOURCE])
+ 
++# fpclassify() needs -lm
++add_to_var([KA_LIBS], [-lm])
++
+ # Some sanity checks on configure options
+ AS_IF([test .$enable_vrrp = .no],
+   [
+@@ -779,27 +782,6 @@ AC_LINK_IFELSE([AC_LANG_SOURCE([[
+     LDFLAGS=$SAV_LDFLAGS
+   ])
+ 
+-# Check if fpclassify() requires -lm
+-CFLAGS=
+-LDFLAGS=
+-AC_MSG_CHECKING([whether fpclassify() requires -lm])
+-AC_LINK_IFELSE([AC_LANG_SOURCE([[
+-  # include <math.h>
+-  int main(int argc, char **argv)
+-  {
+-    double zero = 0.0;
+-    if (fpclassify(zero) == FP_ZERO)
+-      return 0;
+-    return 1;
+-  }
+-  ]])],
+-  AC_MSG_RESULT([no]),
+-  AC_MSG_RESULT([yes])
+-    add_to_var([KA_LIBS], [-lm])
+-  )
+-CFLAGS=$SAV_CFLAGS
+-LDFLAGS=$SAV_LDFLAGS
+-
+ # Checks for header files.
+ AC_CHECK_HEADERS([arpa/inet.h fcntl.h limits.h netdb.h netinet/in.h stdint.h stdlib.h string.h sys/ioctl.h sys/param.h sys/prctl.h sys/socket.h sys/time.h syslog.h unistd.h],
+   [], [AC_MSG_ERROR([Missing/unusable system header file <$ac_header>])])
diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index 30d857ba25..02c5a0cf39 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -10,6 +10,8 @@ KEEPALIVED_DEPENDENCIES = host-pkgconf openssl
 KEEPALIVED_LICENSE = GPL-2.0+
 KEEPALIVED_LICENSE_FILES = COPYING
 KEEPALIVED_CONF_OPTS = --disable-hardening
+# We're patching configure.ac
+KEEPALIVED_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_JSON_C),y)
 KEEPALIVED_DEPENDENCIES += json-c
