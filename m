Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BE4C77B6C
	for <buildroot@archiver.kernel.org>; Thu, 13 Apr 2023 11:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FD3F41F1E;
	Thu, 13 Apr 2023 11:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FD3F41F1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3kSwJxSRcmVe; Thu, 13 Apr 2023 11:34:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0249741EF0;
	Thu, 13 Apr 2023 11:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0249741EF0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E2991BF2B9
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 11:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8ABE41EF0
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 11:34:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8ABE41EF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AL9t-g9LemeF for <buildroot@lists.busybox.net>;
 Thu, 13 Apr 2023 11:34:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92444418AC
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 92444418AC
 for <buildroot@buildroot.org>; Thu, 13 Apr 2023 11:34:32 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5066ce4f490so458956a12.2
 for <buildroot@buildroot.org>; Thu, 13 Apr 2023 04:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681385670; x=1683977670;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=quS6xm8lQPkF3LKRhmPaVqngtz89K7063Kiqe1t2uOk=;
 b=jJ2/nEw3dDyKCuCKLG0WgAxreTVZ4gUQ3NseLnDci3ZoXgBoJjkrYm5Yc9/hjfcdsD
 28zcq7nKRuM765gAzL4O+Fevky72u9/Jm2yDggu4tvCAXh+E+jWsyC8gxCGnJlx3JUt7
 sUixFF7HZkG+j8R4/b1Lrm1ebTAWlthLovKYI9ZNUrgvdHKfd3/YbTcM/5mF/lO9yHi0
 /Wr1GXimPe/6FmMCJgkvNS8pCt0OXdx6PQxdrCumDUboNbSqtsW4t929Lvpt/lLvBhIo
 QeN94BjQI2kvl1TX/ke5FvAuD6qBfHgUe16iaD/dlJpjRwMYragm8VrQbDjaGvWViKMa
 0JbQ==
X-Gm-Message-State: AAQBX9eZfVs07ybBu37eI0bsZy46SCUJbfyqa6pdqY0G7WDLDkJcTBD6
 dnPE6T2Zo9WDPt2dp4A/Jw6enhoPZqiCBxWFG+U=
X-Google-Smtp-Source: AKy350bvPnbO7T0bxccupnz+r/v3XfS9G8+ZhzDRvdV2O6gCv14MWGL6XtNrnOtbXfgxwW8L1d26Yw==
X-Received: by 2002:a05:6402:1b02:b0:501:d4f9:3141 with SMTP id
 by2-20020a0564021b0200b00501d4f93141mr2311506edb.32.1681385670417; 
 Thu, 13 Apr 2023 04:34:30 -0700 (PDT)
Received: from localhost.localdomain ([91.90.166.178])
 by smtp.gmail.com with ESMTPSA id
 b2-20020aa7cd02000000b005050f477147sm725926edw.13.2023.04.13.04.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 04:34:29 -0700 (PDT)
From: Witold Lipieta <witold.lipieta@thaumatec.com>
To: buildroot@buildroot.org
Date: Thu, 13 Apr 2023 13:34:16 +0200
Message-Id: <20230413113416.3445526-1-witold.lipieta@thaumatec.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thaumatec-com.20221208.gappssmtp.com; s=20221208; t=1681385670; x=1683977670;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=quS6xm8lQPkF3LKRhmPaVqngtz89K7063Kiqe1t2uOk=;
 b=J28x6GgAbbyH+9sxVvq0Sh9zwBNUTZ5M9EtXsy6VHH9GtPREoUW/0Bzzx6td/bHDWs
 2RvSJ9g7c3l3Cfp8d+tYWzWRMB2KRE1hymLwTZRLqCdLfdTf2/42g2Jbj/SweUHVWoyy
 SzpUF4COmfPkIWhtrKWOrqJFDuZjaSegKdcq9Z1wTGIGhRndx6/yyrlAZymH8qOswQ8n
 Af7EsVt2fXE/KTouPeWzWM2GpOUWiCKdueoc77HQGBlz6eWiZb/dEsdRvJn6kHmTzPRs
 EX8i7v/6WHhS6v/qCB60eMkxRpFZMZzNmGP6ovIyCbwCwbhi9zln8RgvA4QQe62ciA5P
 EYLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=thaumatec-com.20221208.gappssmtp.com
 header.i=@thaumatec-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=J28x6GgA
Subject: [Buildroot] [PATCH 1/1] package: python-esptool: Bump version to
 4.5.1
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
Cc: Witold Lipieta <witold.lipieta@thaumatec.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Witold Lipieta <witold.lipieta@thaumatec.com>
---
 package/python-esptool/python-esptool.hash | 4 ++--
 package/python-esptool/python-esptool.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-esptool/python-esptool.hash b/package/python-esptool/python-esptool.hash
index b7246f9788..e1d3188658 100644
--- a/package/python-esptool/python-esptool.hash
+++ b/package/python-esptool/python-esptool.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/esptool/json
-md5  92c38551bc33bd5271bdea033aa51610  esptool-4.4.tar.gz
-sha256  8acd4dfe70819b1302861ae92894380fb4700b377f5a4739479a4ec276e0b256  esptool-4.4.tar.gz
+md5  fbad6fb6024580fd2645331f92a74555  esptool-4.5.1.tar.gz
+sha256  e3eb59836123e5ebf793ef639311f7d85645526487d8b1c2b51159b455106b9a  esptool-4.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/python-esptool/python-esptool.mk b/package/python-esptool/python-esptool.mk
index 0a71e1a78b..34bdf6cc96 100644
--- a/package/python-esptool/python-esptool.mk
+++ b/package/python-esptool/python-esptool.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ESPTOOL_VERSION = 4.4
+PYTHON_ESPTOOL_VERSION = 4.5.1
 PYTHON_ESPTOOL_SOURCE = esptool-$(PYTHON_ESPTOOL_VERSION).tar.gz
-PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/8b/4c/82d7fe5fa0643415bbb90bebff1f861816903c481ee5156fabd6d76dc684
+PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/04/80/8eb97d1793cfaf830a4c0a7ea1d8f0674ccba8c23b7d02dcce074b5f44ea
 PYTHON_ESPTOOL_SETUP_TYPE = setuptools
 PYTHON_ESPTOOL_LICENSE = GPL-2.0+
 PYTHON_ESPTOOL_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
