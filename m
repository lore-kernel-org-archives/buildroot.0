Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0A9C28D13
	for <buildroot@archiver.kernel.org>; Thu, 25 Aug 2022 15:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A6A783E18;
	Thu, 25 Aug 2022 15:26:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A6A783E18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FQ7EZaSk05Bw; Thu, 25 Aug 2022 15:26:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A876983005;
	Thu, 25 Aug 2022 15:26:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A876983005
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8EBC91BF36D
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 15:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6822E418DE
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 15:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6822E418DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5xUdxK9rImbD for <buildroot@lists.busybox.net>;
 Thu, 25 Aug 2022 15:26:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F295418D7
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F295418D7
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 15:26:31 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id x23so18821075pll.7
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 08:26:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=GrW8kpEJhV1W+DOsyGGN7iAi/bzkL/7Ejkh2H/n3ulY=;
 b=KbWRhPTsWYmCucihl6qlzi2hmGG5TIUuFNt8gSB3WcN/PAPtl6gAjts8ro6JIF1BgR
 YFFK4/elRhgk9VlilW0H2Jd2hzTR9N8CrsLKGlUXzEv/bksg5ZBDqgRpxRqLWnras74M
 e9Zi9d3A7Isk8YMUyO8oPYJZHPPYFz5Jc56+3WYSUq/oLKCEGN2Qh7Gt7/RCOd95CpoQ
 S75KK/r5Zo3LZ101MYOXWCWTkzb9bZr7SRAhrBtppcCa8lyR+SyVI25RHBm4EriCsm9U
 zWuE278z3h85uuJu1PwI8s8lwwF5+k6cMPvid1dy5EYzRVE3Lb1MiFEGBtu65CNpLauk
 adtA==
X-Gm-Message-State: ACgBeo0aQamS7XaHK8y1I1a4K74iceeqa5+DqKpwXZByflCnbd2SlueI
 RS7t8bfhIRoh6MX2QYeXz2mH+dZzmisD6g==
X-Google-Smtp-Source: AA6agR7DuWDsxXVJS2NnayfwXF0dr4ZIvDpWCbr25UiKZDoSS2zX84fiXmw7YwxMBaCRRswofzZthg==
X-Received: by 2002:a17:90b:3e8d:b0:1fa:facf:672f with SMTP id
 rj13-20020a17090b3e8d00b001fafacf672fmr5377662pjb.0.1661441190229; 
 Thu, 25 Aug 2022 08:26:30 -0700 (PDT)
Received: from smartcross-dev.lan ([2605:52c0:2:32c::])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a170902758600b00172a2a41064sm14598427pll.298.2022.08.25.08.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 08:26:29 -0700 (PDT)
From: Andrea Daoud <andreadaoud6@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 25 Aug 2022 23:26:09 +0800
Message-Id: <20220825152609.158953-1-andreadaoud6@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=GrW8kpEJhV1W+DOsyGGN7iAi/bzkL/7Ejkh2H/n3ulY=;
 b=U47ixYFKetwTGoPcKXz77B9E1UPJCEFeK8lP3/R+lR3g/i7Ih6nLuPsiEP+nLUTl2W
 +31gCpNuhguKRTUrSCjN/XyweRGK0oT7/NhbuXGJhdv8KXtM3CoZwUdjgzqfm3nvn22o
 VnwWy15znOmHbyCOc+83qxM7JIWf+M3+/tqsl4eQdogzJChPBcqjHqEfo06ihdxAMide
 IvOjQO0l75Kgi/et1eNqDifKAewRfg/a5HMAkebuFlH0kHOoOMksIipzfrvCd5GwDsaZ
 2PYeZOzU/vx1O6rkpHtsS4uSelx2vsbwRqkiLADBXznUTPsvHmicdmZB1xhSipuQaG0s
 tXfw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=U47ixYFK
Subject: [Buildroot] [PATCH 1/1] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.65
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andrea Daoud <andreadaoud6@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bluez 5.65 contains various fixes.

Signed-off-by: Andrea Daoud <andreadaoud6@gmail.com>
---
 package/bluez5_utils-headers/bluez5_utils-headers.mk | 2 +-
 package/bluez5_utils/bluez5_utils.hash               | 2 +-
 package/bluez5_utils/bluez5_utils.mk                 | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bluez5_utils-headers/bluez5_utils-headers.mk b/package/bluez5_utils-headers/bluez5_utils-headers.mk
index 2f3a290ea8..565511120f 100644
--- a/package/bluez5_utils-headers/bluez5_utils-headers.mk
+++ b/package/bluez5_utils-headers/bluez5_utils-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils
-BLUEZ5_UTILS_HEADERS_VERSION = 5.64
+BLUEZ5_UTILS_HEADERS_VERSION = 5.65
 BLUEZ5_UTILS_HEADERS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_HEADERS_DL_SUBDIR = bluez5_utils
diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
index 0324dd2d77..e0c9f3cdb9 100644
--- a/package/bluez5_utils/bluez5_utils.hash
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
-sha256  ae437e65b6b3070c198bc5b0109fe9cdeb9eaa387380e2072f9de65fe8a1de34  bluez-5.64.tar.xz
+sha256  2565a4d48354b576e6ad92e25b54ed66808296581c8abb80587051f9993d96d4  bluez-5.65.tar.xz
 # Locally computed
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 8e2c657899..76070dc3a9 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils-headers
-BLUEZ5_UTILS_VERSION = 5.64
+BLUEZ5_UTILS_VERSION = 5.65
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
