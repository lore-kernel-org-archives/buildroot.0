Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557D4C433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 21:12:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C821461077
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 21:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C821461077
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E05083B23;
	Thu,  7 Oct 2021 21:12:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l4m5fOB-LQYe; Thu,  7 Oct 2021 21:12:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0807983B2C;
	Thu,  7 Oct 2021 21:12:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D88A1BF866
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 21:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C044408D5
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 21:12:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rEOOMvTbYibc for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 21:12:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 014CF408B9
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 21:12:01 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id m22so23195396wrb.0
 for <buildroot@buildroot.org>; Thu, 07 Oct 2021 14:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E8sTTBaDDPTXZSjA5ltuXLBKZsHhgu83Yrujv5+DqPQ=;
 b=AzgbUoQYi3ZYVaR7Rqd4bGzCqcBs0fZ1Hr/QvDnVhAmseYnsmQbVITk8ahofLMpYbv
 gXICN0TZc8+j7lhTjs1hPiOwB3b0EhQOR3PNMPUc9Y0QhQ7NozE5Dx2Q9xQgPWuIojka
 s42vfpZHvq8tuAsAGhsn6Oe5/GYIvEZGbZ+wF0TvO7uY/E/G1D9i1XjtMgHqEUGZI3Un
 wIu4TsJkTbT64ZbQ3KMllJt99RhM/2Kps1qaGeF2kvuvJ6ecLGwqLINou2ck4oZmDh+3
 00qY+6+oITe7wSlnjmahBo/aeUXzEIe+P2U5Bf0fb/5wkc90wDBwIBQP8xHwJ+h5Uj83
 2VbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E8sTTBaDDPTXZSjA5ltuXLBKZsHhgu83Yrujv5+DqPQ=;
 b=OPhJqjJAHC+cF5ffEGJMZmXVksHcv1W8g/QSvGhsvw86Lkqx1jWHj0/AjG+d18FWR3
 I9EaGxIdq7sgoqZFDf42OQMwDVYBqP3jQzqoeQJRRncXwojlScScNX3bbQE0USAD8wDU
 LnWTBvLIoc3PnmjcYJA6M+Mj4LYq55GCtrTkaIHNy0a6NgodDyKVzkWCRuF5NZRbfGfm
 cMOS+Hqd80eqPhUvtjoKfogpfE7+AbUCmUh1Siu/ylIAPVYpfnwskJj1N7zvPhQjCkay
 VGZEytE4YWbQH7WcJTDTL3yKkJU/pEt6+4Pu/f8+Lxw4V/qmArS9f57KXoQhF8ljnNwz
 vvNg==
X-Gm-Message-State: AOAM531E8T5xy1L7wXQTIoZgpmKXZjQMt4feLevr5ci1v3Q2KfFEEOJk
 Oce0eg+ShHmokMVedRI9ePUcflXfW9I=
X-Google-Smtp-Source: ABdhPJw0iGefbC4lLd07qBM5jm7FZr05xKeaEMPKJ1Piz9USyEJuLd+VkTt8i919WuscHZ11610Gew==
X-Received: by 2002:adf:a184:: with SMTP id u4mr8382435wru.69.1633641119974;
 Thu, 07 Oct 2021 14:11:59 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id p3sm9918852wmp.43.2021.10.07.14.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 14:11:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Oct 2021 23:11:09 +0200
Message-Id: <20211007211109.3756339-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libgta: bump to version 1.2.1
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update site: https://marlam.de/gta/news/source-code-moved
- Update indentation in hash file (two spaces)

https://marlam.de/gta/news

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgta/Config.in   | 2 +-
 package/libgta/libgta.hash | 4 ++--
 package/libgta/libgta.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libgta/Config.in b/package/libgta/Config.in
index 894dced096..f66d83c90e 100644
--- a/package/libgta/Config.in
+++ b/package/libgta/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_LIBGTA
 	  Libgta is a portable library that implements the Generic
 	  Tagged Array (GTA) file format.
 
-	  http://gta.nongnu.org
+	  https://marlam.de/gta
diff --git a/package/libgta/libgta.hash b/package/libgta/libgta.hash
index d5fceb4205..49ac51d3a1 100644
--- a/package/libgta/libgta.hash
+++ b/package/libgta/libgta.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 1d2ff713955eee28310de082a8fd8e236403c27dee3716ba1238c56e6643e4fb  libgta-1.0.8.tar.xz
-sha256 36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
+sha256  d445667e145f755f0bc34ac89b63a6bfdce1eea943f87ee7a3f23dc0dcede8b1  libgta-1.2.1.tar.xz
+sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/libgta/libgta.mk b/package/libgta/libgta.mk
index 1189feeff9..9b19f42dc7 100644
--- a/package/libgta/libgta.mk
+++ b/package/libgta/libgta.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGTA_VERSION = 1.0.8
-LIBGTA_SITE = http://download.savannah.nongnu.org/releases/gta
+LIBGTA_VERSION = 1.2.1
+LIBGTA_SITE = https://marlam.de/gta/releases
 LIBGTA_SOURCE = libgta-$(LIBGTA_VERSION).tar.xz
 LIBGTA_INSTALL_STAGING = YES
 LIBGTA_DEPENDENCIES = host-pkgconf bzip2 xz zlib
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
