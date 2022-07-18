Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11523C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 21:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A077261030;
	Mon, 18 Jul 2022 21:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A077261030
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ewAlffB3RdOI; Mon, 18 Jul 2022 21:52:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8AA760F6B;
	Mon, 18 Jul 2022 21:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8AA760F6B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E9941BF3C1
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 21:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4659B4035D
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 21:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4659B4035D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pLcSUI3thivl for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 21:52:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CED0940241
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CED0940241
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 21:52:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 0F1BB1C0003;
 Mon, 18 Jul 2022 21:51:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 18 Jul 2022 23:51:57 +0200
Message-Id: <20220718215158.2167845-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658181120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=VSdxUMQBw2J6DNNj4JGP6g2Xqi9D/Jxet/DDoR+tt3g=;
 b=ZKOfpQt5fNpy/VXVhFx2X3XomIjd98fLrlWeHDGfIGRoS3pk2TQn8SGxhdcieShqgz7E0J
 NAIALAlkpDLbWOs6JCAHwyvHbAElAsRBGddB3Q15Ph5/6YaEp5Ja1o8X4ySe4KUANCKEjg
 aNaZA/KK2dYs4PIgRQXR5Kcja0LHtBzbrmxox5IyEUERZ/7eHkKDXH/0/l3Fp6NdStbRQD
 Cwg+1+65rYxOKKhjNt5eAkTaR1RggUJ0H8FcOBzKk2S3nl46qSVTVhZWtO961bA6JrgPxF
 tJHdNWN2treSow9BCayXQlMRuP0dAJfk+myVeWifFq7EMYe/Y0uUDOf23G41Dw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZKOfpQt5
Subject: [Buildroot] [PATCH] package/sudo: fix SUDO_ENABLE_SUDO_GROUP_RULE
 following version bump
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
Cc: Matthias Hardt <mhardt@berlinux-solutions.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the version bump of sudo to v1.9.11p2 in commit 9b7f8da96b, the
sed magic in SUDO_ENABLE_SUDO_GROUP_RULE no longer does its job, due
to a slight change in the example sudoers file provided by upstream
sudo.

This commit fixes the regexp to match the new sudoers file.

Fixes bug #14891 (https://bugs.busybox.net/show_bug.cgi?id=14891)

Reported-by: Matthias Hardt <mhardt@berlinux-solutions.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sudo/sudo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 2b9ba76a51..4f9fdb4b2c 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -80,7 +80,7 @@ define SUDO_USERS
 endef
 
 define SUDO_ENABLE_SUDO_GROUP_RULE
-	$(SED) '/^# \%sudo\tALL=(ALL) ALL/s/^# //' $(TARGET_DIR)/etc/sudoers
+	$(SED) '/^# \%sudo\tALL=(ALL:ALL) ALL/s/^# //' $(TARGET_DIR)/etc/sudoers
 endef
 SUDO_POST_INSTALL_TARGET_HOOKS += SUDO_ENABLE_SUDO_GROUP_RULE
 
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
