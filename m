Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E13DCAC5AC
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 00:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22CB06079E;
	Wed, 18 Sep 2024 00:22:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O3cfu9OrxZ13; Wed, 18 Sep 2024 00:22:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 160F06079F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 160F06079F;
	Wed, 18 Sep 2024 00:22:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 813501BF969
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 00:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CC46400F4
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 00:22:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vYPL_oW2cPSz for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 00:22:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4553340125
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4553340125
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4553340125
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 00:22:24 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-82a626d73efso229314639f.1
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 17:22:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726618943; x=1727223743;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=79PYsuHIKuj4Ok1Ec+s9gffgwtgo+6PfqE69bG1a+pg=;
 b=svOYA+FyydvPSxNfYvUgFTfZkg98NhaMhfIzYs5I5gteFLn95alQ3GSbw6wPQbXIMx
 Iap+idRRjttKs2wQxNkMh9WgTe7CEpx28QxLEDt3JgYiloKoGHBBo/xuj/hvm5kOEWBH
 J7BYRCgb66Yd9vPtvEqeXm4jh+I2t3GkC3PDzoe/DdTZvQmfAPBMzTdiIJWjE6G7Yzbr
 wOsO5LIAcH1vlaPHUFEMsR6yXzUAbjGmGMQkyHL6TikUDnG47BjAxYGe6Qwe5xJiPOEt
 B5ntwnyoVZeY1MhHbda4FsAeGdwyijKqhMtpvBjsDSO4Q7Dyr5yRMJC+Qg821bprPJU/
 IQSA==
X-Gm-Message-State: AOJu0YwtWrHUp0Rdw6tBHztTw3cSHbJV05XwKuVkGI2tlokJiZgKSc0R
 O5WdpXW4uIz+WPSJonzXNmgB9nt16yMuID/4Qd8P3WHLc99a0vaxiHyN5h0t
X-Google-Smtp-Source: AGHT+IFXXQzzJu4pf4RGxCNnzZt1DY7LIjMpDIGLGzcwaAPHGxVhhS+8DmNk4mwYHpdqby6haBxOEg==
X-Received: by 2002:a05:6e02:1c8f:b0:3a0:ab71:ed38 with SMTP id
 e9e14a558f8ab-3a0ab71f003mr59197105ab.14.1726618942989; 
 Tue, 17 Sep 2024 17:22:22 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e1b189sm24789575ab.37.2024.09.17.17.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 17:22:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 18:22:19 -0600
Message-Id: <20240918002220.414668-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726618943; x=1727223743; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=79PYsuHIKuj4Ok1Ec+s9gffgwtgo+6PfqE69bG1a+pg=;
 b=exb7UeKuA4lNcZgmTeyqanMDhKwugoVC9Dn4FdJvWrJUV5tFKQ1EXHn54fagzj3vbw
 JitLVAB2rAscT0KoC8WyDaTNk7rpjYUd4feBmKfWKw5ec4EDAnCTCvhIkd/piP1UHhER
 N0tRt2ohRJkkmkDPFpFG6uP0qiCEj8USWQHpRO1Fa5+nP7X9QbRBAZlYxWJEKl9+t8ZB
 z5E8oOQqQXAtLcQbeXdecpQiaSgau3/qmtuSynRK3xDrqY3tQZGr+y4MrPQt3ZHf7Ldp
 mz9oBc0Wb74Ayr3WaCG4PG6zOj0Ii+i5uG9nCF8hO0JCgK6zQ5M5mLsea98EelZdiGxp
 gC0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=exb7UeKu
Subject: [Buildroot] [PATCH 1/2] package/python-pysnmpcrypto: new package
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                                 |  1 +
 package/python-pysnmpcrypto/Config.in             |  9 +++++++++
 .../python-pysnmpcrypto/python-pysnmpcrypto.hash  |  5 +++++
 .../python-pysnmpcrypto/python-pysnmpcrypto.mk    | 15 +++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/python-pysnmpcrypto/Config.in
 create mode 100644 package/python-pysnmpcrypto/python-pysnmpcrypto.hash
 create mode 100644 package/python-pysnmpcrypto/python-pysnmpcrypto.mk

diff --git a/package/Config.in b/package/Config.in
index 2200f16520..c0b64de7f9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1322,6 +1322,7 @@ menu "External python modules"
 	source "package/python-pysmi/Config.in"
 	source "package/python-pysnmp/Config.in"
 	source "package/python-pysnmp-mibs/Config.in"
+	source "package/python-pysnmpcrypto/Config.in"
 	source "package/python-pysocks/Config.in"
 	source "package/python-pyspnego/Config.in"
 	source "package/python-pytablereader/Config.in"
diff --git a/package/python-pysnmpcrypto/Config.in b/package/python-pysnmpcrypto/Config.in
new file mode 100644
index 0000000000..da9dd6cf43
--- /dev/null
+++ b/package/python-pysnmpcrypto/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_PYSNMPCRYPTO
+	bool "python-pysnmpcrypto"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
+	help
+	  Strong cryptography support for PySNMP (SNMP library for
+	  Python).
+
+	  https://github.com/lextudio/pysnmpcrypto
diff --git a/package/python-pysnmpcrypto/python-pysnmpcrypto.hash b/package/python-pysnmpcrypto/python-pysnmpcrypto.hash
new file mode 100644
index 0000000000..d36d20b43f
--- /dev/null
+++ b/package/python-pysnmpcrypto/python-pysnmpcrypto.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pysnmpcrypto/json
+md5  969f3690cf2ba4309c047af31d17617e  pysnmpcrypto-0.1.0.tar.gz
+sha256  ee6819247ceee09aa2de54b998c51ccf595d75a9ccc2e303383b39a5ac63816c  pysnmpcrypto-0.1.0.tar.gz
+# Locally computed sha256 checksums
+sha256  24c90090900edc62b49e27888132293a096248408f73993dc8f0147a6fe200ae  LICENSE.rst
diff --git a/package/python-pysnmpcrypto/python-pysnmpcrypto.mk b/package/python-pysnmpcrypto/python-pysnmpcrypto.mk
new file mode 100644
index 0000000000..4472434286
--- /dev/null
+++ b/package/python-pysnmpcrypto/python-pysnmpcrypto.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pysnmpcrypto
+#
+################################################################################
+
+PYTHON_PYSNMPCRYPTO_VERSION = 0.1.0
+PYTHON_PYSNMPCRYPTO_SOURCE = pysnmpcrypto-$(PYTHON_PYSNMPCRYPTO_VERSION).tar.gz
+PYTHON_PYSNMPCRYPTO_SITE = https://files.pythonhosted.org/packages/e6/70/b71f5f1321ea548a7152fc23926258caaec353c8c3edce1aaafbb030ba76
+PYTHON_PYSNMPCRYPTO_SETUP_TYPE = pep517
+PYTHON_PYSNMPCRYPTO_LICENSE = BSD-2-Clause
+PYTHON_PYSNMPCRYPTO_LICENSE_FILES = LICENSE.rst
+PYTHON_PYSNMPCRYPTO_DEPENDENCIES = host-python-poetry-core
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
