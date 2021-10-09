Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF24C433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 08:29:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8915360F8F
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 08:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8915360F8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37AE860B5D;
	Sat,  9 Oct 2021 08:29:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YsoDLOy4QCex; Sat,  9 Oct 2021 08:29:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A93A5605FC;
	Sat,  9 Oct 2021 08:29:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4CEA91BF388
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 08:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C2F64065C
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 08:29:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZdXaDM5YfY4n for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 08:29:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A0A24065A
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 08:29:04 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t2so36849103wrb.8
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 01:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rtZB9SFPOwesLXlXuWLDdP2OqKG5Weas2s+JHxplkOc=;
 b=BGkS8WwTnF5u6Bcj0GIkK8G5LqD7jYVPewrc5AGvfEnsQjIkTEbqqFlOvCXt2yx7mP
 q5j+GqN0lLFYS6Eo25XBmDoi/t8BSWrPUJ8dTkb8PWbKjoH7Q6t+KJsILO7NI9uE308u
 CmcvUpDBKg1Np+Qaq9uXo8Z1FBzqAI3fFiqptln99lhk03gwwBm6pTTIER85mR7XQGmV
 4fnP9m9ontiFdL+71Qk0HPggpJqtRnUSinogA0G3OgC/8EjSARUrQ7IVoWldMz5eWPKG
 QvVDycSyKtcnZQvvPfaCglhRjIYSrL2X2POPx7m89drkW2xcNEBjDBER87j+rODZHdmg
 UcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rtZB9SFPOwesLXlXuWLDdP2OqKG5Weas2s+JHxplkOc=;
 b=ZFus8SUyhIX9AHOSw5Ba20gxTxaPMNSPshZl8DHcKyczOBaB0iW3yyy0CX6AIGdZWt
 gu4adDiEASv91kG/Tt++SoTpRnJ/o1zSui599/v414amLFLIUqBURobw5BUqsruP0wSb
 QE8AWpBfxo17xjmNxcRUYea+RzJxD3gKir2ByfUlBhFuEreYu00IdJe2GZGfCp3eCaem
 MtDgKMQtAR3cRK1eTwOmi4gLhZnUd8BWZAHI67BS2OjLLo+uTVZzlnryJkPQVtA4tQ+k
 Dh0i1R9AMK3Bs4GDd2gI319KoxDNgDTHjTA5LlGy8gVZibHh2yuVs+kS8hgF/Bo1ji8B
 pdAQ==
X-Gm-Message-State: AOAM532m6ZqZUPJ2oLZ8fz9EmvrPU8kBG0J2qa6Pf74X3RJG7YnHmUPs
 rqbtz/yQNZ2wuuag0PhfikOr1rmuaawYog==
X-Google-Smtp-Source: ABdhPJw4huIXo7ecXwd3alKrbR1L7PlXy2zvwcSISftamtnIXW64n5xwA7FTrUgObMewL4VQ1XqwHw==
X-Received: by 2002:adf:a411:: with SMTP id d17mr9874390wra.393.1633768142536; 
 Sat, 09 Oct 2021 01:29:02 -0700 (PDT)
Received: from t450s.fritz.box ([31.19.16.29])
 by smtp.gmail.com with ESMTPSA id a16sm1548497wrp.14.2021.10.09.01.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 01:29:02 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 10:28:55 +0200
Message-Id: <20211009082854.5203-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] boot/uboot: bump to version 2021.10
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 boot/uboot/Config.in  | 4 ++--
 boot/uboot/uboot.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 1fc93a443f..a58f7b7572 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -41,7 +41,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2021.07"
+	bool "2021.10"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -85,7 +85,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2021.07"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2021.10"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index 5a48926ebe..68259f69f2 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  312b7eeae44581d1362c3a3f02c28d806647756c82ba8c72241c7cdbe68ba77e  u-boot-2021.07.tar.bz2
+sha256  cde723e19262e646f2670d25e5ec4b1b368490de950d4e26275a988c36df0bd4  u-boot-2021.10.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
