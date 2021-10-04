Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E7DC433FE
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 17:14:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85C7B61409
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 17:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85C7B61409
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4379640017;
	Mon,  4 Oct 2021 17:14:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iNJbHomnPGUr; Mon,  4 Oct 2021 17:14:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EE5040018;
	Mon,  4 Oct 2021 17:14:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B21531BF308
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 17:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D0D56060D
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 17:13:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x4HqCk5G-9Ea for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 17:13:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E09F6082C
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 17:13:53 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id u18so32047139wrg.5
 for <buildroot@buildroot.org>; Mon, 04 Oct 2021 10:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pbEchFPMqO8k03eSV1cbzvxei3lCkz1nbvEQAwtIVfY=;
 b=HEFwFxvkaiVTouCaRlosc+PdSLB0Mn0dRFQgEiFLXl4wOwieKocEn5uzfXLeL44Bia
 1E32m058iwRXAkjo9k4c9GOReSgQ1lFeTVxNYW8qCZNMH7eF5nRaJ9MiCh5NwPO02o1U
 MNz0A6R8qkh6NHFm4EsMtW7ylHxB7XazGaKgj/eNkMYWfq1nSSZQzcOseZNX/2OBmCHZ
 h/MIs7vTJf2oa73x1z881pq/iD/WIee79y5ZQ/D+lT2j9KKyME8j/QI0GtiaomngktpB
 /5q4wAgC2XG2Hi8oyMbbN9sjflZ+ltNXmkd/BvD9hFX0vrx1qWwGsaAPP9cH6AlbtoEL
 yFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pbEchFPMqO8k03eSV1cbzvxei3lCkz1nbvEQAwtIVfY=;
 b=fdb8p8rYcoVQKsPW8PUevosFkTaOcqAtzBCNUx6UuWneWczurSr/TOmvHIbWOvEqX8
 cNGbmvL1SDrn6f4KYPybuzT+mkuw0GAwVk9FcmAFmiIyxwuVtdXYWVbk9zxgBKd0N2Ou
 x8S4jCN1ariZIk/cs9942xgHRi99ebMcGysHJJoZt3OHzyylHvkIhFLoFyaCBNmsWEU3
 0LY2SWNdHC1EoJjTVEWNfw5eGtdlvLN4k3K42BbnoPwJjSBdsFpoia573BLkucHflG6T
 0bO9aavttHl5IYiLolL/Uv5OHpagFFA56F/dls1M8H/g0vH05VDECThwoOqB7U1+rWhd
 StWg==
X-Gm-Message-State: AOAM531uRlCC34XhxbXn4Fc7IfVwya4EJ1361JxNRAgohSvFTM5yoUvi
 8rLXgS59yWgvIAjmXtI8V3YyjGN3p0A=
X-Google-Smtp-Source: ABdhPJxrKjwpdpSX4GSKTdEM3kaHQpKLK13mQvLlWrdfltdyMv4h3+KbcMX+gSvZzaeMzyKHHVsgVw==
X-Received: by 2002:adf:9b8e:: with SMTP id d14mr6426233wrc.288.1633367631509; 
 Mon, 04 Oct 2021 10:13:51 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:576:abe5:6aef:aec6])
 by smtp.gmail.com with ESMTPSA id i92sm14669053wri.28.2021.10.04.10.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 10:13:51 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 Oct 2021 20:13:41 +0300
Message-Id: <20211004171341.19564-4-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211004171341.19564-1-asafka7@gmail.com>
References: <20211004171341.19564-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-humanize: bump to version
 3.11.0
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

* The package doesn't support python2 anymore.
* Take also sha256 from pypi.
* License was updated with a year bump.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-humanize/Config.in            |  1 +
 package/python-humanize/python-humanize.hash | 10 +++++-----
 package/python-humanize/python-humanize.mk   |  4 ++--
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/python-humanize/Config.in b/package/python-humanize/Config.in
index f4f4e67b65..ec63be9b35 100644
--- a/package/python-humanize/Config.in
+++ b/package/python-humanize/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_HUMANIZE
 	bool "python-humanize"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  Python humanize package contains various common humanization
 	  utilities, like turning a number into a fuzzy human readable
diff --git a/package/python-humanize/python-humanize.hash b/package/python-humanize/python-humanize.hash
index 47b5f70c9a..9b2559ab11 100644
--- a/package/python-humanize/python-humanize.hash
+++ b/package/python-humanize/python-humanize.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/humanize/json
-md5	e8473d9dc1b220911cac2edd53b1d973  humanize-0.5.1.tar.gz
-# Locally computed
-sha256	a43f57115831ac7c70de098e6ac46ac13be00d69abbf60bdcac251344785bb19  humanize-0.5.1.tar.gz
-sha256  2ee89d331213b5886ae5416ead178694ac0eb13bb79c83bf92287f95d3597377  LICENCE
+# md5, sha256 from https://pypi.org/pypi/humanize/json
+md5  04f5b334283e1f7f0dfeccf7d5a4b880  humanize-3.11.0.tar.gz
+sha256  4160cdc63fcd0daac27d2e1e218a31bb396fc3fe5712d153675d89432a03778f  humanize-3.11.0.tar.gz
+# Locally computed sha256 checksums
+sha256  8ba6c18112a431400ad3c743f70670079b302545d98884fc2f28a91c383a0380  LICENCE
diff --git a/package/python-humanize/python-humanize.mk b/package/python-humanize/python-humanize.mk
index 60ec82bd48..ea5454d6cc 100644
--- a/package/python-humanize/python-humanize.mk
+++ b/package/python-humanize/python-humanize.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HUMANIZE_VERSION = 0.5.1
+PYTHON_HUMANIZE_VERSION = 3.11.0
 PYTHON_HUMANIZE_SOURCE = humanize-$(PYTHON_HUMANIZE_VERSION).tar.gz
-PYTHON_HUMANIZE_SITE = https://pypi.python.org/packages/8c/e0/e512e4ac6d091fc990bbe13f9e0378f34cf6eecd1c6c268c9e598dcf5bb9
+PYTHON_HUMANIZE_SITE = https://files.pythonhosted.org/packages/a6/d0/e06993724937f2aab3e7085d137d453968aaac0f74661ef9c90528a79d61
 PYTHON_HUMANIZE_SETUP_TYPE = setuptools
 PYTHON_HUMANIZE_LICENSE = MIT
 PYTHON_HUMANIZE_LICENSE_FILES = LICENCE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
