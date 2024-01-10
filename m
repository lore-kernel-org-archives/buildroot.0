Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DADC47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E544436D7;
	Wed, 10 Jan 2024 20:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E544436D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dRQwkClYgbCx; Wed, 10 Jan 2024 20:52:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7CE4436E5;
	Wed, 10 Jan 2024 20:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7CE4436E5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 52AB51BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0950542276
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0950542276
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id txFwAECWk1Wr for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:52:05 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 074104226E
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:52:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 074104226E
Received: by mail.gandi.net (Postfix) with ESMTPA id 1AA68240005;
 Wed, 10 Jan 2024 20:52:02 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Wed, 10 Jan 2024 21:51:53 +0100
Message-ID: <20240110205154.4091988-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704919922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=FoWCcUShrskbifgh1747PN7B5FlENjdiODZupDE5HaY=;
 b=LdlIUpi5weeM216EM++AsQKM0KnSKUGodULtZY8yFEb1vmwkMfpWNtnpIzsIcT1K46qV23
 HxBFqWLOqbLcXxwrGfor3Vy7BHvjX9kYE6h5tPWcj/zM6YoFpR7SI6ddnPZDgkFyxsoxlF
 qSQHHlhgwVW0O7ond0GWHfiRHaNr+GUjgl2QCGDPm3vva+X2A29dy6gPvbXc7CykCOtTzg
 OGVxKycm3UMjp5+Abk2dwe2kM2LhQuYLf/CQ6kRaBtXy9FkpJKyTuRV98zV0yfH9WBMqAB
 vuPwwYV9sUesxIoRCv0mrTxRWnb944yr8JGFEWV/X+IqN6RSdoWSFeyYaZGVJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LdlIUpi5
Subject: [Buildroot] [PATCH] package/pipewire: fix webrtc-audio-processing
 condition
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The condition checking whether the webrtc-audio-processing package is
enabled, added in commit
3ccd3b4c384e98703841b12f7309362957f8f17d ("package/pipewire: bump to
version 0.3.32") is obviously incorrect, and can never be true.

Fix the condition to use the correct variable instead.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pipewire/pipewire.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 628c69ff8a..f0f3cd847c 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -225,7 +225,7 @@ else
 PIPEWIRE_CONF_OPTS += -Dcompress-offload=disabled
 endif
 
-ifeq ($(WEBRTC_AUDIO_PROCESSING),y)
+ifeq ($(BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING),y)
 PIPEWIRE_CONF_OPTS += -Decho-cancel-webrtc=enabled
 PIPEWIRE_DEPENDENCIES += webrtc-audio-processing
 else
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
