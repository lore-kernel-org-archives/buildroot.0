Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED78EC00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 20:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C6C2606E7;
	Tue, 26 Jul 2022 20:16:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C6C2606E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PSQ_Nj4XXJmT; Tue, 26 Jul 2022 20:16:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98665606A9;
	Tue, 26 Jul 2022 20:16:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98665606A9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6CBD81BF3EF
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4590D408E5
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:16:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4590D408E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rHaf_CAnUmsB for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 20:16:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F1A5408E4
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F1A5408E4
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 20:16:51 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id l22so52379wrz.7
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 13:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GWvQY4w2z5wSj2h1INyUz+9T6KiYPx8H7wK8MiLUseM=;
 b=RUsnpdqrqMdNrwptA8zVXObW4Ij/+5fuAHypPM49E/sVOISjF7m8e9Tl8xd2zjncNM
 nIDLA31uuBlNcVEGETySZWNFP4ECbfgbPAHaFN9nbhSBo+plhD6xL8hxB+aIqDTut6d1
 5gI5X8xUlth1jjWJajq7osgK13GhkwnluXN8IYLi3N/TwY233sB+RXIb+/0u8cv6hCuc
 nERHAix3Jv+FcHkdKml/0Oahf6R6BBqLT0Lg0XZXyx4CM7x1Xcv5u43TGO563FwF/Hwf
 rycWHqXnERpMy05x2Ea30QgAE5sxjBVnjURtJkHekd288uMedfaaITQSduLmqilpEkg4
 nVFQ==
X-Gm-Message-State: AJIora+P+p1cw2TvhNBjjk1j1lBoBifp7Z30+SP2I3BddOUpGrAAMi0Z
 pRozcY9nOVICBaTYHKKhHM+nLXf+cw8=
X-Google-Smtp-Source: AGRyM1vkSRsKPoNFs8B/Qy0h5T2BBlTWtffgDB//gY/swBIvPWUjxx9v/CeAlYriJ4Gv8Fdmr58M5g==
X-Received: by 2002:adf:d1c4:0:b0:21e:8df7:76d8 with SMTP id
 b4-20020adfd1c4000000b0021e8df776d8mr6327985wrd.586.1658866610004; 
 Tue, 26 Jul 2022 13:16:50 -0700 (PDT)
Received: from kali.home (2a01cb0680639d806be2c385179f3c58.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8063:9d80:6be2:c385:179f:3c58])
 by smtp.gmail.com with ESMTPSA id
 p21-20020a05600c205500b003a2eacc8179sm19505448wmg.27.2022.07.26.13.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 13:16:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 22:16:47 +0200
Message-Id: <20220726201647.216177-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GWvQY4w2z5wSj2h1INyUz+9T6KiYPx8H7wK8MiLUseM=;
 b=JHsgLLBR2wB3Kk8zbG3bCLLEoGxZx70NdBuw+8FUZXP++Qr9v81CkfVbuo8bT4h/Bh
 /FGluGS10nFHO0nBfIB1KpINc47oPy9zU3UHDVqsli35ZGy432t+WZbWSaCPegIRcyre
 tW9UqohaUgcdXIyECKy7TT6GwAQmG2/WnWUt8zaKf7b82TVtmaKR0szl5sMIrI5PllTt
 QjLPXrHSVGGiXa4PLyx24H9TFH9ir+Jn19ahpTvc+75a/uIJhjiOMFI8xYbQzv+LNj5j
 iOkjkJH9Ux3CeaLBteQnSnpd6WXt3FknFnwFrXn4G/AmCeJ5/COZQ7wnM4D7R44hFHG2
 I4/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JHsgLLBR
Subject: [Buildroot] [PATCH 1/1] package/pulseaudio: alsa needs UCM
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

alsa needs UCM since bump to version 16.1 in commit
6f3131296484767f037d3535ab69f328e94351db to avoid the following build
failure:

In file included from ../src/modules/alsa/alsa-mixer.h:51,
                 from ../src/modules/alsa/alsa-ucm.c:51:
../src/modules/alsa/alsa-ucm.h:26:10: fatal error: alsa/use-case.h: No such file or directory
   26 | #include <alsa/use-case.h>
      |          ^~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/c651c03bc493ac721ad6517ace550237488ef8a8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pulseaudio/pulseaudio.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index b423057ab6..567540c225 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -105,8 +105,8 @@ else
 PULSEAUDIO_CONF_OPTS += -Dwebrtc-aec=disabled
 endif
 
-# pulseaudio alsa backend needs pcm/mixer apis
-ifeq ($(BR2_PACKAGE_ALSA_LIB_PCM)$(BR2_PACKAGE_ALSA_LIB_MIXER),yy)
+# pulseaudio alsa backend needs pcm/mixer/ucm apis
+ifeq ($(BR2_PACKAGE_ALSA_LIB_PCM)$(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_UCM),yyy)
 PULSEAUDIO_DEPENDENCIES += alsa-lib
 PULSEAUDIO_CONF_OPTS += -Dalsa=enabled
 else
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
