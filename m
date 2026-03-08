Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E0EF5513F
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 11:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E47841194;
	Sun,  8 Mar 2026 11:12:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ERMfnEDaiW1g; Sun,  8 Mar 2026 11:12:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F72540D38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772968363;
	bh=3KOp1RwN7eI4NPjcyKe75o6T8BbBSZzQdH15U1CM1a4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=aN1Yymf5x14bOhVI4on7BdTvPcpi4lylJ11dKHCRLdvGHxWA6mObtclBLkPkeTZ7b
	 Ygdcdjiscs0GwvEF4TaJXAoyZo3OxbkpvTSgZDO4GArlwGoFrwUd3GlIH11x5SXAKg
	 wk1+L52Z7qfnuhRwpGoBRfE9Y1kliog6V1pwNnnb4ZdBJ57T2o8gdekHR5wL62QZrw
	 R5zLpT2C9WnnihswMX8wk9vlc4AEuwzLmRJ9kLtYft/wBgH8IzFv3ARDHMpl+o9uBG
	 j0E+1Kt32etaO4uC956DXngb14mSL/ivWUYDW0xFY5giD+xJllLC0NVOnLDi7KK3Nb
	 4m0OFzu0WXv/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F72540D38;
	Sun,  8 Mar 2026 11:12:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 19227223
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 11:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0ACB940617
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 11:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KUEmiF4uqtfn for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 11:12:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2FC7340194
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FC7340194
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2FC7340194
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 11:12:40 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-354a18c48b5so9537847a91.1
 for <buildroot@buildroot.org>; Sun, 08 Mar 2026 04:12:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772968360; x=1773573160;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mPrRmjwm9WZmpxQtxiSfCeiq8yULS7R1a1gwlBau0I8=;
 b=OlIaCMBHFzNFWTSpzaI3indfD+icS7HS7r2P4NbJ8GdoTHZ+mo8Sf2Uou2H+ok7Y+U
 t3VeERhgRoCjOZ81eeNp8XSGl1KtMjyqxYAHt/DJJbyCH8jpoOnWaSS864FyyG9roWa3
 X3VkZ9DzTDuBgBT+RCZEPHVheBuTnq97rvMMI8mVDDmqTAiTELXhGCAJ3tlXSweMi6Q/
 p4NyW0il6BTTiPYyqFO69RtSLnNYnawP5DfF5kC9NAC7+jrnmOZH+6U82kkgUSmGrpEj
 iyQ5LbgZojqVUfSmjlNQi4n9Yssj93e05UjPHhb99x1dIO57tSXEymCvU1/xee5JQLYR
 7Zow==
X-Gm-Message-State: AOJu0YyW6mLWL6jQdl/T5g4s7sJFGOSvzXpejlr/cAFzf5pCV9HMeTDM
 KRlj10d5YjXtPppHiEXNWQMTpHLh7DrSDnb49PfIIOvOf5kIQTJcJS+QDnUJzw==
X-Gm-Gg: ATEYQzx+1j1R52imzRV2eTPkw22kR2AiNj2fpsaZbQrGCiYSD29X0aSR4REdupn74Fw
 ei504MWM9OJ4RCYNgFiIKjs12ppW64G7c5DXQc8jfxlxIVq5rM+C870TFXWTTZIeEsUu5G771lZ
 QuYIdFEsBLp56yEl5KxWAW898FkScCqehnKklmAXdAZQrXUGjz93cmfhJPdKVkNirBfAOIbe67Z
 U47ZPrBwDdtFFKWrXYj2zGGL6g/wtufmP6nZa48OPhwwUFwlRJ/CSdbTidG0ExXFf9oBvcDQPju
 xzsb4UM0vWAu/mUzti5LsPbuGoaJNAitHZqzveF0Eun2bapXmWfLKp4moJxgfizoW+7dsadiW2R
 qbKvu1so/rcyUOWsH2I55NkTQ9+MXWcVqldBmr6QBjmRkUgIo5aE4LZYRT4f40kqB7amcDWB1jZ
 uYwLph53KcX0zNRwvqNCfyWl/pBYEApRscDDw=
