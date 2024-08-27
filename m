Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD17C52D6F
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 04:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CEAB403C4;
	Tue, 27 Aug 2024 04:35:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xLRMrKzg5M8Z; Tue, 27 Aug 2024 04:35:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA7E5403CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA7E5403CA;
	Tue, 27 Aug 2024 04:35:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C6251BF2BE
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 04:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88F0540185
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 04:35:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id thiond19lFBo for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 04:35:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 41C8D40151
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41C8D40151
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 41C8D40151
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 04:35:15 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 44E543520FE3; Tue, 27 Aug 2024 06:35:14 +0200 (CEST)
Date: Tue, 27 Aug 2024 06:35:14 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zs1XglvC1GPvEr4K@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724733314; bh=cvUMayHpw0l4FI+xfeOpbnAK/qYHd+0c0DpP+pzlBAk=;
 h=Date:From:To:Subject:From;
 b=DkDK4V801eu9fEMoUrvaprMNwHEb75Ga+lB8msqEFmS0VUoXavTmbL3+YD+pX5jS4
 YJgm2UXBPPBcSEJ7aRio9p8oCPWhm+6TsURL62vZNH8oWj6G/u62rDOHO5gHLxuKGW
 Uxccgtd/DRhHe8BKBJdTwp72ShjnTRjdoKLPqJqlHuGNdyrqt02/IcqeIS1PWBk0HG
 bt3CRnTKHMLKZYLWLLg8h8eRNTeMcr6W6keNcc4YD105E3KyiBmm+EnuBugMTat0Nm
 fzXuzTwjzbx5mikYIwp0akmFKUEUd3svgkVZYOzPpYbXVcYrSPvIaKN4CVY0mp6a7j
 QPBewJGEJdJRA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=DkDK4V80
Subject: [Buildroot] [PATCH] package/file: fix musl compile issue
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the update of musl to 1.2.5 in commit
f7f03445cf320adbbc41270a806b38c911d3454a find no longer compiles.

Add a patch from Gentoo people, also reported Upstream to fix the
issue.

Fixes:

 http://autobuild.buildroot.org/results/abf/abfe66cec3680d396c5774ba492f34599e513edc/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .../0001-file-seccomp-fstatat64-musl.patch    | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/file/0001-file-seccomp-fstatat64-musl.patch

diff --git a/package/file/0001-file-seccomp-fstatat64-musl.patch b/package/file/0001-file-seccomp-fstatat64-musl.patch
new file mode 100644
index 0000000000..ecb12fe44e
--- /dev/null
+++ b/package/file/0001-file-seccomp-fstatat64-musl.patch
@@ -0,0 +1,32 @@
+From 8c13923a8e17a02be0989649b2edc20124816729 Mon Sep 17 00:00:00 2001
+From: Mike Gilbert <floppym@gentoo.org>
+Date: Tue, 15 Jun 2021 16:08:22 -0400
+Subject: [PATCH] seccomp: undef fstatat64 to avoid build failure on musl
+
+sys/stat.h in musl does this:
+
+  #define fstatat64 fstatat
+
+Counteract this with an #undef.
+
+Bug: https://bugs.gentoo.org/789336
+Bug: https://bugs.astron.com/view.php?id=473
+Signed-off-by: Mike Gilbert <floppym@gentoo.org>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: N/A under discussion
+---
+ src/seccomp.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/seccomp.c b/src/seccomp.c
+index 5a39ee45..d2a1139a 100644
+--- a/src/seccomp.c
++++ b/src/seccomp.c
+@@ -205,6 +205,7 @@ enable_sandbox_full(void)
+ #endif
+  	ALLOW_RULE(fstat64);
+ #ifdef __NR_fstatat64
++#undef fstatat64
+ 	ALLOW_RULE(fstatat64);
+ #endif
+ 	ALLOW_RULE(futex);
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
