Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D28D25051
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADACB84637;
	Mon, 12 Jan 2026 08:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KH0OfQc3ANey; Mon, 12 Jan 2026 08:44:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 933B884610
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207450;
	bh=TVRD9Uc0BSAYzUskDuz/hM9jfaqKuEdgfE4/knm43wM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bI52J/buXPZbo3qUD+j3QDEs4lrSbVttqe3jEhPhyYkgXwVk3Mm727ACHZgofL5YD
	 Qjfi9VYFMnxj7jzsLR37wrL+/J800foXOFbyaNmc4VUIfkQzw1C+/D4HdYEOCMy19D
	 Cmxuqux4k4zyOf5OPwX70nSH53DU6QPF2e5pzkoU3vPxCmcEBq98mWm3gV1i3eKh8H
	 Cjd4GtAPIcpGtYAh/IefJdDScOW5z2wwjDFKWoztxVwg2HIBLXjkkBJTL78NPhCe3I
	 pLT1MzUoyf2SCRJWqaJn4hmmvV9HXv32nw5C8BEDrAzPmpgMpczfPhov2QlLQtpIDs
	 E0SLzNx/XRhqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 933B884610;
	Mon, 12 Jan 2026 08:44:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E6BB1CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4552941692
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LRYHia2gmLMC for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:44:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 400514168E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 400514168E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 400514168E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:44:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 33CD5A4C4175
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:57 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJC-000000007z0-0hYC
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:29 +0100
Message-ID: <20260112082950.2528445-21-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206657;
 bh=xgtxAO2ofwPRh8Xk8H3pIIEHW/zplenBfOChecet1AQ=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=W5TtRt9IGT3AhHZJ7zC54Z+hI/jGdZtOoSY7vC3pdps07E213h9IwsS08l5Iu4+j4
 rxdf+BbPxYxaenEVps+9cMP5hwWJ+Pz1wIhafaazQmVIGz7UFhLsBQRF1V5TkqDnGS
 TQOZ8I2habxYDVOFNu9kVk+vHlG7+m4t61VPxtSssCsy8/GPFK4uwmHYzhEA4ETBH6
 a0CjaNQ6UPQP8xslNdTysYzodHe+2kOokCSwPA2ODEJyiUG0ixVRvXfhBe4RKEftCB
 F72XpYBxht5gH2xkYUzmV8Hc7n4WeGh7SYu+xwfggTeNv1AlmYZm+E+1VIJMIBqDuK
 OYl/qJE56ESbA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=W5TtRt9I
Subject: [Buildroot] [PATCH 021/102] package/x11r7/xapp_xdpyinfo: bump
 version to 1.4.0
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

https://lists.x.org/archives/xorg-announce/2025-July/003616.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash | 6 +++---
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash
index b0afdc15ac..70f78d612d 100644
--- a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash
+++ b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-April/003388.html
-sha256  a8ada581dbd7266440d7c3794fa89edf6b99b8857fc2e8c31042684f3af4822b  xdpyinfo-1.3.4.tar.xz
-sha512  9ef9f5c10e15a40895e8f008896b960fdd438277657c7159d16f05db79cd2374cfaca4af2f4e59335824bfd2f74a045ef89dd99ea4130ed436ea59fbbb1cbe12  xdpyinfo-1.3.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-July/003616.html
+sha256  dc1de6e6e091ed46c4837b0ae9811e8182f7be0d2af638cab3e530ff081a48b6  xdpyinfo-1.4.0.tar.xz
+sha512  478dd3de58950eeca213a51820445e62a5a63b2fa9ff3505f22802a7980f855fc11f1465e57ff4c34cdf8df0a0ff3c576804ef44f11f3b52c1c9da4ecc5a62d3  xdpyinfo-1.4.0.tar.xz
 # Locally computed
 sha256  49733ead65fdfa1da0d176f9b965cc08dae74d73d66c9606488d52f6fc036abf  COPYING
diff --git a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
index a198fc44c3..7d6ce7a9c6 100644
--- a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
+++ b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XDPYINFO_VERSION = 1.3.4
+XAPP_XDPYINFO_VERSION = 1.4.0
 XAPP_XDPYINFO_SOURCE = xdpyinfo-$(XAPP_XDPYINFO_VERSION).tar.xz
 XAPP_XDPYINFO_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XDPYINFO_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
