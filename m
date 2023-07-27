Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84145EB64DD
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 20:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD069613CD;
	Thu, 27 Jul 2023 20:42:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD069613CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lQfeIFEnx-ws; Thu, 27 Jul 2023 20:42:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 180BF613C2;
	Thu, 27 Jul 2023 20:42:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 180BF613C2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 74D3C1BF3CE
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 20:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E19F613C2
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 20:42:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E19F613C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7_yMWXno-djr for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 20:42:05 +0000 (UTC)
X-Greylist: delayed 310 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 27 Jul 2023 20:42:05 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 733F9613BF
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 733F9613BF
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 20:42:05 +0000 (UTC)
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
 by mail.xes-mad.com (Postfix) with ESMTP id 5E7702037D;
 Thu, 27 Jul 2023 15:36:54 -0500 (CDT)
From: Vincent Fazio <vfazio@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 15:36:52 -0500
Message-Id: <20230727203652.975942-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] arch/Config.in.x86: drop AVX512 from
 alderlake
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

Alder Lake CPUs have AVX512 support disabled [0].

To prevent potential issues, remove the AVX512 support advertisement.

This puts Buildroot inline with the GCC options [1].

[0]: https://www.intel.com/content/www/us/en/support/articles/000089918/processors.html
[1]: https://gcc.gnu.org/onlinedocs/gcc/x86-Options.html

Fixes: e7b94130 ("arch/Config.in.x86: add sapphirerapids, alderlake, rocketlake")
Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 arch/Config.in.x86 | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 38e486eafd..8ddd1fa994 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -450,7 +450,6 @@ config BR2_x86_alderlake
 	select BR2_X86_CPU_HAS_SSE42
 	select BR2_X86_CPU_HAS_AVX
 	select BR2_X86_CPU_HAS_AVX2
-	select BR2_X86_CPU_HAS_AVX512
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
 config BR2_x86_rocketlake
 	bool "rocketlake"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
