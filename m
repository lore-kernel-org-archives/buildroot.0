Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0B0C9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B86514119A;
	Thu, 24 Sep 2026 18:59:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O66b30R3j-bB; Thu, 24 Sep 2026 18:59:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2B02941185
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276369;
	b=pDVdEnO1rbfShRoyTT8r8Yrl80/OrpIBIt8LDLoedDxA+lja81N59l0NwOYO3ZCNzsaD
	 3vybKeNKf+RHGtDSuXz5uQNQFhbKGEtg9F5ySsgnzDa5NVo49PY3bgV28BZVttWCbPVNH
	 4zeIyzxI35h8uAB5dYSkmTKa5YOsMDdQNFD/HEzlzf3dbJfP9ygonF2EDv/YDs8pgMHAR
	 eYVqNk+GHY6jGY3iDudjRlayTwiaTX1ou5Mh+rXtLEKfUrdHQh2V9pkCrOfVKyKsFgC+v
	 /0mYNgEW2hgrhV8rWqc34RKLbLxqbd10iezJ4Iwc4lNDWm74d2RI9cJTbQcoCya6N3w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276369;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=UseMGP5OmbwdaRH7hEgMoodRMK83fFcQKR4JLez1Mt4=;
	b=rPQ5HwBzuEg149EP25j1Mb5k5PkbQX/0djNJkJjrA8eX18uWriH7CxM5RRzaSoRPTmaN
	 Nn3CAe6zO96qGVwqgYzA+D7SuJH5iwXBS+etLubv9NVLjGxLQMUuxqFlr4uMLCrthroOP
	 kZVy17WUB3PgtzCfS22nSuyt4ZpLXEz1hLoIy27/qUYV7KHc9VtmyN78+b+bl+Q3h6+QU
	 HixCt+HNBh9cTnc0qjrixX8bvvJkYsvY5D9VfSPFW04WSVbnSV9GmkGqNiSPOReAAu3Xa
	 B8JWBN0pnTXdsKf3znkcJFVWrSIBz5jgNsFFfV9B88unfTxir1b+L1w1q1sRIEA/EsQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276369;
	bh=UseMGP5OmbwdaRH7hEgMoodRMK83fFcQKR4JLez1Mt4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NtYPDNe3wtHcAQCeOzPz6qN/Ih8upM/48MSv+GZK38cdQTVakPgJFx3MSrUrL3ovh
	 Aw6a8CGfYsFy6f49mc26pcQcVBZYzkY/8QE29kyDUCfiyoz4Vx7LSnCkAv68gq5E7J
	 mM3A2r+HVQUytpV/GBkWktRyibvJvm8J39WZtAr3Ih7YFlStWwuJ2HLAu+S8vK74KJ
	 jQMaU1v6Y3zvpHO/GF3B+5JbMM5TuUURaplYvBFaQjqlzpcLYo2/f0vODQhbxDICIz
	 Bp3VQqb1sirNtfR+/fy8GlydvwLYvoqOfzUMQwtpl4RoKrEMZGbv6SXdy+d2AAMyEn
	 HUKuVz7TKCFOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B02941185;
	Thu, 24 Sep 2026 18:59:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 28B2A417
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1221981257
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DdkXQ5pVSoPS for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D85B081069
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276212;
 b=ABfyxUIW1NkK3Wp+WuNT86Kb80N92fkI/Ounm5G4Gb657Z2AFd4KJ3enhqzGidsGeMaw
 RojWpzzOnp7tFmY5OJSTX7oWA4XLllY4HVVvCkO8ASfbMk5lrryJ4IrSMw+J1NK4IUeTo
 1c+WmqWHxfIiSfFe8TrDZbqa1hhKf0FFv7dEOkJneCrsZKJHXVe+sTN+bGtpJqmQ2KW2y
 pfSD+75/2yZ7j5lPOMZcPCR7VZhHUvvYb7CBQCLoUWJ6NPnSnJJQ7ZmwfQAiERR4OTCIl
 4GUVkcHcCEERjR+uyogoSavfRpweXSiFhFRaRF0bUkcZHLgLrjPluDGusymSyHVXyVg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276212;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=sC7eIe2JQauYJJ4vJwuSZ0Vbcca+//FsErofnik+/Po=;
 b=gpE/GHTHYIlyvW6Gy1eHgUjNEvNzhGP68gw8dqfwPGO4D6v94D70pdjvXoLRzuP13xJC
 td9qF4y+uoATlaGl19qdNw6/9Ijg4jql3eDW3Kq9oemgzbf9PmRHK1qv7OU+V5YtojmWf
 t8fa/P41vd539cTeXW3qcGzA71PFxpGtYqt3jVwTwcN6c8dIrPqfVPu6II8whwyskRWUM
 1Fl5yj+p1nxZFXs8dUORmnpOSpbp8iowQLBUc7nhBq9X9J/XZLKdcEq6nesIDGqq84wML
 JpehhTfAa/6ji+nSmfFfjaG91n3JtH+DBQLl5d6ban6G+FjCFUy/D/cokVX+6xzEM7g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D85B081069
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BF3098323; Thu, 24 Sep 2026 18:55:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:20:06 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 672e27ec30a4cf4a911ec4fe8bf657eb37509b17
X-Git-Newrev: 266957f4ba809df677b82c3ea0a33222a0521dca
X-Patchwork-Hint: ignore
Message-Id: <20260924185542.7BF3098323@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/qemu: host-qemu
 does not support XOP capable CPUs
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7787347222814917510=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7787347222814917510==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/266957f4ba809df677b82c3ea0a33222a0521dca
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Commit 1f7efaf89f03 ("package/qemu: do not support x86_steamroller or
x86_core_avx2") excluded BR2_x86_steamroller from
BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS. This is still needed, but for a
different reason than AVX, and the exclusion is incomplete.

steamroller is bdver3, and what the Qemu TCG engine cannot emulate
there is not AVX, but the Bulldozer-specific XOP, FMA4, TBM and LWP
extensions. In Qemu 11.0.0 (the version we currently package) and
11.1.1, target/i386/cpu.c has:

  #define TCG_EXT3_FEATURES (CPUID_EXT3_LAHF_LM | CPUID_EXT3_SVM | \
            CPUID_EXT3_CR8LEG | CPUID_EXT3_ABM | CPUID_EXT3_SSE4A | \
            CPUID_EXT3_3DNOWPREFETCH | CPUID_EXT3_KERNEL_FEATURES | \
            CPUID_EXT3_CMP_LEG)

