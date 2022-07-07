Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03DFC433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Jul 2022 21:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1490842437;
	Thu,  7 Jul 2022 21:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1490842437
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iKeL-Ugm4VIT; Thu,  7 Jul 2022 21:22:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6CD842436;
	Thu,  7 Jul 2022 21:22:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6CD842436
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B6E21BF44C
 for <buildroot@lists.busybox.net>; Thu,  7 Jul 2022 21:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 646A981326
 for <buildroot@lists.busybox.net>; Thu,  7 Jul 2022 21:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 646A981326
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wI0ZwYiQVe1E for <buildroot@lists.busybox.net>;
 Thu,  7 Jul 2022 21:22:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D1CD80B4B
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D1CD80B4B
 for <buildroot@buildroot.org>; Thu,  7 Jul 2022 21:22:11 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id j7so11395195wmp.2
 for <buildroot@buildroot.org>; Thu, 07 Jul 2022 14:22:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MnEBXClV2wQ6B/K5+ERlM1m1mJspb9f9k+cykD4O1I0=;
 b=dQdi7JRPw9loVvWJZQU+0KiDEkUFM1BtX+Puo9p9Uv7o/pC1zWiUnU/keqO1NEj/x3
 b3tlPnCgLk4WCmJ5CmKP59Z74/TY77gSY4wDdii+NcHXY4kRqELqD+OMh58rOK6/J3rr
 yO2s0CYXDM6kv34J5ThbB4DKhTIbF/YOn0mAlF4Yldydi7Vck+9UDjARV7LMMpGswbAA
 Y478TQ6aZbVGEq/60nAiIBXAGAGYTlNOnVVbIwE0qK5jnFez3SvNUHulLxVaWwl4CNHB
 1rhrnZnu6x6jTGrURQ95yANiUMVac/ljXwx5KLY1P1f4b9T6qmzFXdr9qmUuWq/b+538
 vFIQ==
X-Gm-Message-State: AJIora/4Ew1YSB96i8rvjXn91ePOZe2sRNv0Db4TgnUToX+3ZF3XqdH7
 KbQboGWjzfn4OWsYPv1hK6Tk/bQcXtI=
X-Google-Smtp-Source: AGRyM1tgH8MsrtY8/Gea1wUappeqRuzjLgzt+mKkK9v+xnbevX4AXyIgomxCfPEngmaa/E4MiIwGMQ==
X-Received: by 2002:a1c:7703:0:b0:3a2:d01c:c4e9 with SMTP id
 t3-20020a1c7703000000b003a2d01cc4e9mr4322207wmi.200.1657228929948; 
 Thu, 07 Jul 2022 14:22:09 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 e20-20020a5d5954000000b0020fcaba73bcsm39678184wri.104.2022.07.07.14.22.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 14:22:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Jul 2022 23:19:07 +0200
Message-Id: <20220707211907.50352-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MnEBXClV2wQ6B/K5+ERlM1m1mJspb9f9k+cykD4O1I0=;
 b=ASmWUaknjjNbYpvn50gDZu19N8q/m6QmgUiLNtGf0uea3SW5JDMdKsihgwMjnY8ML5
 cnheMF5jaO41Fb89pDQzu1vureKByU29qu1+w+YNXFz3dNlZISJQOkHw7zFSwrb6N0/P
 fMpmIeDsiy1N+BKMl3i6K1yzzEkYSLImJSsm1g6lR1WsYDU2kvggOaugAQSXsGciAssh
 sEcivZapLyVrqJ/KLzQGYwEoL+8rpotRUt98hrQhe6LT2EFXqSiDBHfZzdyIcaJssUrt
 udwhgYTDYZIDdAe8m0BhV81kQd/BYNzB8RsnfrExJS4Oho4OcR/FAA6oxIaWphX5EtlQ
 QEsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ASmWUakn
Subject: [Buildroot] [PATCH 1/1] package/sudo: fix
 SUDO_ENABLE_SUDO_GROUP_RULE
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

Fix SUDO_ENABLE_SUDO_GROUP_RULE which is broken since bump to version
1.9.11p2 in commit 9b7f8da96be549a52630cd87b30851d600f163a4

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14891

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
