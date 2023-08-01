Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC03C0015E
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 17:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E99440C07;
	Tue,  1 Aug 2023 17:10:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E99440C07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KaZWU5NOU2OO; Tue,  1 Aug 2023 17:10:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D61740A92;
	Tue,  1 Aug 2023 17:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D61740A92
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1959F1BF964
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 17:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 006DB81F03
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 17:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 006DB81F03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JeEC5MAHnUyM for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 17:10:18 +0000 (UTC)
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2343B81E63
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 17:10:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2343B81E63
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
 by mail.xes-mad.com (Postfix) with ESMTP id 844B12013A;
 Tue,  1 Aug 2023 12:10:16 -0500 (CDT)
From: Vincent Fazio <vfazio@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  1 Aug 2023 12:10:12 -0500
Message-Id: <20230801171012.1652426-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731224703.2923-1-vfazio@gmail.com>
References: <20230731224703.2923-1-vfazio@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] arch/Config.in.x86: consolidate Geode
 CPU targets
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
Cc: Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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

[0]: https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/i386/geode.md;;hb=HEAD
[1]: https://en.wikipedia.org/wiki/MediaGX#MediaGXm
[2]: https://en.wikipedia.org/wiki/Geode_%28processor%29
[3]: https://wiki.laptop.org/go/Hardware_specification

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
Changes v1 -> v2:
  - Reword the commit message
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