CPUID_EXT3_XOP, CPUID_EXT3_FMA4, CPUID_EXT3_TBM and CPUID_EXT3_LWP are
defined in target/i386/cpu.h, but are not part of that mask, i.e. TCG
does not implement them. Binaries using those instructions therefore
die with:

  qemu: uncaught target signal 4 (Illegal instruction) - core dumped

This affects the whole Bulldozer family, not only steamroller:
bulldozer (bdver1), piledriver (bdver2) and excavator (bdver4) are
equally unsupported, but were never excluded.

Use the newly introduced BR2_X86_CPU_HAS_XOP symbol, which covers all
four variants, instead of listing BR2_x86_steamroller alone. As for
AVX512, this disables gobject-introspection and nodejs, which are the
two packages needing host-qemu in user mode.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 22c0ec4fcfe58ff7a292f0a69e3357923f06b349)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/qemu/Config.in.host | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 48979fd7ce..fbc989b003 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -22,10 +22,11 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_sparc64
 	default y if BR2_xtensa
 	default y if BR2_x86_64
-	depends on !BR2_x86_steamroller
-	# The Qemu TCG engine does not implement the AVX512
-	# instruction set, so binaries built for such CPUs cannot be
-	# emulated.
+	# The Qemu TCG engine implements neither the XOP instruction set
+	# nor the other Bulldozer-specific extensions (FMA4, TBM, LWP),
+	# and it does not implement the AVX512 instruction set either,
+	# so binaries built for such CPUs cannot be emulated.
+	depends on !BR2_X86_CPU_HAS_XOP
 	depends on !BR2_X86_CPU_HAS_AVX512
 	depends on !BR2_powerpc_620 && !BR2_powerpc_630
 

--===============7787347222814917510==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7787347222814917510==--
