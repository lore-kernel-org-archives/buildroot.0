Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D25E7DF11
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 18:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A24C40B3F;
	Mon,  2 Feb 2026 18:04:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J35R_sY-jeu9; Mon,  2 Feb 2026 18:04:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 784EE40ACA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770055475;
	bh=vLp7OVO5beyWLJ2ELoRxyXcwL1FySKipLMP/t13/Cns=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Nm7E/wLKxF8CMmCe4DQsgc/FYjjzRacsnr3uLg0rd3Yxaa86sOTz9aE6LRmUmGodo
	 tdHzhxpIXg3T6/sNTyrysnQ/Td8+6vqE6NS1PHl2dQ0MoENc8Hr01yZETW1QzDYfmP
	 GELBQw06uzxa28Ou3RKujft2Vt8ibEQMr0bXOEVzW4wOI928Km2HjzuOwM4V21JbzW
	 ry6qYs8jR8NtQYw/S1li65cjhDlj6X/eujvveHRrIg1OZ3oKsDVP89kfndYj8/eQi2
	 curdAW6lnKRugVzgb9Iqk+XLGpQGN6v7CwP3IcOEPMU5DVj8AbuHXJG8LT87+Hj3dh
	 eioGudsrGFneQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 784EE40ACA;
	Mon,  2 Feb 2026 18:04:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E81723E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60C4E40395
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:04:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B9whekJK54bG for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 18:04:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B664400E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B664400E7
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:04:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61BFA86488; Mon,  2 Feb 2026 18:04:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 19:04:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f45bec1edfc684e9fa0506903b2bf882d16ddb47
X-Git-Newrev: 9782cab084988dfeca25cb567bbcea3f5570d300
X-Patchwork-Hint: ignore
Message-Id: <20260202180433.61BFA86488@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpir: fix build with gcc >= 14.x
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9782cab084988dfeca25cb567bbcea3f5570d300
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport an upstream patch fixing a build issue with gcc >= 14.x.

Fixes:

  https://autobuild.buildroot.net/results/d144ec967b7db34de56eaf34bb436460b8c924ed/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpir/0003-fix-configure-with-gcc-14.patch | 31 +++++++++++++++++++++++
 package/mpir/mpir.mk                              |  1 +
 2 files changed, 32 insertions(+)

diff --git a/package/mpir/0003-fix-configure-with-gcc-14.patch b/package/mpir/0003-fix-configure-with-gcc-14.patch
new file mode 100644
index 0000000000..8df2fd363a
--- /dev/null
+++ b/package/mpir/0003-fix-configure-with-gcc-14.patch
@@ -0,0 +1,31 @@
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
diff --git a/package/mpir/mpir.mk b/package/mpir/mpir.mk
index 87bf8247a5..bf2181f551 100644
--- a/package/mpir/mpir.mk
+++ b/package/mpir/mpir.mk
@@ -11,6 +11,7 @@ MPIR_LICENSE_FILES = COPYING.LIB
 MPIR_INSTALL_STAGING = YES
 MPIR_DEPENDENCIES = gmp host-yasm
 # 0002-Fix-configure-failures-with-Xcode12.patch
+# 0003-fix-configure-with-gcc-14.patch
 MPIR_AUTORECONF = YES
 
 # We don't care about the documentation
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
