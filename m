Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7197CD6E53
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 10:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1A73852DE;
	Sat, 30 May 2026 10:44:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X_xNf9nexUIe; Sat, 30 May 2026 10:43:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFD30852D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780137839;
	bh=PVfzELZn5br7D1rFrRs5TH8f0METqzi584eWKtIpiG0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Czj2Ic8n87fY32DTY+QaLkjqqWw0JMCn9f+AsdHElMJr3jmAZ61HlobwhkPv+IDMc
	 hpvLZ610Wz2UU/MSoMexdTqXuIUvOc/Mhm/5e/gz8XdYLGPvkM4lOg4964x/N706+r
	 FjMLLcvBviA3+1e+TQcWx6TycjCbxDyTl5PwIfNSpycMo0H0mVBn1XLq2nnSmxP4d9
	 zoVI4T+/A3GLjwkIIP+ZHsQZDtMvTpEEq/XSuCpNCb8HRezJD4BM2AktL3H4C67Hna
	 Ht/cNTrM7Ry8imlsxMaZyNWKj2tGlcuijlDrZeOi6/dPioNVRG/E2l1/ep0IX/JdAf
	 8dNNSMVejBNTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFD30852D9;
	Sat, 30 May 2026 10:43:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 737D112F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70C0C429D9
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z85MRRvZYs_1 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 10:43:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDDA0429B4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDDA0429B4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:43:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE8978749B; Sat, 30 May 2026 10:43:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 12:43:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b15fa64e6b75f75191c845aea43c349e0080986
X-Git-Newrev: 31e1088bbaa873db28323b1e122fdb83148cc299
X-Patchwork-Hint: ignore
Message-Id: <20260530104344.CE8978749B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jemalloc: needs MMU
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/31e1088bbaa873db28323b1e122fdb83148cc299
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

src/pages.c:79:33: error: 'MADV_DONTNEED' undeclared (first use in this
 function)
   79 |         if (madvise(addr, size, MADV_DONTNEED) == 0) {

The oldest build error found in the autobuilder logs dates back to 2024:
https://autobuild.buildroot.net/results/adf/adf52f767c92ab1db7b817094a3929f3cf918e82/
so a backport to LTS branches should be considered.

Fixes:
https://autobuild.buildroot.net/results/d6a/d6a9f7ff9d29eee9d9280364f872ffaa1544f192/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/jemalloc/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/jemalloc/Config.in b/package/jemalloc/Config.in
index a128b8b376..ace3dccd1e 100644
--- a/package/jemalloc/Config.in
+++ b/package/jemalloc/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_JEMALLOC
 	bool "jemalloc"
 	depends on BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # madvise()
 	help
 	  This library providing a malloc(3) implementation that
 	  emphasizes fragmentation avoidance and scalable concurrency
@@ -25,4 +26,5 @@ config BR2_PACKAGE_JEMALLOC
 
 comment "jemalloc needs a toolchain w/ threads"
 	depends on BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
