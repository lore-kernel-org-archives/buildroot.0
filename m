Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F16BC28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 11:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A59B1415B5;
	Mon, 22 Aug 2022 11:50:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A59B1415B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T0etRzQwszAF; Mon, 22 Aug 2022 11:50:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 669E041575;
	Mon, 22 Aug 2022 11:50:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 669E041575
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8BE2A1BF418
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 11:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 648CE41575
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 11:50:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 648CE41575
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ixbi7zkulYz for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 11:50:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A922B41570
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A922B41570
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 11:50:41 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id d21so1299739eje.3
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 04:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=kpv+Q9QZHN8yHj+QUrdEWe1bWUpy3yQNIbGHkQGrLlw=;
 b=xKik+vHh6EP//fOUXGZ59uUrvHvknEU60W3/9CnQvW6Fo1RgvNXvptKyv72OQBfka2
 wYLTJHTfTokGpoEjo706MpuLQvEgsmQEP/Du9TxhfoPO7i6Bt9xklEmVPBaSu0MBK3ud
 L63dU1JkYSDtbtRpo3hsi3mDYn4WSTvp7wj+WnuWjMLVwV5MDZTku1mYTqhVV8Cr6Glg
 wz9z6n/gCsGnvjZAGWgNuQh4DiJ0WGbpMRZZmDof0f5iTK2vrMDKXzMprFi85WZ9H8fw
 CBhb4NLAOF7g+/95YIdya0hDY4nZWq6wUiYvsFYvUnkKP2N1aDogKwfmRP42OV94Motl
 1P6Q==
X-Gm-Message-State: ACgBeo3pOFY2aA54KFBWiRFpM4V5x/QMQ4TquE5umUKFkeFgEUMZm7xI
 6o2GzoIJT+UPum5P/5WoKSfCRRnUh0abHg==
X-Google-Smtp-Source: AA6agR7svAilo5IPN4j1y1XUEleNmTbVRF9z13fKxhOqdHS3VIe3gtTEBaZpcZx8/EyXk6VLsfUWPg==
X-Received: by 2002:a17:906:fd84:b0:730:acee:d067 with SMTP id
 xa4-20020a170906fd8400b00730aceed067mr13266583ejb.206.1661169039606; 
 Mon, 22 Aug 2022 04:50:39 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-31-31-9.retail.telecomitalia.it. [79.31.31.9])
 by smtp.gmail.com with ESMTPSA id
 h21-20020aa7c955000000b0043d5c9281a3sm7987535edt.96.2022.08.22.04.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 04:50:39 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 22 Aug 2022 13:50:36 +0200
Message-Id: <20220822115036.1676570-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=kpv+Q9QZHN8yHj+QUrdEWe1bWUpy3yQNIbGHkQGrLlw=;
 b=fbNPA4seGRljlyatWlBFG4UIDFVnPT8P4pa7WuHNKyELbHVb3QX8aKKsuiCCrtX74L
 BByHZptyTYvgBmN2J/6yBEfTB2QjjymxrNetAyZ4H9bbVsRYa2swyH3s+/jY6FkI9TIC
 6K4uQPJN5FFTNV35xZ6OW4TpDIjK+8coUcQVM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=fbNPA4se
Subject: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.4.240
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/uuu/uuu.hash | 2 +-
 package/uuu/uuu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index 7291f93c523e..9396926781bb 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  b8b7fcd0e8eca64a255bf2b964bfb39a97599670e5258858421b27ff86aac80f  uuu_source-1.4.224.tar.gz
+sha256  2a1971438f70f77fae0578fb59b831d1e6de38f8c63f0f26e516248d9451a057  uuu_source-1.4.240.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
 sha256  52b1828ddb508a180cf9ad159b61e655c72dfb25ffce67eb0aef761d38a4398f  README.md
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 647254446fa6..0cd44276976c 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.4.224
+UUU_VERSION = 1.4.240
 UUU_SOURCE = uuu_source-$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
