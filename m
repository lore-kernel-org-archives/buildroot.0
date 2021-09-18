Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD914C433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 00:50:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55628611C3
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 00:50:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 55628611C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1196841F3;
	Sat, 18 Sep 2021 00:50:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ftfIyWGv_9UQ; Sat, 18 Sep 2021 00:50:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C65A84199;
	Sat, 18 Sep 2021 00:50:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3DA3F1C1135
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 00:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D69484199
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 00:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UXXBkLunqDH4 for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 00:50:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D1A582FA9
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 00:50:30 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id g14so10772670pfm.1
 for <buildroot@buildroot.org>; Fri, 17 Sep 2021 17:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GAN+6qdbEFRCT4WYxPKGarcx0vCk/+XciPPkbVrwJUU=;
 b=C29Vjw0g/JkYTzGtSDVtDcZoVrW17ekmmCN5OxS5BCbVKnPiQR9Ebc5XoIgjvC45sj
 v+LFYXZ9ffsr2mmeJsl9jatqRFanQPFLhDnZB5eyXmOV9KNUpt2KNtQImnlo26H8tCb/
 zbUI3CQPN8Y+mr/vXM3htq2qgqaR9koLGfODR4WTa8Mjx3d3ocek1E82veANHTCHQT1i
 xLMf6MQW0b2OOhfhpfFhu0wSi+HM70kxrRAfoi6DAivg/DQeTmQq48+tRTfr0dJch6o4
 RH+jZHHqgAOnSYYsTngTn6CFEeo30Ck3gLtsM9ImKgPVSDfFM4YghQ3WenpoUvERpnD/
 MYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GAN+6qdbEFRCT4WYxPKGarcx0vCk/+XciPPkbVrwJUU=;
 b=S8ojHo1uvxohq07QcTkmKs2rBJm0gkurzpJmnRxE/CnxwS1Y5eTmmBREIPMCgQd0HF
 +FWM36QhpRF/MOqaa0i3ehV5tORaL5r16t7lJ34Lm+39v7VWzNgOjXUzsQlRvj/0eRtE
 KTryHK9TaMc0Q+oe5DjrxgVZ83IxGrhJfQ6Svw3FsOPzyR6gsal4zfl2PGN6vL5EEgu5
 lwI63pD7fQEgE5bqFmscIU1NP5PXg6xqHhovK1FWgi6wDt/NFJs0j+84BBml3OJQCw4I
 8W0HATurMvD9yY1S27WIo3lG9rxkwVUnqZiwxHzzCOpcupNV6VnCWLTalIydAdiPJ61b
 bT0A==
X-Gm-Message-State: AOAM533FnOmoFB27DpfjbdWz8T0UCdCcF8/b3xY4YBDBR0C38ETU9bVn
 jRHCMNiDfXBHzYYQa1F7B4cNkptTsFHUsQ==
X-Google-Smtp-Source: ABdhPJwb5iGKnPTXBhRNRtDQPglDPA2cdrZ7Ua9TECSL3QhS5vTNtlKFHW5Gmh7pQqSgwBPe3G0Inw==
X-Received: by 2002:a63:4622:: with SMTP id t34mr12290140pga.293.1631926229828; 
 Fri, 17 Sep 2021 17:50:29 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id ft14sm11491310pjb.34.2021.09.17.17.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 17:50:29 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 Sep 2021 17:50:27 -0700
Message-Id: <20210918005027.97811-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/openjdk{-bin}: bump versions to
 11.0.12+7 and 16.0.2+7
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Tudor Holton <buildroot@tudorholton.com>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

As the github repository has changed from github.com/AdoptOpenJDK/ to
github.com/adoptium, both versions are updated in the same patch.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/openjdk-bin/openjdk-bin.hash | 6 +++---
 package/openjdk-bin/openjdk-bin.mk   | 7 +++----
 package/openjdk/openjdk.hash         | 4 ++--
 package/openjdk/openjdk.mk           | 4 ++--
 4 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
