Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FFFC04A6A
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 21:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D910F60594;
	Tue,  1 Aug 2023 21:18:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D910F60594
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eJIS3KUCFQDg; Tue,  1 Aug 2023 21:18:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B7C46072A;
	Tue,  1 Aug 2023 21:18:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B7C46072A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B98F1BF860
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 326E581521
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:18:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 326E581521
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6CofPFxbJQjl for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 21:17:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 584EA80E2C
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 21:17:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 584EA80E2C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45CA484044; Tue,  1 Aug 2023 21:17:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Aug 2023 23:16:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0dcefa7ba983b313070d1f61b5603113b4f6762
X-Git-Newrev: 2bd0431bafc981ea6237b3abdd18ea22fb825f5f
X-Patchwork-Hint: ignore
Message-Id: <20230801211759.45CA484044@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in.x86: consolidate Geode CPU
 targets
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2bd0431bafc981ea6237b3abdd18ea22fb825f5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since its introduction in 7d8a59b40, the BR2_x86_geode CPU target has
pointed to GCC -march=geode which targets AMD Geode processors [0].

This arch tuning enables MMX and 3DNow! extensions in GCC but these are
not currently reflected in the selected flags by BR2_x86_geode.

This is likely due to the confusing naming and history of "Geode".

The AMD Geode can trace its origins back to the Cyrix MediaGXm [1] and
then to the NSC Geode GXm/GXLV/GX1/GX2 [2]. All of these processors have
MMX instruction support listed in their datasheets. The NSC GX2 was the
first in the series to enable 3DNow!.

When 7fed07d3a4a introduced BR2_X86_CPU_HAS_MMX, Geode was skipped
presumably because it wasn't clear that the target is AMD Geode and
because the Wikipedia documentation for Geode is incomplete [2] with
regards to supported instructions as they all support MMX.

When f6cd56b9ce3 introduced BR2_X86_CPU_HAS_3DNOW, Geode was skipped
presumably for similar reasons.

Note: the in-tree olpc_xo1_defconfig uses BR2_x86_geode which is fine
as this hardware uses the AMD Geode [3].

Make it more clear that the target is AMD Geode by renaming the Kconfig
menu option and add both MMX and 3DNow! flags to BR2_x86_geode.

This also means that BR2_x86_geode_mmx is no longer needed, and can be
removed. No legacy handling is needed since BR2_x86_geode_mmx has
never been part of any release.

[0]: https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/i386/geode.md;;hb=HEAD
[1]: https://en.wikipedia.org/wiki/MediaGX#MediaGXm
[2]: https://en.wikipedia.org/wiki/Geode_%28processor%29
[3]: https://wiki.laptop.org/go/Hardware_specification

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.x86 | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 86e148dee6..49823fe885 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -705,22 +705,10 @@ config BR2_x86_zen4
 	select BR2_X86_CPU_HAS_AVX512
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 config BR2_x86_geode
-	bool "geode (no mmx)"
-	depends on !BR2_x86_64
-	help
-	  For several variant of geode which have not MMX support.
-	  See https://en.wikipedia.org/wiki/Geode_%28processor%29 to
-	  determine if your particular Geode processor supports MMX or
-	  not.
-config BR2_x86_geode_mmx
-	bool "geode (with mmx)"
+	bool "AMD Geode"
 	depends on !BR2_x86_64
 	select BR2_X86_CPU_HAS_MMX
-	help
-	  For several variant of geode which have MMX support.
-	  See https://en.wikipedia.org/wiki/Geode_%28processor%29 to
-	  determine if your particular Geode processor supports MMX or
-	  not.
+	select BR2_X86_CPU_HAS_3DNOW
 config BR2_x86_c3
 	bool "Via/Cyrix C3 (Samuel/Ezra cores)"
 	depends on !BR2_x86_64
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
