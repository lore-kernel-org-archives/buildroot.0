Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0670FCD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D017181E53;
	Fri,  5 Jun 2026 12:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wsEblXtgrJ-E; Fri,  5 Jun 2026 12:38:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D707A81F0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663106;
	bh=qxndjUAwu+CUUJ3VEbrUkVno7rvGjv5Lk4IXMjVpWNI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kUcQrTc9ISzdqbiPt/0ZBlGj/SIQSsnL5uqDFk6fhy2VWYqs0M6a+yau2pWKgvHs8
	 ktgylm3a8bg0Fk59zvUFBR8r4OheJf86Jdr/ghGeq81xsu+VebUN/LiWegshpxuOjD
	 g//88+h7mOEHp1eSmAnV8lqIiD34yGKmjIc32cV8mP3I1ZbsbW6KST+8J4i589+4LC
	 fYHViljjH7uW2LjAylLzZa60Zw+yF+dgcV7qQACgx69HnzvG+zBn3S/PUDuo5qH3+T
	 7ZfLaO9eZyKaMfgOypEdxLMlNK0+0BLj/+3Plnfw4zcmCRm2qUGb+UIbiqEf6bHI/B
	 gcv5cDNwrmQ6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D707A81F0F;
	Fri,  5 Jun 2026 12:38:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E831F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7D2781EAD
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eQUbEA2_sgjD for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D911C81E9A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D911C81E9A
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0FB6487B3A; Fri,  5 Jun 2026 12:37:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:02:46 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ea564408cdd74fdd4c17d3429672cc30d65e0132
X-Git-Newrev: b7e60b2db258a31a47d8f35505a0fa445bad87c2
X-Patchwork-Hint: ignore
Message-Id: <20260605123713.0FB6487B3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/jemalloc: needs
 MMU
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b7e60b2db258a31a47d8f35505a0fa445bad87c2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
(cherry picked from commit 31e1088bbaa873db28323b1e122fdb83148cc299)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
