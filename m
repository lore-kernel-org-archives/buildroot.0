Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79F7EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85DEC41E4E;
	Fri, 13 Feb 2026 19:35:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7X1Jsezx9fzG; Fri, 13 Feb 2026 19:35:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E80241E59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011358;
	bh=lM2dfxtwwYNwXk8OmgeAsawSAXHjHC+jymxHOZRV2nw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qPbAdmEi1Ct5AgZpXY3Vo3diL2v4oFz+PVI2R1aFBRqm7s1KMO/yBS1s8eTkTpCkl
	 gY0k+ppnxxs8hqY80jIqogwyRwhyLJCg8OjCQn6oimCgeBLpj7zx3jmwuc3oh3D/3V
	 ByITD4vQLR9Tp1R6bXEGEmMh48KdvO692J1YYkkvMa4EYLMvQX9DN/u2jYhBppCOpZ
	 ZKFNqmFm9/77XEsrPAYmOPqbd+swVimxxkSKcWtYx1CGJpLYL59D98j49Hl3MCpvkC
	 WkKmD2hPuQw6wW5xuEgHJMRzApmLF57wVTWpDdwDAtMhxmXv0cAaDSo0eJmjO0/ofm
	 32di76Ro/DY2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E80241E59;
	Fri, 13 Feb 2026 19:35:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 17794283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E042684535
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1PIlLe1AFCRz for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C96784536
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C96784536
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 614B581EB5; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:34:34 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ac673c6bbbddecece6e3422c4633af8751a73780
X-Git-Newrev: 48b50ab6d7a66dd8af46a8bc46d8eb4a89cb3bef
X-Patchwork-Hint: ignore
Message-Id: <20260213193527.614B581EB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mpir: fix build
 with gcc >= 14.x
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/48b50ab6d7a66dd8af46a8bc46d8eb4a89cb3bef
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Backport an upstream patch fixing a build issue with gcc >= 14.x.

Fixes:

  https://autobuild.buildroot.net/results/d144ec967b7db34de56eaf34bb436460b8c924ed/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9782cab084988dfeca25cb567bbcea3f5570d300)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
