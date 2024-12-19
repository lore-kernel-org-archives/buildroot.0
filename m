Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAA9E77188
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 01:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0CC94265D;
	Thu, 19 Dec 2024 01:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L6mbiuoVWbsU; Thu, 19 Dec 2024 01:08:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F51642654
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F51642654;
	Thu, 19 Dec 2024 01:08:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F43BC0
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 01:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BFAC84F95
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 01:08:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8SVwWQdgcK23 for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 01:08:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6138584F73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6138584F73
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6138584F73
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 01:08:14 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3a9caa3726fso1120215ab.1
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 17:08:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734570493; x=1735175293;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rg0gmvuWeoBMGkPBtbl3zckoJiyNtnJrloauNdYLmIc=;
 b=Klee7WInPEHh8fqlBH9CTZ9yENuPghylh5IwqQzaoJQgzR8diWRbHHBEkYZ7eEtg2n
 spG35YdoCNF6kzI+mFrgaj0jgJq2S6vOryVclhWfih1JdEgdmpOsTRbTkUBXBlQY/KUt
 KDoBFhjvdpL1vOv9CMYejstxfwQEG2pK555ofhBNduoK714uH+cjS3zjff6uJU0tvBI0
 +CQrp7isFj4tNKG3bJXEvlWDyFK1kq9xNmz8/+VyKmBmNo3v6bpXbAj1AB5U7CeD210Y
 4gyImi8nitwvLt9Dmkzre1ycXUFrRJV3SPBS8pyQ+Z6CdMiVNH+HvyufwPVOkRtCKvqg
 hBgg==
X-Gm-Message-State: AOJu0Yx+19za17yf+FloAqSikBC2opt5TQsc4QITRC9U/TYu4w0YCyow
 +eJRrwhIsRB5UljMGaSGotLavMK1wFPcgpwvg98OixqxjrBhGA1ojLNTp64ZMUk=
X-Gm-Gg: ASbGncvW2YtS1mAhhtnLKUs26UkLbip6KInc1kiGqUmawHcGxnNYb39GzWsoPPx1ioS
 54Abjibz9zN3oRQ64atmq2sZJlbrh1aKP5eNFLgD74oT7p1cAJteJfFWSuXzQN3hiGaZNLiFvMm
 r2h8IVQx/WraGx6wvg7m0omWrg8qsl+O8o1gsRkGbVJZw1g2JDZVa+MERQ+wHbHan4SVJxFcZW+
 Xu6WeTvnDYSIxh4WvOxeL3rodxJYRhQBVl0LtNhvd8Jjr62FRMLJvPTtg7gU7+Gf/VmEn93mhl4
 7uCaMXXWOnoZ/n/IeE2DNLaZx+MAKQyv9g==
X-Google-Smtp-Source: AGHT+IH+rdSX3Z85ETcz8kBUxaDIMhh9aGvmz5FzMCRHjMG2B+3krqCQRN34kSPMzJD8X+1R0dA+fA==
X-Received: by 2002:a05:6e02:1c44:b0:3a7:c563:d3ad with SMTP id
 e9e14a558f8ab-3c03093ec46mr10949225ab.11.1734570492748; 
 Wed, 18 Dec 2024 17:08:12 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3c0e3f36273sm369345ab.55.2024.12.18.17.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 17:08:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Dec 2024 18:08:09 -0700
Message-Id: <20241219010810.237875-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734570493; x=1735175293; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rg0gmvuWeoBMGkPBtbl3zckoJiyNtnJrloauNdYLmIc=;
 b=YsOHjj/Ke/gApWCQYn1YXfzQ8BjbCmDVNVUjY8qtrLCNZk7QVmwqZ0L3qB3GVvUTBi
 yJbxCdzCEMM9zyZka03pm76AlkHiy0AAt9G2EgokAVZb0/zFVufppz99sGAIJNLl/3TD
 EJEzyMC08Xmi3gY9ZIQKn6td3vyZ7hZDqjZi02iipZMwTwcvUeuIyP0srIrsrRh80IrX
 luAt4Y3cFTxvhx4dx6m409FGZAG3gJ7OUT3WJW7kC0AYJx9bbXHA09KiCnOYw9/rQA0a
 r0FK+R7BNYMtpoJhVOwXSU1SVzYw0wHrJ6Z3UehMEHwRqqvf2Qs8LdeeUiYU0AUU1OvM
 GjmQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YsOHjj/K
Subject: [Buildroot] [PATCH 1/2] package/python-asyncclick: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                                |  1 +
 package/python-asyncclick/Config.in              |  7 +++++++
 package/python-asyncclick/python-asyncclick.hash |  5 +++++
 package/python-asyncclick/python-asyncclick.mk   | 15 +++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-asyncclick/Config.in
 create mode 100644 package/python-asyncclick/python-asyncclick.hash
 create mode 100644 package/python-asyncclick/python-asyncclick.mk

diff --git a/package/Config.in b/package/Config.in
index feb4840a7d..06472aa972 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1013,6 +1013,7 @@ menu "External python modules"
 	source "package/python-async-generator/Config.in"
 	source "package/python-async-lru/Config.in"
 	source "package/python-async-timeout/Config.in"
+	source "package/python-asyncclick/Config.in"
 	source "package/python-asyncssh/Config.in"
 	source "package/python-attrs/Config.in"
 	source "package/python-augeas/Config.in"
diff --git a/package/python-asyncclick/Config.in b/package/python-asyncclick/Config.in
new file mode 100644
index 0000000000..9264245213
--- /dev/null
+++ b/package/python-asyncclick/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_ASYNCCLICK
+	bool "python-asyncclick"
+	select BR2_PACKAGE_PYTHON_ANYIO # runtime
+	help
+	  Composable command line interface toolkit, async version.
+
+	  https://palletsprojects.com/p/click/
diff --git a/package/python-asyncclick/python-asyncclick.hash b/package/python-asyncclick/python-asyncclick.hash
new file mode 100644
index 0000000000..59f00893e5
--- /dev/null
+++ b/package/python-asyncclick/python-asyncclick.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/asyncclick/json
+md5  542e83089a55129ca2fe7ccdbc65ba77  asyncclick-8.1.7.2.tar.gz
+sha256  219ea0f29ccdc1bb4ff43bcab7ce0769ac6d48a04f997b43ec6bee99a222daa0  asyncclick-8.1.7.2.tar.gz
+# Locally computed sha256 checksums
+sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.rst
diff --git a/package/python-asyncclick/python-asyncclick.mk b/package/python-asyncclick/python-asyncclick.mk
new file mode 100644
index 0000000000..946325e496
--- /dev/null
+++ b/package/python-asyncclick/python-asyncclick.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-asyncclick
+#
+################################################################################
+
+PYTHON_ASYNCCLICK_VERSION = 8.1.7.2
+PYTHON_ASYNCCLICK_SOURCE = asyncclick-$(PYTHON_ASYNCCLICK_VERSION).tar.gz
+PYTHON_ASYNCCLICK_SITE = https://files.pythonhosted.org/packages/5e/bf/59d836c3433d7aa07f76c2b95c4eb763195ea8a5d7f9ad3311ed30c2af61
+PYTHON_ASYNCCLICK_SETUP_TYPE = setuptools
+PYTHON_ASYNCCLICK_LICENSE = BSD-3-Clause
+PYTHON_ASYNCCLICK_LICENSE_FILES = LICENSE.rst
+PYTHON_ASYNCCLICK_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
