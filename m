Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89ADEC433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CEE560E59;
	Tue,  1 Nov 2022 22:23:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CEE560E59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 55a59ElydpLe; Tue,  1 Nov 2022 22:23:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F1D660E4A;
	Tue,  1 Nov 2022 22:23:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F1D660E4A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 661701BF3E8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 418AD405BC
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 418AD405BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uLK4olsyhVs6 for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:23:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F5AE400EF
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F5AE400EF
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:23:40 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id l14so22071815wrw.2
 for <buildroot@buildroot.org>; Tue, 01 Nov 2022 15:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9pBE6HBFENU9POS7OeIirejT93e3we4C2sVIB6yPlB8=;
 b=GoZ/ek8/oN5e1Wqo1IUVoi4hToULZFlaiLIaEjI1yZ5DOolO8+rCetSlPSCHeMOJqS
 HQtJS7t4wIbhJ5QG5gLFsa39EdDsGV3kOLML5zFXwaU1BnwCOHQSu1423sOEX0O545XX
 kySynCAiW9JNCjiwAf3ChLDIrCEDVq8VXxFSoFdWMEqG8a9SPHdJ8w0+o7zJtuhPttMz
 KWS/y9KbgSPIbrKgkCg6w9XUqG0aCzZr7OK5MBdbiuufCFTu7mJiWNvPRGMVHjYa4Bpz
 qlhJGTLYDVQp46Mub++Mg2HwWvloGolicpIjly18f8O1IYqahUbILkKa0p50XHYYKtDQ
 7xCQ==
X-Gm-Message-State: ACrzQf38Zes1TkRM7l/17SlQ+Y5opokvAnbnpWgCRWS3ibrGKQO2B0fT
 pJhH4vZwuJVc5NFFmOzbSJMBOs88IgI=
X-Google-Smtp-Source: AMsMyM5vhkjsbV52s4jb/W+gK/jowUopBo47oAvykMqi3CM1ZzfunMUq2kROOLs9I2aHiJvOsma+8Q==
X-Received: by 2002:adf:e985:0:b0:236:6a53:3a16 with SMTP id
 h5-20020adfe985000000b002366a533a16mr12546195wrm.501.1667341418022; 
 Tue, 01 Nov 2022 15:23:38 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 i203-20020a1c3bd4000000b003cf7292c553sm60693wma.13.2022.11.01.15.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 15:23:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  1 Nov 2022 23:23:36 +0100
Message-Id: <20221101222336.434052-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9pBE6HBFENU9POS7OeIirejT93e3we4C2sVIB6yPlB8=;
 b=CKl0WDYNOVR+YcgDB/g/i1FFrAcjWu/s9FaIuSK0YLD7PsiyO8T79noSz6/QUnbmuD
 I+nPLFHg5Fled7X5rjdAu94Rj6KS8PtgdqMG27iIP0xGU39SFSCLpFX+GsqNL48H6u3I
 UMamgV46GcJcD/CF14VtbpAfnSjv5LUyGtwmyMC2rgZwP2KCBE/dNjecsy91oG91TBcI
 mICxGdSG9ZOHLgBuHgTkwXvmWAb9crLkazD+1zOZifldybGTIibkQQT4a/P/2ZvZdXco
 rKnB4Q/x5mo/ylWQ+upqzZiUZkOBxLWh51eQ2x/jHJ703iOjl8Ah6m9l8otyWgmZ1nZ0
 TWmA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CKl0WDYN
Subject: [Buildroot] [PATCH 1/1] package/quazip: bump to version 1.3
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/stachenov/quazip/releases/tag/v1.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/quazip/quazip.hash | 2 +-
 package/quazip/quazip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/quazip/quazip.hash b/package/quazip/quazip.hash
index bcb16acdc0..16d299fdf4 100644
--- a/package/quazip/quazip.hash
+++ b/package/quazip/quazip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2dfb911d6b27545de0b98798d967c40430312377e6ade57096d6ec80c720cb61  quazip-1.2.tar.gz
+sha256  c1239559cd6860cab80a0fd81f4204e606f9324f702dab6166b0960676ee1754  quazip-1.3.tar.gz
 sha256  b455b21b0d31d6e51993f1fb7e0694c75fa0eb0519a9ea62e4815fcf48b140b0  COPYING
diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
index 7731e59d94..f4de2a11a4 100644
--- a/package/quazip/quazip.mk
+++ b/package/quazip/quazip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUAZIP_VERSION = 1.2
+QUAZIP_VERSION = 1.3
 QUAZIP_SITE = $(call github,stachenov,quazip,v$(QUAZIP_VERSION))
 QUAZIP_INSTALL_STAGING = YES
 QUAZIP_DEPENDENCIES = \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
