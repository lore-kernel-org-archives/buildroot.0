Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F9AC4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 05:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41ABD41BF8;
	Thu, 11 Jan 2024 05:35:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41ABD41BF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wdZaRGvlc6Oz; Thu, 11 Jan 2024 05:35:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EE64418AF;
	Thu, 11 Jan 2024 05:35:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EE64418AF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A20231BF23C
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 05:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A93561400
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 05:35:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A93561400
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EtEUyCrgVbZD for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 05:35:51 +0000 (UTC)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 785CE613E1
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 05:35:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 785CE613E1
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3606dc50447so26130405ab.2
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 21:35:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704951350; x=1705556150;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sfPU1Gd1mi+kNAHCG5lM8fMLRgDy9xkfq0YxJXf2Qo4=;
 b=H09N5JjuHwJPQQ00W4DjEAPJCSCtB02/cz2OoikaO2YNo1Fmj0rLgwjeiudCbSFw0B
 HIUI2pNyMxfJpC4TSjys6RFiBnsV90ZpWYb/F2CLQEYreaI+nHWIhSCv9v8puPaZWU/L
 V7uKFfeeSxUpaP36CWQE8NlAGRNeMozBZhnY9UAWUmCm/rvHjFAu5BsdhImrTLPXMY/g
 mn3MaX1WQfcSQAFd+rQSxtUTqt2o7iVV6BnILFavCfoKGzi1JTXlJQ4tSwHN6m4elk69
 Z0EI8xu+Nhomzo8JV34haj/DYrS7/HqkFxVVHWP3pEo0dndteM24nFZ4+uOxJ3gZudYD
 0caw==
X-Gm-Message-State: AOJu0YwaidHTIwINZMrgSO3HTAi+OJqnrGnFRyYzTTBNUjFh9ywYAsv3
 X0NJRMcgag7nl9LqIzAHhBVeha1dyZxGbQ==
X-Google-Smtp-Source: AGHT+IGsIIyR1wPtXJhpnL2Zfve78GhLVcHkyU5uHlD3HdFqp9NVuSvp0UzXTvRIN74Oxnrt+J95vQ==
X-Received: by 2002:a92:d4d0:0:b0:360:7c05:e484 with SMTP id
 o16-20020a92d4d0000000b003607c05e484mr736368ilm.54.1704951350041; 
 Wed, 10 Jan 2024 21:35:50 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 o15-20020a92c04f000000b0035ff59f9ffcsm77267ilf.62.2024.01.10.21.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 21:35:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 22:35:48 -0700
Message-Id: <20240111053548.2930141-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704951350; x=1705556150; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sfPU1Gd1mi+kNAHCG5lM8fMLRgDy9xkfq0YxJXf2Qo4=;
 b=GXBNx1GXaBezsY/Upb/l0X0EZK4bbdKqRPrKhi5oAultWUmqvtAU41pT7fu+C1Hp7r
 n8ze0g1y9v6Pgww1nR3V0ssnhZTlSpWydBl9+PqAJ6adbQ7eB5VqZP9sVQT+dDtZvbzm
 i65gkSFrRq5A2pULz4LEdc4c5UhEuGc7MmtOolgGQpdVfL1b4R4pB3oyQz1mnEtX4aGR
 i3OkKV5osSJcSD7I8KoS1kTNvJOjYU1yk+ivX6svSWCvAk2SZ0SpDlGn2JJUxrIcBAaq
 CkcEPIco3jXr9lGa8VFhlJZukRO86UTo5HPWN0OXQHzOsSK3hi0V5mI+UO3WCl4OBuRf
 sPlQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GXBNx1GX
Subject: [Buildroot] [PATCH 1/1] package/python-s3transfer: bump to version
 0.10.0
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-s3transfer/python-s3transfer.hash | 5 +++--
 package/python-s3transfer/python-s3transfer.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-s3transfer/python-s3transfer.hash b/package/python-s3transfer/python-s3transfer.hash
index 16f0face72..48be6b3a8b 100644
--- a/package/python-s3transfer/python-s3transfer.hash
+++ b/package/python-s3transfer/python-s3transfer.hash
@@ -1,4 +1,5 @@
-# sha256 from https://pypi.org/pypi/s3transfer/json
-sha256  2ed07d3866f523cc561bf4a00fc5535827981b117dd7876f036b0c1aca42c947  s3transfer-0.6.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/s3transfer/json
+md5  ba84e7c06bc1dcd3151c3d2132621cfc  s3transfer-0.10.0.tar.gz
+sha256  d0c8bbf672d5eebbe4e57945e23b972d963f07d82f661cabf678a5c88831595b  s3transfer-0.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/python-s3transfer/python-s3transfer.mk b/package/python-s3transfer/python-s3transfer.mk
index 60a72da729..6fae824862 100644
--- a/package/python-s3transfer/python-s3transfer.mk
+++ b/package/python-s3transfer/python-s3transfer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_S3TRANSFER_VERSION = 0.6.0
+PYTHON_S3TRANSFER_VERSION = 0.10.0
 PYTHON_S3TRANSFER_SOURCE = s3transfer-$(PYTHON_S3TRANSFER_VERSION).tar.gz
-PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/e1/eb/e57c93d5cd5edf8c1d124c831ef916601540db70acd96fa21fe60cef1365
+PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/a0/b5/4c570b08cb85fdcc65037b5229e00412583bb38d974efecb7ec3495f40ba
 PYTHON_S3TRANSFER_SETUP_TYPE = setuptools
 PYTHON_S3TRANSFER_LICENSE = Apache-2.0
 PYTHON_S3TRANSFER_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
