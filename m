Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27DDC38A02
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 04:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39F7060E84;
	Sat, 29 Oct 2022 04:16:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39F7060E84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vGSYl-yJxW-h; Sat, 29 Oct 2022 04:16:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5285D60E89;
	Sat, 29 Oct 2022 04:16:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5285D60E89
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 785C01BF852
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 04:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5079760769
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 04:16:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5079760769
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eK9hiWwFqJmE for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 04:16:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBB97605AE
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBB97605AE
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 04:16:02 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id e129so6433649pgc.9
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 21:16:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oNsY4BKS7/Mo/oqxklTRI2cqcgnuR/LIXaEJSLKUH2o=;
 b=tkmowwxwAslabnK3OlsCqQhzEgA31wkQXvvTI156T1Ma+jdm2U2eNCAm7NfgCRLjmh
 4hw2Hvr7xzZQfc5dw2yee6LlJzG8thfP9QXF4+MFFylibjo5cuRba0MvL0ysL0IsbFTg
 IPrnQw+n/ZRlrG1RSIe1rWn5mi6TI7bb6cDVSe40ZvP4cFFqStTOhq27ZEBuBgLXa41Y
 edS2OHNyTABWz3kJCrwR/0M3Fm2UtrC385vPSx+wcALpXreSn6IqWwY3CPeVnrXU6Lq4
 lfVEvJW1CWxOjX8WUTcaxGHaSPoWQPpPPmTYnwLJBxmCLoELy9OakUSZyTCNuvf4YjWu
 1MkQ==
X-Gm-Message-State: ACrzQf0ukOiPHRRiKw3SGXlCovsletPU3/sQJUmCfKCT/i0BDw0efW1/
 8Z4AYQBJ+1nxIBk6Hk/09q450sH2X6iU/A==
X-Google-Smtp-Source: AMsMyM6qvX2RN11fWTHeem/cc8xdG1vw56VKcftqiWUTvOWUI5xQ0wwslg+Gcn8Vo8dIgCtOeB2VUQ==
X-Received: by 2002:a05:6e02:158a:b0:2d5:12f0:4dce with SMTP id
 m10-20020a056e02158a00b002d512f04dcemr965205ilu.159.1667005238736; 
 Fri, 28 Oct 2022 18:00:38 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 w18-20020a02b0d2000000b00363b7cec211sm64091jah.135.2022.10.28.18.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 18:00:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 19:00:36 -0600
Message-Id: <20221029010036.1388698-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oNsY4BKS7/Mo/oqxklTRI2cqcgnuR/LIXaEJSLKUH2o=;
 b=LeINl/VRy9pWrVpfBOujy7MMptB9ZOpyUcejDHPC85kD1Ewq51rgCG0ZF/N41evlmx
 Dj2czvQLQoJXYYBCw4WUA4DYuW4qoSaaaS3iF8aZl4G9lMJE6+VJcWdwZWpp+HkFtFhv
 s+I/D0ApFJRuEjEdzA1Fp7S/UxWYr7lh5YaVWCA65hD5PeIqqgk0MDZyxFSsBG2TBAyz
 Chff5Y7Ax3ndC/8niBlbwsitpETIkXWKN4IofPHcTR37U0Ss3D31VPKDKAjJTug4ZMb5
 WoMW6wPs6LwjxRqPxuUMU4fZpaQneWLRuB7Zj5+mCr1T2InwMd3QZp4oi4cKID9DGtor
 8qUQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LeINl/VR
Subject: [Buildroot] [PATCH 1/1] package/python-ujson: bump to version 5.5.0
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to now supported system double-conversion library.

Disable built in strip so that stripping is handled by buildroot.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-ujson/Config.in         |  3 ++-
 package/python-ujson/python-ujson.hash |  4 ++--
 package/python-ujson/python-ujson.mk   | 10 +++++++---
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/package/python-ujson/Config.in b/package/python-ujson/Config.in
index 7af03e6497..31b4d484d8 100644
--- a/package/python-ujson/Config.in
+++ b/package/python-ujson/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_UJSON
 	bool "python-ujson"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_INSTALL_LIBSTDCPP # double-conversion
+	select BR2_PACKAGE_DOUBLE_CONVERSION
 	help
 	  UltraJSON is an ultra fast JSON encoder and decoder written
 	  in pure C with bindings for Python 3.
diff --git a/package/python-ujson/python-ujson.hash b/package/python-ujson/python-ujson.hash
index e88e273145..27df5aa355 100644
--- a/package/python-ujson/python-ujson.hash
+++ b/package/python-ujson/python-ujson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ujson/json
-md5  2c7ffd2bf23f6f07da3a0cbf5ff5c2f0  ujson-5.2.0.tar.gz
-sha256  163191b88842d874e081707d35de2e205e0e396e70fd068d1038879bca8b17ad  ujson-5.2.0.tar.gz
+md5  73b42e3f4bf3130073cfffbd82608275  ujson-5.5.0.tar.gz
+sha256  b25077a971c7da47bd6846a912a747f6963776d90720c88603b1b55d81790780  ujson-5.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6a00a8f8b4050303368b694147bde1aed9c96bdff869c181dbbf3ccb784a1501  LICENSE.txt
diff --git a/package/python-ujson/python-ujson.mk b/package/python-ujson/python-ujson.mk
index 8eb5f6a0a7..95cb0ebad1 100644
--- a/package/python-ujson/python-ujson.mk
+++ b/package/python-ujson/python-ujson.mk
@@ -4,12 +4,16 @@
 #
 ################################################################################
 
-PYTHON_UJSON_VERSION = 5.2.0
+PYTHON_UJSON_VERSION = 5.5.0
 PYTHON_UJSON_SOURCE = ujson-$(PYTHON_UJSON_VERSION).tar.gz
-PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/e4/fc/2dee0e78162aa1ad03dadde9a9b5c281d6f8bb0eed6810a270486d8fc041
+PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/6e/4a/03ddad85a10dd52e209993a14afa0cb0dc5c348e4647329f1c53856ad9e6
 PYTHON_UJSON_SETUP_TYPE = setuptools
 PYTHON_UJSON_LICENSE = BSD-3-Clause
 PYTHON_UJSON_LICENSE_FILES = LICENSE.txt
-PYTHON_UJSON_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_UJSON_DEPENDENCIES = host-python-setuptools-scm double-conversion
+PYTHON_UJSON_ENV = \
+	UJSON_BUILD_DC_INCLUDES="$(STAGING_DIR)/usr/include/double-conversion" \
+	UJSON_BUILD_DC_LIBS="-ldouble-conversion" \
+	UJSON_BUILD_NO_STRIP=1
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
