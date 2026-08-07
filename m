Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6C3C2A09B
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 12:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B773812FC;
	Fri,  7 Aug 2026 12:55:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qSGPM77GTRlK; Fri,  7 Aug 2026 12:55:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C18B581300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786107318;
	bh=T1/a+nkcwE4cTka1Xxa8UFOC1ucU8GEscTzvURYm3F0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Dpy98QAmvAO0FhjvXvAL3BRTsD5z4L59+KGwYffBiaS7ow251FPVQEDsHYzrE+kpG
	 K7qB9ygdmToaBqqW5Llg+z8kNWdAxqZmh1+E2l5Lli2khYYVpx+APvwAWk7h+C3FvM
	 0qGIGoTX6OzfF90PJiPmZF714DqIEIaAWftczkbHSMpVVtgnmC0KZ+o7djFqjJHQFv
	 RbbKrKCkcHsmV/KQbjUw27/+JIhXMUoNzYHSKxKSVjC06bx6nYdHZFzuMUEyHWywq0
	 FwpgG7PsW/7xC41PH1HOERThHrRVpmhjJKOrM6snBiYlNr3of09uHAiYEFIWxhmC+J
	 rQcHysLrbPPZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C18B581300;
	Fri,  7 Aug 2026 12:55:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 87C33392
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81ABA40A98
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FTuE75j8tftr for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 12:55:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8671C40A8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8671C40A8F
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8671C40A8F
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:15 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-c16036356c1so37370366b.2
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 05:55:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786107313; x=1786712113;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vpXvbhx+4QojrVwzzWGHBM6FWVDHkKBLyQle4oMHKBM=;
 b=DGFZ3O7De3e94EqHknWoQ0WmFMwyOM86raUIfsRUo0yd6zgeOI8NFyPddsRxvwo29D
 mt/U3bjzGcJ0Mn5IczxwcRXI4F3Otl6NNdU5QX34sRESRcLjcUb8IoLGv7EVH72e+QJB
 NC1p/HZC91iYHgWOqcVKUCNOPgoFDrsoJGK9w/8eH7P7aMSbx038+1IGoWmZE6bmvPcM
 88J3isMhIcdWbR6/uMdWpHXYKtMAxIwujmPpE6T9r0O+1ZZc6UURizWWAWeB8Krdt49Q
 JuAKNSnKJiT1HMgrLIs0CrzBAK5RMdOy8j73qygTNaney6Q1neLyCfmLE47DrI4WTTnE
 NsSw==
X-Gm-Message-State: AOJu0YwEBjzrMsHl2GoWIbQB8njA1Iw2lKcd9320lgwIjSZ3haeZtXS2
 D2RjNhlgc02cy0SbuE3dGWtHOzp6RcAabQrXfl5dWXzhF9NpBvAIsMQi3jF9rAf/jtDB0/4DcVI
 5BtYQRJY=
X-Gm-Gg: AR+sD110Kqc/Rv+XfvtD2KLjzWDEUcgks3Gai706m216xYlVXtoLuZM3uwWWJpCseNp
 OlxEAXJuhhsmWlL0spbRDjKAVs+7t7jswzaLCDyAVLMU7paKJGZisQvqcj9nY7FEfEeNjIj4LBe
 7Q3FeISj5M9sX2FL0tf+Fmp5z1NQenQfKaOgJMurDBE1pSos2e2VWJcH3FLiEZ4pfUWghi9lZft
 +v32gUecXVLHca8xH6K6SxBsjoIIvhMeRdDYrKrgp/jNVCem3e/3U958hP9wtkcOnOUdzJgs7Do
 3YN0Ut39GlcQbjXkf0n8RAhnStj78VuBN3EniKJ5YoFIMBPSzccYrF4cfZ7xyavvidhpeBdZWRb
 oG8q2JkhJIevDGHS4OLzYQEPc4RV2LrCMFE0xCv9RDUZZoPy00bxkzc0LqCIr12hd184N2NS6/E
 Qn2f2vgOB2QhR+eL1z/P/wLSSmCDxxGD5gr7onKAH3/RMyLCZQOEraeQya8oykKFR8EwgYQR2tJ
 iAsHJlJ6Iru37SVQAqYrM7Nzxe6jL3guOLKR1WTM0ehRn61ECP8XdFPhzmIg/cbhmAP0vlX6uwx
 YOK/PEFXFilZTjThQT2wCwnMAqImRtCIMiyu2fvktKkxtvO27rho2LE5tZtuzpeR
X-Received: by 2002:a17:907:3d11:b0:c12:927d:a288 with SMTP id
 a640c23a62f3a-c2039af66cemr591486166b.1.1786107313334; 
 Fri, 07 Aug 2026 05:55:13 -0700 (PDT)
Received: from adam.amarulasolutions.com
 (2001-1c00-8183-9900-f185-b195-5f14-b7f0.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8183:9900:f185:b195:5f14:b7f0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2080a29a8fsm49539866b.4.2026.08.07.05.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2026 05:55:12 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Fri,  7 Aug 2026 14:55:00 +0200
Message-ID: <20260807125510.1285300-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1786107313; x=1786712113;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=vpXvbhx+4QojrVwzzWGHBM6FWVDHkKBLyQle4oMHKBM=;
 b=YygQA72019MXynZP1dtcNeZ2oIRCYbd1C2O/hQ7b/2IzfqF5rdvJH8fGlDThqGt58p
 tTfaj3YVOPQJ86DFv45ROTnswR3a4TdM4FinINH5AH9bj30jQi71IZurM9xQq5mLnqxM
 MiN3eT6KfbRUH0tL+eBAeA66tm9RvsS7sUjR8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=YygQA720
Subject: [Buildroot] [PATCH 01/11] package/mender-grubenv: add busybox fancy
 sync fixup
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This prevents multiple `sync: ignoring all arguments` warnings
when the `grub-mender-grubenv-set` script is called when a
system that uses busybox sync installs a mender update.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/mender-grubenv/mender-grubenv.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
index d93159802d..de089f2ef8 100644
--- a/package/mender-grubenv/mender-grubenv.mk
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -87,4 +87,8 @@ define MENDER_GRUBENV_INSTALL_TARGET_CMDS
 	echo 'ENV_DIR=/boot/grub-mender-grubenv' > $(TARGET_DIR)/etc/mender_grubenv.config
 endef
 
+define MENDER_GRUBENV_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_SYNC_FANCY)
+endef
+
 $(eval $(generic-package))
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
