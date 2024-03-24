Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC92C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 09:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB7A040012;
	Sun, 24 Mar 2024 09:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RcwhxGrirRE3; Sun, 24 Mar 2024 09:08:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDA3E400C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDA3E400C4;
	Sun, 24 Mar 2024 09:08:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB8FD1BF20B
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 09:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E59B3605D0
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 09:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4dMAbGEInOto for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 09:08:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 06A0B605CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06A0B605CC
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06A0B605CC
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 09:08:24 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-513d4559fb4so4500393e87.3
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 02:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711271302; x=1711876102;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kqYvYQDGk0wwksY2nuOioDW+EiFN9bWnDEujJZqGmlI=;
 b=Bfy3RI9rRg+u9+RDKXb2U0eVr2XOu97W2sAsbRjfVL5zvgQ60gLxD0YD2AJS1I4iae
 tssVZKzC6H+sKIR0Lug9nRJb7nBD66sHtwDNPtHBWFC3kCtEjmqLD/qwAOADBuYShGc0
 KwkMBT/UDdxzisgljvRd4FYtRsHl1ZwJUbSeb2EwCX9qf2a5RjWnuDV5gsRFWJEejzFJ
 u3Pu9EjBMTrFanJq7DcO6LTFphV3qzjLlYPiNt/1K0qutsLAJbfVtnnrSO3Y/JAWHSsW
 dUscVKcWGLXDhJzdcByA9l1A72nMhYvhhZHimiUclQvsW+caWKlXpH9AG7+qaF45IgRH
 FStg==
X-Gm-Message-State: AOJu0YySI9dzdSNaa881RzhxrsCZmBikUOmBOPtnjFOse2LQVLRKl8B6
 tUKcaFhlHYxCj4RIDBgU3SthUASU+q4x/ebW+cHXwmZ9loo19WBn57Q3tXWL
X-Google-Smtp-Source: AGHT+IHjwUyjk2MJKBJOYWVSLozctSfV6WD6cm2EdgYQPEq59iHXO7GsfElKezU+MAbHcKOd68DYIQ==
X-Received: by 2002:a05:6512:70d:b0:513:13eb:c99b with SMTP id
 b13-20020a056512070d00b0051313ebc99bmr2772287lfs.62.1711271301657; 
 Sun, 24 Mar 2024 02:08:21 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 b8-20020a05600c4e0800b0041488cfd0fesm551876wmq.28.2024.03.24.02.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 02:08:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 10:08:17 +0100
Message-ID: <20240324090817.251630-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711271302; x=1711876102; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kqYvYQDGk0wwksY2nuOioDW+EiFN9bWnDEujJZqGmlI=;
 b=krBewUJAZ9oY4gB4PQ2u2gvnPcsdEtgmMMu5bdSUX87Phch0XRp/1l+VxCZff9WZPS
 3JGBREzmHcnotrkDAXrMZMbHCwRFIH5pVG9JoWTsJ6tssbDayOj5WrIMzIrkvJWoVF/u
 SBYnatai6CBejvicRD67LxDPag+dTFW5RhM7WdXuoRT3/upjhnBZqj2g/dP7H9Bt6ZXk
 LGnBA0Fq3vuLOxQiWAtBMTkKKHEGEFL12YXUqqfpbOsvALb2tpAPV9xQvK5fjB3gaqq0
 Szm6CSNKDuwN+moVQA4gj9RfkP0/oeOScRWL0eEciOID0qfSTUio6GwcS/oH1IbtIcIj
 I8Jw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=krBewUJA
Subject: [Buildroot] [PATCH 1/1] package/i2pd: bump to version 2.50.2
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

Update hash of license file (date updated with
https://github.com/PurpleI2P/i2pd/commit/d5ee1f602fdc7a47ccc9a4e239ea720dd63f123a)

https://github.com/PurpleI2P/i2pd/blob/2.50.2/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/i2pd/i2pd.hash | 6 +++---
 package/i2pd/i2pd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/i2pd/i2pd.hash b/package/i2pd/i2pd.hash
index 98c0db243d..cc099a94ff 100644
--- a/package/i2pd/i2pd.hash
+++ b/package/i2pd/i2pd.hash
@@ -1,4 +1,4 @@
-# From https://github.com/PurpleI2P/i2pd/releases/download/2.43.0/SHA512SUMS
-sha512  7247850cd47cccc540346b4a1becc6dba5f40bcb333cd722e9fc59fd8b0beddee700376829d29add05cea6b84bb34303ed37e01914a1a41cf8cd94fe5c826e4a  i2pd-2.43.0.tar.gz
+# From https://github.com/PurpleI2P/i2pd/releases/download/2.50.2/SHA512SUMS
+sha512  7df7a578711a959feee4326060829cf87c0d1669e473934549cb59d868a7aef7300ecd2d7a6b92a2295aa7e97964cc16d0e44a334db917e22b0b59573a9052de  i2pd-2.50.2.tar.gz
 # Locally computed:
-sha256  9c87aff490b272254d716475e3c4973f5f64af1d18f9f6962c1e61e252e1ad9a  LICENSE
+sha256  e32cc0171ce3301afa67d83f61598f29af7efdf8218dfb66cc1a72224474ec2c  LICENSE
diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index ad268a235c..402931c655 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-I2PD_VERSION = 2.43.0
+I2PD_VERSION = 2.50.2
 I2PD_SITE = $(call github,PurpleI2P,i2pd,$(I2PD_VERSION))
 I2PD_LICENSE = BSD-3-Clause
 I2PD_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
