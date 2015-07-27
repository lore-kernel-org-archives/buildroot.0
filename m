From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 27 Jul 2015 16:20:59 +0200
Subject: [Buildroot] [PATCH 1/2] package/gcc: fix gcc 4.7 build with gcc5
Message-ID: <1438006860-5990-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gcc 4.7 doesn't build with gcc5.

Patch is from DragonFlyBSD github [1]

[1] https://github.com/DragonFlyBSD/DPorts/issues/136

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 .../gcc/4.7.4/844-gcc-fix-build-with-gcc5.patch    | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/gcc/4.7.4/844-gcc-fix-build-with-gcc5.patch

diff --git a/package/gcc/4.7.4/844-gcc-fix-build-with-gcc5.patch b/package/gcc/4.7.4/844-gcc-fix-build-with-gcc5.patch
new file mode 100644
index 0000000..b076e54
--- /dev/null
+++ b/package/gcc/4.7.4/844-gcc-fix-build-with-gcc5.patch
@@ -0,0 +1,42 @@
+From 4fb4acf88912dd978bb63ecab79641a5795ce84f Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Mon, 27 Jul 2015 15:05:14 +0200
+Subject: [PATCH] gcc: fix build with gcc5
+
+gcc < 4.8 doesn't build with gcc5.
+
+Patch is from DragonFlyBSD github [1]
+
+[1] https://github.com/DragonFlyBSD/DPorts/issues/136
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ gcc/cp/cfns.h | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/cp/cfns.h b/gcc/cp/cfns.h
+index 62cdfab..4f63cc4 100644
+--- a/gcc/cp/cfns.h
++++ b/gcc/cp/cfns.h
+@@ -53,6 +53,9 @@ __inline
+ static unsigned int hash (const char *, unsigned int);
+ #ifdef __GNUC__
+ __inline
++#ifdef __GNUC_STDC_INLINE__
++__attribute__ ((__gnu_inline__))
++#endif
+ #endif
+ const char * libc_name_p (const char *, unsigned int);
+ /* maximum key range = 391, duplicates = 0 */
+@@ -96,7 +99,7 @@ hash (register const char *str, register unsigned int len)
+       400, 400, 400, 400, 400, 400, 400, 400, 400, 400,
+       400, 400, 400, 400, 400, 400, 400
+     };
+-  register int hval = len;
++  register int hval = (int)len;
+ 
+   switch (hval)
+     {
+-- 
+2.4.3
+
-- 
2.4.3
