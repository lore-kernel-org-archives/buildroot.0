Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568C8C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 15:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1657F83F98;
	Thu, 17 Feb 2022 15:56:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GlFC-hRID3jN; Thu, 17 Feb 2022 15:56:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 442A483F7E;
	Thu, 17 Feb 2022 15:56:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC8E31BF2B9
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 15:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8B856F66E
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 15:56:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=othermo.de
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bamiSW6ThMoj for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 15:56:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout-b-105.mailbox.org (mout-b-105.mailbox.org [195.10.208.50])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC1D661C39
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 15:56:01 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-105.mailbox.org (Postfix) with ESMTPS id 4JzzvJ6wK8z9snc;
 Thu, 17 Feb 2022 16:55:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=othermo.de; s=MBO0001; 
 t=1645113354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1SjCoc0G8elNYBEat6ZyGi9WNplJE5a/WWCumdU/QSs=;
 b=socIa4DblB/1NRZbp00+fAbGiiLpEXE+eJI30PGWdgphXMRTRhaSGQELj9FxXksU07yn2x
 9VRoIkgHCqJd4kdH7ke9rd2FcNdhlzWv3j6udF+/njU2fkpXC103QB4Pg0Zh8oDKQpVQ6x
 z/a5w20+G8wy62k4fGNB9Oj3EdJ12wEmWdWHg0QzOrtFhgHAT1+cX3Vldms1qACN+F5HQS
 wO7CLgMC9UiP6GKvznjJ53URz5qqyqHThsxUNz57j4MVJiVY0OaGjxjGCnoAFNtN0oZbAC
 lPuT81WjZVUkaSHFzrxvRj+n3C1fWm+7l2B+KPhG0MOLpCmznHTSMGPFwHGbHw==
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 16:55:48 +0100
Message-Id: <20220217155549.1084829-2-marcus.hoffmann@othermo.de>
In-Reply-To: <20220217155549.1084829-1-marcus.hoffmann@othermo.de>
References: <20220217155549.1084829-1-marcus.hoffmann@othermo.de>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/2]
 configs/friendlyarm_nanopi_r2s_defconfig: uboot needs openssl
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following compile error:

In file included from include/bootm.h:10,
                 from tools/image-host.c:12:
include/image.h:1178:12: fatal error: openssl/evp.h: No such file or directory
 1178 | #  include <openssl/evp.h>
      |            ^~~~~~~~~~~~~~~
compilation terminated.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/2103784200

Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
---
 configs/friendlyarm_nanopi_r2s_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/friendlyarm_nanopi_r2s_defconfig b/configs/friendlyarm_nanopi_r2s_defconfig
index 818c847f4b..ce252a5d76 100644
--- a/configs/friendlyarm_nanopi_r2s_defconfig
+++ b/configs/friendlyarm_nanopi_r2s_defconfig
@@ -30,6 +30,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi-r2s-rk3328"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
