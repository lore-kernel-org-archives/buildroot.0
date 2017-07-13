From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 13 Jul 2017 23:04:24 +0200
Subject: [Buildroot] [PATCH] package/lshw: fix the build with glibc without
	NLS
Message-ID: <20170713210424.18934-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since [1], NONLS is added to LSHW_CFLAGS even for glibc based toolchain.
Previously it was not the case since BR2_ENABLE_LOCALE is always
selected for glibc based toolchain.

With NONLS, config.h try to redefine two Intl function (textdomain and
bindtextdomain) that are used by glibc internally.

This break the build with the following error:
sysroot/usr/include/libintl.h:82:52: error: expected unqualified-id before 'throw'
 extern char *textdomain (const char *__domainname) __THROW;

Fixes:
http://autobuild.buildroot.net/results/9bf/9bf5437b4348ea8077013b80a51ce05fa328247d

[1] 3acd9f845de0489071719d52d774aab48d7f9c33

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...nt-t-try-to-redefine-intl-functions-when-.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/lshw/0004-config.h-dont-t-try-to-redefine-intl-functions-when-.patch

diff --git a/package/lshw/0004-config.h-dont-t-try-to-redefine-intl-functions-when-.patch b/package/lshw/0004-config.h-dont-t-try-to-redefine-intl-functions-when-.patch
new file mode 100644
index 0000000..5618d49
--- /dev/null
+++ b/package/lshw/0004-config.h-dont-t-try-to-redefine-intl-functions-when-.patch
@@ -0,0 +1,38 @@
+From e7550f317ac88957a2127cc1bedb7c5b4dd918bd Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Thu, 13 Jul 2017 22:44:20 +0200
+Subject: [PATCH] config.h: dont't try to redefine intl functions when NONLS is
+ set
+
+When NONLS is set and a glibc based toolchain is used to build lshw,
+config.h try to redefine two Intl function (textdomain and
+bindtextdomain) that are used by glibc internally.
+
+This break the build with the following error:
+sysroot/usr/include/libintl.h:82:52: error: expected unqualified-id before 'throw'
+ extern char *textdomain (const char *__domainname) __THROW;
+
+Fixes:
+http://autobuild.buildroot.net/results/9bf/9bf5437b4348ea8077013b80a51ce05fa328247d
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/core/config.h | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/core/config.h b/src/core/config.h
+index 69023fd..e7bdc18 100644
+--- a/src/core/config.h
++++ b/src/core/config.h
+@@ -4,8 +4,6 @@
+ #ifdef NONLS
+ #define _(String) (String)
+ #define N_(String) String
+-#define textdomain(Domain)
+-#define bindtextdomain(Package, Directory)
+ #else
+ #include <libintl.h>
+ #define _(String) gettext (String)
+-- 
+2.9.4
+
-- 
2.9.4
