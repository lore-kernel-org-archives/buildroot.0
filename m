Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FA6C83F10
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 10:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6139A60A6B;
	Sat, 12 Jul 2025 10:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kNmOXi-o_pfi; Sat, 12 Jul 2025 10:40:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A5806081B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A5806081B;
	Sat, 12 Jul 2025 10:40:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A22EB1CC
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 10:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F507607F7
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 10:40:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfiYUT6k6xGY for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 10:40:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3E4C6076A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3E4C6076A
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 10:40:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA62086327; Sat, 12 Jul 2025 10:40:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Jul 2025 12:40:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7a175355b73294281c675f1973ee5165f62a2a8
X-Git-Newrev: 8b999bdf1853d44dc57fd48198b82275c720ca38
X-Patchwork-Hint: ignore
Message-Id: <20250712104052.BA62086327@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/loongarch: Fix toolchain triple ABI
 suffix
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b999bdf1853d44dc57fd48198b82275c720ca38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LoongArch GCC infers ABI from triple suffix, thus it's necesessary
to set up proper triple ABI suffixes for different ABI types.
See [1].

Adjust ABI suffix as per Table 10. List of possible <fabi-suffix>
in "LoongArch Toolchain Conventions Version 1.00" [2].

[1] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config.gcc;h=a6f6efec4e103301225ef74c2d1159933d1c9cf8;hb=1757c320badc92c0628eafcd07d54585659692ed#l5102
[2] https://loongson.github.io/LoongArch-Documentation/LoongArch-toolchain-conventions-EN.html#_gnu_target_triplets_and_multiarch_specifiers

Link: https://lore.kernel.org/all/20250706105859.292908-1-ju.o@free.fr/
Suggested-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
[Julien:
 - add link to gcc sources infering ABI
 - update loongarch doc link to point to triplet section
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Makefile.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index 829636900b..5ebb5f9ba8 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -83,6 +83,14 @@ ABI := $(ABI)hf
 endif
 endif
 
+# LoongArch Float ABI suffixes
+ifeq ($(BR2_LOONGARCH_ABI_LP64F),y)
+ABI = f32
+endif
+ifeq ($(BR2_LOONGARCH_ABI_LP64S),y)
+ABI = sf
+endif
+
 # For FSL PowerPC there's SPE
 ifeq ($(BR2_POWERPC_CPU_HAS_SPE),y)
 ABI = spe
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
