Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A21C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 13:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D62DA83EE5;
	Fri,  5 Jan 2024 13:26:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D62DA83EE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2KtI_LJjgUwf; Fri,  5 Jan 2024 13:26:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C0AD83DCD;
	Fri,  5 Jan 2024 13:26:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C0AD83DCD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 10CAF1BF995
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD38C436F8
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD38C436F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I-dzxUMaoHHu for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 13:26:25 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A863E435DF
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 13:26:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A863E435DF
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40d76fefd6bso13704815e9.2
 for <buildroot@buildroot.org>; Fri, 05 Jan 2024 05:26:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704461183; x=1705065983;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HYsPw3+FymntZBDYfQFonyJP+5CW2aSlWd8XgS3Pw0I=;
 b=gxb2ABUarRNfgn3sn6cXS1MF5iyWKeYZqI7J9OaUBCrapXvTPXZ8LY4D9A67b7YJfe
 c6q4g1cUslMER5OPOT0wzpAC+y+b36FHXG4i+VOjEX1XDxuABcemEVWI2cAKrPsWBS0Z
 j8Ky/bJByKXACBH76n5dqGnqq2aWBgWheGxdc8WzyUWJKL2LqiOCYyl0cXiASryJDXqZ
 NCeZ0V4eyCm1lYRJrMUARPxyV0t5fORh/IfwyAkwKW4TnREw5kGhzETOGJUgJQY02u5R
 lgt8vTAeMRlDX3owVyp4DNoYAq5C4qjAm1xpKzXUBaES0+FXnJPrXrzNp2Pkc0xQLClG
 +iJQ==
X-Gm-Message-State: AOJu0YyPzwYcDbBQIawq5OnqQpZyAmXbg75DGEbRV5xAJWmmnPyt2wFR
 NwWC/RNs9UIv/6ixXAbqe/cw0wIhb50=
X-Google-Smtp-Source: AGHT+IHKgLoKRvhYAaDAIJ2GplAw0aRwHr5oLxRgGwdZffzMm0xy9CtLs6bLnKJdmiJRIz72Qv6fzw==
X-Received: by 2002:a05:600c:a06:b0:40d:898d:5c7e with SMTP id
 z6-20020a05600c0a0600b0040d898d5c7emr594301wmp.237.1704461182853; 
 Fri, 05 Jan 2024 05:26:22 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 fa17-20020a05600c519100b0040d7b1ef521sm1555966wmb.15.2024.01.05.05.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 05:26:22 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Jan 2024 14:26:21 +0100
Message-ID: <20240105132621.506262-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704461183; x=1705065983; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HYsPw3+FymntZBDYfQFonyJP+5CW2aSlWd8XgS3Pw0I=;
 b=dubd1LzUgSnUNVVJ04oupVwDnxBioJ+8Uxkm4IkjZVDGV35c/u7y7PIvbFWA367xR9
 j6yLALNbtoqbaEYYcPLLxZss3Zc+ml4oY1li1LqZ41KZR3ir2yjgvklkO8kFE22Fy+58
 p9S5obB4HmvW8LnZFpgKHplf0MSDDwCU3kO+hbH0qnfyMb4LUbxUCS5gSvIMex36E7eC
 CU5kdIuVCwzZr7g4dPNHoazOrN36q4HjYKb3zlFpjyX44Mvta2hKk0hPXVqKmnkqdLJx
 +ys8V0b84Xxyl0/aTpGrnbRvkmoAJlb/D044rDXN+sVsCss+WlCAUkfpzKDQZlUdrcQr
 DeXA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dubd1LzU
Subject: [Buildroot] [PATCH 1/1] package/subversion: bump to version 1.14.3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://subversion.apache.org/docs/release-notes/1.14

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/subversion/subversion.hash | 4 ++--
 package/subversion/subversion.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/subversion/subversion.hash b/package/subversion/subversion.hash
index d2239b1b5b..2710e9e3f3 100644
--- a/package/subversion/subversion.hash
+++ b/package/subversion/subversion.hash
@@ -1,5 +1,5 @@
-# From https://www.apache.org/dist/subversion/subversion-1.14.2.tar.bz2.sha512
-sha512  20ada4688ca07d9fb8da4b7d53b5084568652a3b9418c65e688886bae950a16a3ff37710fcfc9c29ef14a89e75b2ceec4e9cf35d5876a7896ebc2b512cfb9ecc  subversion-1.14.2.tar.bz2
+# From https://www.apache.org/dist/subversion/subversion-1.14.3.tar.bz2.sha512
+sha512  40b172492005fd3b0cd9e457b4444af8ea5d8ff8fc161a9a0c6dc3a7314c6ad4ff75a4676f68a1919ae6273ae03e34d04eba8c1c37b8c0b4ec70d6731b527b41  subversion-1.14.3.tar.bz2
 
 # Locally calculated
 sha256  484aff0cfbb81155a10f903ed756e27e9fc65578c245a295bae295c4bb51eaad  LICENSE
diff --git a/package/subversion/subversion.mk b/package/subversion/subversion.mk
index b27058c024..bc0b9b45ab 100644
--- a/package/subversion/subversion.mk
+++ b/package/subversion/subversion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUBVERSION_VERSION = 1.14.2
+SUBVERSION_VERSION = 1.14.3
 SUBVERSION_SOURCE = subversion-$(SUBVERSION_VERSION).tar.bz2
 SUBVERSION_SITE = https://downloads.apache.org/subversion
 SUBVERSION_LICENSE = Apache-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
