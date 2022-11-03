Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D42CC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 00:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A997C607D1;
	Thu,  3 Nov 2022 00:19:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A997C607D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wkWS8trmWDW9; Thu,  3 Nov 2022 00:19:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC43C6059C;
	Thu,  3 Nov 2022 00:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC43C6059C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D1E61BF41D
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 00:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC8AC80C06
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 00:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC8AC80C06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hoHydKptCCMI for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 00:19:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E968280BAC
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E968280BAC
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 00:19:37 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id y6so150568iof.9
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 17:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rx2K+uFVWUS2XPHA4UTz2HikwO2UzXPWHI6+b7Mle/Y=;
 b=ssg/3kRurPiuD4VYtkYSzMx8IIFbkGKbowk/xfsjC/bDvHT7mTRF1wVahSDjJb+XHN
 R5H106FPjGG7gqk8mXQ6r2dlP0mvq5an16e3N4lLlOFFXsVzfZKQPXdcb9XShjIMHIFM
 L1bMYyc0HSokeP/o5plPCAtCL07RXjbnq1nDjk2WHpAg+Ic+FSBmj3JUVC2iM6bg692F
 dP4+E3a32zKfKJSI02ThpNI4DP9C8J5TZY0FNSwR8HuYfeSsZYBMC5/S9BRJDnxLhn4U
 yn9YKFZdTWeDqTbq+xkUPnMsIEwEoctDgNfkX9O9O7YHB+4MDogEyh+6wrqKpQVbOF11
 TWew==
X-Gm-Message-State: ACrzQf22eMQlidEgkaL+V5URMp9FCUDz3fZCYz3ErQnfhFpVEuThZyCt
 z7zkhUIPwTlTvEp0LVUHW3deT4PXLt1eQQ==
X-Google-Smtp-Source: AMsMyM6XlXoA3ODR4hYqc9DpMXERa0f414EuCNJfUpdQXEG+4Oc+ZeVX8rf2awCoktUj+mPtO1Z0ww==
X-Received: by 2002:a02:b383:0:b0:375:4fc8:586b with SMTP id
 p3-20020a02b383000000b003754fc8586bmr14365531jan.200.1667434776630; 
 Wed, 02 Nov 2022 17:19:36 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 y19-20020a027313000000b0035a10a7e3ecsm5198938jab.74.2022.11.02.17.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 17:19:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 18:19:34 -0600
Message-Id: <20221103001934.2100260-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rx2K+uFVWUS2XPHA4UTz2HikwO2UzXPWHI6+b7Mle/Y=;
 b=Lo76nbHDaYcICBZGuZnAawtFcohYEdWOblSQe2kGOezGVJZTgkniKarrTtSiKo9gvA
 5nyNljTa/7IabnsD4EtpnFws+pbjc6/wbz9oy1d5HzPeWcI7+rIvhsG1eQsDwFbZhVBE
 CZvD439a50SZDcWYIJULlXVToXhyzwHx+fwkMB/U/DiqTBVZZlONwPZVxVFj4ggYHSCh
 2Ch/HYlC5Qcvfr8ieckgttattGoCiK9DKjQsfP8Tj7xh4211Hzc8DKsQTOtF6wJAQV+c
 S4JiJXJuLrbOyQYt3HCUQHPIOnJQQftsE2NbAd+4CpREkhI1edvdl6TUVMUXZEaIwg6B
 m9Cw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Lo76nbHD
Subject: [Buildroot] [PATCH 1/1] package/python-libusb1: bump to version
 3.0.0
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
 package/python-libusb1/python-libusb1.hash | 7 ++++---
 package/python-libusb1/python-libusb1.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-libusb1/python-libusb1.hash b/package/python-libusb1/python-libusb1.hash
index 7d2302e088..86dea08c89 100644
--- a/package/python-libusb1/python-libusb1.hash
+++ b/package/python-libusb1/python-libusb1.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/libusb1/json, sha256 locally computed
-md5  b087646fb0c8c4cf7e8123af72f885b9  libusb1-2.0.1.tar.gz
-sha256  d3ba82ecf7ab6a48d21dac6697e26504670cc3522b8e5941bd28fb56cf3f6c46  libusb1-2.0.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/libusb1/json
+md5  ffbb02bf9aa49f973a6a58112aed7b06  libusb1-3.0.0.tar.gz
+sha256  5792a9defee40f15d330a40d9b1800545c32e47ba7fc66b6f28f133c9fcc8538  libusb1-3.0.0.tar.gz
+# Locally computed sha256 checksums
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/python-libusb1/python-libusb1.mk b/package/python-libusb1/python-libusb1.mk
index 40a64141af..48a0b1dea3 100644
--- a/package/python-libusb1/python-libusb1.mk
+++ b/package/python-libusb1/python-libusb1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LIBUSB1_VERSION = 2.0.1
+PYTHON_LIBUSB1_VERSION = 3.0.0
 PYTHON_LIBUSB1_SOURCE = libusb1-$(PYTHON_LIBUSB1_VERSION).tar.gz
-PYTHON_LIBUSB1_SITE = https://files.pythonhosted.org/packages/a9/97/e8afa2af12b6de608ec86c8c4ad57f1248d98946d1b5e1aa0bff926755e9
+PYTHON_LIBUSB1_SITE = https://files.pythonhosted.org/packages/f4/83/59bf75e74e0c4859ea63eae0c7da660c1dcb78b31667d4a5f735d52f5974
 PYTHON_LIBUSB1_SETUP_TYPE = setuptools
 PYTHON_LIBUSB1_LICENSE = LGPL-2.1+
 PYTHON_LIBUSB1_LICENSE_FILES = COPYING.LESSER
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
