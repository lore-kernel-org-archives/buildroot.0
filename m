Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DF9C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 19:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84572612B8;
	Wed, 22 Feb 2023 19:19:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84572612B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WVH9_TPU4ZYW; Wed, 22 Feb 2023 19:18:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF157612B3;
	Wed, 22 Feb 2023 19:18:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF157612B3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ECC4B1BF475
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 19:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D422A4032E
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 19:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D422A4032E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iC9CbcifVLxx for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 19:18:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDA7A40227
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDA7A40227
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 19:18:56 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id h14so158193wru.4
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 11:18:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fUKR/0OCtZu7kL4N7tXcpF6bRA/M8b0sDLOX8YMOGA4=;
 b=5TibepBPqW9XfnkDjD4+7cKmVtk6hBDCMmUE3jdpCSkHjDjksA8A0JHj4xdN4omLLt
 Y9zoVqR+cJnbU06W4aAbFl7IWkISQlDW/WByf1cH7p26+AkUpEw3Qz4wRnwMGANIg5U3
 48lpxP/iOdpT3iWt19f9nTa/1OPUR1+DrWGBsM422G9dXLEJj2j0bIPBI85BKoNH+jm7
 Rg1fjaw4/IxkyQBmwgdf0wRdkxpLKHFaLkjePPTXbAi3R1kyzuYUNd1jAedFZoOfTkHt
 RgSi45te+Wiaqi89LwIp+GamsOXPo6DaCJY4roaMdichNl3rkk+JWCKcTzPd6qjpbhRe
 B6Qg==
X-Gm-Message-State: AO0yUKWR/16+/sIgHIyqfPV3xNLg05eNJ8izHVSEGWsxP063P+PTYhJ3
 /dNT+g2fEqgO/HwBGucxNErQEN3dwt8=
X-Google-Smtp-Source: AK7set+2ppyctVbTiSDC7EVUH9xOeTK/unuVU0+B0SM61ZR/AU8u5sht2e5R7dt4Io78hmAiPLOcVw==
X-Received: by 2002:a5d:4c4f:0:b0:2c5:4cd0:4b86 with SMTP id
 n15-20020a5d4c4f000000b002c54cd04b86mr8640967wrt.68.1677093534660; 
 Wed, 22 Feb 2023 11:18:54 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 z8-20020a5d6408000000b002c70bfe505esm2417236wru.82.2023.02.22.11.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 11:18:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 20:18:50 +0100
Message-Id: <20230222191850.182174-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fUKR/0OCtZu7kL4N7tXcpF6bRA/M8b0sDLOX8YMOGA4=;
 b=oXF0U5Amup7cSsu3dI/WuvKTvpvAVCrricgw1xBSlInJpve/dWqulKhilY5FMRSqBY
 2WTMEMnJVbSEjTVM9UexkjkehZuoU0vhP3+AZbagEvg/L+USSG59IChcM+M2VIYgvnA3
 UKhfD/STH35IZ+IBtj0t+p1A7fq8SA1REg3lrJuJl/89tLDKLljMZZOR+/PXIwtWfhSq
 UieUt/8ATuG70qbj1sTg0NYwMYjr1Fp5R40gKeYLdVS2JaB5Ohs3MQF/nFo7fuhXoZlg
 LhKkVPDPJbqBw8d5Slwc4WVGHjmCwNQqxQvBOh8cQNvuzElwHksyxABySK4TNqzksH3k
 nGPw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oXF0U5Am
Subject: [Buildroot] [PATCH 1/1] package/libgcrypt: fix Thumb mode workaround
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

Fix the following build failure:

/tmp/ccRqWxnA.s:98: Error: instruction not supported in Thumb16 mode -- `adds ip,fp,r0'

Fixes:
 - http://autobuild.buildroot.org/results/4b96f4e41724e5c9c806a6c7df397a58d1ae1b1e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgcrypt/libgcrypt.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 6cf9b235f3..dc19116df6 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -27,8 +27,8 @@ LIBGCRYPT_CONF_OPTS += --disable-asm
 endif
 
 # Code doesn't build in thumb mode
-ifeq ($(BR2_arm),y)
-LIBGCRYPT_CONF_ENV += CFLAGS="$(patsubst -mthumb,,$(TARGET_CFLAGS))"
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+LIBGCRYPT_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
 endif
 
 $(eval $(autotools-package))
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