index 04b3c42d25..696371eb51 100644
--- a/package/openjdk-bin/openjdk-bin.hash
+++ b/package/openjdk-bin/openjdk-bin.hash
@@ -1,8 +1,8 @@
 # From https://github.com/AdoptOpenJDK/openjdk16-binaries/releases
-sha256  7fdda042207efcedd30cd76d6295ed56b9c2e248cb3682c50898a560d4aa1c6f  OpenJDK16U-jdk_x64_linux_hotspot_16.0.1_9.tar.gz
+sha256  323d6d7474a359a28eff7ddd0df8e65bd61554a8ed12ef42fd9365349e573c2c  OpenJDK16U-jdk_x64_linux_hotspot_16.0.2_7.tar.gz
 
-# From https://github.com/AdoptOpenJDK/openjdk11-binaries/releases
-sha256  e99b98f851541202ab64401594901e583b764e368814320eba442095251e78cb  OpenJDK11U-jdk_x64_linux_hotspot_11.0.11_9.tar.gz
+# From https://github.com/adoptium/temurin11-binaries/releases
+sha256  8770f600fc3b89bf331213c7aa21f8eedd9ca5d96036d1cd48cb2748a3dbefd2  OpenJDK11U-jdk_x64_linux_hotspot_11.0.12_7.tar.gz
 
 # Locally calculated
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index b48155dc28..641a212f17 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -6,15 +6,14 @@
 
 ifeq ($(BR2_OPENJDK_VERSION_LATEST),y)
 HOST_OPENJDK_BIN_VERSION_MAJOR = 16
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.1_9
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.2_7
 else
 HOST_OPENJDK_BIN_VERSION_MAJOR = 11
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.11_9
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.12_7
 endif
 HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_VERSION_MINOR)
 HOST_OPENJDK_BIN_SOURCE = OpenJDK$(HOST_OPENJDK_BIN_VERSION_MAJOR)U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
-HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk$(HOST_OPENJDK_BIN_VERSION_MAJOR)-binaries/releases/download/jdk-$(subst _,%2B,$(HOST_OPENJDK_BIN_VERSION))
-
+HOST_OPENJDK_BIN_SITE = https://github.com/adoptium/temurin$(HOST_OPENJDK_BIN_VERSION_MAJOR)-binaries/releases/download/jdk-$(subst _,%2B,$(HOST_OPENJDK_BIN_VERSION))
 HOST_OPENJDK_BIN_LICENSE = GPL-2.0+ with exception
 HOST_OPENJDK_BIN_LICENSE_FILES = legal/java.prefs/LICENSE legal/java.prefs/ASSEMBLY_EXCEPTION
 
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index ba6c4385e7..2b4a2c7a62 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  3b3aca61fe2834322e51636d99bcd09c4abba7d8a2cde231dbcbcbdedf829baf  openjdk-16.0.1+9.tar.gz
-sha256  55841c01dbe6606e0d5f88045fb2da02632ce3a2d9d9b25d030a06eadeee0f62  openjdk-11.0.11+9.tar.gz
+sha256  b4a0e71e41a11175e8a7c1dba86ed5b0aa878413158c8d48813db1b64ac9536c  openjdk-16.0.2+7.tar.gz
+sha256  9a37c9641b45f5c51fe19c1ccae141daeb5dcdbd59fa2f56e7dea7bf09484bec  openjdk-11.0.12+7.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index cbb975ca25..aac5c87e73 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -6,10 +6,10 @@
 
 ifeq ($(BR2_OPENJDK_VERSION_LATEST),y)
 OPENJDK_VERSION_MAJOR = 16
-OPENJDK_VERSION_MINOR = 0.1+9
+OPENJDK_VERSION_MINOR = 0.2+7
 else
 OPENJDK_VERSION_MAJOR = 11
-OPENJDK_VERSION_MINOR = 0.11+9
+OPENJDK_VERSION_MINOR = 0.12+7
 endif
 OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
 OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
