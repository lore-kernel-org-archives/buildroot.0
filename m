Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2CCC77B7C
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 06:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EF07412F6;
	Thu, 29 Aug 2024 06:20:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vD3F1o62wW4M; Thu, 29 Aug 2024 06:20:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF01A412D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF01A412D4;
	Thu, 29 Aug 2024 06:20:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 32CA11BF867
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 06:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EDA860639
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 06:20:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lq193y4lVpK8 for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 06:20:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 229BA6062C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 229BA6062C
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 06:20:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D5568661E; Thu, 29 Aug 2024 06:20:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 08:04:32 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: cc03fb2d1a83a89b4754c08430fb5a524d204507
X-Git-Newrev: feeb6ea3690f73eb3748c1970a69e1b53db03c9e
X-Patchwork-Hint: ignore
Message-Id: <20240829062034.0D5568661E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/mpir: fix build
 with host gcc >= 14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=feeb6ea3690f73eb3748c1970a69e1b53db03c9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fix the following build failure with host gcc >= 14 which enables
-Werror=implicit-function-declaration
(https://gcc.gnu.org/gcc-14/porting_to.html):

configure:9998: checking build system compiler /usr/bin/gcc
configure:10011: /usr/bin/gcc conftest.c
conftest.c: In function 'main':
conftest.c:4:3: error: implicit declaration of function 'exit' [-Wimplicit-function-declaration]
    4 |   exit(0);
      |   ^~~~
conftest.c:1:1: note: include '<stdlib.h>' or provide a declaration of 'exit'
  +++ |+#include <stdlib.h>
    1 | int
conftest.c:4:3: warning: incompatible implicit declaration of built-in function 'exit' [-Wbuiltin-declaration-mismatch]
    4 |   exit(0);
      |   ^~~~
conftest.c:4:3: note: include '<stdlib.h>' or provide a declaration of 'exit'
configure:10014: $? = 1
configure:10021: result: no
configure:10026: error: Specified CC_FOR_BUILD doesn't seem to work

Fixes:
 - http://autobuild.buildroot.org/results/3ab381f06d5dc030039b6f6f8d19feb55cf3367d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3bb426628c19f04cbad6821c1a68f008043d7808)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-Fix-configure-failures-with-Xcode12.patch | 116 +++++++++++++++++++++
 package/mpir/mpir.mk                               |   2 +
 2 files changed, 118 insertions(+)

diff --git a/package/mpir/0002-Fix-configure-failures-with-Xcode12.patch b/package/mpir/0002-Fix-configure-failures-with-Xcode12.patch
new file mode 100644
index 0000000000..453515f926
--- /dev/null
+++ b/package/mpir/0002-Fix-configure-failures-with-Xcode12.patch
@@ -0,0 +1,116 @@
+From bbc43ca6ae0bec4f64e69c9cd4c967005d6470eb Mon Sep 17 00:00:00 2001
+From: Mitchell Blank Jr <mitch@bodyfour.com>
+Date: Mon, 21 Dec 2020 12:05:19 +0000
+Subject: [PATCH] Fix configure failures with Xcode12
+
+Changes are needed becuase Xcode12 includes a default of
+-Werror,-Wimplicit-function-declaration which means that
+even something like calling "exit(0);" is a compile failure
+if you haven't done a "#include <stdlib.h>" first (as C99
+requires, but most other compilers will just warn about)
+
+I don't know if the "long long reliability test 2" test which
+tries to provoke a crash on a particular gcc 3.3 build still
+does what it was originally intended to do with my change.
+Of course, I doubt anyone has tried to use that compiler in
+years.
+
+Fixes #290
+
+Upstream: https://github.com/wbhart/mpir/commit/bbc43ca6ae0bec4f64e69c9cd4c967005d6470eb
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ acinclude.m4 | 24 +++++++++++++-----------
+ 1 file changed, 13 insertions(+), 11 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 91c35bc23..620a629ef 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -589,9 +589,9 @@ extern
+ #endif
+ __inline__ t1 e(t2 rp,t2 up,int n,t1 v0)
+ {t1 c,x,r;int i;if(v0){c=1;for(i=1;i<n;i++){x=up[i];r=x+1;rp[i]=r;}}return c;}
+-f(){static const struct{t1 n;t1 src[9];t1 want[9];}d[]={{1,{0},{1}},};t1 got[9];int i;
++void f(){static const struct{t1 n;t1 src[9];t1 want[9];}d[]={{1,{0},{1}},};t1 got[9];int i;
+ for(i=0;i<1;i++){if(e(got,got,9,d[i].n)==0)h();g(i,d[i].src,d[i].n,got,d[i].want,9);if(d[i].n)h();}}
+-h(){}g(){}
++void h(){} void g(){}
+ #else
+ int dummy;
+ #endif
+@@ -603,8 +603,9 @@ GMP_PROG_CC_WORKS_PART([$1], [long long reliability test 2],
+    1666 to get an ICE with -O1 -mpowerpc64.  */
+ 
+ #ifdef __GNUC__
+-f(int u){int i;long long x;x=u?~0:0;if(x)for(i=0;i<9;i++);x&=g();if(x)g();}
+-g(){}
++extern int g();
++void f(int u){int i;long long x;x=u?~0:0;if(x)for(i=0;i<9;i++);x&=g();if(x)g();}
++int g(){return 0;}
+ #else
+ int dummy;
+ #endif
+@@ -3323,11 +3324,11 @@ check (va_alist)
+   ret = vsnprintf (buf, 4, fmt, ap);
+ 
+   if (strcmp (buf, "hel") != 0)
+-    exit (1);
++    return 1;
+ 
+   /* allowed return values */
+   if (ret != -1 && ret != 3 && ret != 11)
+-    exit (2);
++    return 2;
+ 
+   return 0;
+ }
+@@ -3336,7 +3337,7 @@ int
+ main ()
+ {
+ $i
+-  exit (0);
++  return 0;
+ }
+ ],
+       [:],
+@@ -3469,7 +3470,7 @@ cat >conftest.c <<EOF
+ int
+ main ()
+ {
+-  exit(0);
++  return 0;
+ }
+ EOF
+ gmp_compile="$1 conftest.c"
+@@ -3543,7 +3544,7 @@ AC_CACHE_CHECK([for build system executable suffix],
+ int
+ main ()
+ {
+-  exit (0);
++  return 0;
+ }
+ EOF
+ for i in .exe ,ff8 ""; do
+@@ -3577,7 +3578,7 @@ AC_CACHE_CHECK([whether build system compiler is ANSI],
+ int
+ main (int argc, char *argv[])
+ {
+-  exit(0);
++  return 0;
+ }
+ EOF
+ gmp_compile="$CC_FOR_BUILD conftest.c"
+@@ -3608,10 +3609,11 @@ AC_DEFUN([GMP_CHECK_LIBM_FOR_BUILD],
+ AC_CACHE_CHECK([for build system compiler math library],
+                gmp_cv_check_libm_for_build,
+ [cat >conftest.c <<EOF
++#include <math.h>
+ int
+ main ()
+ {
+-  exit(0);
++  return 0;
+ }
+ double d;
+ double
diff --git a/package/mpir/mpir.mk b/package/mpir/mpir.mk
index 5dbd760aa1..46cd35e436 100644
--- a/package/mpir/mpir.mk
+++ b/package/mpir/mpir.mk
@@ -11,6 +11,8 @@ MPIR_LICENSE = LGPL-3.0+
 MPIR_LICENSE_FILES = COPYING.LIB
 MPIR_INSTALL_STAGING = YES
 MPIR_DEPENDENCIES = gmp host-yasm
+# 0002-Fix-configure-failures-with-Xcode12.patch
+MPIR_AUTORECONF = YES
 
 ifeq ($(BR2_MIPS_NABI32),y)
 MPIR_CONF_OPTS += ABI=n32
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
