Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE2BC43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 13:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 385F640C44;
	Tue, 19 Jul 2022 13:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 385F640C44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wy4jHivLrcd6; Tue, 19 Jul 2022 13:17:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4170B40C50;
	Tue, 19 Jul 2022 13:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4170B40C50
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C98E1BF31E
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 13:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB51181D16
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 13:17:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB51181D16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EJMc5kRXjBxo for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 13:17:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C116981CA5
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C116981CA5
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 13:17:02 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso7799820wma.2
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 06:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2Cy7ZMCelk/1o8/yqirSwLlvu9tI0+EgFOEBPmszDio=;
 b=awP81STY+cIqsjQMRylVNCPHvXk9TweMjWqYFTXP6sgLI4S8bRwF31/I353tGHoUKx
 3Gve8DMCliKkTzDg9hyGEzFHSRb2xho26L9s47k+QuHLrIueEVapxHSK53vCHIfhFUMS
 7rdCYmdvuZXKRgIObT/mMr49IdDLPgMgk+rA/+AO6ID4Mn1C+G2Wkqbdddb51cabKFSp
 ok+C5FPE9oEkjm9YVB9NNMftCwbRjdbH1/tD+RQ+fxSaifKWQPDAbpKd0JnMehLglOYx
 y8LeN1Ag32NnBDp2GEKY+uPjJexaTVI0Q1Qk9je3qAh43UdszluVBH8Yw6P1MT7lfoRU
 QioA==
X-Gm-Message-State: AJIora+1V3pBVyP2MeH0t8hSuO9VFX8W143z5Ev+0+Qi4JqDfHxn9lR3
 FEqCUIlQE6R65iKump8Tu8pM4zQCk/4=
X-Google-Smtp-Source: AGRyM1tGD8o5PFINr/XjogjWlpeYBAQ4QJ565kIrbB6upqlHOCzPeU74T8Kmb4yYjlOqXIar4LM7Rw==
X-Received: by 2002:a7b:cc14:0:b0:3a3:2213:e653 with SMTP id
 f20-20020a7bcc14000000b003a32213e653mr3487313wmh.52.1658236620804; 
 Tue, 19 Jul 2022 06:17:00 -0700 (PDT)
Received: from lano-work.. ([80.120.136.76]) by smtp.gmail.com with ESMTPSA id
 d16-20020a05600c34d000b0039c5642e430sm14609496wmq.20.2022.07.19.06.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 06:17:00 -0700 (PDT)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 15:16:03 +0200
Message-Id: <20220719131605.337057-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2Cy7ZMCelk/1o8/yqirSwLlvu9tI0+EgFOEBPmszDio=;
 b=T7kZvgXxkUL/qd4QPogl65b+c+LtUD7A3ZIudAtykTlbC+UX5HV1f75FLKxzUJyZam
 SIWZkIzLPKIZb/CzNnjU9apqeCbu+7fKNq8USMzuRR0Ufb+Pi8s4KeH70yhF5D48HN8z
 sSNdjm+OUtA6EQ4fJckQg2PUS9ru1wyb3N76Udd8GjMrKr1D3Ts8ZRcT4aXN8dxWBr7s
 z/6eRTaSOmA8d2LUtRgQKFCLpuI2MSsAMNfWAYBYcNdNrpUNAGIiA4MaN5pzRekvd77v
 1q7G4l5R+0pYmS07AfldXEPpAsf/lDb6cF7LpvRT+tlqaA0w4vALLe9GAbGQgF968GBe
 uJ4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=T7kZvgXx
Subject: [Buildroot] [PATCH 1/2] package/systemd: allow empty
 SYSTEMD_DEFAULT_TARGET
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Once you allow systemd to be build while not using it as init
system, the variable will be mpty and the build fails.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/systemd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b6fffc553f..1510437617 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -586,7 +586,7 @@ SYSTEMD_CONF_OPTS += -Dfallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
 endif
 
 define SYSTEMD_INSTALL_INIT_HOOK
-	ln -fs "$(call qstrip,$(BR2_PACKAGE_SYSTEMD_DEFAULT_TARGET))" \
+	ln -fs "$(or $(call qstrip,$(BR2_PACKAGE_SYSTEMD_DEFAULT_TARGET)),multi-user.target)" \
 		$(TARGET_DIR)/usr/lib/systemd/system/default.target
 endef
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
