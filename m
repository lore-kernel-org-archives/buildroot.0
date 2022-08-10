Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3572EC00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 07:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9392A40128;
	Wed, 10 Aug 2022 07:28:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9392A40128
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jYipVNsO1YFU; Wed, 10 Aug 2022 07:28:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A69D1408E0;
	Wed, 10 Aug 2022 07:28:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A69D1408E0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 675EC1BF44A
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 07:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40B8940331
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 07:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40B8940331
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XE7RNpa7Pl_t for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 07:28:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D70C9402BB
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D70C9402BB
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 07:28:31 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 a18-20020a05600c349200b003a30de68697so1332459wmq.0
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 00:28:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=KzWkA742RWs/3WGur7uarh7FoDu3AXHUGPO7+ZAcuGc=;
 b=aPsSh9GXIih7a2NeGttyYtEhUl+EDPtW3qcmRQ3xlZvBYCs/7LHKH/MWwMP9NXd+03
 jEusfPxNUO5jdBtEuf7axmN7CIprUAXpFjB86cJvJJDWqQjWnTrIlys1FHfocOMEvIha
 WsPQKiu3u3kDxHpRl0Pa9cn+Wh2Sn3GBknr4WYDrdqvdiqQyo/sIUaCQKPJb2AtWR4m5
 eiKaZ5+bLf2JxhDvIuPb2/ua3Gm7olwkat9mMYVqC5zsjl8XdfeZlFVwjROr0XrGW3y5
 oDXNP6yn8QVnY1ob/TgYwgHPr/9qL+ADycDuwKBEsXJb6O+xKGYShAyBtxP8jkTaH59P
 0Eaw==
X-Gm-Message-State: ACgBeo3+FJH2rxHp9v9Ubk1BxqDkY+CMfb1/JG1UnXgLXVk+Y/9ylYG2
 2thr7YHzaGRgdDqhJLeMxfsR7NfuUyY=
X-Google-Smtp-Source: AA6agR6Mllc7lpeHwW8eOMNNay6YXXLCTwWLOJ4SOywe0DNWTKltLzzPN+nd/ITxUD6RLQdeqazyhw==
X-Received: by 2002:a7b:ce11:0:b0:3a5:244:8b65 with SMTP id
 m17-20020a7bce11000000b003a502448b65mr1422490wmc.85.1660116509571; 
 Wed, 10 Aug 2022 00:28:29 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b0021e2fccea97sm15103240wrf.64.2022.08.10.00.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 00:28:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Aug 2022 09:28:01 +0200
Message-Id: <20220810072801.2832510-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=KzWkA742RWs/3WGur7uarh7FoDu3AXHUGPO7+ZAcuGc=;
 b=LPPtnbhRD38m5r17T9QNI1UjKKv45VTrmBCCmeSvJYL2IoJPG9Db1brv9IdtzMst9A
 z0UfwrPo0PdHOPmXkbwcB+f8UuqYzyRp9553FhUzFVFoqRvUP4EWSShfrD9x7CEYcQpe
 +z5cF11h3Jwh2NQQQwRVvzgZSpkMVZwiCtAQ+1zzkadS6u8XMOK4PO3lxhc+PDA9/PWz
 UQ+XLLMYCjaiY4YQzX1vCMIFfPc6Bp4ro5mC4MAPWtAW12soEnuYLv7dcGw/PZpMgnj6
 m0qOiKl8Cssy1PvLN5QDo/d3zGGKlvkHRpmg60IR3n6JP8JsL2+nFDc14wskyxTg55s6
 BEMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LPPtnbhR
Subject: [Buildroot] [PATCH 1/1] package/grpc: fix legal info
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
 Robert Rose <robertroyrose@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 0fc2438ff6e3d14cc9e7b546e2909e386db33439 forgot to update hash of
LICENSE (full text of MPLv2 included with
https://github.com/grpc/grpc/commit/05fcd826f477ef1a024a2defa5e4b3d78f5e6eb4)

Fixes:
 - http://autobuild.buildroot.org/results/98b820f85cd32596bde6bbee2cfc7e07ecfa454b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/grpc/grpc.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
index 84af11f5a1..d7c1b89aca 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256  9b1f348b15a7637f5191e4e673194549384f2eccf01fcef7cc1515864d71b424  grpc-1.48.0.tar.gz
-sha256  277adcc1dcef8359b1efb48e628635f88b40be8fbd64e82fd0169930d135d7a5  LICENSE
+sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
