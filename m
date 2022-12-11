Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47C3C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 20:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5461860BDE;
	Sun, 11 Dec 2022 20:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5461860BDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rJY8VN_5vkIj; Sun, 11 Dec 2022 20:38:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E83F60B49;
	Sun, 11 Dec 2022 20:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E83F60B49
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 141EB1BF2B1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFEBF81413
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFEBF81413
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vwUWjtBRUe5g for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 20:38:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C471581412
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C471581412
 for <buildroot@busybox.net>; Sun, 11 Dec 2022 20:38:34 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso3585734wmo.1
 for <buildroot@busybox.net>; Sun, 11 Dec 2022 12:38:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N0WrygPqw4/dLCuvXGN4dmN4Sf3mfUF2Bhx0yD1rAg0=;
 b=u/QKhukctyrfzzVVpSkqGnQfRX9Ds4TYH7jvvdPTawg712ikdBEXXJxnu0241JbW6b
 0d5Ee+xAaCYLD9tFfJO9HvIhXAoBAW8PZyM7Gm13QIbClEOC/eFY6nS8EfCbDZKQbPUY
 2sc5QKfvsZ1QpW/1Jc0SNdnEN5ycZXuHXbsT6ZqlGwfD/izwU5fQB8SsNOrskeQsCZ3a
 orjD9LI1tgr8dwSXuUnFI46MYJsof8KemtXWPzsdHyFwzWZEK/HnE05tzfmQehUbCqME
 yM0ESyPpL9zzyA/LfaoH4igHXOWLiaiPqb4ipZ980KcC5mS60RkmTHzVlloILGiY60tX
 fr+w==
X-Gm-Message-State: ANoB5pkvMqKLVooBwGnC93h1gH9GKU5DDpGCLFPYSSBtE0JOD0yXGu1b
 /P3P66CXyCZRUE6Lphx6QHM2zO/foso=
X-Google-Smtp-Source: AA0mqf6wGk2ulo7IjhKJg6+vTIjJ/RSpIViwpfujXw7jElhL1VeQlsNXKjK4wte31batHsBs07X7cQ==
X-Received: by 2002:a05:600c:500e:b0:3c6:e63d:b8ac with SMTP id
 n14-20020a05600c500e00b003c6e63db8acmr10570836wmr.27.1670791112828; 
 Sun, 11 Dec 2022 12:38:32 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 iz2-20020a05600c554200b003cf78aafdd7sm6920274wmb.39.2022.12.11.12.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 12:38:32 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 11 Dec 2022 21:38:26 +0100
Message-Id: <20221211203826.3117784-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N0WrygPqw4/dLCuvXGN4dmN4Sf3mfUF2Bhx0yD1rAg0=;
 b=MdOMS5NeV7tolsC1cd905Ms0sEkIhA3azlD5jbR1hKv+V+f/EU8nB0r88ajdVDwtNH
 mZqzSfN8XExuLccaDL5gikiud5I3H2gQR0Tnqvhk8NX+bUcBd7w7VGoYxYmf4HtTN6pN
 gX/ad2CVSPZI2Dgp1BksFa0VvP2mPP/zR9RH+1Woh41xYPwACiUetpo0fjXRQS5PEy4A
 ioWB3pwWDbn46kU1uWYSZHL+7O3ueT8GN7ivPTZXle9sPbadGlwvsLhhNAK82LZPR+lB
 H9ZKx/AgeN8XTJbAFi/S64iEr1wEwBpyQl3aorWS/uw20YtdHyLNGo0mDR4lLPo20pYD
 m+HA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MdOMS5Ne
Subject: [Buildroot] [PATCH] boot/ti-k3-image-gen: avoid a wget in the build
 step
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 boot/ti-k3-image-gen/ti-k3-image-gen.hash |  1 +
 boot/ti-k3-image-gen/ti-k3-image-gen.mk   | 18 +++++++++++++++---
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.hash b/boot/ti-k3-image-gen/ti-k3-image-gen.hash
index 82c5b1706..90b908130 100644
--- a/boot/ti-k3-image-gen/ti-k3-image-gen.hash
+++ b/boot/ti-k3-image-gen/ti-k3-image-gen.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  d13e9556bfba32d14071e172589683e48f6fea705a0b05ddd7fe984002089888  k3-image-gen-08.05.00.004.tar.gz
+sha256  623e2f8d73d8da725188200f613e4c53228856dfac8af5a791dc7d1ea18b5f29  ti-sci-firmware-am64x-gp.bin
diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.mk b/boot/ti-k3-image-gen/ti-k3-image-gen.mk
index f8e6105bf..152a39d03 100644
--- a/boot/ti-k3-image-gen/ti-k3-image-gen.mk
+++ b/boot/ti-k3-image-gen/ti-k3-image-gen.mk
@@ -15,13 +15,25 @@ TI_K3_IMAGE_GEN_INSTALL_IMAGES = YES
 # from the ti-k3-r5-loader package. Hence the dependency on ti-k3-r5-loader.
 TI_K3_IMAGE_GEN_DEPENDENCIES = host-arm-gnu-toolchain ti-k3-r5-loader
 
+TI_K3_IMAGE_GEN_SOC = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SOC))
+TI_K3_IMAGE_GEN_SOC_TYPE = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE))
+TI_K3_IMAGE_GEN_CONFIG = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG))
+
+# this hash comes from the Makefile in ti-k3-image-gen
+TI_K3_SYSFW_VERSION = 59d6f921b3b562e0aa1f42ce322e4645b1bfc52c
+TI_K3_SYSFW_SITE = https://git.ti.com/processor-firmware/ti-linux-firmware/blobs/raw/$(TI_K3_SYSFW_VERSION)/ti-sysfw
+TI_K3_SYSFW_SOURCE = ti-sci-firmware-$(TI_K3_IMAGE_GEN_SOC)-$(TI_K3_IMAGE_GEN_SOC_TYPE).bin
+TI_K3_IMAGE_GEN_EXTRA_DOWNLOADS = $(TI_K3_SYSFW_SITE)/$(TI_K3_SYSFW_SOURCE)
+
+define TI_K3_SYSFW_COPY
+	cp $(TI_K3_IMAGE_GEN_DL_DIR)/$(TI_K3_SYSFW_SOURCE) $(@D)/$(TI_K3_SYSFW_SOURCE)
+endef
+TI_K3_IMAGE_GEN_POST_EXTRACT_HOOKS += TI_K3_SYSFW_COPY
+
 # The ti-k3-image-gen makefiles seem to need some feature from Make v4.0,
 # similar to u-boot. Explicitly use $(BR2_MAKE) here, as the build
 # otherwise fails with some misleading error message.
 TI_K3_IMAGE_GEN_MAKE = $(BR2_MAKE)
-TI_K3_IMAGE_GEN_SOC = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SOC))
-TI_K3_IMAGE_GEN_SOC_TYPE = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE))
-TI_K3_IMAGE_GEN_CONFIG = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG))
 TI_K3_IMAGE_GEN_MAKE_OPTS = \
 	SOC=$(TI_K3_IMAGE_GEN_SOC) \
 	SOC_TYPE=$(TI_K3_IMAGE_GEN_SOC_TYPE) \
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
