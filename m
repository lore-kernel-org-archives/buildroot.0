Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0952CC6FD1F
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 08:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA74E41689;
	Wed,  3 Apr 2024 08:42:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gsMxSpE9grIE; Wed,  3 Apr 2024 08:42:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFCE24168E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFCE24168E;
	Wed,  3 Apr 2024 08:42:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 08B881BF44A
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9C2C82027
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:42:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yhgtPtdvYQke for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 08:42:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 64DC782023
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64DC782023
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64DC782023
 for <buildroot@busybox.net>; Wed,  3 Apr 2024 08:42:10 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-56e05fc2421so736633a12.0
 for <buildroot@busybox.net>; Wed, 03 Apr 2024 01:42:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712133728; x=1712738528;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yjzIavNefky2c/GiWVbUVJNnTYJer+GV764r8/cquNE=;
 b=II62IjZDMzT4kRchsFvxBhDuHdD/6XB4LInMdjR1cCeGdOFlDf26ajAIly/gLenE0l
 mic6IiIrP3HJ72KZFeee6CG4thuF2C6yXdTkHyHq5BFopfEZFrQ7l6NVlOBxMrApfElq
 idOKgYOAHnHRGznZT6ZwBYkqMS9jslsCJ6yzKCrWByVwgekpreDLXKPCxwJ5aswzikiw
 1X5bW0/HurInotmjd0RvxTxfnEtm74vb/57NzKM4nG+1vab4iEkzAxBnUJNS+k01bMDD
 jWdVsfqp1o+F3409X2L0LARbEpha1+9H/agc1yuFhu2uJgCLZnXadVZmnTwGOZGtAK9+
 AolQ==
X-Gm-Message-State: AOJu0YyfGRU/pWvYUVZxEKN0e7hEuFtn0xmXq95zv3n00LwYS8uUcua4
 BJlolczUEGFtydxo2v2eztGYgPwPoTiF5q5TROCoLkADjhTnE2jFVVTc/C8Ec5CWShHgdvRGa2k
 =
X-Google-Smtp-Source: AGHT+IHWhbOpteOz8EDAZ6ssjzvKeP7O27qf3he/6tW3UWD7NcjEpV4rfxbhtqbm6jlVaLOZjrRukw==
X-Received: by 2002:a17:906:f583:b0:a4f:389a:22be with SMTP id
 cm3-20020a170906f58300b00a4f389a22bemr802168ejd.37.1712133728026; 
 Wed, 03 Apr 2024 01:42:08 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 dp12-20020a170906c14c00b00a473a1fe089sm7518825ejc.1.2024.04.03.01.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 01:42:07 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  3 Apr 2024 10:42:03 +0200
Message-Id: <20240403084203.512309-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1712133728; x=1712738528; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yjzIavNefky2c/GiWVbUVJNnTYJer+GV764r8/cquNE=;
 b=CRWa+V3dw+6qBSrC99yBRoXU/FsuebNotlzlOjkcxbhQ7w6IRJVWbd3fC/m8roD+rl
 35acOyTVpg9K72lE5tU8pVmzZX2hUczC6jzBeXDCt+MlMbmABG1H5A2FVjhXRFJqjM+n
 DDZgtax7BhavnVPgIZ40FylWrQF1GR8cCSoKRZT9OFtxBm7TN+mgjyoC5JtAvG5uWnVZ
 uoIqer3h5oBVJ+LILmELLwS02HVCAp2Bd6bonu0ZkkePGsN24QMdTiqRNc5Vlz+CfFzF
 uW+zBCGI7BOsWU6hC7EF/w1VhLFxokF4O+95RiubZax8wlNIHR0JOhwiPCC2McN5Occ2
 KcBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=CRWa+V3d
Subject: [Buildroot] [PATCH] package/libressl: bump to version 3.8.4
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
 package/libressl/libressl.hash | 2 +-
 package/libressl/libressl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index 40b49dbb8..5d3b54ea9 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256  6d4b8d5bbb25a1f8336639e56ec5088052d43a95256697a85c4ce91323c25954  libressl-3.8.2.tar.gz
+sha256  c0cef9cfe174ac366ce482f542fddb07721e7fa0caface34b49a8720fa37fe7d  libressl-3.8.4.tar.gz
 # Locally computed
 sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index b72f3b38c..1d90aa853 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 3.8.2
+LIBRESSL_VERSION = 3.8.4
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
