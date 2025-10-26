Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE39CCD193
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 09:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F80F600D1;
	Sun, 26 Oct 2025 09:02:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id haVCVOdBx6Oe; Sun, 26 Oct 2025 09:02:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A094560602
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A094560602;
	Sun, 26 Oct 2025 09:02:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FAB9D7
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 09:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21676403E2
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 09:02:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MCSV30jzNzCY for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 09:02:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2845B403CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2845B403CC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2845B403CC
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 09:02:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04a9.dip0.t-ipconnect.de [91.58.4.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E7D8FA4C43FC;
 Sun, 26 Oct 2025 10:02:21 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33694)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vCwdp-000000006g3-3HOT;
 Sun, 26 Oct 2025 09:02:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Semyon Kolganov <semenak94@mail.ru>
Date: Sun, 26 Oct 2025 10:02:21 +0100
Message-ID: <20251026090221.699214-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761469341;
 bh=Ha9kyQrMIkMl7KwvIQp/ZrsKUFRJQ+vEPrGZjqsokdo=;
 h=From:To:Cc:Subject:Date:From;
 b=bzAM8KOTw4ZRJDHaCGtVRnGaElbE3elypgMo57gVOIkm6GiYCDUAEAKtZ++5afHux
 c2N3+3KIoTkfL65ttM1UuiV1x6VBjpIOQxPysujEX74nDWn3aSqQyu8+hA8FWm2uOD
 cozGGkRY4UVd1jncC0iJBj3MICl21JG8D4BrFz2czc/ARYSz9fMeXqfvaeijWWcwv/
 LCdbnVa60pMVrMl6ncRrQ6lcLuQyel4JayQsqb1i98vu/5CHyHsm4dmQrEpuMbOvPw
 mnfs9eWP6DWZxk2C8AoJnt2YrnJ+b+LtZjqBOMdVXpl7CuYK09WLC9ghzG23OxKeXF
 ma56f+tP2Gozg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=bzAM8KOT
Subject: [Buildroot] [PATCH 1/1] package/mpir: fix build errors
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Added upstream patch to fix configure with gcc-14.

Updated project URL and _SITE due to previous site not being available
anymore: https://github.com/wbhart/mpir/pull/298

The github helper could not be used, for details see
https://patchwork.ozlabs.org/project/buildroot/patch/20250203-repair_mpir-v1-1-db848d68b586@bootlin.com/
In contrast this commit does not bump the package version.

Removed doc build which fails due to missing automake.

Fixes:
https://autobuild.buildroot.net/results/d14/d144ec967b7db34de56eaf34bb436460b8c924ed/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../mpir/0003-fix-configure-with-gcc-14.patch | 32 +++++++++++++++++++
 package/mpir/Config.in                        |  2 +-
 package/mpir/mpir.hash                        |  2 +-
 package/mpir/mpir.mk                          | 13 ++++++--
 4 files changed, 45 insertions(+), 4 deletions(-)
 create mode 100644 package/mpir/0003-fix-configure-with-gcc-14.patch

diff --git a/package/mpir/0003-fix-configure-with-gcc-14.patch b/package/mpir/0003-fix-configure-with-gcc-14.patch
new file mode 100644
index 0000000000..d3d490750b
--- /dev/null
+++ b/package/mpir/0003-fix-configure-with-gcc-14.patch
@@ -0,0 +1,32 @@
+From 4ff3b770cbf86e29b75d12c13e8b854c74bccc5a Mon Sep 17 00:00:00 2001
+From: Reno Dakota <paparodeo@proton.me>
+Date: Wed, 4 Dec 2024 23:09:03 +0000
+Subject: [PATCH] fix configure with gcc-14
+
+move function definition above caller to fix compile error
+
+> configure:6438: gcc -m64  conftest.c >&5
+> conftest.c: In function 'f':
+> conftest.c:13:44: error: implicit declaration of function 'h' [-Wimplicit-function-declaration]
+
+Upstream: https://github.com/wbhart/mpir/commit/4ff3b770cbf86e29b75d12c13e8b854c74bccc5a
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ acinclude.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 620a629ef..cd917567f 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -590,8 +590,8 @@ extern
+ __inline__ t1 e(t2 rp,t2 up,int n,t1 v0)
+ {t1 c,x,r;int i;if(v0){c=1;for(i=1;i<n;i++){x=up[i];r=x+1;rp[i]=r;}}return c;}
+ void f(){static const struct{t1 n;t1 src[9];t1 want[9];}d[]={{1,{0},{1}},};t1 got[9];int i;
+-for(i=0;i<1;i++){if(e(got,got,9,d[i].n)==0)h();g(i,d[i].src,d[i].n,got,d[i].want,9);if(d[i].n)h();}}
+ void h(){} void g(){}
++for(i=0;i<1;i++){if(e(got,got,9,d[i].n)==0)h();g(i,d[i].src,d[i].n,got,d[i].want,9);if(d[i].n)h();}}
+ #else
+ int dummy;
+ #endif
diff --git a/package/mpir/Config.in b/package/mpir/Config.in
index da4cc9f44e..b22350b23b 100644
--- a/package/mpir/Config.in
+++ b/package/mpir/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_MPIR
 	  MPIR is a highly optimised library for bignum arithmetic
 	  forked from the GMP bignum library.
 
-	  http://www.mpir.org/
+	  https://github.com/wbhart/mpir
diff --git a/package/mpir/mpir.hash b/package/mpir/mpir.hash
index 71d0c19d12..3b1b3e877d 100644
--- a/package/mpir/mpir.hash
+++ b/package/mpir/mpir.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  52f63459cf3f9478859de29e00357f004050ead70b45913f2c2269d9708675bb  mpir-3.0.0.tar.bz2
+sha256  86a5039badc3e6738219a262873a1db5513405e15ece9527b718fcd0fac09bb2  mpir-3.0.0.tar.gz
 sha256  9ccf26cfe845e0eb8bb58053e47366e7ab6b697ae010f7650978d4b71b7d1fc1  COPYING.LIB
diff --git a/package/mpir/mpir.mk b/package/mpir/mpir.mk
index 46cd35e436..eab5233865 100644
--- a/package/mpir/mpir.mk
+++ b/package/mpir/mpir.mk
@@ -5,15 +5,24 @@
 ################################################################################
 
 MPIR_VERSION = 3.0.0
-MPIR_SITE = http://www.mpir.org
-MPIR_SOURCE = mpir-$(MPIR_VERSION).tar.bz2
+MPIR_SITE = https://github.com/wbhart/mpir/archive/refs/tags
 MPIR_LICENSE = LGPL-3.0+
 MPIR_LICENSE_FILES = COPYING.LIB
 MPIR_INSTALL_STAGING = YES
 MPIR_DEPENDENCIES = gmp host-yasm
 # 0002-Fix-configure-failures-with-Xcode12.patch
+# 0003-fix-configure-with-gcc-14.patch
 MPIR_AUTORECONF = YES
 
+# mpir tries to build/install .info doc even if makeinfo isn't installed
+# on the host, so we have to disable global doc installation to prevent
+# autobuild errors.
+define MPIR_DISABLE_DOC_INSTALL
+	$(SED) 's/SUBDIRS += mpn fft mpz mpq mpf printf scanf cxx tune doc/SUBDIRS += mpn fft mpz mpq mpf printf scanf cxx tune/' \
+		$(@D)/Makefile.am
+endef
+MPIR_POST_PATCH_HOOKS += MPIR_DISABLE_DOC_INSTALL
+
 ifeq ($(BR2_MIPS_NABI32),y)
 MPIR_CONF_OPTS += ABI=n32
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