X-Received: by 2002:a17:902:f547:b0:2a7:95d1:3c0 with SMTP id
 d9443c01a7336-2ae823aac8dmr76284215ad.23.1772968359829; 
 Sun, 08 Mar 2026 04:12:39 -0700 (PDT)
Received: from fedora ([2409:40e5:116b:3332:bcdc:5bdf:dbca:b2ec])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae83f8c713sm76652995ad.66.2026.03.08.04.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 04:12:39 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Mar 2026 16:42:18 +0530
Message-ID: <20260308111218.1119529-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772968360; x=1773573160; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mPrRmjwm9WZmpxQtxiSfCeiq8yULS7R1a1gwlBau0I8=;
 b=BXGt2I9EAv0sObMzilMGqPZPeTdAVdzZZOI4+G9rwrtXKVXaztuXd9OjxHbzfh8O3K
 RMMIyqpcHUJMDWpNam5bnsYSMvaDo1lgdmVJySM19KNLc2ppUYKaE/pxylO7SL1N2fBE
 ENREGd2FGA4bSRBUm9Z8R8C6ig2PkgWVdkl9FH4t1Z8kpMoqVTVqImE5SbIKv9wmC4Bw
 ev1Ag0GxfGT3Yc/nSEwdZjUATrQ+aNdk0cd9s+TDEMLj3D9IGA5ltQ27SW8hoaSwJ8CQ
 o9fm97HCT9R0eM2INv9qGwngrE8lPy2vjWNH0FugcNG/9eZPJ2ID2boCXuZacS/EW+E8
 w8dA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BXGt2I9E
Subject: [Buildroot] [PATCH] package/libcgroup: bump version to 3.2.0
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
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This release fixes the musl build error in test-pkg with bootlinx86_64-musl.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/libcgroup/libcgroup.hash |  6 +++---
 package/libcgroup/libcgroup.mk   | 12 ++++++++++--
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/package/libcgroup/libcgroup.hash b/package/libcgroup/libcgroup.hash
index 65b98d94e2..53e65fb01f 100644
--- a/package/libcgroup/libcgroup.hash
+++ b/package/libcgroup/libcgroup.hash
@@ -1,5 +1,5 @@
-# From https://github.com/libcgroup/libcgroup/releases/download/v2.0.3/libcgroup-2.0.3.tar.gz.sha256
-sha256  b29b5704de3d0fadf199fe4e17eeeaecba7f0dd1b85569c96eec37c7672e3026  libcgroup-2.0.3.tar.gz
+# From https://github.com/libcgroup/libcgroup/releases/download/v3.2.0/libcgroup-3.2.0.tar.gz.sha256
+sha256  9a0fc2d6c377215c3e0d849f9189ecd91fd075f1da0a24b73f56c8892e86bdfe  libcgroup-3.2.0.tar.gz
 
 # Hash for license file
-sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
+sha256  b4a2193e6b8a059758a80ecede2b8bfecdc988ee1bd7ce3ec414befbdc214f4d  COPYING
diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
index 28f572d325..6169472bc2 100644
--- a/package/libcgroup/libcgroup.mk
+++ b/package/libcgroup/libcgroup.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCGROUP_VERSION = 2.0.3
+LIBCGROUP_VERSION = 3.2.0
 LIBCGROUP_SITE = https://github.com/libcgroup/libcgroup/releases/download/v$(LIBCGROUP_VERSION)
 LIBCGROUP_LICENSE = LGPL-2.1
 LIBCGROUP_LICENSE_FILES = COPYING
@@ -14,7 +14,8 @@ LIBCGROUP_INSTALL_STAGING = YES
 
 LIBCGROUP_CONF_OPTS = \
 	--disable-daemon \
-	--disable-initscript-install
+	--disable-initscript-install \
+	--disable-tests
 
 ifeq ($(BR2_PACKAGE_LIBCGROUP_TOOLS),y)
 LIBCGROUP_CONF_OPTS += --enable-tools
@@ -29,6 +30,13 @@ else
 LIBCGROUP_CONF_OPTS += --disable-pam
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+LIBCGROUP_DEPENDENCIES += systemd
+LIBCGROUP_CONF_OPTS += --enable-systemd
+else
+LIBCGROUP_CONF_OPTS += --disable-systemd
+endif
+
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
 LIBCGROUP_DEPENDENCIES += musl-fts
 endif
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
