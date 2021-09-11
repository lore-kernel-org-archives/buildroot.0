Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBBF9C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 08:42:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C90B60FE6
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 08:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C90B60FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD0E760675;
	Sat, 11 Sep 2021 08:42:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OdWl8qxgQFbs; Sat, 11 Sep 2021 08:42:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FA9C60654;
	Sat, 11 Sep 2021 08:42:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 654FB1BF3C2
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 08:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54C8284AE3
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 08:42:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ANI5m8n9kBoa for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 08:42:47 +0000 (UTC)
X-Greylist: delayed 00:05:04 by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6E9A84AE2
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 08:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631349764;
 bh=BytOZUO4y2KEq2x9s4f5WdD1O3wy+ylPiqjZUbjepsU=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=PiL2FcGcxA2gsxWVi2fSlYJEQj6S2bSAt5TPwOPggunLda1z7YG8qYtsnu3BrWfu3
 H+PMjb/rmekwE2x4WZ42gV2NC9Deu6NDiQWJ0hKdvQPK8eUBZpGMi8YNWLSGCy/tLH
 z78uNDMMOc7/cipdgqNkWX7iffR2Zb5+Phps+2Mc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from NCC-5001D.lan ([83.130.82.162]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MWigq-1mR52I2l3I-00X175 for
 <buildroot@buildroot.org>; Sat, 11 Sep 2021 10:37:38 +0200
From: Dagg Stompler <daggs@gmx.com>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 11:37:37 +0300
Message-Id: <20210911083737.9073-1-daggs@gmx.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:wpM4d50MQZKasJZFekRsLCS9OuzX/ZtcF7FDQ3KCqJmNoH2waHR
 vlm3xebZR/IaEErBnBqZbbRe4yEPhMEOKnC3FPomjT8vTExz/frw1CTxEKXnUdyQs8hkbj9
 MY4SFqUi1vWgOWzqOCiv2fBCK7JI3iXecZkwtiFEWfeB8nZOkzfYOvq82GcHiH48tZ7D138
 6Z/6bi4bJdDwmSTwri18Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:u75EPY7iSh8=:TBvetsGP8KJ9o/UqCtauVJ
 ItYpghylZ8RYOQX3AG6r+8JpGa03Lk13yw+Fzdq33F/mRRxHubigbVKNidZgBv0Vh8jkiMKcZ
 Cw8yyVC8KkJ+5Sd+QiQVR2wXNQ/SSsiLCXD5bpVbhA5N9TPkMZRKrfTPDx8lBTJC0YOfntCDt
 M+MieapUCFmruVka5xgHlI9O+1jZ7V4/jXSbzu3XH4FA7fegeU2iLMd5pqHDUDw1/Xv8ckGB+
 yA9HeaEzSABGCJDnXk0mJPKerjuVLSz2XpdKsBpwhU11aWRG4TxXzZmRsd/qFiCCrXuMebkPk
 opHj2ndB2u0xIAKZJ1EVsYDkZr/nHCVFI3FueIcHDXCb9eOyf+qiqaEne48jhLDFVyVMOkNLR
 Fa+aqyKO8Jq/dfgP6sXs+hYLIzTTaQTwtkPlNWoTH2UYcpxwVG8s5e1bA64dT9pmrVY2SHqlk
 VAuDibauhHFTrntJeKSwh6I3WccSe5VgknO2t+SWXOnRvWDCvg2PJUxJA+onQ3k4up+TXsMYn
 cCCu0c3hC3VzkXk5wEWAwxczD0dJ295+DLGdBAFWhSLx7shC/5jHqdhbzUx3w/uIS3Nh5sqgQ
 2DTso78avpJM+YL1gAtJ8htHLSDi2CnNPtT+T7WHf7+Aya+lV5KhX5nCJDaLz/Rh0EhYLlTV+
 qXpmBjIGQRx87PWZbWK7dc3LCRFoxaFssQpraw9qkAsaZOPTJ8tZwPp93iUqeUgUM+iXCQS4N
 IqeP9dw2D0X9qaG6QaT5TbfUQ+Egr7nBYOsrtQ8IlPRn17N2d321ttaw8lNBBVGZJSJN7/bg5
 AI0zmR/ZDI004cluKu/i/rFJcnlx1utpKyBuXs1Ejou3uXXEQuuIsqf7GxSjEnfdiZCVYoTFT
 pJoL+sy/OOSLurTu4mm8jXdI7+v7vgaaDNnZUy1X36MkFEKujiwOzKgJef+kxt4Op8BMmN3et
 yCOxJiXT/mG/2aWf/DSFLjjlceBsJnkjGq58zRPQYDyVnGmCdD4DZjMTAvKEx5s7DG8jsbRPc
 G/tFmO2czyFSFPb4og9nrE3E6KcSrcF8BiTI6fn5bnqC8mQXkY3JuPCyTPN5NoeAJT5ggykuj
 76GbqBzzQv8g3U=
Subject: [Buildroot] [PATCH] configs/ordeidc2: increase image size to 256M
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

following Commit 9f127cc4, the resulting image is bigger than possible.
so BR2_TARGET_ROOTFS_EXT2_SIZE set to 256M is required.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071376

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 configs/odroidc2_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
index 5f97fc3dd8..daa818e036 100644
--- a/configs/odroidc2_defconfig
+++ b/configs/odroidc2_defconfig
@@ -10,6 +10,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAML0"
 BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
 BR2_ROOTFS_OVERLAY="board/hardkernel/odroidc2/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/hardkernel/odroidc2/post-image.sh"

--
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
