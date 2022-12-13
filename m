Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A146C00145
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 01:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B69BD405FA;
	Tue, 13 Dec 2022 01:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B69BD405FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fml3s32SCpSv; Tue, 13 Dec 2022 01:50:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3ECB40605;
	Tue, 13 Dec 2022 01:50:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3ECB40605
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58BCC1BF2FB
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 01:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33C7481B53
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 01:50:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33C7481B53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OvhvCvL7dAk8 for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 01:50:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B90D18143B
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B90D18143B
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 01:50:17 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id b192so1008050iof.8
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 17:50:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4LJiXwCwSFTfidxCX/k275Ix5hRKuSOPw6dhfgfPRZc=;
 b=KsmvO51j4EAstS3Ij9o5xuHxK/4LdvS3zoVaJzu+yiD/8p7P1dpyzrPvTB3PxbJ2qA
 mbPSk5U80AFHQzUkXEtQO8yFH+sz2PJuLVMGstfZjR4V8kOaUGEwhpajj1iXi2y0GSAd
 3raNomaomDIT8e97a2pqKw9NixCqgW4p7fJr+AhtdfOqNl9a4RBVAQB/1Ku1pRKC6QMx
 ybS7Kb0ufimBcBSgylWrnsdIRXxSiwC7l74p1V3CKWwr+hh1XtSN10gELY4NRHcU/StG
 MZD7DEJ0htYnsbVzNHi4wbNUF2JrH/XJQCS/71JVbHKNQIeuKviHLK+bblwZgxkepkZv
 2qvA==
X-Gm-Message-State: ANoB5plULHSRroNXhmnxFipMUpZ0TE+VhrLzKfsBdTBWd+QBFCsP95Hj
 5heGPUlKxDqjFMORYi4/KU/WkX3NXw2a6Q==
X-Google-Smtp-Source: AA0mqf7YsmiamOkfsz5H7bmO6u0BikNZXw2bkvvPHNCPLcm7Gl/m7R3RWohA08cclDTCgqh2/UHFcA==
X-Received: by 2002:a5e:8c15:0:b0:6e2:e82c:435a with SMTP id
 n21-20020a5e8c15000000b006e2e82c435amr5784419ioj.13.1670896216515; 
 Mon, 12 Dec 2022 17:50:16 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 y18-20020a027312000000b003760a908bfasm413354jab.169.2022.12.12.17.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 17:50:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 18:49:55 -0700
Message-Id: <20221213015001.4175808-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4LJiXwCwSFTfidxCX/k275Ix5hRKuSOPw6dhfgfPRZc=;
 b=b4YvMamJb18VDSaDvy7UywhKrwl/59vDN9MMcpoCDK2FyYHw3slEPBiWLvazmJ8bX5
 EXufCLSbaLBO+Y8AZg1sNYQQptUqT17GjjVVq8N/9PNMZD9TdlqX6I540rKvZdsqGb0O
 tBwtVA6a0ik3Wb+So4v7YAUzExv5/1z5UZ0JEQaR5e43EPuTy2TzYqFUmwo53OjqrjC9
 V9+ZIXxuBynbUNGKf6hj19ys/tXx0kqEK7PD9JJwIa/zFmu09bA8EEOypg3VwAgSZz5d
 jU17tzp8ggArNyy2i1o2PtToy8XIJ/cSXCgAbOIX1XOQuVCmSsT2EG2TS88djKVjenmF
 TKSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=b4YvMamJ
Subject: [Buildroot] [PATCH 1/7] package/python-async-generator: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-async-generator/Config.in           |  6 ++++++
 .../python-async-generator.hash                    |  7 +++++++
 .../python-async-generator.mk                      | 14 ++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/python-async-generator/Config.in
 create mode 100644 package/python-async-generator/python-async-generator.hash
 create mode 100644 package/python-async-generator/python-async-generator.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f0dcc42de7..4a4d7ffdcb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1360,6 +1360,7 @@ F:	package/python-aiosignal/
 F:	package/python-aiozipkin/
 F:	package/python-argon2-cffi/
 F:	package/python-argon2-cffi-bindings/
+F:	package/python-async-generator/
 F:	package/python-async-lru/
 F:	package/python-async-timeout/
 F:	package/python-bidict/
diff --git a/package/Config.in b/package/Config.in
index 914c3584e9..facd38dd1e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -959,6 +959,7 @@ menu "External python modules"
 	source "package/python-arrow/Config.in"
 	source "package/python-asgiref/Config.in"
 	source "package/python-asn1crypto/Config.in"
+	source "package/python-async-generator/Config.in"
 	source "package/python-async-lru/Config.in"
 	source "package/python-async-timeout/Config.in"
 	source "package/python-attrs/Config.in"
diff --git a/package/python-async-generator/Config.in b/package/python-async-generator/Config.in
new file mode 100644
index 0000000000..eb5720c652
--- /dev/null
+++ b/package/python-async-generator/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_ASYNC_GENERATOR
+	bool "python-async-generator"
+	help
+	  Async generators and context managers for Python 3.5+.
+
+	  https://github.com/python-trio/async_generator
diff --git a/package/python-async-generator/python-async-generator.hash b/package/python-async-generator/python-async-generator.hash
new file mode 100644
index 0000000000..3a94d5eb31
--- /dev/null
+++ b/package/python-async-generator/python-async-generator.hash
@@ -0,0 +1,7 @@
+# md5, sha256 from https://pypi.org/pypi/async_generator/json
+md5  078a29b4afb3d7f38c097a530f042a55  async_generator-1.10.tar.gz
+sha256  6ebb3d106c12920aaae42ccb6f787ef5eefdcdd166ea3d628fa8476abe712144  async_generator-1.10.tar.gz
+# Locally computed sha256 checksums
+sha256  b54d37617a67005623de975715952a2df062a2616c197bc3b6b451245b0c9265  LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.APACHE2
+sha256  3e6dae555eb92787fc82d1d48355677f454c7f65aeb38d3f9e72bf9a3daf034b  LICENSE.MIT
diff --git a/package/python-async-generator/python-async-generator.mk b/package/python-async-generator/python-async-generator.mk
new file mode 100644
index 0000000000..d5e4f430fc
--- /dev/null
+++ b/package/python-async-generator/python-async-generator.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-async-generator
+#
+################################################################################
+
+PYTHON_ASYNC_GENERATOR_VERSION = 1.10
+PYTHON_ASYNC_GENERATOR_SOURCE = async_generator-$(PYTHON_ASYNC_GENERATOR_VERSION).tar.gz
+PYTHON_ASYNC_GENERATOR_SITE = https://files.pythonhosted.org/packages/ce/b6/6fa6b3b598a03cba5e80f829e0dadbb49d7645f523d209b2fb7ea0bbb02a
+PYTHON_ASYNC_GENERATOR_SETUP_TYPE = setuptools
+PYTHON_ASYNC_GENERATOR_LICENSE = Apache-2.0 or MIT
+PYTHON_ASYNC_GENERATOR_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
