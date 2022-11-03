Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B546C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 20:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC6C281412;
	Thu,  3 Nov 2022 20:03:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC6C281412
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Dnuo8KQv_Z3; Thu,  3 Nov 2022 20:03:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3D1C81395;
	Thu,  3 Nov 2022 20:03:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3D1C81395
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A1701BF3C0
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 542EA40B9E
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:03:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 542EA40B9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x-dmrROSqWTt for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:03:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 412FF40B6D
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 412FF40B6D
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:03:53 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id 11so2327237iou.0
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 13:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KKPD/O/8jEO27ZQ7Af0XI+O/yNi1L76hiz7P/+E4mZA=;
 b=V3pVoiZPTZIl3QUcWGtRMqU+pqTE21l3W3tzLhxIvEIazl4a78nVQNcjqoCLyl2Mdg
 PyW/dcxEUPjuzZzKfbOBtBlWbVWE+iXFSSJ82gqbKnxRyfhRvUg85CgeZTr6kZIJzHgz
 asvZ3G0lHsf/wWFTmormdoL7duxVkZsVbB0c7Yu3gnzz8rNDX8OgrIu4uRE6auNs7VM0
 Tunp2nS8mN1d0K1y/3ENcErwyAZBZmkLz2uKZXCODR47CmJfigF4znJkfyK5af7bb4Kl
 /3DwsJ+rMZWoOHO0yLAIJYVgx8GYVqGM3tqybI3b5SvtmbbWFw7Eq/d9Ng1VDzNZPJLn
 IwCQ==
X-Gm-Message-State: ACrzQf0MQjUFIilTvOjxmtE3t5v+Mpk7trWhwvmVHjyD0EocwFBjmJvL
 PTUuWEErB5yT+bwcEDeWwJwQArwVSDSmwgHX
X-Google-Smtp-Source: AMsMyM493S0uNmtunVLZ0d51ss8gLLIW84DPocgeeFWKI/hdqckXzatiT1txUgvwu9v5JsLQ9e6sdA==
X-Received: by 2002:a02:c8d0:0:b0:375:109f:bc14 with SMTP id
 q16-20020a02c8d0000000b00375109fbc14mr19670181jao.233.1667505831914; 
 Thu, 03 Nov 2022 13:03:51 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 cp6-20020a056638480600b003734c4d01d2sm507741jab.61.2022.11.03.13.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 13:03:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 14:03:49 -0600
Message-Id: <20221103200349.2685847-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KKPD/O/8jEO27ZQ7Af0XI+O/yNi1L76hiz7P/+E4mZA=;
 b=UfXXlXvIvHPI2hRzxOCf3LHrRytM5Y9nZp7qLjwqizvR36kLxI9TSXNmiANCTs9Xls
 vbvpxyrHwChoH2EeOlm1SM5wd6UAhbi8Dx3T/d9X1Uabxi9nemeKvUY4j8VeRDcnPZ3R
 7ltnQF1hO+14IFDdT0ZU63QETGGJV7fHV6QqyQOHdZUkX4AedjK2L8dh+5G3uZh+gFTh
 ZPsvMesZGMcinoLBeuM+qbJAJD38MBO3MsLUUHmAsnGQzfwllJYEVwh4c7OENIZoXxIV
 GdojFcW4g+OaMrv71khWiSlCusyQ4A4zuKqSfzuj+kWGPJqkjgJWN0C947pgVwUiIUGY
 cn9Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UfXXlXvI
Subject: [Buildroot] [PATCH 1/1] package/python-thrift: bump to version
 0.16.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Vinicius Tinti <viniciustinti@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License details moved to readme.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-thrift/python-thrift.hash | 6 +++---
 package/python-thrift/python-thrift.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-thrift/python-thrift.hash b/package/python-thrift/python-thrift.hash
index 1d1d628908..0907a6e88f 100644
--- a/package/python-thrift/python-thrift.hash
+++ b/package/python-thrift/python-thrift.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/thrift/json
-md5  c3bc8d9a910d2c9ce26f2ad1f7c96762  thrift-0.13.0.tar.gz
-sha256  9af1c86bf73433afc6010ed376a6c6aca2b54099cc0d61895f640870a9ae7d89  thrift-0.13.0.tar.gz
+md5  486887192acd558636a1528dfddf918c  thrift-0.16.0.tar.gz
+sha256  2b5b6488fcded21f9d312aa23c9ff6a0195d0f6ae26ddbd5ad9e3e25dfc14408  thrift-0.16.0.tar.gz
 # Locally computed sha256 checksums
-sha256  c13578ae9d0529d0252e1c7375b917bacf58723dce1fcd40c7ed59183401b468  LICENSE
+sha256  35e2508f171c3ac2529f402c123c12f3b2ac91643f2e52b334f71f8c861be321  README.md
diff --git a/package/python-thrift/python-thrift.mk b/package/python-thrift/python-thrift.mk
index 3a908ca91c..23a2ad0476 100644
--- a/package/python-thrift/python-thrift.mk
+++ b/package/python-thrift/python-thrift.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_THRIFT_VERSION = 0.13.0
+PYTHON_THRIFT_VERSION = 0.16.0
 PYTHON_THRIFT_SOURCE = thrift-$(PYTHON_THRIFT_VERSION).tar.gz
-PYTHON_THRIFT_SITE = https://files.pythonhosted.org/packages/97/1e/3284d19d7be99305eda145b8aa46b0c33244e4a496ec66440dac19f8274d
+PYTHON_THRIFT_SITE = https://files.pythonhosted.org/packages/e4/23/dd951c9883cb49a73b750bdfe91e39d78e8a3f1f7175608634f381a197d5
 PYTHON_THRIFT_SETUP_TYPE = setuptools
 PYTHON_THRIFT_LICENSE = Apache-2.0
-PYTHON_THRIFT_LICENSE_FILES = LICENSE
+PYTHON_THRIFT_LICENSE_FILES = README.md
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
