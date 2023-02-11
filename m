Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EED7C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 14:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CC4B4032A;
	Sat, 11 Feb 2023 14:46:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CC4B4032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wMcLm6JNP1sh; Sat, 11 Feb 2023 14:46:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D904F4031E;
	Sat, 11 Feb 2023 14:46:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D904F4031E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A28531BF369
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 14:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C63E60A65
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 14:46:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C63E60A65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ARv8yvaZfjer for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 14:46:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94EB360644
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94EB360644
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 14:46:29 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id r3so7599717edq.13
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 06:46:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DzQl1v2pYDjyZBBZMpDebdCDWNuG1YUQAY6WS76dHNo=;
 b=G2iYADDBrxk4Jzak2S4B5BVwj7wTdToWRuu6kaC5EfLkddo/09z7YXfJYoqCEcdrDw
 H89d66RFbsTzO50JHS1ISk1KEcoZc1swZ5vbKqbmAzQN5pUDJCNdZci8hu2ceMRpRtK0
 MTMqNWrfY7G5uC0fneQNHTHVe1oF/n+da2Bhgt6jx0w9q+ctKikW9Wrs0dqNlHZizsMg
 i2w8P/pm9S/LOAma3QGXPrvy0Cg7nizta9VPEAIqUvYcYM74Huuh+o1yF1A3cx19NKQB
 Uk8Zbe+0BRONZDtjo/yDfn1KWB+udUglSHlGkwv7kqCQB3pskj2SCVo99W1RS3SdrVei
 tGRQ==
X-Gm-Message-State: AO0yUKUNgG306vrafBGQQPHQzBpyNsgIZ9vdOrl5/Jjt1h+hXwfhD5Wt
 cp6ASv8C2b0SsZMSqOoZ/RMDy/UG1DzohPP4lyo=
X-Google-Smtp-Source: AK7set/MMcZUEQpvl8njpm5/Wka0/oKK2+PyQEm5b432PhKe6zX1cxp0q4a4kq3iOCefuzkflf8dKA==
X-Received: by 2002:a50:99d9:0:b0:4ab:d49:212b with SMTP id
 n25-20020a5099d9000000b004ab0d49212bmr13569172edb.0.1676126787694; 
 Sat, 11 Feb 2023 06:46:27 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-44-29-201.retail.telecomitalia.it. [79.44.29.201])
 by smtp.gmail.com with ESMTPSA id
 v26-20020a056402175a00b004acb3026af2sm1704660edx.59.2023.02.11.06.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 06:46:27 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 15:46:23 +0100
Message-Id: <20230211144623.380475-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DzQl1v2pYDjyZBBZMpDebdCDWNuG1YUQAY6WS76dHNo=;
 b=mOVPRT9VdAGCUQauHD6ee5RSnjo3hCx312HC4UPxFmF301wICOo5Z4O39mvTvVjuNV
 E6qyWs2S4qxSsZWiv2GZ4hFS9dh4z5rx+ICbathWJ5gG9q9BETe4eJ+vbW858S0R2bgP
 NMhOKkeIbMm4WmywResMpN4NMj4NYmLms/FNE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=mOVPRT9V
Subject: [Buildroot] [PATCH v2 1/1] package/davinci-bootcount: bump to
 version 2.0.0
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

Changes in v2:
- move 'v' from DAVINCI_BOOTCOUNT_VERSION to DAVINCI_BOOTCOUNT_SITE

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/davinci-bootcount/davinci-bootcount.hash | 2 +-
 package/davinci-bootcount/davinci-bootcount.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/davinci-bootcount/davinci-bootcount.hash b/package/davinci-bootcount/davinci-bootcount.hash
index ef4bca2b7dfe..53435b1d1d6d 100644
--- a/package/davinci-bootcount/davinci-bootcount.hash
+++ b/package/davinci-bootcount/davinci-bootcount.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  de7843cf1245a739b6d18d4db478893e50c2de0ee19bbce96dc323065d28c3e4  davinci-bootcount-0973689c7556a953d2b468e4d8d46758c6d467b4.tar.gz
+sha256  12b5aa83736efb2fefd22cd4d9f305a25c68dfaa10401d5efb17e55a5163934e  davinci-bootcount-2.0.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/davinci-bootcount/davinci-bootcount.mk b/package/davinci-bootcount/davinci-bootcount.mk
index 385d96d5a2c4..695d39688ac6 100644
--- a/package/davinci-bootcount/davinci-bootcount.mk
+++ b/package/davinci-bootcount/davinci-bootcount.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DAVINCI_BOOTCOUNT_VERSION = 0973689c7556a953d2b468e4d8d46758c6d467b4
-DAVINCI_BOOTCOUNT_SITE = $(call github,VoltServer,uboot-davinci-bootcount,$(DAVINCI_BOOTCOUNT_VERSION))
+DAVINCI_BOOTCOUNT_VERSION = 2.0.0
+DAVINCI_BOOTCOUNT_SITE = $(call github,VoltServer,uboot-davinci-bootcount,v$(DAVINCI_BOOTCOUNT_VERSION))
 DAVINCI_BOOTCOUNT_LICENSE = GPL-3.0
 DAVINCI_BOOTCOUNT_LICENSE_FILES = COPYING
 
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
