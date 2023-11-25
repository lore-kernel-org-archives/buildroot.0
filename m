Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48982C61DF7
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 06:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E59F260D51;
	Sat, 25 Nov 2023 06:41:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E59F260D51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rLHuWxSvLDlA; Sat, 25 Nov 2023 06:41:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 468D5606EC;
	Sat, 25 Nov 2023 06:41:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 468D5606EC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F0E5F1BF39E
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 06:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9A0B606EC
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 06:41:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9A0B606EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id acM51fnsHLKF for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 06:41:54 +0000 (UTC)
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE05B60648
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 06:41:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE05B60648
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-7b34ddcc625so80330139f.1
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 22:41:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700894512; x=1701499312;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SPZxm4eEmhTruzsRJ4R0WJWsY44TywfLzw0c+NuYrig=;
 b=pLv1Y19itEbg2gQKDYioeDvetanrj5xKBoFiZgQWKc8VPISff5d6oAz4pHEN3FPtsP
 hqOohppT+h+YZ1idGAyAPyj4MPT8+OPAIitcsDW26v1gjc4hiGqbiwel4a9RHJnMdetl
 tt+WU5Bqe2/p/KIoiq+qs0UeDLWnfs14Ne7jsPhEHSecpa5INWB2UuxBhC9N2I61M7Mj
 YnljXcv/q7FUwdVHL8HQJN2R11i/a/zc1Z2PRmXBEQ9ZEPIlYlLAjJFii1DChsxR34rE
 byWO2Joyu48K6acfyWBQw6bj3tcBUc0q5X/WEQQ62mOhYQK30XB1h6IEOgkIvcuOv3gM
 sOZw==
X-Gm-Message-State: AOJu0Yz3FjC1ExDdv7CosfR7ivBxwzh0EhtcEc20Ly1pKDI9Ytk7Bxt5
 6lxyD2cRbR8SZ30LD84xDZMuZYgrPEY=
X-Google-Smtp-Source: AGHT+IEaIuo2TnvWO5eNE4TXzSyZLAml5UK8tEVOOcN5O+tCWOftht9lfaKkv7IghZJGaaaWOb9ndA==
X-Received: by 2002:a05:6e02:2142:b0:35c:9577:df3 with SMTP id
 d2-20020a056e02214200b0035c95770df3mr303957ilv.13.1700894512322; 
 Fri, 24 Nov 2023 22:41:52 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 d9-20020a6bcd09000000b0079fbb834232sm1359606iog.19.2023.11.24.22.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 22:41:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 23:41:50 -0700
Message-Id: <20231125064150.820056-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700894512; x=1701499312; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SPZxm4eEmhTruzsRJ4R0WJWsY44TywfLzw0c+NuYrig=;
 b=VQ8QN64AF4HRAWNLZQdsujOAbzJBUFZAiVCJSXPDYTwr12BWrak0/IIzbPkhOklu3H
 5BUx82iCN1HpQek2Xi8zXxo8j7bFCg0IcZgeDBlWRADgFXQ/76YhR9qcn9W3LWDieF1r
 797u9e4ttv+E8E/uP/jVtShV4DH8P8+5jWxHNh7Zqc9o7lubIDB/ciJNYgM4EeayU1kB
 A3/V2CuURz2T3H/y73dRYAJnOe0uISGt/E7CcZo0HJ9XNSiGgFLh57F6X4aqqn9eJJYk
 AoRKjUKPLcrfNeBw8gxbJbAcR8McDQfArVotivOeOaJM1cnPUCjgRBJaX/LaleqPHGAR
 AA3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VQ8QN64A
Subject: [Buildroot] [PATCH 1/1] package/python-pycairo: bump to version
 1.25.1
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
 package/python-pycairo/python-pycairo.hash | 4 ++--
 package/python-pycairo/python-pycairo.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycairo/python-pycairo.hash b/package/python-pycairo/python-pycairo.hash
index 98bb7f2802..f44afe6fc4 100644
--- a/package/python-pycairo/python-pycairo.hash
+++ b/package/python-pycairo/python-pycairo.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycairo/json
-md5  7a3729d21659098e1b9a411b62e88966  pycairo-1.23.0.tar.gz
-sha256  9b61ac818723adc04367301317eb2e814a83522f07bbd1f409af0dada463c44c  pycairo-1.23.0.tar.gz
+md5  7669cdc70111d01ba6faecd65d8cdbf6  pycairo-1.25.1.tar.gz
+sha256  7e2be4fbc3b4536f16db7a11982cbf713e75069a4d73d44fe5a49b68423f5c0c  pycairo-1.25.1.tar.gz
 # Locally computed sha256 checksums
 sha256  360b9a526d47c51a7cab7f1ec49ca5893050562d639b742d588934ff84823a72  COPYING
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING-LGPL-2.1
diff --git a/package/python-pycairo/python-pycairo.mk b/package/python-pycairo/python-pycairo.mk
index f9933df187..eb60293ff8 100644
--- a/package/python-pycairo/python-pycairo.mk
+++ b/package/python-pycairo/python-pycairo.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCAIRO_VERSION = 1.23.0
+PYTHON_PYCAIRO_VERSION = 1.25.1
 PYTHON_PYCAIRO_SOURCE = pycairo-$(PYTHON_PYCAIRO_VERSION).tar.gz
-PYTHON_PYCAIRO_SITE = https://files.pythonhosted.org/packages/69/ca/9e9fa2e8be0876a9bbf046a1be7ee33e61d4fdfbd1fd25c76c1bdfddf8c4
+PYTHON_PYCAIRO_SITE = https://files.pythonhosted.org/packages/c7/7c/de4d40316ee563e4f15a0f05f28c8458833fbef80c4588b9dd51f39b78ee
 PYTHON_PYCAIRO_SETUP_TYPE = setuptools
 PYTHON_PYCAIRO_DEPENDENCIES = cairo
 PYTHON_PYCAIRO_LICENSE = LGPL-2.1 or MPL-1.1
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
