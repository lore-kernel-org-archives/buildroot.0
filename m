Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D8EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Jul 2022 21:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43C8C408FB;
	Sun, 10 Jul 2022 21:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43C8C408FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4rCeOWUHaInO; Sun, 10 Jul 2022 21:18:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 585F840915;
	Sun, 10 Jul 2022 21:18:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 585F840915
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5186D1BF3F6
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 21:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C0B360E5A
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 21:18:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C0B360E5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ed5IvZkV2oXR for <buildroot@lists.busybox.net>;
 Sun, 10 Jul 2022 21:18:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3407E6080B
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3407E6080B
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 21:18:06 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id n10so4759564wrc.4
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 14:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+QjUBpv4Yc0ZuUtCYSeTGPghAfwp4NEiIiP7OcT6254=;
 b=riGfVZKH9OgmbaicEMS81xrWtq5IBec4YX3wbmTo6pSOuA75IM81XQEzlZQRLeAHWr
 7YiIgXKB55HVcd8jB6oe9dhm4AJnkIr61QYPbbwnvIiKZa2NrV+CYfpxJbzs+wFzCayI
 i4KTw0v0n35IDUqK5NYrcLEzhKCD3uyOb8KcRM8dQ5Kp/kaqjC3VlTjantLUTC8A5vnl
 ELv53b8wlEpKh48qfSdqlM32gJr/G1cuscrhk1u/8M5ZjFUZILJ3gDVKq5/4ci2LlIQJ
 cAzLhtAmh1cSzVXn5T9YqsuKG7LOxSMts42MkSUaiiyFec6W5OrhpcGWujvvTx3SbBB3
 uuYQ==
X-Gm-Message-State: AJIora/X43cqMwDY1JZ/dLHzsHg4U9SvbqT1KlOWilAzHDAdeDa5w6+b
 EsRWWyfjeri9SjK0vSzcFwC6FKqw5iY=
X-Google-Smtp-Source: AGRyM1skeHMclhKRPW0/sznstRYWTTQ3W14pc6/KL7508XvypjK8iuy0g3G8VqKVZp8jv4mlg2MytQ==
X-Received: by 2002:adf:f847:0:b0:21d:6c3b:ecbf with SMTP id
 d7-20020adff847000000b0021d6c3becbfmr13714820wrq.423.1657487883853; 
 Sun, 10 Jul 2022 14:18:03 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1cf404000000b003a02f957245sm8168090wma.26.2022.07.10.14.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 14:18:03 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Jul 2022 23:15:03 +0200
Message-Id: <20220710211503.851359-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+QjUBpv4Yc0ZuUtCYSeTGPghAfwp4NEiIiP7OcT6254=;
 b=hk8v4susmcwoBrJyO1MOkQS4aq4Epn/m6CouYpTpg2ORm2w47T8Whnw+g3l0An0gK4
 tc0TNfYQgXY1crxGtb1Sh/uFapFlJWatZJGS14i/fMmetV6eFNUWCCw4/d6pB4mZUpvm
 IDESLDzsv0BT9PGSTDLWmamn34Jy7bZEH5IqvPb1tj4BS3G1CDYpY+S5AGfi1j/Pj7yv
 nsiHObbXT8ZbFTJYAXRx4TbJEMs7m4ADMrjcDrKH4ks+yi3Gsv9b40KL/0w3TiBTDToO
 TRMjdCVjrEAxdz0DbbYia4VGu81nyczbuBVbEWSAwti4iN9wn4RVHPZnRl/kflPFm/er
 mlNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hk8v4sus
Subject: [Buildroot] [PATCH 1/1] package/mutt: bump to version 2.2.6
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a bug-fix release, fixing a variety of small issues.

https://gitlab.com/muttmua/mutt/-/blob/mutt-2-2-6-rel/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index 1f6082ee35..0bec59def4 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ff8b781159794adcca126b551d5e419174b7b38a582a159bfe4e13451a757e47  mutt-2.2.5.tar.gz
+sha256  ffa2d93517cfc606fe01daffc5f12e42062a1c134d3b9af78484ebc5430888d3  mutt-2.2.6.tar.gz
 sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 2c6b087b92..5b1119c79b 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 2.2.5
+MUTT_VERSION = 2.2.6
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
