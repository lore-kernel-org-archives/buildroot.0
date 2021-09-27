Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90CCBC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 20:18:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1465861041
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 20:18:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1465861041
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3BC340555;
	Mon, 27 Sep 2021 20:18:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4NW906CpCbod; Mon, 27 Sep 2021 20:18:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EA30404DA;
	Mon, 27 Sep 2021 20:18:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 46E331BF239
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 20:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 319BB80F94
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 20:18:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xroVQXko8GNc for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 20:18:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4ED780F8B
 for <buildroot@busybox.net>; Mon, 27 Sep 2021 20:18:13 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 t16-20020a1c7710000000b003049690d882so64398wmi.5
 for <buildroot@busybox.net>; Mon, 27 Sep 2021 13:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G1QZJRtSLD6g2Ih8PcJlg3VKLshk0zLitwCBBGZF3/o=;
 b=aVDDqTPnr6kap55vrJBBGDrdEjWrKNoQF1rEY/26rtbRVXNI2/bvK1psZVw9//XQdj
 3J+k9vqY4n3fz28X943Ff5jlP/yNZrl9lpjEkyalfkX07bhr6tffxpFnQvl4GzBwaRUm
 s6jio//VUY2+owy42MYKTsJOYs6HGaAaS7ppZ33+0ct6kNoO3seDjo39AdPsgIe3nWdR
 kQKSe7TZdnYLe1YRZyUt5nZeanbYyA8j8dLESfAOtu8WYxQGICNbxSsGmojupeGj+wzC
 UTvHnLmq+DmKQboqa0HGwtvnCqAZI3OaHe+5zXiYvPBFgiEuxfuMTrTiBBUS2/iR4Wug
 6I2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G1QZJRtSLD6g2Ih8PcJlg3VKLshk0zLitwCBBGZF3/o=;
 b=4lS7nB7WNpFEhMc0Yvt1f/TAMukEQCj+vBVV+LOYaa/8VXdaqYkd332NX5jC9syZjb
 yAZoC98EuKFLQ63aIfk1bJzOg1qymy1eO5nGFP46eLB7h7edCgswsDUGzxJ8fhDYc/Lo
 j8OBVywUEw4mp5WiGT/GfTOpP0NwiESvmRYi2WfxiQf15koK2p/lCZVtRvSXfHcb2G51
 EE5p/56JDx4IZn6TyVoVGGh5DdvJrDOeKeauw9idy3FxLgEVCoZDHudYKpe+UL3OaR4I
 hc7l6i6gD53diEWx2o90Sc1kGuxKLmoByfeUWc9F61LFNuScfDA59Q4GFp+CwvZx+h5S
 SpIw==
X-Gm-Message-State: AOAM530127OiB9JyXmxqxFO6hgcvMkgH0KslIOx3kTAPrL1Xy5nuVCyC
 Y6yrMeXcSVEKQVTai8FVtVuQvpxAwjo=
X-Google-Smtp-Source: ABdhPJxBX9XTRA6bmD8BTEGCPHgw9NBZRZFDLEiZgXXU32D+Wc2W9S9D9otG7nLSeKLzzxzGat4f2w==
X-Received: by 2002:a7b:ce83:: with SMTP id q3mr971602wmj.103.1632773892150;
 Mon, 27 Sep 2021 13:18:12 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id m4sm502164wml.28.2021.09.27.13.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 13:18:11 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 27 Sep 2021 22:18:05 +0200
Message-Id: <20210927201805.122757-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/openldap: bump to version 2.4.59
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
 package/openldap/Config.in     |  2 +-
 package/openldap/openldap.hash | 10 +++++-----
 package/openldap/openldap.mk   |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/openldap/Config.in b/package/openldap/Config.in
index bd39d0d02..7a0b2f4b8 100644
--- a/package/openldap/Config.in
+++ b/package/openldap/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_OPENLDAP
 
 	  This only installs client-side support.
 
-	  http://www.openldap.org/
+	  https://www.openldap.org/
 
 if BR2_PACKAGE_OPENLDAP
 
diff --git a/package/openldap/openldap.hash b/package/openldap/openldap.hash
index 8ce50d613..71092c93d 100644
--- a/package/openldap/openldap.hash
+++ b/package/openldap/openldap.hash
@@ -1,7 +1,7 @@
-# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.58.md5
-md5  c203d735ba69976e5b28dc39006f29b5  openldap-2.4.58.tgz
-# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.58.sha1
-sha1  875416827be3ad63f20004510a354db0aaceb2ed  openldap-2.4.58.tgz
+# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.59.md5
+md5  6036a03b3a67b4a1fe1246e0a2c7265a  openldap-2.4.59.tgz
+# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.59.sha1
+sha1  b154d06bbf40fafafb34fffc4b116946d931efef  openldap-2.4.59.tgz
 # Locally computed
-sha256  57b59254be15d0bf6a9ab3d514c1c05777b02123291533134a87c94468f8f47b  openldap-2.4.58.tgz
+sha256  99f37d6747d88206c470067eda624d5e48c1011e943ec0ab217bae8712e22f34  openldap-2.4.59.tgz
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index daa409ae1..b5373544a 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLDAP_VERSION = 2.4.58
+OPENLDAP_VERSION = 2.4.59
 OPENLDAP_SOURCE = openldap-$(OPENLDAP_VERSION).tgz
 OPENLDAP_SITE = https://www.openldap.org/software/download/OpenLDAP/openldap-release
 OPENLDAP_LICENSE = OpenLDAP Public License
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
