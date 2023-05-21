Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBF0C7EE23
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 08:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F051560BE9;
	Sun, 21 May 2023 08:53:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F051560BE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9_n_TB9ntUn8; Sun, 21 May 2023 08:53:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10BD560AA7;
	Sun, 21 May 2023 08:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10BD560AA7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C81E1BF3D8
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 08:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E442181E28
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 08:53:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E442181E28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 85iNlrWIJN4Y for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 08:53:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1475881E0B
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1475881E0B
 for <buildroot@busybox.net>; Sun, 21 May 2023 08:53:54 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f427118644so47968275e9.0
 for <buildroot@busybox.net>; Sun, 21 May 2023 01:53:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684659232; x=1687251232;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VzJ3hiA569UWh0lBqUsh2wdTt1Fe1vvUt/E97Th+JGo=;
 b=VjtHqn15PrKNxMk9/J5+6yixl1oQOFbjfP7Zknijy0ywcvyxQELql88BeeEMA5WGqv
 +bxul0rsSpneN/Mo1f5zsnqlNU02pXArvm+SipmQhw3NORos8WhMuvl3DWabs3GpId82
 jP9cBiWckSwcgYPjWHMizZoqpe7P1/L8dGaCfgPvK737ZgZ7arQlDZiUG1PZR/mjBKIf
 oUSHkdslfnjFdbOVL5CBMA3l+MO31X/fprrkMVOA+/woUwPotneqkvxsJS1itqIJYV8C
 uh9c+3CDVUqJ7lt0mcTfwMdXnKXFT5ed3mXldL2/i/pXKlpagka+lvZ6N5FCQeh02Z/R
 XVjQ==
X-Gm-Message-State: AC+VfDzv+blwph1zkELXuwA4qZKuqjEXkUq1rYBHt4exTM+pAraMvP3z
 Ms7ZW9X84OZytkv4mukuCcckJNZSfNk=
X-Google-Smtp-Source: ACHHUZ4BjG011Xc6tlirIO/lFxcuGftcK/R0Sq63MgyfRMRrDuW8mNAsNduDN2H9tVnN6j0TRZq5Lw==
X-Received: by 2002:a7b:c3ce:0:b0:3f5:db0f:4967 with SMTP id
 t14-20020a7bc3ce000000b003f5db0f4967mr5173628wmj.16.1684659231941; 
 Sun, 21 May 2023 01:53:51 -0700 (PDT)
Received: from pc-140.home ([2a01:cb1c:e03:bd00:5ffe:deec:ec3f:c958])
 by smtp.gmail.com with ESMTPSA id
 y21-20020a1c4b15000000b003f60119ee08sm2313504wma.43.2023.05.21.01.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 01:53:51 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Sun, 21 May 2023 10:53:45 +0200
Message-Id: <20230521085345.25691-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684659232; x=1687251232;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VzJ3hiA569UWh0lBqUsh2wdTt1Fe1vvUt/E97Th+JGo=;
 b=O5vTnouN1v8wwt7bww4Tply3DR2OBfawXYgyWolQxKRD0g5e25LLOXc1U1hqfFLxc0
 0gS2+osRLkPPTZhNmg77jB+B3lXCZGDCfDpBV5mXPhssE3ONBqIhtg0RnjsTPXtVtXkH
 Vwuh6WXUi/pw5Q1qCfYnqvGHnIVUSQ6Qd0FcBDhoS53NGGL/HBvmWmvAeDjz5gQ5xMLV
 NV+MAZaDwGqNESBlSYkHKrbNct+dv5B6Mjn4cJMRMtyudmoUGvsopdlryodCfbqHEmkr
 gO6tiuOj/aFfRmqz7zD5Jnr/o0hhmoG1zAv11xBhTCyTwbQagIdWNKgK+cWIa6KMmSeI
 9LBg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=O5vTnouN
Subject: [Buildroot] [PATCH 1/1] package/liquid-dsp: bump to version 1.5.0
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
Cc: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/liquid-dsp/liquid-dsp.hash | 2 +-
 package/liquid-dsp/liquid-dsp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/liquid-dsp/liquid-dsp.hash b/package/liquid-dsp/liquid-dsp.hash
index 7e5de6b259..6fdbd62a86 100644
--- a/package/liquid-dsp/liquid-dsp.hash
+++ b/package/liquid-dsp/liquid-dsp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  66f38d509aa8f6207d2035bae5ee081a3d9df0f2cab516bc2118b5b1c6ce3333  liquid-dsp-1.4.0.tar.gz
+sha256  93003edb6e74090b41009b1fae6f273a3e711dc4c8c56a0cca3e89167b765953  liquid-dsp-1.5.0.tar.gz
 sha256  4df7126196efba1283deb99e3269418dde4ab0ad1fde80a55051153451eb4df2  LICENSE
diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
index fcdf572532..e9788eb144 100644
--- a/package/liquid-dsp/liquid-dsp.mk
+++ b/package/liquid-dsp/liquid-dsp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIQUID_DSP_VERSION = 1.4.0
+LIQUID_DSP_VERSION = 1.5.0
 LIQUID_DSP_SITE = $(call github,jgaeddert,liquid-dsp,v$(LIQUID_DSP_VERSION))
 LIQUID_DSP_LICENSE = MIT
 LIQUID_DSP_LICENSE_FILES = LICENSE
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
