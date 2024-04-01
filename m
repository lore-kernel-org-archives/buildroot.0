Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A19FCD1288
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 21:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E70F40750;
	Mon,  1 Apr 2024 21:24:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VdEgvPnbQ2sV; Mon,  1 Apr 2024 21:24:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AF7240792
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AF7240792;
	Mon,  1 Apr 2024 21:24:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 51C3E1BF338
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 21:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F1C140614
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 21:24:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qYYtF5WVRPRq for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 21:24:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 01E3540600
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01E3540600
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01E3540600
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 21:24:00 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-7cc0e0dba0fso164552139f.3
 for <buildroot@buildroot.org>; Mon, 01 Apr 2024 14:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712006639; x=1712611439;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yxGdVYzA6WKxSo8Ef6Kh/JZZ9QPqc2BJBDs7BdJYcbc=;
 b=Me3tw9SJI0z2ehppA+fw8VajCr+/0xYLgWei+Mp4QCC8+/Y0KEouTxjfmmGitf/rDB
 9Kw5U2cfT1yM/2x6+vz4jAsM5gpsRWlcehuSmBJsQd4CkIU5f7seMNnG33H0b2tNvkcl
 ld5pDyXGIq+t4aIPu7t1GEfn7EfOXAPxp8PWvmEF7PBb8tOdnMucIAl0OupH3FoNwyzN
 aK6fmYSA7Kn9nZrMokhv+25ESZO7UNzupLOFZ1LVT8osBcGU/0lRw4pkq4rpjXQEGrfr
 amRE5qULrefwipD27Y74DigWpC3SbQg5Q3cPyq/dDJEBgtgyZWzXt7/g5F9s3Z9IrfmM
 e85w==
X-Gm-Message-State: AOJu0YwkMhYoQYIqvd0UGdRb1FvnsTFO6g+AJHZbLqGnrH8DFpAATPHE
 OPHTzojvHrr0mrj64aznGudfp43pB+y+5Se7uM+W4Hx1qm1HmxLDhHGb62wwDFEhjw==
X-Google-Smtp-Source: AGHT+IHQPnmgJwrGRXsgmz5TOzPTiktNn0PgAi5dbIUOqJOKJXUhl8vRlVYd0IEELg+TjsZ7AcpR1A==
X-Received: by 2002:a5e:cb0b:0:b0:7d0:da7f:9071 with SMTP id
 p11-20020a5ecb0b000000b007d0da7f9071mr1174785iom.8.1712006639187; 
 Mon, 01 Apr 2024 14:23:59 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 d23-20020a02a497000000b0047708160be9sm2813844jam.147.2024.04.01.14.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 14:23:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Apr 2024 15:23:44 -0600
Message-Id: <20240401212344.1345395-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240401212344.1345395-1-james.hilliard1@gmail.com>
References: <20240401212344.1345395-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712006639; x=1712611439; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yxGdVYzA6WKxSo8Ef6Kh/JZZ9QPqc2BJBDs7BdJYcbc=;
 b=B7vMQDD+1zyH9y228pYN1YoChIfouPpXEnMhkTm4dbDokgRnhhJ4rTQOExXvIZycwB
 riFVLDnWrdOoFHl/5LvIW1atHA5tZ5rgvufup6WZZqxZvUVqrkzpSKjn/v5RT8olY2eB
 5K8BGKB93VAsLPh5hTuy6gD8UTupLUR6uGJ9o+ffa9Oayzso98ZIdWoB992km3fON4gP
 7eurRDvNOmHZKMDN4ykt1qH649l0AcwhRc6rTEexWmirbm1fsI/VF/WWC8ug3Ay4z72D
 X5RJ1U8sZQ6gYC96dAx4Pxibl+BPjXkcbc71kRKPZRm0JS02EBJflDBVIGW2SSm4rXjv
 7dhQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=B7vMQDD+
Subject: [Buildroot] [PATCH v4 5/5] package/python-aerich: new package
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

We need to backport a patch so that the correct poetry build backend
is used.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                             |  1 +
 ...ild-backend-to-support-editable-inst.patch | 29 +++++++++++++++++++
 package/python-aerich/Config.in               | 12 ++++++++
 package/python-aerich/python-aerich.hash      |  5 ++++
 package/python-aerich/python-aerich.mk        | 15 ++++++++++
 5 files changed, 62 insertions(+)
 create mode 100644 package/python-aerich/0001-update-poetry-build-backend-to-support-editable-inst.patch
 create mode 100644 package/python-aerich/Config.in
 create mode 100644 package/python-aerich/python-aerich.hash
 create mode 100644 package/python-aerich/python-aerich.mk

