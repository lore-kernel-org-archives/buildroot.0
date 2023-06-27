Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC226EB64D9
	for <buildroot@archiver.kernel.org>; Tue, 27 Jun 2023 14:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 328BD831A2;
	Tue, 27 Jun 2023 14:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 328BD831A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HQhvvduNb-Q8; Tue, 27 Jun 2023 14:34:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D72D830A8;
	Tue, 27 Jun 2023 14:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D72D830A8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7FDB31BF35E
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 14:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59DD581A73
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 14:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59DD581A73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rMyqp6toAAZW for <buildroot@lists.busybox.net>;
 Tue, 27 Jun 2023 14:34:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42C5281775
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42C5281775
 for <buildroot@buildroot.org>; Tue, 27 Jun 2023 14:34:12 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fb4146e8ceso17270815e9.0
 for <buildroot@buildroot.org>; Tue, 27 Jun 2023 07:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687876450; x=1690468450;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U3PeTdS8IHdGERT1LsStdUhfZtZ/LawdAyppsJA/Hqs=;
 b=I1i93Px3GQ381izoMVX4lEg2RGnW4618j+frKekFgY6qjlpKB4LDFCY1p9jInBQC9C
 qOM/v0jHaMBcXzGHwDej/IlbbdfQHVxcV7GtUxcF3OVkknVEi7/MNa9lXIdAszDtax6Y
 lpyP7g9uB4k0P5j8cYt3gv8cRZVrt5Clg4afk4zeGvUYVR/Pnr7mHDYn58PFAcpIiMfS
 C0XXZFPO3j3pY0rhVkJzqDqVaN+NHEDB9z9HQT4B6Et29Q8+i+uUZwzPVIwIjAbwhlQi
 QqC+LLauRLWj6gbZPVuAG7HOeZhMmoTdNEz7PADI/YtfrKk3h9ekEFVD0eQ3Gw1aItF/
 Fl6w==
X-Gm-Message-State: AC+VfDy639r/XNz4nCmVHMdJZFy9+POAzFCYXlINbw89RIBVosOnPpMN
 zI7IjhUvdkALu7Bs7ED2+VHhC9hcHTE=
X-Google-Smtp-Source: ACHHUZ5bIvY5emQDrhFlMy6Y0em0BcSd9Z6ba52TqmuzXr++iMnKv5QWiciur+8yaYBr44RWPbxwKQ==
X-Received: by 2002:a7b:c014:0:b0:3f8:f1db:d206 with SMTP id
 c20-20020a7bc014000000b003f8f1dbd206mr24370506wmb.25.1687876450320; 
 Tue, 27 Jun 2023 07:34:10 -0700 (PDT)
Received: from p1g2.home (aputeaux-652-1-54-113.w83-204.abo.wanadoo.fr.
 [83.204.213.113]) by smtp.gmail.com with ESMTPSA id
 h2-20020a1ccc02000000b003fa74bff02asm10874540wmb.26.2023.06.27.07.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 07:34:09 -0700 (PDT)
From: Gary Bisson <bisson.gary@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jun 2023 16:34:01 +0200
Message-Id: <20230627143401.594223-3-bisson.gary@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230627143401.594223-1-bisson.gary@gmail.com>
References: <20230627143401.594223-1-bisson.gary@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687876450; x=1690468450;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U3PeTdS8IHdGERT1LsStdUhfZtZ/LawdAyppsJA/Hqs=;
 b=ZnyoOdWPB15CFLHl56RY3t4O1jmfaJfb6a1oFv9py0UxqRg5o23Gkgw2YxH+JcRUAn
 Jz9ULitRKy/d0M16PHIPagunIhkhrklAwL19r2By8MguCqeips2LC3IyequyWKVXFZ0g
 Rlgk3dtLYC9147nVq+1VjOHUoAo1asGEAZQc5or3gynqmSWq+BmgNfYFVaVfxaXn3A75
 De9DJhj4QHNtCP6SdUtRFU7somFLpgjAoaIvwHwkVxZWX4B4wluq4tZ1erFCvbNS/r2p
 Yd1VyNNZelcTFOc8HAtb1oHWxDOpKMv7MSyJmHh1rxdyh3LwM4C5fKSP2ySr/kta+Toe
 uD9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ZnyoOdWP
Subject: [Buildroot] [PATCH 2/2] configs/nitrogen*: add missing pylibfdt
 u-boot dependency
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
Cc: Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed by binman.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271714
https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271716
https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271718
https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271719

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 configs/nitrogen8m_defconfig  | 1 +
 configs/nitrogen8mm_defconfig | 1 +
 configs/nitrogen8mn_defconfig | 1 +
 configs/nitrogen8mp_defconfig | 1 +
 4 files changed, 4 insertions(+)

diff --git a/configs/nitrogen8m_defconfig b/configs/nitrogen8m_defconfig
index c3959f7614..dc9c1acf78 100644
--- a/configs/nitrogen8m_defconfig
+++ b/configs/nitrogen8m_defconfig
@@ -44,6 +44,7 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-b
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 
diff --git a/configs/nitrogen8mm_defconfig b/configs/nitrogen8mm_defconfig
index d7b47c11f8..f021a30ad8 100644
--- a/configs/nitrogen8mm_defconfig
+++ b/configs/nitrogen8mm_defconfig
@@ -44,6 +44,7 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-b
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 
diff --git a/configs/nitrogen8mn_defconfig b/configs/nitrogen8mn_defconfig
index b28801878e..88925cfda7 100644
--- a/configs/nitrogen8mn_defconfig
+++ b/configs/nitrogen8mn_defconfig
@@ -44,6 +44,7 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-b
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 
diff --git a/configs/nitrogen8mp_defconfig b/configs/nitrogen8mp_defconfig
index e088cb690f..956c3b7bc1 100644
--- a/configs/nitrogen8mp_defconfig
+++ b/configs/nitrogen8mp_defconfig
@@ -44,6 +44,7 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-b
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
