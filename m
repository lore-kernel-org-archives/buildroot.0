From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:42 -0000
Subject: [Buildroot] [git commit] package/micropython: bump version to 1.11
Message-ID: <20190903133619.D4C6F8A52E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=033c690e31322df9c3bb6b4403e0f5ca7c043343
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bring in the latest version and remove patch that has been applied upstream.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-__GI_vsnprintf-alias-for-gcc-9-and-above.patch | 32 ----------------------
 package/micropython/micropython.hash               |  2 +-
 package/micropython/micropython.mk                 |  2 +-
 3 files changed, 2 insertions(+), 34 deletions(-)

diff --git a/package/micropython/0002-lib-utils-printf-Exclude-__GI_vsnprintf-alias-for-gcc-9-and-above.patch b/package/micropython/0002-lib-utils-printf-Exclude-__GI_vsnprintf-alias-for-gcc-9-and-above.patch
deleted file mode 100644
index 161d97e5b9..0000000000
--- a/package/micropython/0002-lib-utils-printf-Exclude-__GI_vsnprintf-alias-for-gcc-9-and-above.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 7bbde67cb2dc52c04bd7020689a1227bddfa1b06 Mon Sep 17 00:00:00 2001
-From: Damien George <damien.p.george@gmail.com>
-Date: Wed, 6 Feb 2019 01:12:51 +1100
-Subject: [PATCH] lib/utils/printf: Exclude __GI_vsnprintf alias for gcc 9 and
- above.
-
-See issue #4457.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/micropython/micropython/commit/7bbde67cb2dc52c04bd7020689a1227bddfa1b06]
----
- lib/utils/printf.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/lib/utils/printf.c b/lib/utils/printf.c
-index 1ceeea39ff..0c21fc4c0a 100644
---- a/lib/utils/printf.c
-+++ b/lib/utils/printf.c
-@@ -99,9 +99,11 @@ STATIC void strn_print_strn(void *data, const char *str, size_t len) {
-     strn_print_env->remain -= len;
- }
- 
--#if defined(__GNUC__) && !defined(__clang__)
-+#if defined(__GNUC__) && !defined(__clang__) && __GNUC__ < 9
- // uClibc requires this alias to be defined, or there may be link errors
- // when linkings against it statically.
-+// GCC 9 gives a warning about missing attributes so it's excluded until
-+// uClibc+GCC9 support is needed.
- int __GI_vsnprintf(char *str, size_t size, const char *fmt, va_list ap) __attribute__((weak, alias ("vsnprintf")));
- #endif
- 
diff --git a/package/micropython/micropython.hash b/package/micropython/micropython.hash
index d0052ba299..1b77bc6efe 100644
--- a/package/micropython/micropython.hash
+++ b/package/micropython/micropython.hash
@@ -1,2 +1,2 @@
 #locally computed
-sha256 9a66205d0ba3dff6dcc98119f104cd59c15855c6c030a190ca02354be52836c1  micropython-1.9.4.tar.gz
+sha256 2ab6f75b4bff040445f848004d387dbe1bcbdf1188db2334b2bd3eaa173eb744  micropython-1.11.tar.gz
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index cd6f674094..d636d0e869 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MICROPYTHON_VERSION = 1.9.4
+MICROPYTHON_VERSION = 1.11
 MICROPYTHON_SITE = $(call github,micropython,micropython,v$(MICROPYTHON_VERSION))
 MICROPYTHON_LICENSE = MIT
 MICROPYTHON_LICENSE_FILES = LICENSE
