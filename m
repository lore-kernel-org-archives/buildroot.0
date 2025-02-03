Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC38C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 18:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C70F406D5;
	Mon,  3 Feb 2025 18:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h28eRrE3HQHP; Mon,  3 Feb 2025 18:14:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E799412B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E799412B8;
	Mon,  3 Feb 2025 18:14:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D84D5185
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 18:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C65A360628
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 18:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t1Fc8tAF7VuL for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 18:14:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 64F10605F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64F10605F9
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64F10605F9
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 18:14:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C241441BB;
 Mon,  3 Feb 2025 18:14:20 +0000 (UTC)
Date: Mon, 03 Feb 2025 19:14:01 +0100
MIME-Version: 1.0
Message-Id: <20250203-repair_mpir-v1-1-db848d68b586@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAGgHoWcC/x3MQQqAIBBA0avIrBNMKaqrRIToWLPIZIQIxLsnL
 d/i/wIZmTDDIgowPpTpjg19J8CdNh4oyTeDVnpQWhnJmCzxfiViGSbjRq9MsH6GViTGQO9/W7d
 aP0iV/4ZdAAAA
X-Change-ID: 20250203-repair_mpir-f83c6d03fad9
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Semyon Kolganov <semenak94@mail.ru>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedvlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpefvhhhomhgrshcuuehonhhnvghfihhllhgvuceothhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfeiueetfffgvdehiedvueeiteffvefhjefhgfejkeeflefhffefuefggedtgefhnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpmhhpihhrrdhorhhgnecukfhppeduleegrdejkedrvdduuddrvddvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleegrdejkedrvdduuddrvddvtddphhgvlhhopegluddtrdduuddruddrleehngdpmhgrihhlfhhrohhmpehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehsvghmvghnrghkleegsehmrghilhdrrhhupdhrtghpthhtohepsghui
 hhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738606460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZklVlRNgLeM4kt4BikX61STyEGLr08HjuZdy5QaXDlA=;
 b=YQdUdlQ6Eqe3DzP82NR4cdkVAV7X7SCiCisUKUuO13uggzQWyLMgnVfFjzXu8nK1MfIU67
 TyhLsWVGSE1s77jmei7xz+syJOp/KIxGQ64p4u8YcG8GGM63RAPN3uYwG0TQN6Gc0zbiis
 F40ddciDK+FvN2TMbfnpwTSixcGe2n8h9BLFOPd0rq+/HvV8PiYYTCQM+dSv/5wKBtpGR0
 0h5eEvqGEJ2EfxCqLUYgpiNO1Xd+zM75Z731TPXDtSfybLLYgyNNiw0aNJ4dny7vUiLFGx
 /3oZxlzNoE0aOmkrYWn4knGpoh4OSkEs+5F0T8q+OeNa7c8/zd1cM1SKt9C5Qw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YQdUdlQ6
Subject: [Buildroot] [PATCH] package/mpir: replace source url
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mpir.org is now offline. This commit switch mpir source URL to a mirror
repo on Github.
Unfortunately this repository uses the same name for one of its branch
and a tag, so we are forced to use the exact commit sha1.
However this repository already included in the last version, the fix
for Xcode12, it is now no longer required as an external Buildroot
patch.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 .../0002-Fix-configure-failures-with-Xcode12.patch | 116 ---------------------
 package/mpir/mpir.hash                             |   2 +-
 package/mpir/mpir.mk                               |   6 +-
 3 files changed, 4 insertions(+), 120 deletions(-)

