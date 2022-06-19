Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59481C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 16:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2EA8410AB;
	Sun, 19 Jun 2022 16:35:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2EA8410AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pL1qOjhQWecX; Sun, 19 Jun 2022 16:35:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FE83409F9;
	Sun, 19 Jun 2022 16:35:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FE83409F9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7206A1BF4E7
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4162360E5C
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:35:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4162360E5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OW9zp7WSQiBA for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 16:35:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 361F260E56
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 361F260E56
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 16:35:41 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id n1so11395543wrg.12
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 09:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=41PiqahR3K4ksu3tK2Xh9/dj4zNQp10YWS5In0cKblk=;
 b=5wa5e9i+WBe/KhxLwDt4/i5zvd5aMPLHFuC9KdP686amzYDpIsV3UnFqZXuSMcKHxl
 PmqOXDq+XEoThi1PtT/v+PT2xGh4KUE/bSlABX88OJGobvWpN5OOZgb2JYETg2nfAqNA
 rpwFXR04WSAOPUGXmudjKuMNuS7kV+DHS7A3i4T7cyz9wjWoYSrA2QNnbSD0K5CxztKw
 Lesq7Vht+SNEEEstnBaXdF62OWaq7UsPSjtPmEttVdNnEzQKI4dRki3yFqQ71ysPp3XZ
 v4RntgAHcR4VJN4ORikfDD0vV1BL3ATo6/iqJOQyOn2gGRiUfqkpY9d3dEAVATx1YQ3h
 xQUQ==
X-Gm-Message-State: AJIora/xZnNd/8vrNkM9hUB0N07N4vlWpk5MmZm+Tv2G5vbAQrn0Xwcv
 fNkAnrCpDUS92CsPwRlryD07BD46+Nw=
X-Google-Smtp-Source: AGRyM1tIuRzTNUThYBblw/7lGNKCrHMdAk4hw3M4gTJXlRLxt49d3gtAbbEqNr8oQFa3/N3a3Rj5vA==
X-Received: by 2002:a05:6000:695:b0:21a:3a1a:7b60 with SMTP id
 bo21-20020a056000069500b0021a3a1a7b60mr15715643wrb.441.1655656539215; 
 Sun, 19 Jun 2022 09:35:39 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a7bcd85000000b0039c7c4a542csm11975878wmj.47.2022.06.19.09.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 09:35:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 18:32:54 +0200
Message-Id: <20220619163255.636101-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=41PiqahR3K4ksu3tK2Xh9/dj4zNQp10YWS5In0cKblk=;
 b=Emep0GG1hwbSAt7mMsX7GCNL+8g/BLnG04/ObinGq/iGYB30Oi+KwoG7QyfrOohKJS
 IkkxSSRajTLYof9Khs+ij1rG+/eTUazeReO1+PaWBINXqLmbUmT7xVoLU3IMoG2vyP+a
 ivyy+GTN1p3eOP5Y9aicin5xShgn/YXDVxVafou0rnu1R6S80XzA0uUg9AUsGrqH4uHW
 Bm8bYu22BeEGiO+wPg8UNKsOVMn/9ae3CbUzfh9jtZIAGYYgXbBUTYYGYVylhu7WeoQo
 FiJBnV2mgPv0JVLD6pXSWQK8VdkCYR64QFQvUMg/PNvkrusNx1mtX1AoRxjqR7cGqm7Q
 xAlg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Emep0GG1
Subject: [Buildroot] [PATCH 1/2] package/tcpreplay: replace
 TCPREPLAY_CPE_ID_VENDOR
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

tcpreplay has been replaced by broadcom since April 2022:

<cpe-item name="cpe:/a:tcpreplay:tcpreplay:4.3.1" deprecated="true" deprecation_date="2022-04-02T03:29:17.303Z">
    <title xml:lang="en-US">tcpreplay 4.3.1</title>
      <reference href="http://tcpreplay.synfin.net/wiki/Download">Vendor</reference>
      <reference href="https://sourceforge.net/projects/tcpreplay/">Product</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:tcpreplay:tcpreplay:4.3.1:*:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:broadcom:tcpreplay:4.3.1:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Abroadcom%3Atcpreplay

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tcpreplay/tcpreplay.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index ef65403974..9f2da6439b 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -9,7 +9,7 @@ TCPREPLAY_SITE = https://github.com/appneta/tcpreplay/releases/download/v$(TCPRE
 TCPREPLAY_SOURCE = tcpreplay-$(TCPREPLAY_VERSION).tar.xz
 TCPREPLAY_LICENSE = GPL-3.0
 TCPREPLAY_LICENSE_FILES = docs/LICENSE
-TCPREPLAY_CPE_ID_VENDOR = tcpreplay
+TCPREPLAY_CPE_ID_VENDOR = broadcom
 TCPREPLAY_CONF_ENV = \
 	ac_cv_path_ac_pt_PCAP_CONFIG="$(STAGING_DIR)/usr/bin/pcap-config"
 TCPREPLAY_CONF_OPTS = --with-libpcap=$(STAGING_DIR)/usr \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
