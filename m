Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D728EC433FE
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 19:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 631FA410F7;
	Wed, 20 Apr 2022 19:50:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A4EBuRPUQU7Z; Wed, 20 Apr 2022 19:50:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5664D4035D;
	Wed, 20 Apr 2022 19:50:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C4EFD1BF418
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 19:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C23BB60D68
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 19:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0hoBaPFd8fVF for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 19:50:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 087CF6009C
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 19:50:30 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id b5so1712298ile.0
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 12:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FiB2hOh+1lsVvErSaag2HWoUgeQyxMSddjw8PfFGET0=;
 b=hIhoQ1EtbxEMPe0ZPx/mkutx5MZexyYVx8YHkDXxSadwyCC7Y5z7iZxKdIKuktAMd3
 UfP+U/hMZXD4wYaU+pWXog0AqrKU0RS0FA1fkdZlEo8S/vLsDfmj5WDzBVG6GgF6vGRX
 Yag+iuzkA2OKXtpKUUIswB/6eER46DBeLqZ2+QvupSLgFE0y0DtcYIn59KTSnjaXPu3i
 WGWsHVNACO9ehDFQWtvey3l/4ErExjsT+cnW051pXK/hUQBb+gNHRhNqqcaHUGmSh/lw
 nFrrSDZaph02cnZItlBrDlUt/UMvv3ciPipGD7sjx823OWuUeYsU+QQRmr4IByt/XhB3
 0jcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FiB2hOh+1lsVvErSaag2HWoUgeQyxMSddjw8PfFGET0=;
 b=7qynQnTFMZVa10N6rwfLqlr+SyCT4gWnxdZ7ZuoiZPTl0rega7/mXFANFoc5J3c2QS
 B5dIqxkXy56KgessEzl7C2AL6xVDvqzRHLePT9zEBIkIpZznZpR7oKHBX9CU2SGfyxPE
 pqojqaiszVpodFbQrPv4g5GydiPWCFDWmn27hpC9BGrKjd/WkJ7Cxbg47NehbjqAAJVl
 ZdXtmAN9c67ZmlqeC81vvZywzxtxeKg+sDSWgWbABG7X9nz56p7kMgqkB5BQZ7Z2NSyJ
 JyxDD4UXc/zRlvIk9fV4yjP9aHfPD6NsCaCU21Ijlbs5jz+lhEP3Y6TYOOXf5Nj5WmMi
 GlkQ==
X-Gm-Message-State: AOAM531BzxV//kkTwTPguREvHxsP3ocR3YcvZdUk4vZLt4Vds5q34r+Z
 Frb24Bynoy8Ob1LVeIeLQeB5LbX406spsQ==
X-Google-Smtp-Source: ABdhPJzJhSOLv+Eq9gRK3E8Vqjy4PWVzZhkb43CPCz+597x9KznK+XysRRhYyqQnMWAVQ1MWYKvfPg==
X-Received: by 2002:a92:ae02:0:b0:2c6:798d:2be with SMTP id
 s2-20020a92ae02000000b002c6798d02bemr9055411ilh.18.1650484229622; 
 Wed, 20 Apr 2022 12:50:29 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 b19-20020a5d8553000000b00649f02b1b0csm11932371ios.39.2022.04.20.12.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 12:50:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Apr 2022 13:50:27 -0600
Message-Id: <20220420195027.883653-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-bsdiff4: bump to version
 1.2.2
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

Migrate build system from distutils to setuptools.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bsdiff4/python-bsdiff4.hash | 6 +++---
 package/python-bsdiff4/python-bsdiff4.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-bsdiff4/python-bsdiff4.hash b/package/python-bsdiff4/python-bsdiff4.hash
index 4fddd137e6..bb84bb09a5 100644
--- a/package/python-bsdiff4/python-bsdiff4.hash
+++ b/package/python-bsdiff4/python-bsdiff4.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bsdiff4/json
-md5  58889a1cd439c82c78aa2e4776b1ff38  bsdiff4-1.2.1.tar.gz
-sha256  87cffc7522effdda03fd1564b212ad2279c0af50d16c3e65776f80acb6705d4b  bsdiff4-1.2.1.tar.gz
-# Locally computed sha256
+md5  fc5ea1adfe629a7c7ac6f4bb1a0dca93  bsdiff4-1.2.2.tar.gz
+sha256  1880ac3f52a6c46ae6bcc6db117e4fb35f9b0ccd5af75fd4fee6907d00d6983c  bsdiff4-1.2.2.tar.gz
+# Locally computed sha256 checksums
 sha256  c6c921c90383f1c43beb53c49a652d28309a410a7c394c729fd8870271451cf0  LICENSE
diff --git a/package/python-bsdiff4/python-bsdiff4.mk b/package/python-bsdiff4/python-bsdiff4.mk
index e1c3f7765b..7a50e3379a 100644
--- a/package/python-bsdiff4/python-bsdiff4.mk
+++ b/package/python-bsdiff4/python-bsdiff4.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-PYTHON_BSDIFF4_VERSION = 1.2.1
+PYTHON_BSDIFF4_VERSION = 1.2.2
 PYTHON_BSDIFF4_SOURCE = bsdiff4-$(PYTHON_BSDIFF4_VERSION).tar.gz
-PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/d8/97/101315b0d8c8d6340ee310484a1af6a2ccf65d7bb4762c3a669cf9457c71
+PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/34/e2/e28dd282974f919a6b9adb3b7e64bb1fa4390046706c3e58a60b94aeb497
 PYTHON_BSDIFF4_LICENSE = BSD-2-Clause, BSD-Protection (core.c)
 PYTHON_BSDIFF4_LICENSE_FILES = LICENSE
 PYTHON_BSDIFF4_CPE_ID_VENDOR = pypi
 PYTHON_BSDIFF4_CPE_ID_PRODUCT = bsdiff4
-PYTHON_BSDIFF4_SETUP_TYPE = distutils
+PYTHON_BSDIFF4_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
