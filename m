Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834F5C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 09:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17DD44175E;
	Sun, 25 Sep 2022 09:09:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17DD44175E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dAlhZ62jeGg4; Sun, 25 Sep 2022 09:09:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED94E41756;
	Sun, 25 Sep 2022 09:09:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED94E41756
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4EC4B1BF97E
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 09:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A78360AEA
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 09:09:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A78360AEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5FfXgqdQumJL for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 09:09:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 987E060784
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 987E060784
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 09:09:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 202171BF203;
 Sun, 25 Sep 2022 09:09:23 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Sun, 25 Sep 2022 11:09:16 +0200
Message-Id: <20220925090920.1585682-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220925090920.1585682-1-thomas.petazzoni@bootlin.com>
References: <20220925090920.1585682-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664096964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fTPQw224c/0ePxPoHkABCZNbkRsXgP6aNwKET1LE6z8=;
 b=IBzugW/2UGt5dP6XM1I5op8V8SDBstp0Gg2nvTyFvWH5M9lUij3xpozYmkmcSVo8X5ldEe
 5VE3G50TKzPsVPNwkTPxS//8rF8mL4Kc4fgfhcorsu1+8bpQWFjCCjM/E3RkAYGm/YjKxO
 LurHTXv9T0B1Vau5MkUt4fvqVSzpt8r+wbpNKidNvvgbZhmBCs+L/NoGc9ihQK7Y3GuiQG
 fv/nsgsLe0e7YPg1WCMAHC2sM3qcZfrcT8k57FLjKjbqKaPThzfXKdNLEnMVxxpqpPv3bm
 mUWyRWoB9J3JWF5ehpFoV4xpDeHDSd1sML8H9CmX2rUbbT0rewIvoIafOvdmyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IBzugW/2
Subject: [Buildroot] [PATCH v2 1/5] arch/Config.in.xtensa: adjust endianness
 logic to avoid bogus configurations
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
Cc: Jonathan Ben Avraham <yba@tkos.co.il>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Xtensa architecture supports both LE and BE configurations. When
BR2_XTENSA_CUSTOM is chosen, a choice in menuconfig to choose between
LE and BE.

However, if using the internal toolchain backend, when the
BR2_XTENSA_OVERLAY_FILE is empty, in practice, the configuration will
always be big endian. But the choice being present, random
configuration testing ends up testing configurations where
BR2_XTENSA_OVERLAY_FILE is empty, but the endianness selected is LE,
which is incorrect.

This commit fixes this by preventing the selection of
BR2_XTENSA_BIG_ENDIAN when an internal toolchain is used with an empty
overlay file.

This commit will allow reverting
4cbf7336914f25478aea943456ba7dc3c892c21a ("arch/xtensa: custom
configuration requires an overlay") which broke the build for external
toolchains that use a custom Xtensa core.

Fixes (even though currently hidden by commit
4cbf7336914f25478aea943456ba7dc3c892c21a):

  http://autobuild.buildroot.net/results/702e2886156f291466375dfcf412c20f1aa5857d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.xtensa | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/Config.in.xtensa b/arch/Config.in.xtensa
index f9d5adb4c9..4bb58e1964 100644
--- a/arch/Config.in.xtensa
+++ b/arch/Config.in.xtensa
@@ -37,6 +37,10 @@ config BR2_XTENSA_LITTLE_ENDIAN
 
 config BR2_XTENSA_BIG_ENDIAN
 	bool "Big endian"
+	# Internal toolchains without an overlay file are always
+	# little-endian, so we prevent from selecting big endian in
+	# this case.
+	depends on BR2_XTENSA_OVERLAY_FILE != "" || BR2_TOOLCHAIN_EXTERNAL
 
 endchoice
 
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
