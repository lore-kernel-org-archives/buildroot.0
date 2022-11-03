Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AA9C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FBBD401E2;
	Thu,  3 Nov 2022 21:29:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FBBD401E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PrYiARMG9gNb; Thu,  3 Nov 2022 21:29:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7465D4012C;
	Thu,  3 Nov 2022 21:29:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7465D4012C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A39D1BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65A9640BC0
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:22:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65A9640BC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UW8U8I9MyVXt for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:21:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 794E140519
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 794E140519
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:21:59 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id h206so2433485iof.10
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 14:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TUQK2FgUODx2LcHvBjJ7XRsO4fI65VSv61S8FJK/+9w=;
 b=EFFhYx/XV7rGhrCANtUQdN2CZnQ0eNQK9yPSO3GddR41cMkw6bzYzWGqMCaK2FM3TW
 xGAM1xPAGwEM4CHanln0/U1zH8A3YuK3LzJfZssCzV4jzIF7uTZogP8bv6jxc3kyzHi6
 pKGT4XILFCSWGDu7kguZZXdsK3mBYQLJWWTWUWTEpeJZSwEcK1MWPCtdKIht36eIgBTA
 hKNrygCcPu6yyUKM2RuYRFoiWwBWRf6/JPx4Ev5xZKamEnW+mTxkixiOs1ib/SpdMXMR
 aNhjO1fKndtLVKYTLQpo/flR/gFBNPXeDPyE7cTcKXQZUOFZM8+yc5LDTfaW52QZzSuT
 VHtA==
X-Gm-Message-State: ACrzQf2xHx14+ri1qhasQOMrjcS98FwCn/z2Ilsg8p8+/YLcmg51wzlm
 rDSQhuaBvXho5zZAwKcOZIFk6O4zOkOgTIMA
X-Google-Smtp-Source: AMsMyM4YdZgce9O7GfBv4Pk/kEfVrS4z0x2w0ybY2fgwnVO1/AnZh2UHPwG0G2DEg/wH0wJvWlwidw==
X-Received: by 2002:a5d:8251:0:b0:6cc:a8a4:a98a with SMTP id
 n17-20020a5d8251000000b006cca8a4a98amr17990792ioo.212.1667510518290; 
 Thu, 03 Nov 2022 14:21:58 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 l14-20020a0566022dce00b006afe1d84207sm764511iow.25.2022.11.03.14.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 14:21:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 15:21:56 -0600
Message-Id: <20221103212156.298989-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TUQK2FgUODx2LcHvBjJ7XRsO4fI65VSv61S8FJK/+9w=;
 b=YcJAlvajb96kjIs+mG20zy+Mi4rqy7igXrCJ1DJnyf98yGhXzLPjMY2wflptXK4G9n
 Z/47JFRN5CECfjiZSFp05ZGVRxLVfaoxjABUHuGymxpFTDTFNGfNiB+J8/WmosYItNTg
 93/oweP5Dv/9XHogexV9p1OZuwpvNTmOUQEbI4Isq3DTE2JDIWBa7NblYk4Jl+6xku9h
 SjslyqRTrPd+tSbAZbcluNw9spOlCy5/3m4IU6OoGLM86E6ChnhTikoQKMQ9oEg3yTWG
 4p2XBJaHCPFCS7yCQZuv1UdP53l01kA4alD7noPsIacKprFiBdZlEmaySZ41n3thMXdt
 z09A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YcJAlvaj
Subject: [Buildroot] [PATCH 1/1] package/python-zeroconf: bump to version
 0.39.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new async timeout runtime dependency.

Verified license is still LGPL-2.1+ after hash changed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-zeroconf/Config.in            | 1 +
 package/python-zeroconf/python-zeroconf.hash | 6 +++---
 package/python-zeroconf/python-zeroconf.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-zeroconf/Config.in b/package/python-zeroconf/Config.in
index 1570674f59..69ea81d93a 100644
--- a/package/python-zeroconf/Config.in
+++ b/package/python-zeroconf/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_ZEROCONF
 	bool "python-zeroconf"
+	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
 	select BR2_PACKAGE_PYTHON_IFADDR # runtime
 	help
 	  Pure Python Multicast DNS Service Discovery Library
diff --git a/package/python-zeroconf/python-zeroconf.hash b/package/python-zeroconf/python-zeroconf.hash
index be91b59048..13e1d16cde 100644
--- a/package/python-zeroconf/python-zeroconf.hash
+++ b/package/python-zeroconf/python-zeroconf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zeroconf/json
-md5  98e683a247fe9915a5d4845c38b37ff3  zeroconf-0.29.0.tar.gz
-sha256  7aefbb658b452b1fd7e51124364f938c6f5e42d6ea893fa2557bea8c06c540af  zeroconf-0.29.0.tar.gz
+md5  f85fb9d239397b53836495fd49b85e5f  zeroconf-0.39.4.tar.gz
+sha256  701e4d697f89fe952aa9c13a512ed6bf472dcf4f0a6d275e71085604b3882295  zeroconf-0.39.4.tar.gz
 # Locally computed sha256 checksums
-sha256  bb117c0fbd7f57f64170b690285d7df07c2371b578e3b3cd3aa2e1155ef461a0  COPYING
+sha256  35e4136e96aace60757a8b939741959d8627c4bc1fce62af99df325395276c56  COPYING
diff --git a/package/python-zeroconf/python-zeroconf.mk b/package/python-zeroconf/python-zeroconf.mk
index 67bfa72e03..d939b2e5ae 100644
--- a/package/python-zeroconf/python-zeroconf.mk
+++ b/package/python-zeroconf/python-zeroconf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZEROCONF_VERSION = 0.29.0
+PYTHON_ZEROCONF_VERSION = 0.39.4
 PYTHON_ZEROCONF_SOURCE = zeroconf-$(PYTHON_ZEROCONF_VERSION).tar.gz
-PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/ca/77/eb6137997adc60811c6c46b28b00abac5c16daf14383f61d8a0180326b38
+PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/f5/4f/c47cea73d7ae5467b63de3999d7207fd5b14d70cb2f35ce81c4ab7d7a52e
 PYTHON_ZEROCONF_SETUP_TYPE = setuptools
 PYTHON_ZEROCONF_LICENSE = LGPL-2.1+
 PYTHON_ZEROCONF_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
