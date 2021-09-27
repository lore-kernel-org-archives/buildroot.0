Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E51C43217
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:51:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D45B61058
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D45B61058
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7184E60AC2;
	Mon, 27 Sep 2021 19:51:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8on5V9vkqbRT; Mon, 27 Sep 2021 19:51:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFE2060ABD;
	Mon, 27 Sep 2021 19:51:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 643521BF379
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6086D60ABD
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:51:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s4rK9k1aHtoX for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 19:51:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 222B060A57
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 19:51:44 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 b192-20020a1c1bc9000000b0030cfaf18864so871155wmb.4
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 12:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JLL4xyxm05MwzXAyDIPUYqmxst28ekhGI8khpD87ZzY=;
 b=iauHTuX7/cphfzOtMJmdF9YfIGA8I8qNYS6zuzUTbmp6d0kUbIJj5cw/wF9Y57IxO6
 ZYAJeV+9oKe7zyvHCtTgS/nMrPIAsMutuliE2nx2B4OFJ42EbfP92UNjky9Kxk08I99D
 /KWBsuUREfkmHZrYEoyiNVGmT20PuPQwEJI0SF719DDHs0CggyrxNAgFv6DXwf8DnpP8
 M+RU+NIEVp0gyhPh53w8a9IUFjT4twNVTCXEw3uivXtZjN6btyC1HyZZwlU/7u+CDsuM
 XH6v1Wf9iCPlR+U1ByLDBnnCQaF3JVfrJMI9M1lGQZgjxzk4BbdncYocNnwy6GJE6icO
 Fy9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JLL4xyxm05MwzXAyDIPUYqmxst28ekhGI8khpD87ZzY=;
 b=KQ5kEGQozfz9v5XnEf9Y0nrKt1VMhHdGiRtZuEoSSxY8ygxcwg2dYv2Wi+62F+AHaj
 EOhPvxqkw4RAMiWLA0kQLuc66nydODvAyn+r+UT9KaJRQGrvUDSJiDrOLxfunBFf7Cii
 ygYce3nWtqwIY2jg5mnNXQ+gavQTZrXBwnWY3DwFuXSGEBXf/Q+NrFRhUdEQmfooGAjy
 NNwEDTXbERIpVjluJQCiflK/J7sy8uGni3T+dkhZfmHnL2lJgqH9PF1BD5VvM5CTuUBG
 /7tcv9oTRpWH6hO+yGaNrQWiJC9w9nIwyWoT3Wo7FUBh9wDmGEmi9MpJEKQve9BUVMvr
 PzBw==
X-Gm-Message-State: AOAM530pAPa0UrUgxQMXKIDvUZFp85AMs4k4WCtakZzcshnfw41yCseH
 wFTyPujfd4DrLiSAcqIpF+7NZm92n4k=
X-Google-Smtp-Source: ABdhPJyomt3ReVx7BVQ9Ng0YDTJ7fRE8uk5dM39XT/LWDSeoKChNTusFnHwfKPZUTg2XGfBG7jGR9A==
X-Received: by 2002:a05:600c:1c93:: with SMTP id
 k19mr903110wms.80.1632772302134; 
 Mon, 27 Sep 2021 12:51:42 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:fc32:81cf:8e3a:84a0])
 by smtp.gmail.com with ESMTPSA id w23sm485359wmi.6.2021.09.27.12.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 12:51:41 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 22:51:25 +0300
Message-Id: <20210927195136.549542-1-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aiocoap: bump to version
 0.4.1
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-aiocoap/python-aiocoap.hash | 7 ++++---
 package/python-aiocoap/python-aiocoap.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-aiocoap/python-aiocoap.hash b/package/python-aiocoap/python-aiocoap.hash
index 6df482aa68..6357a87931 100644
--- a/package/python-aiocoap/python-aiocoap.hash
+++ b/package/python-aiocoap/python-aiocoap.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/aiocoap/json, sha256 locally computed
-md5	f5fed00767b4197f2fbaa0ff95cbbf78  aiocoap-0.3.tar.gz
-sha256	402d4151db6d8d0b1d66af5b6e10e0de1521decbf12140637e5b8d2aa9c5aef6  aiocoap-0.3.tar.gz
+# md5, sha256 from https://pypi.org/pypi/aiocoap/json
+md5  c5809dfb02be8784ec17897380009052  aiocoap-0.4.1.tar.gz
+sha256  c47c9d19a98699f27707186871b7c84f4a7016fe4fbb5bd300f809ae456f8a55  aiocoap-0.4.1.tar.gz
+# Locally computed sha256 checksums
 sha256  2bb211d412a6bfa4b2a9cf01123c7fe90e5e6185938896e23ab07b84f8494180  LICENSE
diff --git a/package/python-aiocoap/python-aiocoap.mk b/package/python-aiocoap/python-aiocoap.mk
index a2db70b803..c933d27b23 100644
--- a/package/python-aiocoap/python-aiocoap.mk
+++ b/package/python-aiocoap/python-aiocoap.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCOAP_VERSION = 0.3
+PYTHON_AIOCOAP_VERSION = 0.4.1
 PYTHON_AIOCOAP_SOURCE = aiocoap-$(PYTHON_AIOCOAP_VERSION).tar.gz
-PYTHON_AIOCOAP_SITE = https://pypi.python.org/packages/9c/f6/d839e4b14258d76e74a39810829c13f8dd31de2bfe0915579b2a609d1bbe
+PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/67/1c/6d6764010a4779d61bc7241afa663b368261c72af20555b26efc875d4276
 PYTHON_AIOCOAP_SETUP_TYPE = setuptools
 PYTHON_AIOCOAP_LICENSE = MIT
 PYTHON_AIOCOAP_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
