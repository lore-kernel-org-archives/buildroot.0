Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613F2C433F5
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 06:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F758414C3;
	Mon,  9 May 2022 06:07:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l7gy0c4Sgmtg; Mon,  9 May 2022 06:07:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE80C41497;
	Mon,  9 May 2022 06:07:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 268E51BF97F
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 06:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 246238174C
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 06:07:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wssqMiSzHPwg for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 06:07:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D8BC8174A
 for <buildroot@buildroot.org>; Mon,  9 May 2022 06:07:27 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id w19so21976487lfu.11
 for <buildroot@buildroot.org>; Sun, 08 May 2022 23:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2AVJGKifEXs19MXo37mlo7wyJYOv4vmJ4PZmvGph3tk=;
 b=mjpUyvVZ3Riw5Bdcycd4Obw+69VS4RQTK988/sqDg3pGGhSbvCuLYbU8/5BsZ43ciL
 3r3pRE1UpdifwRi7Pxm7y0XiWZA5xv5J2jUzjsbNzJSftgdwHwmt/lcpdqHU/tIIsmD7
 2yekJv7lSooIgUrfE6jnenj/rGHuDIB2udZVKzdylpZYLp7fvHI2m6lwsre8DqJ2Ggzb
 ZSYZP+6mreyTFs77vZrXwCP4g6mePhGJCVbFAz20U+iP+7oLeaGdvDVlgx08IVb+fn6b
 FnxkpVbLYfl7k0DQcy6zLTGPZn6RWlMXBoeA2x7zBIKGN6PhPjwIUFyxQ3RRa09OeJas
 D2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2AVJGKifEXs19MXo37mlo7wyJYOv4vmJ4PZmvGph3tk=;
 b=dF4QD8rYCcZVp2vwEgMdorOwBopJmy4bBk554upAGUTzzUbou074Nsw15nPrw5IFPn
 3Zo8yPiDFTEPeEvDZBn0DDOCQNAbHzFBmUTRghDiQAn6wJVwf8fry5m5jbwBMG0V4Wr7
 AQC/9DildcfZVRAuBFmh9heMP2WWq7Rkz4QQCgZ3LixIzq85N7nk7BCuk4HquxCBhpPT
 3dk4aZIjz8w/0DyAFrihaEfUMHKRJk3zQ52FNL2C+bs8UAhvIDJeCswikk/nGP+3doZR
 K0qo5jT2QThQJTkPXkRZ5GCr9Csl2BPL8fiTEL40mz1jVdgbWM42f+8atcpCSQnL88Il
 pIcQ==
X-Gm-Message-State: AOAM533nNSMzFM0y+UJuzYvP8H8KPZvXDgENcf5Nv37wK7dGBTGgwSdX
 hUhif3wcxjz6MyYU+PVEBhNJDT7qmE3QJw==
X-Google-Smtp-Source: ABdhPJyL9KdA/sf3oyUOs7o9DkZtOwoY/EzEf+KfXAwllD3Us77NHrUcwvJozwWXdi2CcenUAa5gIA==
X-Received: by 2002:a19:6454:0:b0:472:4946:d23 with SMTP id
 b20-20020a196454000000b0047249460d23mr11429771lfj.216.1652076444978; 
 Sun, 08 May 2022 23:07:24 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 q19-20020a0565123a9300b0047255d211b6sm1824707lfu.229.2022.05.08.23.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 23:07:24 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  9 May 2022 09:07:20 +0300
Message-Id: <20220509060721.2726047-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509060721.2726047-1-geomatsi@gmail.com>
References: <20220509060721.2726047-1-geomatsi@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/rtl8189fs: bump revision
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump package revision to pull various fixes for v5.1 - v5.17 kernels.
Patch that disables verbose debug is no more compatible with updated
driver since build flags in Makefile has been changed. Drop it.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 .../0001-include-disable-debug-messages.patch | 28 -------------------
 package/rtl8189fs/rtl8189fs.hash              |  2 +-
 package/rtl8189fs/rtl8189fs.mk                |  2 +-
 3 files changed, 2 insertions(+), 30 deletions(-)
 delete mode 100644 package/rtl8189fs/0001-include-disable-debug-messages.patch

diff --git a/package/rtl8189fs/0001-include-disable-debug-messages.patch b/package/rtl8189fs/0001-include-disable-debug-messages.patch
deleted file mode 100644
index 532982b1d3..0000000000
--- a/package/rtl8189fs/0001-include-disable-debug-messages.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 5d3a44ff1aeb8ace6e08df3cad16102aaac1ef09 Mon Sep 17 00:00:00 2001
-From: Sergey Matyukevich <geomatsi@gmail.com>
-Date: Sun, 13 Jun 2021 15:51:51 +0300
-Subject: [PATCH] include: disable debug messages
-
-Disable debug messages to make rtl8189fs driver less noisy.
-
-Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
----
- include/autoconf.h | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/include/autoconf.h b/include/autoconf.h
-index 44efe42..b5df57b 100644
---- a/include/autoconf.h
-+++ b/include/autoconf.h
-@@ -224,8 +224,6 @@
- /*
-  * Debug Related Config
-  */
--#define CONFIG_DEBUG /* DBG_871X, etc... */
--
- #ifdef CONFIG_DEBUG
- #define DBG	1	// for ODM & BTCOEX debug
- //#define CONFIG_DEBUG_RTL871X /* RT_TRACE, RT_PRINT_DATA, _func_enter_, _func_exit_ */
--- 
-2.32.0
-
diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index f9772f2a89..d5d18a8ba8 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  fd74248b8cc62e54a954502228be221ace6051832a972b8b3005cc05e9c87761  rtl8189fs-73f826f0fa74b2fc1ad67eaf92bf9787947ae673.tar.gz
+sha256  41eee18d8a4289c2eac07af3224c62214a9b694a717bf497cd34a95b955f3d49  rtl8189fs-94a61cbf46ce87b7c9b8aa53123aeb142133a3c9.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index 0cca0b751d..6031a3072c 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189FS_VERSION = 73f826f0fa74b2fc1ad67eaf92bf9787947ae673
+RTL8189FS_VERSION = 94a61cbf46ce87b7c9b8aa53123aeb142133a3c9
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
