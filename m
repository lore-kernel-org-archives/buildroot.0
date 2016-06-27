From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 27 Jun 2016 22:29:11 +0200
Subject: [Buildroot] [PATCH] package/mono: fix sigcontext incorrect include
Message-ID: <1467059351-20171-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch solves incorrect inclusion of sigcontext.h on musl.
The patch was submitted upstream.

Fixes: http://autobuild.buildroot.net/results/bec/beced92f3ef81f201c0dc9178c7ff6fad0bc45e7/
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 ...009-fix-musl-incorrect-sigcontext-include.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/mono/0009-fix-musl-incorrect-sigcontext-include.patch

diff --git a/package/mono/0009-fix-musl-incorrect-sigcontext-include.patch b/package/mono/0009-fix-musl-incorrect-sigcontext-include.patch
new file mode 100644
index 0000000..3d932b6
--- /dev/null
+++ b/package/mono/0009-fix-musl-incorrect-sigcontext-include.patch
@@ -0,0 +1,44 @@
+From 63f0b0246b8125ae48b15bd182bb5831be02e6c9 Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+Date: Mon, 27 Jun 2016 21:32:11 +0200
+Subject: [PATCH] fix musl incorrect sigcontext include
+
+On musl __GLIBC__ is not defined, so the conditional logic will
+not produce correct result. Add a specific case to handle when
+__GLIBC__ is not defined.
+
+Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+---
+ libgc/os_dep.c             | 2 +-
+ mono/mini/exceptions-arm.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libgc/os_dep.c b/libgc/os_dep.c
+index 8c8e098..34859c1 100644
+--- a/libgc/os_dep.c
++++ b/libgc/os_dep.c
+@@ -32,7 +32,7 @@
+       /* prototypes, so we have to include the top-level sigcontext.h to    */
+       /* make sure the former gets defined to be the latter if appropriate. */
+ #     include <features.h>
+-#     if 2 <= __GLIBC__
++#     if 2 <= __GLIBC__ || !defined(__GLIBC__)
+ #       if 2 == __GLIBC__ && 0 == __GLIBC_MINOR__
+ 	  /* glibc 2.1 no longer has sigcontext.h.  But signal.h	*/
+ 	  /* has the right declaration for glibc 2.1.			*/
+diff --git a/mono/mini/exceptions-arm.c b/mono/mini/exceptions-arm.c
+index b036aa7..a3e2164 100644
+--- a/mono/mini/exceptions-arm.c
++++ b/mono/mini/exceptions-arm.c
+@@ -14,7 +14,7 @@
+ #include <string.h>
+ 
+ #ifndef MONO_CROSS_COMPILE
+-#ifdef HAVE_ASM_SIGCONTEXT_H
++#if defined(HAVE_ASM_SIGCONTEXT_H) && defined(__GLIBC__)
+ #include <asm/sigcontext.h>
+ #endif  /* def HAVE_ASM_SIGCONTEXT_H */
+ #endif
+-- 
+1.9.1
+
-- 
1.9.1
