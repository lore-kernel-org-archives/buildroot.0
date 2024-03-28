Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B7BCD11DD
	for <buildroot@archiver.kernel.org>; Thu, 28 Mar 2024 21:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D479F417FC;
	Thu, 28 Mar 2024 21:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o40LYjgSGyI2; Thu, 28 Mar 2024 21:56:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C932F417F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C932F417F7;
	Thu, 28 Mar 2024 21:56:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ABDB61BF47A
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 21:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 979F1415A5
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 21:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T9zQyaFSv8VN for <buildroot@lists.busybox.net>;
 Thu, 28 Mar 2024 21:56:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 560DD4159A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 560DD4159A
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 560DD4159A
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 21:56:44 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-341cf77b86bso920131f8f.2
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 14:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711663002; x=1712267802;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d7PnrJanmo0kmzI/4TqSBZXu//v/HQT4jmQhQoySHDM=;
 b=Z3kOC+NLVhJYQHT65wCTW9NIm8lPUUYfJJ5fH5sB9Qc5KkhghOGihi7p5rvgayf5K1
 amA83M/qJ9qcSrZjVPU+j2BEtGWfweGcnffLURq3Ypvn5XoACaRXBYP5ACOCumS/zbmq
 WORqJzDqkw2LQxrPLDWVpwCFy6lAz9yRiIPQrxcUjlVZemcVjl53/58uYQBaYTLR5idZ
 7ftweD/4PYDg0PYGb3UTex4VBE22csPG0a/ykD2nSR0OdUSOoeCiAN+PTxyg2iSTDOMI
 vv2IOUiYuLDR3sTqnewSFGdMgjafDLUSjyC1l2LAMd2ZDNiKdq8iunkX02Ja7xTNIfQ6
 HABw==
X-Gm-Message-State: AOJu0Yx8/uoHI88y0MsaNq6feUNvIAa+7BF0i75YTX/K4nlnpx/y+2ar
 LdrFIdxvYg3RDMX1FANcBsuhSMlCAxB0gNtWsc+LFKqRf7Cc7eic+7aGTvAt
X-Google-Smtp-Source: AGHT+IExSH+NEBniw7AXL2YrT+WlOFjW6QAfFZzj7H+hapx2sXe7NkBxGWFKcF0HTP9Y1Vv5HWs4Sg==
X-Received: by 2002:a5d:65c6:0:b0:33e:c593:bb08 with SMTP id
 e6-20020a5d65c6000000b0033ec593bb08mr157143wrw.13.1711663001934; 
 Thu, 28 Mar 2024 14:56:41 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g1-20020adfa481000000b00341e7e52802sm2710431wrb.92.2024.03.28.14.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 14:56:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Mar 2024 22:56:38 +0100
Message-ID: <20240328215638.67750-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711663002; x=1712267802; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d7PnrJanmo0kmzI/4TqSBZXu//v/HQT4jmQhQoySHDM=;
 b=b8ga0FmB6sdw4jo8i2uSNhJuVlTveSmu39EfO8WW/IXNQQa51igpV9hE3d45A+rhyR
 L8XF84ZieK2y+K/7IA4KGZDKjck0L+KGSva5ZJpsTTxnlM9O0+3eBDr8ZO3yEUS/UWtS
 jl0AW+1UWS0lZ2FSXcZkvipCy02Y6/pTDUP2y3tYq6Q68rQLey40SWt2lUhO9kw+KF3n
 4ZfNTsrPoqHJcXr2jdZhTmLAkKvSLKpAThCeFTsc5lS1M53aUY2q/5DOa77AO7usqWYV
 UAu1njPeSeSyg8DMXSF2Z6lO+oMf+OC3t8FD48ixIftfCNevarUAnR/qjUEEtqRncu/p
 tMXw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=b8ga0FmB
Subject: [Buildroot] [PATCH 1/1] package/libmaxminddb: bump to version 1.9.1
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

https://github.com/maxmind/libmaxminddb/blob/1.9.1/Changes.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmaxminddb/libmaxminddb.hash | 2 +-
 package/libmaxminddb/libmaxminddb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmaxminddb/libmaxminddb.hash b/package/libmaxminddb/libmaxminddb.hash
index 23830a6afe..f5c84fc905 100644
--- a/package/libmaxminddb/libmaxminddb.hash
+++ b/package/libmaxminddb/libmaxminddb.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  1107799f77be6aa3b9796ad0eed8ffcc334bf45f8bd18e6a984d8adf3e719c6d  libmaxminddb-1.8.0.tar.gz
+sha256  a80682a89d915fdf60b35d316232fb04ebf36fff27fda9bd39fe8a38d3cd3f12  libmaxminddb-1.9.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/libmaxminddb/libmaxminddb.mk b/package/libmaxminddb/libmaxminddb.mk
index c741f429ed..1a1a2e302a 100644
--- a/package/libmaxminddb/libmaxminddb.mk
+++ b/package/libmaxminddb/libmaxminddb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMAXMINDDB_VERSION = 1.8.0
+LIBMAXMINDDB_VERSION = 1.9.1
 LIBMAXMINDDB_SITE = \
 	https://github.com/maxmind/libmaxminddb/releases/download/$(LIBMAXMINDDB_VERSION)
 LIBMAXMINDDB_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
