Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F46CA5FA2
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 15:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC1C280C95;
	Mon, 28 Sep 2026 15:48:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gU6r1e9C6ZnH; Mon, 28 Sep 2026 15:48:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0240F80CEA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790610515;
	b=QnuS78JnGn/FjEQPXMZ9nF/cbmt7lULrCaGsqisjoCTWBk6JeVcxIxsQOrpEFmJrT/qS
	 vYxKpZRARxgLcYAR3GbMtNL7tYUVB27Pyq/7bjr7Amk4g8p5Km8Aen5zZp/B88t0/8Ccn
	 6NWBCWWCDZL0sQu6nMbWfk7ZTMzi+XoOH5Fhxj0Wunmg3tbYLiuqemgettG8Pth6i+N2x
	 CLNFnoDnhWqC6CAC4t5Fdq/RUNhra3fYNoUtNb7yB4P9VfcOspAWKa0vJP6n6gJ9tfkR8
	 tSuESCY+5e8+n9cR8W7haBADfj6u197EW27T9oFe8e4qPbcrzgoxkoWfe8ovt4PzIag==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790610515;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=jsGCueyFcMwWB3TZ7cSr6/bwQZ/CX7QctitiTgPGLmg=;
	b=ri/rNiDWGECqTmbnxIr+u9YJiIB+UY2TjdRVoqRn+pxLw7L7zFGVmKONUKzxvtXgNkqD
	 XXpShk9WCXdUp0El3ADHUDL6OUWgReZ44rtH4+5Uj+fyylRNF5O2yHCrL1D+1qrjcBloY
	 aEBngkZHwp7XKOAih3wOkcdzz6+DIBCaliT4C0mWYfpjtTd+qfheqhHKL2CI+K8ckWiFc
	 yitq1DbiU4D7nt9d0/YNzm5i94nNCQmT0fqXoq/ptJYAh1lQEPXD6b6iNcKEtMkRCIt/1
	 xNQQLMXD3H12qIhOlNBb3N5nzis8k6yDPwJcRYhK3dpo2R5Mg5SpCfxT07SH9dJ6mkA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790610515;
	bh=jsGCueyFcMwWB3TZ7cSr6/bwQZ/CX7QctitiTgPGLmg=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=kuRWDK23GYA1vySvmphItFBrpaoOR+86kV+N/V+VFlWu2PjiyoZmcC6I4WBdhS2vx
	 O/LWkKZIAkvoxzSll7xLAg4mDMWInrASZDr1RSUV19b15hEyvKZFGkKKe2N/JvErO/
	 V+TV2Q6uL7Va+weQyIKy8lA7jBNGRz5GEb0I6RBN19WBmP+CJRT9+G/qFzWEusLZ7M
	 NH+ZH3C67cCDfq/UYoxSzcFTn0Z9sQvgaoqEsCNwhha3TLQgcDIF6wQRU2mfcEpqz1
	 ExX2F6aIrFVtg3inxH/H+aWyNyGilcYTitQexIUMEMTWLMV1lEiviDj9Y86EZgIIQQ
	 2oPZx6La3Siwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0240F80CEA;
	Mon, 28 Sep 2026 15:48:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8206172
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 15:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 681E8400D5
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 15:48:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5bhIR6rfbE1H for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 15:48:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 7398E400B4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790610512;
 b=I47eVozvSOqPuTAMWYqKkYj9Jo115gd8DpiRJ88F+EiiFEKsIq/G4B7fP5CeOEC/SPOM
 ZJNOW+Zm9MDKt2/Yc1cCewgaLV5W9JGUlVW8univs0Iu3M4q5P2gghriYxOEx59vR+kqd
 IUFpvATPzHh1f1qGIXqRxdGcXs6tJ7vIhjsCOncQp+xPgttjASLArLfDwlkPg/8FTOLnY
 t6UoSx+OXxkxj7GbWW4PGpDlq0QqAyc8JIU60G6ic+RFh8oREC1nqGTmWUkuS3lYbn8c1
 0BYU9PjZ49gedGTZwm6hVyKlPfJnkV/r9D3W0+LSQPf6gizBy0l2aWuBenO+QIVJ2uw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790610512;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=U7eGNenvcPWb2/fCYoTj3DP9mYfHGZSfBQxG4Wz0qo4=;
 b=N3uRM79D1SuahJnmEnbgrlR0pB+9irwUsvmXMMUzvhYVBUhREuXTXySJgJCnZcxnipDa
 MWfxz3myIhxcU5ZaRAGfA6tI2zxba+nVKiAh8EAzdLnFv9+f3oAS/wJdJYRMLbXsUlck0
 Wk8VMu4PBtTpAIhxlJ0Gjyasf0efzMgzUGpqslWhMdEpj1XUA6jc+FZVkZv1jEKN5J4Ld
 BvKT7Ctlx6TLl3/LEBv4KEuqb5UgtWjTDu4URUQdkdpVDf9H5Obka6VaPByy2VXN/NAht
 XyN9xJH3Azr64R5gA27j0Kt6ISZKJrckLNYKzeF1ueDGD9op/IvrDdnjGZeRp53LN5w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Lbv9Leoz; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7398E400B4
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 15:48:30 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e79a408deso19574485e9.2
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 08:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790610508; x=1791215308;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=U7eGNenvcPWb2/fCYoTj3DP9mYfHGZSfBQxG4Wz0qo4=;
 b=VQIA1Ww9H1cq1ChLkNftco4w9MKDcJTCOLQKcqSh6DPvG47P2H485PfqW8EJY695es
 ayLt5oBSWJKXY6KKRVZuMAJCe08Tlz12b0Sre+scXgEkSAuQKfEosXQ1ntLZdzNyeOUg
 tzsvktGpnL1aT91jIVsefF2hUmvS33ha4ld7oAIKLc6VxwzXxsNOsBbi4dmkBxfUyTre
 ZiDKLVvsfllJFjdI5rSLYghewv/dUnpEjy4wZWv9sC48NWV7Oo//+2mWB0E5ljt3IVYZ
 vSShcXKYBdqth94HCtXY5/i2nykFvMBzFs6qAicqk3U62wQRnA6TWHdiUyLbQWNtMtSZ
 KbVQ==
