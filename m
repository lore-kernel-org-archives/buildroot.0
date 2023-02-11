Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2529EC636CC
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 14:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5983C4181B;
	Sat, 11 Feb 2023 14:27:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5983C4181B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mJQLZpzw0vtB; Sat, 11 Feb 2023 14:27:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EE32416F4;
	Sat, 11 Feb 2023 14:27:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EE32416F4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B89A1BF369
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 14:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5560160773
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 14:27:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5560160773
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HXjO_LT0Ue_A for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 14:27:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E10560759
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E10560759
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 14:27:00 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id c1so3827605edt.4
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 06:27:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T4KLy18GjWxpZPtbCxEQL/F0nPkIsTzcS2KpJhdJeec=;
 b=3wo45muOijruZRQvXQ4RcncpuGxBrOr0TIK7X3As5Zyxq8D3lgH3EHpGxSJm7yvvrh
 YJyvgCkzWdVXNKlBQCklbiJQet/jaytFUcjXJcKUGujB3BSlrvmcAA/VWJTKL79YaKov
 W9JDS1WMvkhud0677qhfWWHUKEj5esDFV9VWxPP7JsrVfd7gWtMr956WDTdJZJuZa1dB
 EgffkVqpSm/ZI8bhs2j3bpkYdGYUbnmSm5elYv5o62V3keYiOanOfOYBIugWVq/decgT
 wbQrZEP8YKkJLTtEFUM/QiZFtvqSK7l8GVV95nEDt1GvRS5PArZhzbfZZZg7iEC5XcOV
 +VoQ==
X-Gm-Message-State: AO0yUKVxSziYtjWFTWyZIa1lW02EZ80FtrFnmlqfZo2cG6j74z81dBgV
 QKSe8GOS391DhmhO4ckHg5tF8MmC5VEaxg6QHHA=
X-Google-Smtp-Source: AK7set8fznA6Xuw2op0iXl6wFCaX3cQDaaKpajmhNRslGcgoiLqddsyl3zxkdTQoPop/KDFQJj5MSQ==
X-Received: by 2002:a50:9f28:0:b0:4ab:b0d5:6bb0 with SMTP id
 b37-20020a509f28000000b004abb0d56bb0mr4601480edf.18.1676125618441; 
 Sat, 11 Feb 2023 06:26:58 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-44-29-201.retail.telecomitalia.it. [79.44.29.201])
 by smtp.gmail.com with ESMTPSA id
 o18-20020a509b12000000b00497d8613532sm3812079edi.5.2023.02.11.06.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 06:26:58 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 15:26:55 +0100
Message-Id: <20230211142655.375225-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T4KLy18GjWxpZPtbCxEQL/F0nPkIsTzcS2KpJhdJeec=;
 b=rOv3qAKjtr9M3uD18Uf1NTQcV9za3ClQth/D4c8fW9fKfvkx6LAjmld5N1CBI/FJ5g
 csu5CWJcCAwmVDuLcNvjTqCo1ei7kubDV8Rf6PgrAoidH99pr+DFWbrXCwmakPb5D8we
 Q7kapRtjIUKUXyDy9v0Qpa+j4BpzObE5V5idY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=rOv3qAKj
Subject: [Buildroot] [PATCH 1/1] package/davinci-bootcount: bump to version
 2.0.0
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
Cc: dario.binacchi@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dariobin@libero.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- stm32mp1: support for STM32 TAMP_BKP21R bootcount register
- tab formatting
- gitignore: added autoscan files
- updated documentation
- i2c_eeprom: bootcount does not use two uint16s
- am33xx: declare registers as 'volatile'
- src/am33xx: do not close fd, it seems to prevent reliably writing register
- configure.ac: update version, homepage
- Added EEPROM read/write for non-TI AM335x platforms

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/davinci-bootcount/davinci-bootcount.hash | 2 +-
 package/davinci-bootcount/davinci-bootcount.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/davinci-bootcount/davinci-bootcount.hash b/package/davinci-bootcount/davinci-bootcount.hash
index ef4bca2b7dfe..ecbaa51517ab 100644
--- a/package/davinci-bootcount/davinci-bootcount.hash
+++ b/package/davinci-bootcount/davinci-bootcount.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  de7843cf1245a739b6d18d4db478893e50c2de0ee19bbce96dc323065d28c3e4  davinci-bootcount-0973689c7556a953d2b468e4d8d46758c6d467b4.tar.gz
+sha256  12b5aa83736efb2fefd22cd4d9f305a25c68dfaa10401d5efb17e55a5163934e  davinci-bootcount-v2.0.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/davinci-bootcount/davinci-bootcount.mk b/package/davinci-bootcount/davinci-bootcount.mk
index 385d96d5a2c4..71c597f85a39 100644
--- a/package/davinci-bootcount/davinci-bootcount.mk
+++ b/package/davinci-bootcount/davinci-bootcount.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAVINCI_BOOTCOUNT_VERSION = 0973689c7556a953d2b468e4d8d46758c6d467b4
+DAVINCI_BOOTCOUNT_VERSION = v2.0.0
 DAVINCI_BOOTCOUNT_SITE = $(call github,VoltServer,uboot-davinci-bootcount,$(DAVINCI_BOOTCOUNT_VERSION))
 DAVINCI_BOOTCOUNT_LICENSE = GPL-3.0
 DAVINCI_BOOTCOUNT_LICENSE_FILES = COPYING
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
