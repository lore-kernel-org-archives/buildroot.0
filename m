Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42534C4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 09:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB41460E3B;
	Wed, 23 Nov 2022 09:35:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB41460E3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A5Ew7RiFxDD8; Wed, 23 Nov 2022 09:35:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDAAC60B6F;
	Wed, 23 Nov 2022 09:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDAAC60B6F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1377D1BF853
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 09:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFDDE40242
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 09:35:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFDDE40242
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WKDQJaj6zS9i for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 09:35:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0B5140158
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E0B5140158
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 09:35:46 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id m22so41380695eji.10
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 01:35:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PxT3+HZGHixsY824ieq1fG5hnlHSnVExckDn703ZWA4=;
 b=VbmDoyNvPoaQvNZaZ0bPfoWDDBsFs2YCgMCuaYqcpE9ynchP84FDIlteeTuRH9aOnx
 HumXQq/38CY1NeAlZu/eLzzsxBB1bmZmZ4qe5/b9pqLgOtgGAiNTHUAN++aaTyOKCJOC
 +1H22JLuVS8KuNA1ugzWQQCNgDYvuOeHHJ9fXtH0j7dM2W17Kc/B0cM2v9icnEBaLvEI
 4wNB/LntjhGRCf5/Y6h4xVyO+a6fTD9BMfU5m93ivksOQa+AjqDQ4090WJQX6O7vjEzo
 4OigjztkyXHc8+RUhdX+THws+rMAqnJl87vJOp9gKSaUR3/31PklVN2SSLj8OmQ1yBg3
 Gcyw==
X-Gm-Message-State: ANoB5plWj3MgRKgSuilUulmAz5BXWgkyxt4QclUz1KIpt6JaujRfWIlc
 P+NQrjYF/2kWY8OTXWtPnvu5EG0Qiis=
X-Google-Smtp-Source: AA0mqf4wxa9IqnUsSwbwfFGYv5JyhDdoXGTy1wv/8WxBFrKx5zgvB+ckT+wIvPaq0I68IM4ouXxjLQ==
X-Received: by 2002:a17:906:7e51:b0:78d:4fcb:1303 with SMTP id
 z17-20020a1709067e5100b0078d4fcb1303mr23824452ejr.182.1669196144653; 
 Wed, 23 Nov 2022 01:35:44 -0800 (PST)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 s12-20020aa7cb0c000000b0044ef2ac2650sm7372943edt.90.2022.11.23.01.35.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Nov 2022 01:35:44 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 10:35:37 +0100
Message-Id: <20221123093538.15211-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PxT3+HZGHixsY824ieq1fG5hnlHSnVExckDn703ZWA4=;
 b=GBif0m1zBlf2oCruTXXI9FJ1dmKJzL8S9HuHbB9EHhryKpCEqGViVjQd83tece7r9t
 IvjE63eK7hqNoz7/12aq9qvjZRFBtK1l5gbhdq6vYDh5FLGuoolHpyk0/2SrlOnc+P5+
 rBtJgQ50uER7ncHZOkrb6iFCl/JbVhkkQY57a6QakNJKawcFp+8TepmuqlELNAAaPwBs
 kx3iJHVEPYIMs7+CYgKs5BSl1uVtHSJ2MVDV997RHFFj90YXapdZqhR2sDh5Jz4TeGvC
 JPdPFEJKYrElga9caMBiLJa1cBglqeZnsk4xw3he2i4KtB6MQ+RcDOVoszfpN9sAXYsL
 80vw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GBif0m1z
Subject: [Buildroot] [PATCH 1/2 branch/next] package/python-pyspnego: new
 package
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                            |  1 +
 package/python-pyspnego/Config.in            |  8 ++++++++
 package/python-pyspnego/python-pyspnego.hash |  6 ++++++
 package/python-pyspnego/python-pyspnego.mk   | 14 ++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/python-pyspnego/Config.in
 create mode 100644 package/python-pyspnego/python-pyspnego.hash
 create mode 100644 package/python-pyspnego/python-pyspnego.mk

diff --git a/package/Config.in b/package/Config.in
index 7a6da035f3..7d50d793ec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1213,6 +1213,7 @@ menu "External python modules"
 	source "package/python-pysnmp/Config.in"
 	source "package/python-pysnmp-mibs/Config.in"
 	source "package/python-pysocks/Config.in"
+	source "package/python-pyspnego/Config.in"
 	source "package/python-pytablereader/Config.in"
 	source "package/python-pytablewriter/Config.in"
 	source "package/python-pytest/Config.in"
diff --git a/package/python-pyspnego/Config.in b/package/python-pyspnego/Config.in
new file mode 100644
index 0000000000..7533b725ec
--- /dev/null
+++ b/package/python-pyspnego/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_PYSPNEGO
+	bool "python-pyspnego"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
+	help
+	  Windows Negotiate Authentication Client and Server.
+
+	  https://github.com/jborean93/pyspnego
diff --git a/package/python-pyspnego/python-pyspnego.hash b/package/python-pyspnego/python-pyspnego.hash
new file mode 100644
index 0000000000..400e380b5d
--- /dev/null
+++ b/package/python-pyspnego/python-pyspnego.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/pyspnego/json
+md5  67114f5e59c6d5b45fe2b38c128c2140  pyspnego-0.6.3.tar.gz
+sha256  6060a0e683171090adcf92c9d319ddd334f15117fa199a703d8c9bd094d9f6c0  pyspnego-0.6.3.tar.gz
+
+# Locally computed
+sha256  286517c93031c343f809f64b38563a783614b762e1367242af6cdd4107335471  LICENSE
diff --git a/package/python-pyspnego/python-pyspnego.mk b/package/python-pyspnego/python-pyspnego.mk
new file mode 100644
index 0000000000..0910c57b7d
--- /dev/null
+++ b/package/python-pyspnego/python-pyspnego.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyspnego
+#
+################################################################################
+
+PYTHON_PYSPNEGO_VERSION = 0.6.3
+PYTHON_PYSPNEGO_SOURCE = pyspnego-$(PYTHON_PYSPNEGO_VERSION).tar.gz
+PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/ba/13/7b4e7dcff1eb24a13e0a631a4b49eab361678e4490d691c03253ae736da4
+PYTHON_PYSPNEGO_SETUP_TYPE = setuptools
+PYTHON_PYSPNEGO_LICENSE = MIT
+PYTHON_PYSPNEGO_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
