From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:41 -0000
Subject: [Buildroot] [git commit] package/micropython: fix build with gcc 9
Message-ID: <20190903133619.C4C038A5E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=338d922a5844a0581d8d935f29d9499f0531eea0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/087906ea63875bcea244aa8f1e551aecd8285f65

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-__GI_vsnprintf-alias-for-gcc-9-and-above.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/micropython/0002-lib-utils-printf-Exclude-__GI_vsnprintf-alias-for-gcc-9-and-above.patch b/package/micropython/0002-lib-utils-printf-Exclude-__GI_vsnprintf-alias-for-gcc-9-and-above.patch
new file mode 100644
index 0000000000..161d97e5b9
--- /dev/null
+++ b/package/micropython/0002-lib-utils-printf-Exclude-__GI_vsnprintf-alias-for-gcc-9-and-above.patch
@@ -0,0 +1,32 @@
+From 7bbde67cb2dc52c04bd7020689a1227bddfa1b06 Mon Sep 17 00:00:00 2001
+From: Damien George <damien.p.george@gmail.com>
+Date: Wed, 6 Feb 2019 01:12:51 +1100
+Subject: [PATCH] lib/utils/printf: Exclude __GI_vsnprintf alias for gcc 9 and
+ above.
+
+See issue #4457.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/micropython/micropython/commit/7bbde67cb2dc52c04bd7020689a1227bddfa1b06]
+---
+ lib/utils/printf.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/lib/utils/printf.c b/lib/utils/printf.c
+index 1ceeea39ff..0c21fc4c0a 100644
+--- a/lib/utils/printf.c
++++ b/lib/utils/printf.c
+@@ -99,9 +99,11 @@ STATIC void strn_print_strn(void *data, const char *str, size_t len) {
+     strn_print_env->remain -= len;
+ }
+ 
+-#if defined(__GNUC__) && !defined(__clang__)
++#if defined(__GNUC__) && !defined(__clang__) && __GNUC__ < 9
+ // uClibc requires this alias to be defined, or there may be link errors
+ // when linkings against it statically.
++// GCC 9 gives a warning about missing attributes so it's excluded until
++// uClibc+GCC9 support is needed.
+ int __GI_vsnprintf(char *str, size_t size, const char *fmt, va_list ap) __attribute__((weak, alias ("vsnprintf")));
+ #endif
+ 
