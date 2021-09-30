Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81DB8C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 07:03:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C176617E4
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 07:03:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C176617E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C9C9407A6;
	Thu, 30 Sep 2021 07:03:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JccVhFKyjyHR; Thu, 30 Sep 2021 07:03:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 426E940334;
	Thu, 30 Sep 2021 07:03:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 737961BF9B6
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 07:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6293D42525
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 07:01:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lkLkbQa7FQxQ for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 07:01:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80BA2424FF
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 07:01:18 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id j27so3788558wms.0
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 00:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lVmjp8dYkch1i5oFXwo3nTHTJwC2XfuozaU4KmKCFZs=;
 b=BEgX77ZRbtTxegRPEdWDYK2NA6mnsuDLS0S+Fb9jE8BU0oybxUd9iEFg3P6herRJrg
 zt7QqfT86TaD+oXbsgVpd4dU1Ge9ueR/i1d88jIXnquX2QTNcysQ9OPN/USNQCVsIXBO
 ZXe0XGgnKFXFh18v2pfZSugwoF/SPjSnPgPVucbzTqjSHvDp9to4uFNRLDHCSEJGDxCo
 LduWkT+FxFaKsKZJNRNbKpIemyLFJK60S/pzQhlwX19UoN0jK/cwcdf3NKNqfJOuZ/1+
 FtoksMW9MYhlXrZbb81YLPsaOde0zQVBZxvU1T45HfgQAPasjts1AbogfTOrMUv3GBxu
 WQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lVmjp8dYkch1i5oFXwo3nTHTJwC2XfuozaU4KmKCFZs=;
 b=3Wrwc+nHHOQiILO+Hwdtb6CvkGUvCbdUAGcs9dU7cnACCEuijrnNE0Ctmd56yuZfR9
 3xqdAgDJgQeHAzKVTMKhVFEGNFtZXCZlPRV7hY10mQz/ZfB+oVo2VD5WH2ofs/Pg8IM9
 Q1mMzaVGuXqc/+zug4pOkXdzY4nzPX8IHwcePI5OLG8WQEPq3M/zbO/moGjX1WiElSAn
 cCN/DY6YMolonBJkq42IJFlSPzmwOZecg50VmlrU2dzVTUZRKk6A/JOO2Uwq4NaEdMUy
 56Wl1jLsJHFBkAMzRO7w0YOAjxZ0vzfs5/50DBXI1Gg/XehZIoWjwsXl+NOueigD5b60
 zdaQ==
X-Gm-Message-State: AOAM530Nfixcx/Hnu4ag4/2IxVe1xk0NHlRJg5nufYfw13GMLh19KHqE
 Fe7qo9se4gqrfpZ8yIrZE0o7wS+b8WE=
X-Google-Smtp-Source: ABdhPJxo+dlxUXEauEb9vG+3yHfEBl2e/FVTcMI1d2521C3lhqEYVTVbJYTl9sA1WQJbyGqGPfIeDw==
X-Received: by 2002:a05:600c:4ed3:: with SMTP id
 g19mr3660205wmq.195.1632985276633; 
 Thu, 30 Sep 2021 00:01:16 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:c4c3:c3e7:ea7f:250b])
 by smtp.gmail.com with ESMTPSA id n26sm3801088wmi.43.2021.09.30.00.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:01:16 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Sep 2021 10:00:50 +0300
Message-Id: <20210930070051.40361-14-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210930070051.40361-1-asafka7@gmail.com>
References: <20210930070051.40361-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-xlrd: bump to version 2.0.1
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
 package/python-xlrd/python-xlrd.hash | 6 +++---
 package/python-xlrd/python-xlrd.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-xlrd/python-xlrd.hash b/package/python-xlrd/python-xlrd.hash
index 0a66a2112a..003ccc9a72 100644
--- a/package/python-xlrd/python-xlrd.hash
+++ b/package/python-xlrd/python-xlrd.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/xlrd/json
-md5	e5d5b96924d791b22898b622eb3e918e  xlrd-1.2.0.tar.gz
-sha256	546eb36cee8db40c3eaa46c351e67ffee6eeb5fa2650b71bc4c758a29a1b29b2  xlrd-1.2.0.tar.gz
-# locally calculated
+md5  ae3f951c857a490d432f0a7d722352bf  xlrd-2.0.1.tar.gz
+sha256  f72f148f54442c6b056bf931dbc34f986fd0c3b0b6b5a58d013c9aef274d0c88  xlrd-2.0.1.tar.gz
+# Locally computed sha256 checksums
 sha256  b5a5dbce60265e305a815a6cb83ed07f24519d8ba644f2a307994488bced8815  LICENSE
diff --git a/package/python-xlrd/python-xlrd.mk b/package/python-xlrd/python-xlrd.mk
index c94e054b5b..1f280bd432 100644
--- a/package/python-xlrd/python-xlrd.mk
+++ b/package/python-xlrd/python-xlrd.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XLRD_VERSION = 1.2.0
+PYTHON_XLRD_VERSION = 2.0.1
 PYTHON_XLRD_SOURCE = xlrd-$(PYTHON_XLRD_VERSION).tar.gz
-PYTHON_XLRD_SITE = https://files.pythonhosted.org/packages/aa/05/ec9d4fcbbb74bbf4da9f622b3b61aec541e4eccf31d3c60c5422ec027ce2
+PYTHON_XLRD_SITE = https://files.pythonhosted.org/packages/a6/b3/19a2540d21dea5f908304375bd43f5ed7a4c28a370dc9122c565423e6b44
 PYTHON_XLRD_SETUP_TYPE = setuptools
 PYTHON_XLRD_LICENSE = BSD-3-Clause
 PYTHON_XLRD_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
