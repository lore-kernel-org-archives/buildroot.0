Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682EFC433FE
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 03:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE1E14040D;
	Sun, 30 Oct 2022 03:10:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE1E14040D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LrSHsPtRMsJc; Sun, 30 Oct 2022 03:10:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E83D9404DF;
	Sun, 30 Oct 2022 03:10:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E83D9404DF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 205761BF378
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 03:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F029781342
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 03:10:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F029781342
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XO3iNcMezeJg for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 03:10:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0428580C64
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0428580C64
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 03:10:38 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id d123so2777508iof.7
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 20:10:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wPqctK1YUXw3x6IJ2zVgYI+7g/y+sRMeit26GBjztIo=;
 b=ihAzQHUn7ymRD30saIqpWcThfSFkvxxsCav9LVDzbBIuz9ukyxwpaj0Xfou8OV/Vad
 Di8h3QJxbmwA5UuKXjQSX+iWq+vPJD2L1dWeQUrk6scUk1xJsdjTy/b/6UBrnu+XuPj5
 RoSJ1+8W4qlzXhvT7gbZ+bDvv02zqkioW8te981vk9LUGdFQ+uRAcJLZdtBWgAJGXWiT
 LL9SdwZEcyQVgpypXUmULe9AOpMDTM0eDuPMndJ+L4uu1SOx5VSEiV09bCvcoVoFV/gc
 MFg2PhmPpus94VG1BOjpMjAK0ed3ersp2NSHSgkgHgmEl1MV3hbtnlHQiMdfRSOT4jBa
 Rwkg==
X-Gm-Message-State: ACrzQf1n6LIQMSTI+L8/5jBYkItMwQm30EYaiqVCg4InFcaaikyKhckI
 bK9UE8c4oQUptMopPXmS2jXic29oEcP9yA==
X-Google-Smtp-Source: AMsMyM72mpQHkx6pd86qsp+dc5AB6OfCSudUgCKunuUkoVf8EJ//bLie6EfZp6ktXjvMQY48jdeTUg==
X-Received: by 2002:a5d:9481:0:b0:6c5:8052:4631 with SMTP id
 v1-20020a5d9481000000b006c580524631mr3335344ioj.46.1667099437753; 
 Sat, 29 Oct 2022 20:10:37 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 u27-20020a02b1db000000b0036378825c31sm1191813jah.70.2022.10.29.20.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 20:10:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 21:10:35 -0600
Message-Id: <20221030031035.1635268-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wPqctK1YUXw3x6IJ2zVgYI+7g/y+sRMeit26GBjztIo=;
 b=PuZIbT/wErdx+eTiq3aeZY4xaUzhd6iHzaQR4MbXKJB7RatfzhDP3qqHmtQ+q8SElg
 bCh6booMLw3GC3q/XIPYZoe2SzPL78hCAncTRlGXBOW+2hp2Og4tcehSJlUqDKT3kRjN
 7QKZx3BqXSEGFMhMIyFHTT9kkApi8VdTHueJjaE7+tqwM4IBSJTVelfQCITw1OKPGoI4
 RQ2R5urdqp47V9UXez1q2HACdR8EZZC//m2Y6HWY2/zGHjJC5HB8qoAgas4b9L3c1mUq
 q7q2q3BIU+djnMBLn/fYC46Sz3loQwrmCEN4y5TLhvWvU4hs+sEzRPFqjnD2rgopE0xI
 1pSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PuZIbT/w
Subject: [Buildroot] [PATCH 1/1] package/python-pypa-build: bump to version
 0.9.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pypa-build/python-pypa-build.hash | 4 ++--
 package/python-pypa-build/python-pypa-build.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pypa-build/python-pypa-build.hash b/package/python-pypa-build/python-pypa-build.hash
index c0856c2abf..4c02ee1dce 100644
--- a/package/python-pypa-build/python-pypa-build.hash
+++ b/package/python-pypa-build/python-pypa-build.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/build/json
-md5  307632355e32c3769c99da66f92fe020  build-0.8.0.tar.gz
-sha256  887a6d471c901b1a6e6574ebaeeebb45e5269a79d095fe9a8f88d6614ed2e5f0  build-0.8.0.tar.gz
+md5  f2dc1823b0eff7037e19be18e354b2f1  build-0.9.0.tar.gz
+sha256  1a07724e891cbd898923145eb7752ee7653674c511378eb9c7691aab1612bc3c  build-0.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  aaf9a29ca5907971ccf07de025375db34539a8d5eeebce20b46099805722106f  LICENSE
diff --git a/package/python-pypa-build/python-pypa-build.mk b/package/python-pypa-build/python-pypa-build.mk
index de4894dc3a..b78aefe855 100644
--- a/package/python-pypa-build/python-pypa-build.mk
+++ b/package/python-pypa-build/python-pypa-build.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPA_BUILD_VERSION = 0.8.0
+PYTHON_PYPA_BUILD_VERSION = 0.9.0
 PYTHON_PYPA_BUILD_SOURCE = build-$(PYTHON_PYPA_BUILD_VERSION).tar.gz
-PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/52/fa/931038182be739955cf83179d9b9a6ce9832bc5f9a917a006f765cb53a1f
+PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/0f/61/aaf43fbb36cc4308be8ac8088f52db9622b0dbf1f0880c1016ae6aa03f46
 PYTHON_PYPA_BUILD_LICENSE = MIT
 PYTHON_PYPA_BUILD_LICENSE_FILES = LICENSE
 PYTHON_PYPA_BUILD_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