diff --git a/package/mpir/0002-Fix-configure-failures-with-Xcode12.patch b/package/mpir/0002-Fix-configure-failures-with-Xcode12.patch
deleted file mode 100644
index 453515f9267f407e17f98410ca4b532fefb85a78..0000000000000000000000000000000000000000
--- a/package/mpir/0002-Fix-configure-failures-with-Xcode12.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-From bbc43ca6ae0bec4f64e69c9cd4c967005d6470eb Mon Sep 17 00:00:00 2001
-From: Mitchell Blank Jr <mitch@bodyfour.com>
-Date: Mon, 21 Dec 2020 12:05:19 +0000
-Subject: [PATCH] Fix configure failures with Xcode12
-
-Changes are needed becuase Xcode12 includes a default of
--Werror,-Wimplicit-function-declaration which means that
-even something like calling "exit(0);" is a compile failure
-if you haven't done a "#include <stdlib.h>" first (as C99
-requires, but most other compilers will just warn about)
-
-I don't know if the "long long reliability test 2" test which
-tries to provoke a crash on a particular gcc 3.3 build still
-does what it was originally intended to do with my change.
-Of course, I doubt anyone has tried to use that compiler in
-years.
-
-Fixes #290
-
-Upstream: https://github.com/wbhart/mpir/commit/bbc43ca6ae0bec4f64e69c9cd4c967005d6470eb
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- acinclude.m4 | 24 +++++++++++++-----------
- 1 file changed, 13 insertions(+), 11 deletions(-)
-
-diff --git a/acinclude.m4 b/acinclude.m4
-index 91c35bc23..620a629ef 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -589,9 +589,9 @@ extern
- #endif
- __inline__ t1 e(t2 rp,t2 up,int n,t1 v0)
- {t1 c,x,r;int i;if(v0){c=1;for(i=1;i<n;i++){x=up[i];r=x+1;rp[i]=r;}}return c;}
--f(){static const struct{t1 n;t1 src[9];t1 want[9];}d[]={{1,{0},{1}},};t1 got[9];int i;
-+void f(){static const struct{t1 n;t1 src[9];t1 want[9];}d[]={{1,{0},{1}},};t1 got[9];int i;
- for(i=0;i<1;i++){if(e(got,got,9,d[i].n)==0)h();g(i,d[i].src,d[i].n,got,d[i].want,9);if(d[i].n)h();}}
--h(){}g(){}
-+void h(){} void g(){}
- #else
- int dummy;
- #endif
-@@ -603,8 +603,9 @@ GMP_PROG_CC_WORKS_PART([$1], [long long reliability test 2],
-    1666 to get an ICE with -O1 -mpowerpc64.  */
- 
- #ifdef __GNUC__
--f(int u){int i;long long x;x=u?~0:0;if(x)for(i=0;i<9;i++);x&=g();if(x)g();}
--g(){}
-+extern int g();
-+void f(int u){int i;long long x;x=u?~0:0;if(x)for(i=0;i<9;i++);x&=g();if(x)g();}
-+int g(){return 0;}
- #else
- int dummy;
- #endif
-@@ -3323,11 +3324,11 @@ check (va_alist)
-   ret = vsnprintf (buf, 4, fmt, ap);
- 
-   if (strcmp (buf, "hel") != 0)
--    exit (1);
-+    return 1;
- 
-   /* allowed return values */
-   if (ret != -1 && ret != 3 && ret != 11)
--    exit (2);
-+    return 2;
- 
-   return 0;
- }
-@@ -3336,7 +3337,7 @@ int
- main ()
- {
- $i
--  exit (0);
-+  return 0;
- }
- ],
-       [:],
-@@ -3469,7 +3470,7 @@ cat >conftest.c <<EOF
- int
- main ()
- {
--  exit(0);
-+  return 0;
- }
- EOF
- gmp_compile="$1 conftest.c"
-@@ -3543,7 +3544,7 @@ AC_CACHE_CHECK([for build system executable suffix],
- int
- main ()
- {
--  exit (0);
-+  return 0;
- }
- EOF
- for i in .exe ,ff8 ""; do
-@@ -3577,7 +3578,7 @@ AC_CACHE_CHECK([whether build system compiler is ANSI],
- int
- main (int argc, char *argv[])
- {
--  exit(0);
-+  return 0;
- }
- EOF
- gmp_compile="$CC_FOR_BUILD conftest.c"
-@@ -3608,10 +3609,11 @@ AC_DEFUN([GMP_CHECK_LIBM_FOR_BUILD],
- AC_CACHE_CHECK([for build system compiler math library],
-                gmp_cv_check_libm_for_build,
- [cat >conftest.c <<EOF
-+#include <math.h>
- int
- main ()
- {
--  exit(0);
-+  return 0;
- }
- double d;
- double
diff --git a/package/mpir/mpir.hash b/package/mpir/mpir.hash
index 71d0c19d12e1e3858600db9506a2ad846021e5d5..dec36c3b36b0b64deef19e1d7608cb0f4f3fcfed 100644
--- a/package/mpir/mpir.hash
+++ b/package/mpir/mpir.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  52f63459cf3f9478859de29e00357f004050ead70b45913f2c2269d9708675bb  mpir-3.0.0.tar.bz2
+sha256  4dd706e813505956a44cfbb8aefb8a6fef519bdc956d4730d8c7c83f058c094d  mpir-307663bf8b4daad22a7a593bfddf381b68920855.tar.gz
 sha256  9ccf26cfe845e0eb8bb58053e47366e7ab6b697ae010f7650978d4b71b7d1fc1  COPYING.LIB
diff --git a/package/mpir/mpir.mk b/package/mpir/mpir.mk
index 46cd35e4365bafbd30cc500bc975c3abeeb85c2f..c55061e1875cf995afad75519d36c9cc0da9f260 100644
--- a/package/mpir/mpir.mk
+++ b/package/mpir/mpir.mk
@@ -4,15 +4,15 @@
 #
 ################################################################################
 
-MPIR_VERSION = 3.0.0
-MPIR_SITE = http://www.mpir.org
-MPIR_SOURCE = mpir-$(MPIR_VERSION).tar.bz2
+MPIR_VERSION = 307663bf8b4daad22a7a593bfddf381b68920855
+MPIR_SITE = $(call github,wbhart,mpir,$(MPIR_VERSION))
 MPIR_LICENSE = LGPL-3.0+
 MPIR_LICENSE_FILES = COPYING.LIB
 MPIR_INSTALL_STAGING = YES
 MPIR_DEPENDENCIES = gmp host-yasm
 # 0002-Fix-configure-failures-with-Xcode12.patch
 MPIR_AUTORECONF = YES
+MPIR_CONF_ENV = MAKEINFO=true
 
 ifeq ($(BR2_MIPS_NABI32),y)
 MPIR_CONF_OPTS += ABI=n32

---
base-commit: d5b3795e92727c6565901cddf0c0f17c7854df56
change-id: 20250203-repair_mpir-f83c6d03fad9

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
