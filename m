Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB21D33987
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 16:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AEA9606F1;
	Fri,  5 Dec 2025 16:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V4U6XfIbOdyI; Fri,  5 Dec 2025 16:20:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C0E46074D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764951612;
	bh=wngj7sPcgBNY6mRMga51K9Bv3TSHXHd3ym1q0cHhgv4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GoVy3nh9MjX8tF0OKOsVXSgAQm5dANA6tE/JZzQMxdZ7xz4rW21UeseZdy4I17ZlW
	 M6ZfsinblO3Oa/CbMhnzcfcXNPSf5gK1sYnujWXgIWQ8WYwogVwlFcHr370lU9KmnZ
	 WfV1c82r/EL+lRGtCqBjIcnpMlp4hc8ojIMiEukHBcKQCGxc4uOaC/ujBK6rRsbXsm
	 T5VzoVZrv7I3O+BM8QQAHtCcbYcam+c5c2p+MMrq/D6YtReRS1v+sPEybOa1E3WBJ+
	 EpNwYMdI9sohuY3aoXi95U7zN8ObWn2P7KGnej9TvwW6VyqOx80KOOXa/9X1C1VAO5
	 E9S6PtOyTP6HQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C0E46074D;
	Fri,  5 Dec 2025 16:20:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 60B7E1A9
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 16:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E8EA6074D
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 16:20:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h8nWfU9HDXxj for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 16:20:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E5C6E606F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5C6E606F1
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E5C6E606F1
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 16:20:08 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42f762198cbso1535388f8f.3
 for <buildroot@buildroot.org>; Fri, 05 Dec 2025 08:20:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764951607; x=1765556407;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6jxIp14POg4LuZKptA/COX5gTb200AC2VGkt43l0QGI=;
 b=aKiEuFN7D1u6uWaLBqHbEPbz0+GlpHj+amtfaYqSQDJTEvDE9Sb+3xIGSu9ci7pdN4
 Rxm3ZqY6/+7526QH1TWyQ+YexsccGcJJkN091hUyGNwicvGNULpcrmKC3iey+QjfNHLt
 UbHo+6CiYmAV374E0W9JKMCYjpHEiD5PW2KKitIFA8qXj+/XI1hghfzGb/Shud4j/J8P
 vEyCf7+MqbRl1S+/V6dwkE9CRoJ7tP+NoyRAUfLCpw6RptytRZuoPse3n1H/Rz34KyeV
 /ZQ1tBCgvsMvt2cIjYP251H4IZpNmsZIFT5boHUrZahQ9CCk0/9QwRX6k9qrEGRjOnmb
 WemQ==
X-Gm-Message-State: AOJu0YxSNiuOxP4KDVkdXC18fBDePM+IO1D0ug8nyJhD7ueUGoYYKK00
 LwrsDXucIp5Rd9HsL6pp5wfx9tBUOPSOBqckw+Mpv3BflR5slR707WuiFhL51w==
X-Gm-Gg: ASbGncsaqH9ttgl9Z77AQbt2DaDXQkRKGsotlQbUNiRIYeNoPUUthkeoSHxDj5lN8cj
 +ACvC2ACO7Wg6vwYIkYG+SnbAlDLBLcC3EriQy5THFti22V7Zn2AnjG7Im/BK7KR2fmIokxSrBw
 Kr5RHLARbKDdeoDjGvf2qSryRxRemtdtlMeGMVTcWaglYYC4vrytn6JmS38d/Nis9Xsmu6A+YMM
 jcxIXWH36SgPFg/HcYrL54B+kaAcxlh/YJjxFa99V6jCTlSdAQReFBQ1u8Q8DWJACZpIftBYDjn
 P3iuCldYQxRNpM94jh/JjOVUDmiKR2y+IrqSidzGfCHVmncU8mUSo7/aaDp0QjgKG1dLnm94Ozq
 aqYew//G29UBiqsEPqtVz07XejTS7tbjnFxjwjOVc19evNMv6PpgwbC5INfPEBuZZqvq4cWuvkL
 UTNHK0NT5wgYw=
X-Google-Smtp-Source: AGHT+IFx4B2K3Ju8kuMpUW5vdTrHL656QylUfrgulJ9wSOrqx38lfSLluNv9MgIbKO5getEzpPa9QQ==
X-Received: by 2002:a05:6000:4287:b0:42b:2dfd:5350 with SMTP id
 ffacd0b85a97d-42f7985dc85mr7664953f8f.56.1764951606578; 
 Fri, 05 Dec 2025 08:20:06 -0800 (PST)
Received: from LinkMed ([2a02:8070:2483:7e00::daa5])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d222478sm9405968f8f.20.2025.12.05.08.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 08:20:06 -0800 (PST)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Fri,  5 Dec 2025 17:17:05 +0000
Message-ID: <20251205171705.21591-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764951607; x=1765556407; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6jxIp14POg4LuZKptA/COX5gTb200AC2VGkt43l0QGI=;
 b=fAicoxImmXEvtBg667VNu3UFbgeui5y4hfH8du7FnsykNH2lu8mLm4974PxKOd6biP
 id8y43V94O+9A4hpm4Ffz21Nlu5lGTOsl/Wxk1LbbQGU+SRV50U0Wao7sLCuDIURHbZH
 I1rMHuJKVmXuAXtb0M0zKNXW5cAiyIJOdXMoQrO4j+/3seOGKnfhgigOoQvXsBBmdf/s
 qydfmOLAmLRAwP9pWnZ7IgDPKbizyCPfIxZqlcAUdS5fZKXpd3/QgGM4HfC5CAhoIUvh
 2H82WyeoIr45gMVW9LB0GkPvM6BccCmGY/HowQPkBPTZ+i4k5ZZ1kdFXno5+CefJBnU1
 iIew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fAicoxIm
Subject: [Buildroot] [PATCH v1 1/1] package/x11r7/xserver_xorg-server:
 security bump to version 21.1.20
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Changelog:
https://lists.x.org/archives/xorg/2025-October/062147.html
https://lists.x.org/archives/xorg/2025-October/062150.html
Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 6 +++---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 7d373850d0..7509971ec6 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg/2025-June/062065.html
-sha256  c8591ceb70b177440062406542fe52ba60212f217f27f8f802dd20373ca9e74b  xorg-server-21.1.18.tar.gz
-sha512  d0cd176e4c7273b6870999a3d008ed282fd5609acb2e0919c16447af3a5b2228d8592424388a8ace67acf216cdfae3a2d52f7a7ba81f6071467c61d57f32f314  xorg-server-21.1.16.tar.gz
+# From https://lists.x.org/archives/xorg/2025-October/thread.html
+sha256  a51aea1cbb29cb8122e39c1c8728469d4fd8db71a538565fbf017df11841bf04  xorg-server-21.1.20.tar.gz
+sha512  dabe7e637df4b964a1ff04a15587157b9596851a722a753447c257253ad0422007078b74053e1a51bdfd2178e3140a52f94dff0f205242a8589b6fe02d27e8a8  xorg-server-21.1.20.tar.gz
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 2ce02ade36..c9456c66b5 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 21.1.18
+XSERVER_XORG_SERVER_VERSION = 21.1.20
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.gz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
