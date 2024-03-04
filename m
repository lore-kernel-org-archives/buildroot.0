Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D728C54E55
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 15:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DB6B41490;
	Mon,  4 Mar 2024 15:50:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 33aGFheMR7Lk; Mon,  4 Mar 2024 15:50:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1909140395
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1909140395;
	Mon,  4 Mar 2024 15:50:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 65AF31BF2A9
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60B2660BAB
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:50:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v-FrmdWkLfLj for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 15:50:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 603D460647
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 603D460647
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 603D460647
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 15:50:15 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2d22b8801b9so64728681fa.0
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 07:50:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709567412; x=1710172212;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/m0L2TG8frMADpahE8PBo8xOqR/Cg87SESReNjAClIs=;
 b=mIdQjNoaAnuOZlF+b0kVtd47wrXroTn4CGq4wDx4kfpnrHKxiTdoMur92u0JWEcAAt
 O0oZ/BO7UVq+5qQC+NtDcl5DaInuZ669CBi01nvoFQTcqDvVP9pqzpHXE8E20R1kO746
 l6CsM6EUnPQKdjS9v1lHVuEUSYlbOLPOvJieJ9OG964PB9jFAf6usbXxB2o2RhmpGh0j
 u1rQt6z8KDxDAuG/GZX28ga7fDeqA11XmEQ9lNxogdtxj7b4SJIwFT56ZWDF3n/PqPb2
 IuCh/BPn0cFM1RaloB4xxcgm1Cm+m+d4j4wESLu6UKPRefVe2Y8FGaJWhU7EtBbWcy/c
 NlzQ==
X-Gm-Message-State: AOJu0YxZDuQJ6q7PrUMcZoLHZBfRdUKU3lvcDeqGX5jNH2008hY72tTS
 EIqwWMCUGTvtCl0bYysQ72hzzwVgYkxMddU3Xyqu9HYbCLRg6Ov205sEbsZ8
X-Google-Smtp-Source: AGHT+IFs3mShVv/gB5sTamTl9WqVeeSuuaOv3S0b2JkRErkrkF2VrnbtA1XR0t+C2lbRXPn/kUv2KQ==
X-Received: by 2002:a2e:780b:0:b0:2d3:219d:c8bd with SMTP id
 t11-20020a2e780b000000b002d3219dc8bdmr6485592ljc.50.1709567412099; 
 Mon, 04 Mar 2024 07:50:12 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 14-20020a5d47ae000000b0033cf80ad6f5sm12805666wrb.60.2024.03.04.07.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 07:50:11 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 Mar 2024 16:50:09 +0100
Message-ID: <20240304155009.3505542-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709567412; x=1710172212; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/m0L2TG8frMADpahE8PBo8xOqR/Cg87SESReNjAClIs=;
 b=hbjhTRVzUeskNQQQYlJboF0z6+wLKqDwZ5eO4W/sJLZV2oxV+j0uuOxtQWHijXV4O6
 //ZpnbL9uehgnmEy96R6aXAPwpV+2xtyl7YZM1U4980tXgo2OPpRab+ZU/Lol/jLoKGQ
 AByo6Jtl3Yw9peflssN7WzrriqfIqg5WyZewwXCLKqnb0gfjykK7w6smSnzDhW5KAb0O
 PhLQxsmfUACliuqXpVcuWIUMfBL01TRmKzC2S3MIDVnaLrqeAgimq1PpSgBNUlovYHi1
 rH2b970JSSiJcHB/w2T5JC9Q/nfZckS8yuZUmDRjz9Xmho1tt8nrB+KI1lt4HYgdzArt
 AIHA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hbjhTRVz
Subject: [Buildroot] [PATCH 1/1] package/rauc-hawkbit-updater: fix build
 with gcc 4.8
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Colin Foster <colin.foster@in-advantage.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc 4.8 raised since the addition
of the package in commit 928b7219cd7079864eadadc66dbff21c5cd72804:

../src/hawkbit-client.c:873:17: error: 'for' loop initial declarations are only allowed in C99 mode
                 for (const gint *code = &resumable_codes[0]; *code; code++)
                 ^
../src/hawkbit-client.c:873:17: note: use option -std=c99 or -std=gnu99 to compile your code

Fixes: 928b7219cd7079864eadadc66dbff21c5cd72804
 - http://autobuild.buildroot.org/results/e275d0ec4fe1da418a6163b46666316034b83b19

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
index a453f75a28..3836d3c84e 100644
--- a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
+++ b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
@@ -10,5 +10,6 @@ RAUC_HAWKBIT_UPDATER_SOURCE = rauc-hawkbit-updater-$(RAUC_HAWKBIT_UPDATER_VERSIO
 RAUC_HAWKBIT_UPDATER_LICENSE = LGPL-2.1
 RAUC_HAWKBIT_UPDATER_LICENSE_FILES = LICENSE
 RAUC_HAWKBIT_UPDATER_DEPENDENCIES = json-glib libcurl
+RAUC_HAWKBIT_UPDATER_CFLAGS = $(TARGET_CFLAGS) -std=c99
 
 $(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
