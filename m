Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308EACDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 12:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D192660EDC;
	Sun, 15 Oct 2023 12:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D192660EDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sIbBtFWvyUsi; Sun, 15 Oct 2023 12:47:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDA9460B8E;
	Sun, 15 Oct 2023 12:47:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDA9460B8E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C577C1BF489
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 12:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E2FD81E64
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 12:47:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E2FD81E64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qxeMzDxr1tnt for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 12:47:01 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8998A81E58
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 12:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8998A81E58
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-405497850dbso36316995e9.0
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 05:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697374019; x=1697978819;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZSFmmSJJllg1MMkNIAW3brigfZF80CtOSqAtYtA4EeE=;
 b=hqbctoVKb2PEB9S+qeil9ruE/AfzHjkoqrIRAZ1xZ479lPcShcsfBV4z0kKX+m/LeB
 zw+pgMdELqnMt/b7os8wnlp/Ccuhs/nYnAU+PrlYCG2slyzqNdXODZA8D+U2PUKZb9CP
 bLeGoDLcmvMqzbLX4xlUSxNFWTw+/3U9rNJpFnaW9AXyukrUz7U807gHANNgz8/rD5n4
 uNvUmsTLYw8VT2QmXJ50hx5h9yOHenhWkuLqYpPSxCTr/b4X+tbZmphdN4M8sPcD+Bgc
 cwUsUQ8E9Q79sfI2x6aZl2IA5PammPA4JFOkb6WJbLBtX+uq3UaOZOEsiUKTqOvVUiIm
 un3Q==
X-Gm-Message-State: AOJu0Yw9Ff2bLshG5DZlzuziJGQgKIotYC3Dwl2qN7XF2oYyNNQaO7vQ
 pZZmFE/eYgrNitTi1s5y5ESmkeQ/LcQ=
X-Google-Smtp-Source: AGHT+IH68XfEp6nXbxnv0Yx5DxkwWVgIOSvix19o1NCJu6eg5hWe9cHiDX2+5eDah4ow7d2RAtw7lw==
X-Received: by 2002:a1c:4b18:0:b0:404:4b6f:d705 with SMTP id
 y24-20020a1c4b18000000b004044b6fd705mr28044003wma.17.1697374018757; 
 Sun, 15 Oct 2023 05:46:58 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u18-20020a05600c211200b00401d8181f8bsm4393090wml.25.2023.10.15.05.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Oct 2023 05:46:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 14:46:53 +0200
Message-ID: <20231015124654.197965-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697374019; x=1697978819; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZSFmmSJJllg1MMkNIAW3brigfZF80CtOSqAtYtA4EeE=;
 b=AFYEQE30k+xTDK0C0nXNG7xFD5/yNXG+ZWCAZaupesYQtiC5h5KcWr+TsrUSDZvD4E
 NrrGfvPXCFC4nCtKnTF6ORVB36dT+en5G4KI+y0S3nlzfrOTaRvNkExtYMMa5zja14UE
 dIFBfoKDnx+kEXtHUeyiPSNW3jogCcc8YkOzRmMazCYTk532Oi80KVd4JPNhgIrWB1Uh
 OybBqEXEAKf41OIuF3gRq3uZep4ncVEsQ/KcunuqHHSSFPdGvaAvAggbI1hyGZjvftXP
 gVXRcS0l9sBTe5nHPIrIqafr/nb3M1UOj2/Hi0dCmWlWqiLYegcmGumMBnI2nWFVX1wE
 JsVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AFYEQE30
Subject: [Buildroot] [PATCH 1/1] package/libpfm4: bump to version 4.13.0
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

https://perfmon2.sourceforge.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpfm4/libpfm4.hash | 6 +++---
 package/libpfm4/libpfm4.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpfm4/libpfm4.hash b/package/libpfm4/libpfm4.hash
index 42740adb1e..80dc66c62e 100644
--- a/package/libpfm4/libpfm4.hash
+++ b/package/libpfm4/libpfm4.hash
@@ -1,6 +1,6 @@
 # From http://sourceforge.net/projects/perfmon2/files/libpfm4/:
-sha1  4c61cfb489426d9fff15428cb8536ba0e391c8ac  libpfm-4.12.0.tar.gz
-md5  9e4f9b89d23171eb9314a948a51b4284  libpfm-4.12.0.tar.gz
+sha1  bcb52090f02bc7bcb5ac066494cd55bbd5084e65  libpfm-4.13.0.tar.gz
+md5  673aaf0613f8fd1d886b4c5867c2fef1  libpfm-4.13.0.tar.gz
 # Locally calculated
-sha256  4b0c1f53f39a61525b69bebf532c68040c1b984d7544a8ae0844b13cd91e1ee4  libpfm-4.12.0.tar.gz
+sha256  d18b97764c755528c1051d376e33545d0eb60c6ebf85680436813fa5b04cc3d1  libpfm-4.13.0.tar.gz
 sha256  beef323d68fc5db9c67b20e8e9de7ccde371d20cdbcdd686804055b18b926d90  COPYING
diff --git a/package/libpfm4/libpfm4.mk b/package/libpfm4/libpfm4.mk
index 7165d78cd9..1a18a31ce8 100644
--- a/package/libpfm4/libpfm4.mk
+++ b/package/libpfm4/libpfm4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPFM4_VERSION = 4.12.0
+LIBPFM4_VERSION = 4.13.0
 LIBPFM4_SOURCE = libpfm-$(LIBPFM4_VERSION).tar.gz
 LIBPFM4_SITE = http://downloads.sourceforge.net/project/perfmon2/libpfm4
 LIBPFM4_LICENSE = libpfm4 license
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
