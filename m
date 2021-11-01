Return-Path: <SRS0=b2+E=PU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA5BC433F5
	for <buildroot@archiver.kernel.org>; Mon,  1 Nov 2021 11:16:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06D05610CC
	for <buildroot@archiver.kernel.org>; Mon,  1 Nov 2021 11:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 06D05610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD83060662;
	Mon,  1 Nov 2021 11:16:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FxKhfGC_CYIF; Mon,  1 Nov 2021 11:16:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2766C60613;
	Mon,  1 Nov 2021 11:16:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74F4B1BF299
 for <buildroot@lists.busybox.net>; Mon,  1 Nov 2021 11:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 622E44013F
 for <buildroot@lists.busybox.net>; Mon,  1 Nov 2021 11:16:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pkksI5bDpoWV for <buildroot@lists.busybox.net>;
 Mon,  1 Nov 2021 11:16:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F04340131
 for <buildroot@buildroot.org>; Mon,  1 Nov 2021 11:16:53 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id z144so19914396iof.0
 for <buildroot@buildroot.org>; Mon, 01 Nov 2021 04:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iwFpuu88MK1bAdmUTAxlDSY2w502hxzdksAjQXDZS2g=;
 b=bbKip8v0q8xvfHlYJX2GD+AaOoHwQZ8lnN3vKecUqr9XuQSMNodVbaZ+9S6piqjcbR
 mtSfMXdJ67Aw0BfD82J3NwrsmfbBo6bnXBnSbjtCXeRIo4dOPhpr1pTPNvqGaQ0ypNxM
 wYii1mZo6Pe9GlKD95uBMtUtC/whAKRGXraXhDzRqOoA1ef12L7CNPlU4Dz1JssBiTrE
 3Me0Mn2Z7+M2jcQK1yIbaRDTmy/iXkfvd+6qMUP6mU1kgj/3xYymrIptfoCEI/gmxrWN
 J4VPkIiaFyYIAB2Kee1JBwObxwdA207gbOw2pPYM9X86omBoemZkO6yrsTGGmRzVMf3r
 XFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iwFpuu88MK1bAdmUTAxlDSY2w502hxzdksAjQXDZS2g=;
 b=BzwIZEAorsiH+8HHObVJ9hZGiDei0e+BY8JeOG84ZnMF1eWzf/wqjSpDo6x75sezUo
 6rYheoJyybC+5FLMIWSDTnQElN+Rf4/jFUGmPe7lP/vx3LT7Dk4QllPkCF5ZVrwnUdYR
 16j+4ErSfM0lwV4xJtrdsXDfePjwxvO26WvS0EQ2ozHBrPIjhtf9+konQHK5FReF80L6
 +yLdjWtk0rsMgQcU0IL/jyYh0Y5QFoDUwJ4WggHMgXb3np4y4dLNbpds7nkVGQer1vZt
 7eD6zm7AT2zs45+rQdyWup3a7dZfZSibbpdv5OOgT+eYAXD+inpZSbGXLvoQGo1IC0EY
 EGjw==
X-Gm-Message-State: AOAM532qnherVWrCIeYpQmRB9Clo6mo3husIwCKCPgLLi9VMzBAik33y
 BCs7oI58xJYRAEcIypR2sHgj3Cx9uZM=
X-Google-Smtp-Source: ABdhPJyzoztaXDUJhBDeUgQYTM6c1CX5RdAIft13tW9aeZJsnLt9YoTx1EHV6IupmdjhQs4cObJdzA==
X-Received: by 2002:a5d:8487:: with SMTP id t7mr19772022iom.100.1635765412128; 
 Mon, 01 Nov 2021 04:16:52 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-49.hlrn.qwest.net.
 [71.218.115.49])
 by smtp.gmail.com with ESMTPSA id o10sm1977166ioa.26.2021.11.01.04.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 04:16:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Nov 2021 05:16:49 -0600
Message-Id: <20211101111649.2741772-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-async-timeout: bump to
 version 4.0.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash change due to removal of full license text:
https://github.com/aio-libs/async-timeout/commit/63e781b8745cca5bcf4d3ec1cd9a7a19e988a6d0

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-async-timeout/Config.in                 | 1 +
 package/python-async-timeout/python-async-timeout.hash | 8 ++++----
 package/python-async-timeout/python-async-timeout.mk   | 4 ++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-async-timeout/Config.in b/package/python-async-timeout/Config.in
index 659a0fdeca..27cfe51f7b 100644
--- a/package/python-async-timeout/Config.in
+++ b/package/python-async-timeout/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT
 	bool "python-async-timeout"
 	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  asyncio-compatible timeout context manager.
 
diff --git a/package/python-async-timeout/python-async-timeout.hash b/package/python-async-timeout/python-async-timeout.hash
index f99e1daddb..1a64c3a77d 100644
--- a/package/python-async-timeout/python-async-timeout.hash
+++ b/package/python-async-timeout/python-async-timeout.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.python.org/pypi/async_timeout/json
-md5	305c4fa529f2485c403d0dbe14390175  async-timeout-3.0.1.tar.gz
-sha256	0c3c816a028d47f659d6ff5c745cb2acf1f966da1fe5c19c77a70282b25f4c5f  async-timeout-3.0.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/async-timeout/json
+md5  2871f3853060ac7e76e6278b85dfb3c9  async-timeout-4.0.0.tar.gz
+sha256  7d87a4e8adba8ededb52e579ce6bc8276985888913620c935094c2276fd83382  async-timeout-4.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256	b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
+sha256  e18d7bb8f513e2c46bb585c94b585bd30720dd3ccb21ddb0786f72d16658f92c  LICENSE
diff --git a/package/python-async-timeout/python-async-timeout.mk b/package/python-async-timeout/python-async-timeout.mk
index 093adc5c19..1d2c716fa9 100644
--- a/package/python-async-timeout/python-async-timeout.mk
+++ b/package/python-async-timeout/python-async-timeout.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNC_TIMEOUT_VERSION = 3.0.1
+PYTHON_ASYNC_TIMEOUT_VERSION = 4.0.0
 PYTHON_ASYNC_TIMEOUT_SOURCE = async-timeout-$(PYTHON_ASYNC_TIMEOUT_VERSION).tar.gz
-PYTHON_ASYNC_TIMEOUT_SITE = https://files.pythonhosted.org/packages/a1/78/aae1545aba6e87e23ecab8d212b58bb70e72164b67eb090b81bb17ad38e3
+PYTHON_ASYNC_TIMEOUT_SITE = https://files.pythonhosted.org/packages/28/0c/1cd218ea84964f0740a3ab6152dfa99661174abdd8e4053e06c0285ac42a
 PYTHON_ASYNC_TIMEOUT_LICENSE = Apache-2.0
 PYTHON_ASYNC_TIMEOUT_LICENSE_FILES = LICENSE
 PYTHON_ASYNC_TIMEOUT_SETUP_TYPE = setuptools
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