diff --git a/package/Config.in b/package/Config.in
index 13165c1219..04b5db6863 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -956,6 +956,7 @@ endif
 if BR2_PACKAGE_PYTHON3
 menu "External python modules"
 	source "package/python-aenum/Config.in"
+	source "package/python-aerich/Config.in"
 	source "package/python-aexpect/Config.in"
 	source "package/python-aioblescan/Config.in"
 	source "package/python-aiocoap/Config.in"
diff --git a/package/python-aerich/0001-update-poetry-build-backend-to-support-editable-inst.patch b/package/python-aerich/0001-update-poetry-build-backend-to-support-editable-inst.patch
new file mode 100644
index 0000000000..67d7c45bfb
--- /dev/null
+++ b/package/python-aerich/0001-update-poetry-build-backend-to-support-editable-inst.patch
@@ -0,0 +1,29 @@
+From e729bb9b602ba74dea7ccc978dac709283a0934a Mon Sep 17 00:00:00 2001
+From: strayge <strayge@gmail.com>
+Date: Fri, 18 Aug 2023 15:03:38 +0400
+Subject: [PATCH] update poetry build-backend to support editable install
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/tortoise/aerich/commit/e729bb9b602ba74dea7ccc978dac709283a0934a
+---
+ pyproject.toml | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index b9390e1..7673d70 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -45,8 +45,8 @@ location = "./migrations"
+ src_folder = "./."
+ 
+ [build-system]
+-requires = ["poetry>=0.12"]
+-build-backend = "poetry.masonry.api"
++requires = ["poetry-core>=1.0.0"]
++build-backend = "poetry.core.masonry.api"
+ 
+ [tool.poetry.scripts]
+ aerich = "aerich.cli:main"
+-- 
+2.34.1
+
diff --git a/package/python-aerich/Config.in b/package/python-aerich/Config.in
new file mode 100644
index 0000000000..3aa39e176d
--- /dev/null
+++ b/package/python-aerich/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_AERICH
+	bool "python-aerich"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
+	select BR2_PACKAGE_PYTHON_CLICK # runtime
+	select BR2_PACKAGE_PYTHON_DICTDIFFER # runtime
+	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
+	select BR2_PACKAGE_PYTHON_TOMLKIT # runtime
+	select BR2_PACKAGE_PYTHON_TORTOISE_ORM # runtime
+	help
+	  A database migrations tool for Tortoise ORM.
+
+	  https://github.com/tortoise/aerich
diff --git a/package/python-aerich/python-aerich.hash b/package/python-aerich/python-aerich.hash
new file mode 100644
index 0000000000..c104c3d58e
--- /dev/null
+++ b/package/python-aerich/python-aerich.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/aerich/json
+md5  26a99a2c6c604a370b228b74e12c7981  aerich-0.7.2.tar.gz
+sha256  31d67de7b96184636b89de99062e059e5e6204b6251d24c33eb21fc9cf982e09  aerich-0.7.2.tar.gz
+# Locally computed sha256 checksums
+sha256  4cc00f0e33ac8e089b37d8a1474be441b26311bdc16fe035c75b51201515f617  LICENSE
diff --git a/package/python-aerich/python-aerich.mk b/package/python-aerich/python-aerich.mk
new file mode 100644
index 0000000000..63343e0b96
--- /dev/null
+++ b/package/python-aerich/python-aerich.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-aerich
+#
+################################################################################
+
+PYTHON_AERICH_VERSION = 0.7.2
+PYTHON_AERICH_SOURCE = aerich-$(PYTHON_AERICH_VERSION).tar.gz
+PYTHON_AERICH_SITE = https://files.pythonhosted.org/packages/ca/cd/ae9c60ffc21e2d41e22c62cbf24a60dfad937222d880489703842d179746
+PYTHON_AERICH_SETUP_TYPE = pep517
+PYTHON_AERICH_LICENSE = Apache-2.0
+PYTHON_AERICH_LICENSE_FILES = LICENSE
+PYTHON_AERICH_DEPENDENCIES = host-python-poetry-core
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
