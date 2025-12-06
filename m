Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437DCD374BD
	for <buildroot@archiver.kernel.org>; Sat,  6 Dec 2025 06:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18D65408FC;
	Sat,  6 Dec 2025 06:37:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9mJNN_I9iqes; Sat,  6 Dec 2025 06:37:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BF5540923
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765003060;
	bh=RxG7fvrEZRiDHsYXg73nVyci1c7huFQ5spevZdBA9Zc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HHLuN3/mE4A0RxGab2U4rda3pBoVRLOT01NcXVBsOyVjoMmuKuh52sYuc6CoBx4tn
	 DfU5rOzgIR81/3BFd9GE6NprABk5EJEtmvQMBUIE7uLiA5Vyojym/aUL5eO1sVHBIN
	 muWbkru8Ck5oPJ9IQc9Xsh7+MiG3G4v0Y1Wqh8ei57qW5b8MiFCu65lybAqigu+yfS
	 kL4FEADNi3fbQ+SYKu4FsVQoOMKxGmvTkzE7frke7imbBcqXt0Zc/UvZ7ARWI96zim
	 tH9aVBU0uSAYmX0xLZrXjvyb+TBfd74e1tXfx5Et0zSImc+uRVRLJcW3JjHLWbs+2j
	 RcNm2OVZ4Vffg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BF5540923;
	Sat,  6 Dec 2025 06:37:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E250151
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 06:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F406A60727
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 06:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kDvKGOWZOUi1 for <buildroot@buildroot.org>;
 Sat,  6 Dec 2025 06:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 390AD607BB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 390AD607BB
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 06:37:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 277E986467; Sat,  6 Dec 2025 06:37:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 6 Dec 2025 07:34:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a65bbef5baaa04d9074264e56b76e002a8a39f4a
X-Git-Newrev: d4a998f0fa1fa42d89dbd19d10c6c2ee79d3e1ab
X-Patchwork-Hint: ignore
Message-Id: <20251206063737.277E986467@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibc: only supports ARC
 little-endian since glibc 2.41
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d4a998f0fa1fa42d89dbd19d10c6c2ee79d3e1ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since upstream commit
https://sourceware.org/git/?p=glibc.git;a=commit;h=4ff55d08df0e6f11cbd217f4dca4532bd7d9330d,
glibc no longer supports ARC big-endian, and the configure step fails
with:

checking for egrep -e... (cached) /bin/grep -E
checking for big endian... yes
configure: error: big-endian not supported
make: *** [package/pkg-generic.mk:263: /home/buildroot/instance-0/output-1/build/glibc-2.41-70-g1502c248d58cb99a203731707987a4342926e830/.stamp_configured] Error 1

This commit was first merged in glibc 2.41, so this issue is
applicable to both master (glibc 2.42) and 2025.02.x (glibc 2.41).

Fixes:

  https://autobuild.buildroot.net/results/87e4b84f3aee64d041c3b845cb003e6b90649ffb/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 9a4fe6f3db..b066616a01 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -21,7 +21,7 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	default y if BR2_sparc64
 	default y if BR2_x86_64
 	default y if BR2_microblaze
-	default y if BR2_arc && BR2_ARC_ATOMIC_EXT && !BR2_arc750d && !BR2_arc770d
+	default y if BR2_arcle && BR2_ARC_ATOMIC_EXT && !BR2_arc750d && !BR2_arc770d
 	depends on !BR2_POWERPC_CPU_HAS_SPE
 	# glibc needs atomic instructions, and does not support
 	# single-precision floating point ABIs (ilp32f and lp64f)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
