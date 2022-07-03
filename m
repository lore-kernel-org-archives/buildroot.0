Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE50EC43334
	for <buildroot@archiver.kernel.org>; Sun,  3 Jul 2022 09:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BE7E40A03;
	Sun,  3 Jul 2022 09:45:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BE7E40A03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h9bMvK6Adcri; Sun,  3 Jul 2022 09:45:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C280A409F3;
	Sun,  3 Jul 2022 09:45:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C280A409F3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3844F1BF593
 for <buildroot@lists.busybox.net>; Sun,  3 Jul 2022 09:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07092607F6
 for <buildroot@lists.busybox.net>; Sun,  3 Jul 2022 09:45:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07092607F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r7JP86B8WlEo for <buildroot@lists.busybox.net>;
 Sun,  3 Jul 2022 09:45:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53D1E607C1
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 53D1E607C1
 for <buildroot@buildroot.org>; Sun,  3 Jul 2022 09:45:32 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id v9so9254745wrp.7
 for <buildroot@buildroot.org>; Sun, 03 Jul 2022 02:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T8hTIF0NApH63fZpq02l7gp+JBwC3vcBFF5ksL0135s=;
 b=SIzUuB3J+GKim8EQqMymj724GZREzeoR66jdOO9qgvTH8OzhTjCMUjKowqb7/xZJGr
 fYWuc9QttWSnxoiLs78H2xUA3CjXEZMs57mmp1qX3ptPjOBodkGMq2DP0jSt3VrA39+g
 xuOgbkyLdAa7LQroTKaPHgo5nTc0BtiUPvs1D630mcWABLIC8und6tfRj38KWWMpe3fO
 3jOyys1y2rcudM61fri7dqMZuUG4SLmNrfNNAatnG/ASadDSLQCEuxqNc+geAdi5lETb
 OSJofG+9zkETGzFhQzYT2blyJwbhvqe/fckSlWCzehiyDYikpsVoGxmDU8mlG6u8wInX
 4eEg==
X-Gm-Message-State: AJIora+8aHiSV7fklfNmmTYX/tytbAzOa7e/z1wt04Cp2sof/CFqG5OO
 XU7XcaBqyv7qJMs+DlnJcDKNFQg9fZE=
X-Google-Smtp-Source: AGRyM1uSCmDiv7QhRXK9BIZ0UgP+XgA2C0d//IUraWFNIdHaAS85Qr22ByXAGnS15v/Cs04j0ghVsw==
X-Received: by 2002:adf:d206:0:b0:21d:6434:a158 with SMTP id
 j6-20020adfd206000000b0021d6434a158mr4140885wrh.37.1656841530176; 
 Sun, 03 Jul 2022 02:45:30 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a5d5544000000b0021a39f5ba3bsm26918639wrw.7.2022.07.03.02.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 02:45:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Jul 2022 11:42:37 +0200
Message-Id: <20220703094237.1308787-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T8hTIF0NApH63fZpq02l7gp+JBwC3vcBFF5ksL0135s=;
 b=IVU4TZ2AxKsA4r76XsxT2420XtPn7178993Vg0trzvxFUqpX1V40AN7ZMhMZ1kvuNR
 gY/J2EgJie3WSmVVY2di5NxO9b/LxqTAjkSXOhq88sJlNF3afSu40YnWQKP6H51zjRjz
 OHdGzUNYWSfrI9VxAIyE2kfG/JrytiIqI0mlIBTmPziJ0driCafTs0LnpEXE+bbkhJm9
 og2/18WfK2aeslM2vjCUuDcRLEhLLhkBSNOMYGE5Gqkz0sWlXdX9TmAw+xzbYPO2qaIB
 cHHVpj1eJqXcgmY0jH8N49s24+TOnhZED3ln46TEnDNvZAlUlhDMsl4R4T9mrMHB2EaJ
 HV0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IVU4TZ2A
Subject: [Buildroot] [PATCH 1/1] package/kbd: bump to version 2.5.1
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

Update hash of COPYING (upstream license file used since
https://github.com/legionus/kbd/commit/1c47fec4fe12dc016bc1d881d19c48a37504bbc0)

https://github.com/legionus/kbd/releases/tag/v2.5.0
https://github.com/legionus/kbd/releases/tag/v2.5.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/kbd/kbd.hash | 4 ++--
 package/kbd/kbd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/kbd/kbd.hash b/package/kbd/kbd.hash
index 324ba065d0..63f7286d30 100644
--- a/package/kbd/kbd.hash
+++ b/package/kbd/kbd.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/kbd/sha256sums.asc
-sha256  55f0740458cfd3a84e775e50d7e8b92dc01846db1edad8e2411ccc293ece9b9f  kbd-2.4.0.tar.xz
-sha256  ddb9db7630752f8fdc6898f7c99a99eaeeac5213627ecb093df9c82f56175dc7  COPYING
+sha256  ccdf452387a6380973d2927363e9cbb939fa2068915a6f937ff9d24522024683  kbd-2.5.1.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  5a16340fe773f422144b436df90319114a2884933c56e9be6fad642e59be5e1f  CREDITS
diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index ea2c00a373..15912419f8 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KBD_VERSION = 2.4.0
+KBD_VERSION = 2.5.1
 KBD_SOURCE = kbd-$(KBD_VERSION).tar.xz
 KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
 KBD_CONF_OPTS = \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
