Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16EFD1358A
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 23:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8126140BDB;
	Sun, 27 Oct 2024 23:10:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ju1ifWNLXsus; Sun, 27 Oct 2024 23:10:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07E1F40B93
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07E1F40B93;
	Sun, 27 Oct 2024 23:10:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EDB9F1DAA
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 23:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB4BA40B47
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 23:10:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eC2zUNh0CQG9 for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 23:10:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C1FAD40B93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1FAD40B93
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1FAD40B93
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 23:10:28 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-83aba65556cso155393139f.3
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 16:10:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730070627; x=1730675427;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o1wBpWZCRIiADXq3MELzXFwp8Guri/v1GkDbM+XUGnA=;
 b=il97gBnAvpZMfC85LlTaNosXe9D7XbAOm6PpTJFJHxWP+AfObEL+tgRy9AeVNpEyzY
 gHDeqokiopyUz5enzbnx60V6tzlB1NxDgT+Dn95tc8srcOCNqYxKXWb9zhooqp94leqa
 inYq6Vw2XSkBKImux5aGoPtfeXNNmV8ZaWHWvtwj2dUlqkIUya0x0L7U6nRO7vB/6Ysb
 Tw/LyKBag6dLV9u08C8udTuAzrpPmHUvD/KiVTTB/fFWRtHqy2anji/YpUY73C7k2g2I
 W0u/A0IlT3xT7gnoMHxDsglfH5SdvDXBqWVTKL/wd4xidPUNsHPA9y3RAVcPpft7bSmh
 Sjrg==
X-Gm-Message-State: AOJu0YxlKHV+0cUDfqMnDp9B3rRa+uwc19qflcYdByuIm3Vh5Hpl7wcU
 w5AmXsBbVmBp13ql3RQvKhHAtekj0rDNS7YRTGMoQA8dC1mJ8TRUoMZqJA==
X-Google-Smtp-Source: AGHT+IEGi4AP3ao99+FEjScetTd0b3dKgGfsTJFLDE31cEeKPmgufZIp21TlhAI17gyAkRejM8/luA==
X-Received: by 2002:a05:6602:6d07:b0:82a:9cab:9be1 with SMTP id
 ca18e2360f4ac-83b1c5e97famr502715839f.12.1730070627408; 
 Sun, 27 Oct 2024 16:10:27 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83b137f5620sm124972839f.31.2024.10.27.16.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 16:10:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 17:10:25 -0600
Message-Id: <20241027231025.3876630-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730070627; x=1730675427; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o1wBpWZCRIiADXq3MELzXFwp8Guri/v1GkDbM+XUGnA=;
 b=mH1DatwvxVJ+lAYpHsFKQUSjR777i3gTETAHdgAY8ovJCf9yXyR1feEZJn6RRvg8E/
 WvfPE5kdhJPow886UCwUBYXZ06TMaLO8MeV2RmbooJahm32xMyVNx+SvoviC/5ZGmK7x
 O95KUBScelM0Gg4mxxuD+juozvucefD9jj2WLzrQ4Ky80qnzPa0YsADbLP0NqMPFB0Iw
 HE7eRGlI/LdC1j8wLsC2xYMXyCoD96uz+AHvzTfgeLdpda8l8eK+jA0yMl0NVM9UFBUP
 hypkn3oyszws6AqJ1QUawPE//0L1sPlGNAOgNXQvbj05pvWnwvl+E3cqmiTTRn6aA7yk
 uu0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mH1Datwv
Subject: [Buildroot] [PATCH 1/1] package/python-pysmi: bump to version 1.5.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

License hash changed due to adding contributors.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pysmi/python-pysmi.hash | 6 +++---
 package/python-pysmi/python-pysmi.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pysmi/python-pysmi.hash b/package/python-pysmi/python-pysmi.hash
index 729b980032..39a76fc740 100644
--- a/package/python-pysmi/python-pysmi.hash
+++ b/package/python-pysmi/python-pysmi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysmi/json
-md5  f99b37bb4a31a9cfaedc8b7f269ad7b8  pysmi-1.5.0.tar.gz
-sha256  e42bcd3961de71d58186f7a7fa6adac133701ae74cd19e6376289d89593b0af2  pysmi-1.5.0.tar.gz
+md5  84ff7ba2166c022b194c271f43b14c56  pysmi-1.5.5.tar.gz
+sha256  ad96dc983370e2b29a37dcc3af4ca6948127522b629bece23320ca0698c1b605  pysmi-1.5.5.tar.gz
 # Locally computed sha256 checksums
-sha256  46aa9a218d0f066d2565b826b08872227480e93f561eadf4d994213b08882b8a  LICENSE.rst
+sha256  bc211b99a3eb46f3b1f64f8152dffc869d3bc4bffed82545732ef9e34628513b  LICENSE.rst
diff --git a/package/python-pysmi/python-pysmi.mk b/package/python-pysmi/python-pysmi.mk
index f747864def..753105928c 100644
--- a/package/python-pysmi/python-pysmi.mk
+++ b/package/python-pysmi/python-pysmi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSMI_VERSION = 1.5.0
+PYTHON_PYSMI_VERSION = 1.5.5
 PYTHON_PYSMI_SOURCE = pysmi-$(PYTHON_PYSMI_VERSION).tar.gz
-PYTHON_PYSMI_SITE = https://files.pythonhosted.org/packages/59/d9/136ca19b66a917377a3b40f390f525eeeb21122dba7562a726bfb2d3629e
+PYTHON_PYSMI_SITE = https://files.pythonhosted.org/packages/dc/fb/8461c21d0893c72492100b35fce128b057c4e615e79b0ce4496412ffec0c
 PYTHON_PYSMI_SETUP_TYPE = pep517
 PYTHON_PYSMI_LICENSE = BSD-2-Clause
 PYTHON_PYSMI_LICENSE_FILES = LICENSE.rst
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