X-Gm-Message-State: AFuF++khtSjIUVpZMAs0sG8+DTaFNGU2klhdYiKKqB5uW80Youb1gPaP
 4/lvkCAoIFJ86YtnJ8vKKF8ejz8N2fhnfrTx/te5AUk1Gt3QqsWbG9NeySo4VnK3N/x3Ree8h2p
 VEUps
X-Gm-Gg: AYBFou28ZQK0DrAHy3bC1xHFrXlBKiE6HV7/4YoK/LQOIjnqBQ4k0MFRclmGSpE0T9i
 EfGs3xFILa+ZNcg0H6K4XHfi9oMP92rTeGYuOLq2m7Y7R45JqcuJCvSYfDgVjx5O+t9AcslvdGf
 giKfm9Rx/Rde5khKR2d4YeWRVW/UV8LR1flNCZ1NlOMp9zF6w2PAczBme9vhpLxGgQeybNpsSR+
 CvTyE9guRwNlQz7dqPuPiO2cfYecJjpPH0/kjaMLtQPkLZa/Gbz3SlgYCnGbWou86ZsIL5iqcnU
 JnIlOWr2/dPEtbieHSKkEpUxc0bsn1fpG5kkL5aM6YRoRwM/VzwYwjJryRjq0ojLyFwy33dBapZ
 8EfiNCtRh9dJ4KER9jeRCZoJCM+eVy1Gbjpjfby/BkJ7WALxOFoSx746Dje8jWTpg4LQP49ndLy
 gbm0Ooys+ydL99nZnTXtPkBOwJ1ecoqhWF5uyncKA0DsoMuaEQnssbsKojr4m3rmxhyAkChSIP/
 dIJ7WON/AFvnIqPYOikGVfy209zaZDTFyTVv2Sm3ddZS19WK3bxPd3inakSQA==
X-Received: by 2002:a05:600c:6986:b0:49c:fa21:e73c with SMTP id
 5b1f17b1804b1-49fe66f147bmr225639115e9.18.1790610508379; 
 Mon, 28 Sep 2026 08:48:28 -0700 (PDT)
Received: from dragon.home (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fef60da94sm211461545e9.4.2026.09.28.08.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 08:48:28 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 28 Sep 2026 17:48:04 +0200
Message-ID: <20260928154804.1214400-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/wireshark: bump to the latest upstream
 v4.6.9
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Wireshark 4.6 is the current Stable version, while 4.4 is the Old Stable,
see https://www.wireshark.org/download.html

See the major changes from Wireshark 4.4 to 4.6 in these release notes:
https://www.wireshark.org/docs/relnotes/wireshark-4.6.0.html. Of notable
interest, libxml2 is now a required dependency.

This is not considered a security update because all important security fixes
that landed in Wireshark 4.6 patch releases are also available in
Wireshark 4.4.19 (currently in Buildroot).

Side discussion: Wireshark 4.2 is now EOL, see
https://www.wireshark.org/docs/wsug_html/#ChIntroEndOfSupportPlanning
As of today, Buildroot LTS 2025.02.x distributes Wireshark 4.2, and
therefore we should consider bumping it to 4.4.19, or even apply this
patch to bump to Wireshark 4.6.9 which will be supported for longer.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/wireshark/Config.in      |  1 +
 package/wireshark/wireshark.hash |  6 +++---
 package/wireshark/wireshark.mk   | 10 ++--------
 3 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index 8b05599ecb..894e629b1a 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_WIRESHARK
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_SPEEXDSP
 	help
diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index b17f4bcf17..63a3226c19 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.19.txt
-sha1  46c2805407197048d90dc7eac9f0a4a19d13815a  wireshark-4.4.19.tar.xz
-sha256  0499dddc0aeea500bc65196714e1e01097742efbc479a2d67a9a8b5dd57d6d04  wireshark-4.4.19.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.6.9.txt
+sha1  8287d01d50fa1269dcfd4e01c5dfd8d00ef652f4  wireshark-4.6.9.tar.xz
+sha256  d062d416a1ab3a49975aafe3a671c882dde0562ccd71b078808ceb59d465fc0f  wireshark-4.6.9.tar.xz
 
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index a67b915b5b..e6611b431d 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.4.19
+WIRESHARK_VERSION = 4.6.9
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
@@ -18,6 +18,7 @@ WIRESHARK_DEPENDENCIES = \
 	libgcrypt \
 	libglib2 \
 	libpcap \
+	libxml2 \
 	pcre2 \
 	speexdsp
 
@@ -102,13 +103,6 @@ else
 WIRESHARK_CONF_OPTS += -DENABLE_LIBSSH=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_LIBXML2),y)
-WIRESHARK_CONF_OPTS += -DENABLE_LIBXML2=ON
-WIRESHARK_DEPENDENCIES += libxml2
-else
-WIRESHARK_CONF_OPTS += -DENABLE_LIBXML2=OFF
-endif
-
 # no support for lua53 yet
 ifeq ($(BR2_PACKAGE_LUA_5_1),y)
 WIRESHARK_CONF_OPTS += -DENABLE_LUA=ON
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
