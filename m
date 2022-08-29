Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C785ECAAD2
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 06:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3526060F29;
	Mon, 29 Aug 2022 06:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3526060F29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zv4MIhVXj4Ss; Mon, 29 Aug 2022 06:25:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5091B60EFE;
	Mon, 29 Aug 2022 06:25:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5091B60EFE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0D91D1BF32A
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 06:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB31E4159D
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 06:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB31E4159D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pEn09UK1bALk for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 06:25:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6039641528
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6039641528
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 06:25:39 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id az27so8852905wrb.6
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 23:25:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Xj0tSeiMB0hmvg12XRnImnqBY5AqaEL1R+RDGAWgEog=;
 b=dYFd7eu7F6eFBksk4LJShCUunRg+r50DmzaXW1lslzbm3/pxUvDmYxTj1Zd5LPst6s
 Rgy7ZRtaOqNlrwDb1PEuDpip+V95Rvvi4/N6SDbFJievM1Vvyt6zgKQfJ6H9G+Ypljml
 +2FTxjI6v8t1jjLt+8cZoC56igxNxRKODs3GeW995QvihC90OqcRv1hxzHPstEE9s6IC
 fhcMCD0iDrTOuQG+bpDy7JVnEKyG8y/A1Z2mCcb2KZEgxbwH6kG8xaFSv96AicNtM4oN
 fPc01rrel7whgLXf8UjBbWeOzgNZUOW41lVpbaIAXcxM/dZI2BrteuVQOjEpt5X9rkM6
 8cGg==
X-Gm-Message-State: ACgBeo0sHGpL7zNZJ6Mf2D4JJ3pHZnjDDYUlC0S+1A1fLm3KYZAPzxDJ
 GRR6MeiuI1PHf3vrvEkynC64VzACeIw=
X-Google-Smtp-Source: AA6agR7xOSdeBkM7g6HZ4fIixW6c0qkmaxsaX3U8I/oZSDhLc/N/FRvG6lUFO2oQfKxTtlXysNrh4g==
X-Received: by 2002:a5d:6484:0:b0:226:dd0e:b09c with SMTP id
 o4-20020a5d6484000000b00226dd0eb09cmr896104wri.388.1661754337389; 
 Sun, 28 Aug 2022 23:25:37 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 s9-20020a1cf209000000b003a60f0f34b7sm7721471wmc.40.2022.08.28.23.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 23:25:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 08:25:33 +0200
Message-Id: <20220829062533.47384-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Xj0tSeiMB0hmvg12XRnImnqBY5AqaEL1R+RDGAWgEog=;
 b=fqQv0S0nGFNpPXXeDWvxILSeKXXxzKwGiR3ZcwCpNGgb6EUo3AKn9y9WxdXzTdkmYC
 3gg+1xxB6yPZiEnJQQkL41ujtkjCpy7dBFA3r7beLRJtqTdHbzFUDb87eOpRiMDhhTqj
 pGPtclj6QhosFeNACAHWHKTSs2dACO2rCvotsWR1YC+9AUsmaAlQDQWXJfQs+CU3wFgq
 sc5qNeQucKv5w2hi6FmEoh/0uzPofmgqmuYjbHddjdv5aNe9dKAmPcYHb+lGNJ8OL5du
 f++NiPo/DeE/K+QFkkXPwU3s+HXtZxvliNIkNP99WdaPsGxaDM33qc9+L8/mu56rJMrx
 AI1g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fqQv0S0n
Subject: [Buildroot] [PATCH/next 1/1] package/libzip: bump to version 1.9.2
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
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash of license file (contact email address updated with
https://github.com/nih-at/libzip/commit/401ef3dd977066bc8f9b9ae53ce60934501b47d0)

https://libzip.org/news/release-1.9.2.html
https://libzip.org/news/release-1.9.1.html
https://libzip.org/news/release-1.9.0.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libzip/libzip.hash | 4 ++--
 package/libzip/libzip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libzip/libzip.hash b/package/libzip/libzip.hash
index 5afdfd7cb8..26c038e4b6 100644
--- a/package/libzip/libzip.hash
+++ b/package/libzip/libzip.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f0763bda24ba947e80430be787c4b068d8b6aa6027a26a19923f0acfa3dac97e  libzip-1.8.0.tar.xz
-sha256  deae392de70503672793ee784d603bfa8069dcd5974a325dfbf91160f3a147d6  LICENSE
+sha256  c93e9852b7b2dc931197831438fee5295976ee0ba24f8524a8907be5c2ba5937  libzip-1.9.2.tar.xz
+sha256  01c022eca6d566e2e8792fd0f091a28653b2a608319922bcd4de91c49d1438e1  LICENSE
diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
index 6bc5c5c193..0c9d66d877 100644
--- a/package/libzip/libzip.mk
+++ b/package/libzip/libzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZIP_VERSION = 1.8.0
+LIBZIP_VERSION = 1.9.2
 LIBZIP_SITE = https://libzip.org/download
 LIBZIP_SOURCE = libzip-$(LIBZIP_VERSION).tar.xz
 LIBZIP_LICENSE = BSD-3-Clause
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
