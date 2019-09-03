From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  3 Sep 2019 19:08:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/micropython: remove unneeded patch
Message-ID: <20190903170836.20805-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch which is already in version

Fixes:
 - http://autobuild.buildroot.org/results/01da2ad39ea01c522fc5b431c4544bd91f58ac4a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ..._vsnprintf-alias-for-gcc-9-and-above.patch | 32 -------------------
 1 file changed, 32 deletions(-)
 delete mode 100644 package/micropython/0002-lib-utils-printf-Exclude-__GI_vsnprintf-alias-for-gcc-9-and-above.patch

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
-- 
2.23.0.rc1
