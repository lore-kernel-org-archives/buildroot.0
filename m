Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4379FEEAA78
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 21:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF17E40474;
	Thu, 14 Sep 2023 21:56:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF17E40474
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QczyLbdyAbRb; Thu, 14 Sep 2023 21:56:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F7C0405CB;
	Thu, 14 Sep 2023 21:56:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F7C0405CB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B7CF1BF855
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1206040474
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:56:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1206040474
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5RjXixFequDT for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 21:56:14 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09CCB400D1
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 21:56:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09CCB400D1
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-403004a96eeso15683385e9.3
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 14:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694728571; x=1695333371;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cgung2ytkCBm5ymo83BK4dKH7dPvIUSEPkCzcx9uC0I=;
 b=G4+pYCcKzOVj1Get1mFX9Vt1pKrc+pHL2MbcRI3QtEV3cfhKMDx/RO7d7oOE0fxQql
 vEX3xOKIAUi6Rzi/iKeBKqSzcnHA2mxPDpF1mGaUJTc0+je6Lv4LbcUGhfaLmTtVrZQJ
 yhrPpI/8CQiIb7/ao58vzLkOSH6xAPrQJeqKuR0qqA8JNoURGE4uUURU3e/WsxjzFvU0
 7xxtqO7o7oW8LndMvpCq9CRZZ2mI/3sBtADOs2ylQgLa3Vusfusp45ZNPx10f3ZJge+3
 BrO8VZY2mbTiy/g+W9JeeNnmVATPrjQVGcoD4t1gqRNEPzvvUyepMsQvwPGmVnsGaJLq
 EE2w==
X-Gm-Message-State: AOJu0YwhANcz+Cam7PibLGuX+bi5zreeCbuuFEzET+HYeZoWL6XTL/TV
 qC/KGFIZEtOXAHqMX0X2+kEYooqdO34=
X-Google-Smtp-Source: AGHT+IEoQhMGo0WnTK6RL8XmTXfiE2PDgCnxnyYkkp6R0Kw3JfUi++u6DZUR8Cf6QOOZHRHzR90/rw==
X-Received: by 2002:a05:600c:2194:b0:3fe:ef11:d79f with SMTP id
 e20-20020a05600c219400b003feef11d79fmr25102wme.36.1694728571305; 
 Thu, 14 Sep 2023 14:56:11 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v26-20020a1cf71a000000b003fe1630a8f0sm5905978wmh.24.2023.09.14.14.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 14:56:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 23:56:06 +0200
Message-Id: <20230914215606.309735-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694728571; x=1695333371; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cgung2ytkCBm5ymo83BK4dKH7dPvIUSEPkCzcx9uC0I=;
 b=bA9CTgo70PA/FXYeb2wmXA8qkz/z7MJ8vSGwbegvKf3oJQ8PPL8li0SU3RlPYwEtVg
 ssnPZNLi1aDVTKQkaUfAbJMEaq5L7XO8sfjMJuE0SvQFLggtXvELkp7R0s62wDR6DfIT
 0tD7mKc9ZHvpu7FxyXEucHDuvXqwyRFLVA4yBwnUx7KWabVs2e3nYe5KvpTvRS7P/dhZ
 Jt395y6qfyYMWmDIO/MeLqeLqYEQ7GjI67c7poFzmbOOYSA0JCq6I0afUknxKi+pGD3Z
 4OKSoDDoVge+9Uk4+42BlR2B0Sk7rL+qo1lqh5DfRng2k5srx2K/dDosv5qp1DaLVoww
 fHUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=bA9CTgo7
Subject: [Buildroot] [PATCH 1/1] package/libjxl: security bump to version
 0.8.2
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2023-35790: An issue was discovered in dec_patch_dictionary.cc
in libjxl before 0.8.2. An integer underflow in patch decoding can lead
to a denial of service, such as an infinite loop.

https://github.com/libjxl/libjxl/releases/tag/v0.8.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libjxl/libjxl.hash | 2 +-
 package/libjxl/libjxl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libjxl/libjxl.hash b/package/libjxl/libjxl.hash
index 6b4c9d8d0a..c8f98d10ea 100644
--- a/package/libjxl/libjxl.hash
+++ b/package/libjxl/libjxl.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  60f43921ad3209c9e180563025eda0c0f9b1afac51a2927b9ff59fff3950dc56  libjxl-0.8.1.tar.gz
+sha256  c70916fb3ed43784eb840f82f05d390053a558e2da106e40863919238fa7b420  libjxl-0.8.2.tar.gz
 sha256  8405932022a556380c2d8c272eff154a923feb197233f348ce5f7334fb0a5ede  LICENSE
 sha256  91915f8ae056a68a3c5bdf05d9f6f78bb6903e27a8ca3a8434c9e4ac87300575  PATENTS
diff --git a/package/libjxl/libjxl.mk b/package/libjxl/libjxl.mk
index f603327bf6..47c110eb53 100644
--- a/package/libjxl/libjxl.mk
+++ b/package/libjxl/libjxl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBJXL_VERSION = 0.8.1
+LIBJXL_VERSION = 0.8.2
 LIBJXL_SITE = $(call github,libjxl,libjxl,v$(LIBJXL_VERSION))
 LIBJXL_LICENSE = BSD-3-Clause
 LIBJXL_LICENSE_FILES = LICENSE PATENTS
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
