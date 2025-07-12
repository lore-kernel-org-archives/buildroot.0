Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDC9C83F21
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 10:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5058780ED7;
	Sat, 12 Jul 2025 10:40:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id It72Q_s-KyGK; Sat, 12 Jul 2025 10:40:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80E1B80EC9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80E1B80EC9;
	Sat, 12 Jul 2025 10:40:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 28B451CC
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 10:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EC4A4031F
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 10:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F6deSKINcfnd for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 10:40:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D48F040242
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D48F040242
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 10:40:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4E7A86328; Sat, 12 Jul 2025 10:40:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Jul 2025 12:40:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b999bdf1853d44dc57fd48198b82275c720ca38
X-Git-Newrev: 9431681402ed5a878d4072832ba1ecb07dc5c39c
X-Patchwork-Hint: ignore
Message-Id: <20250712104052.C4E7A86328@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/loongarch: Fix minimal GCC version
 for target arch options
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9431681402ed5a878d4072832ba1ecb07dc5c39c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by Thomas in [1], autobuilders reported host-gcc-initial
failures at configure time, with message:

    Unknown arch in --with-arch=la64v1.0

Both la64v1.0 and la64v1.1 requires GCC 14 as minimum, introduced in
upstream commit [2].

[1] https://lore.kernel.org/buildroot/20250709225522.0a12e583@windsurf/
[2] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=b4ebdd153b2b068082b452772095260b03b78cc2

Fixes: https://autobuild.buildroot.org/results/04a904f08d6e0aacbd308692c99e77a334d72b95/
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
[Julien:
 - add links to mailing list and upstream commit
 - remove unrelated comment change to previous commit
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 arch/Config.in.loongarch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in.loongarch b/arch/Config.in.loongarch
index 1f302364b1..fa1b13bc52 100644
--- a/arch/Config.in.loongarch
+++ b/arch/Config.in.loongarch
@@ -13,14 +13,14 @@ config BR2_loongarch64_generic
 config BR2_loongarch64_v1_0
 	bool "LoongArch64 ISA version 1.0"
 	depends on BR2_ARCH_IS_64
-	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	help
 	  LoongArch64 ISA version 1.0 processor.
 
 config BR2_loongarch64_v1_1
 	bool "LoongArch64 ISA version 1.1"
 	depends on BR2_ARCH_IS_64
-	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	help
 	  LoongArch64 ISA version 1.1 processor.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
