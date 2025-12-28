Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BD0D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 07:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B66340725;
	Sun, 28 Dec 2025 07:52:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hydtQlYH3jCg; Sun, 28 Dec 2025 07:52:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FF584070E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766908366;
	bh=tzWxfDSvWDU9tuwKtUaoMQQVKnBx8XNmyiFJPjJdo3k=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lAPogyOTYXhZqmpvmCHEhK+GtV2D4LYBL5V9a9L0SgCFUhcqE40FolRDB2WXYfxwO
	 YiO1YvnImY4uTUWxkGzBjWMi7Jr4hkF6kNLUzyL3jr7YS7HNKcl/epEangF8LJFUnV
	 dsGOwelE9n7exEWH3c6tkgIBGEQ3COk7XkDi91883CTJCJBm2CXADhl7hzo5a8Uqhb
	 CS1bUNBrfDR4Z03J957AWdEfg6Rur4zvsyeMQzE/EkMWDjdb9OEXUjHlFdmCI0yYn2
	 S7zESdpTkcw2obiXkSXutV0wK6mmSRgTm8DtvGcfgFcU+h1zo9C9FwoGt/zuFaPMAU
	 YdIGBHofqYfVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FF584070E;
	Sun, 28 Dec 2025 07:52:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 188A5D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B0DD400B1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:52:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JEoAMHWSquhY for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 07:52:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3443F40087
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3443F40087
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3443F40087
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:52:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B38D2A4C231F;
 Sun, 28 Dec 2025 08:48:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35324)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vZlVr-000000004ex-2CVH;
 Sun, 28 Dec 2025 07:48:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Sun, 28 Dec 2025 08:48:16 +0100
Message-ID: <20251228074822.3370464-22-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251228074822.3370464-1-bernd@kuhls.net>
References: <20251228074822.3370464-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766908118;
 bh=50XQJoP89Plvw4VfZOkBuidMAl+MWq8e3RC8//UWV1c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=TSJ0BPzpxRCcWS0ICWMVSZikiOBhkCwQCsjyM3D/FINPn/WoyEZmccpifa7dodplz
 bOzuKZuDsrEPrjQOsqNvjMMd+QByRa7MNHlZAzvjU/T3SidW4nUiPo0k5CJVz9/cEA
 lj6TBD6N9DRdQ48p9NRmVfhDiGudimqZugbplQSjCrexNLnB/R6TMWPYPcvchSwNaT
 azByjB00qxZA+OWFWb8Ozsm0KjACddytfGWWTPyJTepvhW4NXpXZFUUa4CqT1nI+QG
 XSx0qjjPpijGnrby6NfcQteXvo2r+8ifHC9vuCE/t121b0AADYUXwPElPD8G1ROXdH
 NXj9CnxiKUHAQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=TSJ0BPzp
Subject: [Buildroot] [PATCH v6 21/26] package/ffmpeg: remove optional
 dependency to opencv3
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

OpenCV3 is unmaintained and will be removed from buildroot.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ffmpeg/ffmpeg.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 983a87eb2e..6e4ccd5b8b 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -297,12 +297,9 @@ else
 FFMPEG_CONF_OPTS += --disable-mmal --disable-omx --disable-omx-rpi
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV3_LIB_IMGPROC),y)
-FFMPEG_CONF_OPTS += --enable-libopencv
-FFMPEG_DEPENDENCIES += opencv3
 # To avoid a circular dependency only use opencv if opencv itself does
 # not depend on ffmpeg.
-else ifeq ($(BR2_PACKAGE_OPENCV4_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV4_WITH_FFMPEG),yx)
+ifeq ($(BR2_PACKAGE_OPENCV4_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV4_WITH_FFMPEG),yx)
 FFMPEG_CONF_OPTS += --enable-libopencv \
 	--extra-cflags=-I$(STAGING_DIR)/usr/include/opencv4
 FFMPEG_DEPENDENCIES += opencv4
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
