Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5437C47073
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 06:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 730CA418E6;
	Tue,  9 Jan 2024 06:02:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 730CA418E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LW6lvF2sw3CG; Tue,  9 Jan 2024 06:02:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A276E41E13;
	Tue,  9 Jan 2024 06:02:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A276E41E13
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 72FBD1BF95D
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 06:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58ED660743
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 06:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58ED660743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OP0opTx4EcGZ for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 06:01:34 +0000 (UTC)
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A8D960ADE
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 06:01:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A8D960ADE
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-36074b286d6so16294545ab.1
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 22:01:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704780093; x=1705384893;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ncfb7Z7uRnByOoyAAry8o3BH85cYuhFlTgizGHXy3HA=;
 b=bWGGPPYKBC6173QDM0Z/ds/0vJgACRcu3C16RD3IwZqYe5n8thO2thwagImz7jRrTd
 O+4lSDAyOSe9mPzU5YoxQ7fNn2D32F5cMBBX3k0n2mGKs9cpWVfzZzjx21f2y0tPbcwg
 h+46QFtT5F3mhBJvehT5Z8H0wGFKGdOvsB458fGDoiJrUr91GtcwlCtpA8DP+9XLsROL
 emwSeefg9dgopec+a2nnEc4OQUE9Uq2W6OfBPPODpvf2qnf7E+GW1ivPbp6JUOeBnhtm
 2mVcFfTjlEzQu5rajZInwSc9iKkepx6iyjSuJ6cas5fGNa9srgcn7sE4rvHxnqoidmnH
 dcmA==
X-Gm-Message-State: AOJu0YyHG6ajwoRqjbPaZb81ov0V8/QRcrDh1XBBWr/Wpcy8fUANsv27
 itx1OYM25eVY+uINHxzKLMBojBtPohciHg==
X-Google-Smtp-Source: AGHT+IGP4XKCqxEClyU0OwLVkIcmr6P7sdowGhfkMzCSlJahIax1wEAHbrWjuuPCYkhbuqDjmO+2oA==
X-Received: by 2002:a05:6e02:180a:b0:360:780c:d2b3 with SMTP id
 a10-20020a056e02180a00b00360780cd2b3mr5672268ilv.66.1704780092826; 
 Mon, 08 Jan 2024 22:01:32 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 n15-20020a92d9cf000000b0036063b51610sm410975ilq.27.2024.01.08.22.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 22:01:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 23:01:26 -0700
Message-Id: <20240109060128.3974794-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240109060128.3974794-1-james.hilliard1@gmail.com>
References: <20240109060128.3974794-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704780093; x=1705384893; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ncfb7Z7uRnByOoyAAry8o3BH85cYuhFlTgizGHXy3HA=;
 b=Wdy3UhiJ8BNuFqbV+znGZi5Vd9w8BmOxxKxwRBqrBLdA/vNxeO/etMRvPX164dCCdk
 DcjPw254M5lNPZvI3Ock14BDTslZzrlhNBRcVmIPH39bVvA8FKnZ83UrB3lD6rSw04Uj
 j4d3lZ2DE/6U/D7URxNFGqQ761CnyHQ1iFXOsmqw6CPYYhsaBAiPh8k2ciXloPVwoe4z
 XXNKmBr1BNBGbk/gXecuF3F8icjhHsZIKhPqWvBip4CnPBHjfV1g5NHxHUCP8emwUCFS
 9lQmEuWGOXNB7lYz6W2wqV/aMArcpfrj6sxe1fpbNHhl59HA87IVEDN3jJPSd8X2UC1v
 Nk1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Wdy3UhiJ
Subject: [Buildroot] [PATCH 4/6] package/python-jaraco-text: new package
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
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                                 |  1 +
 package/python-jaraco-text/Config.in              | 12 ++++++++++++
 .../python-jaraco-text/python-jaraco-text.hash    |  5 +++++
 package/python-jaraco-text/python-jaraco-text.mk  | 15 +++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/python-jaraco-text/Config.in
 create mode 100644 package/python-jaraco-text/python-jaraco-text.hash
 create mode 100644 package/python-jaraco-text/python-jaraco-text.mk

diff --git a/package/Config.in b/package/Config.in
index 45ba7ac389..e296e5cde2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1153,6 +1153,7 @@ menu "External python modules"
 	source "package/python-jaraco-classes/Config.in"
 	source "package/python-jaraco-context/Config.in"
 	source "package/python-jaraco-functools/Config.in"
+	source "package/python-jaraco-text/Config.in"
 	source "package/python-jedi/Config.in"
 	source "package/python-jeepney/Config.in"
 	source "package/python-jinja2/Config.in"
diff --git a/package/python-jaraco-text/Config.in b/package/python-jaraco-text/Config.in
new file mode 100644
index 0000000000..5044ea3233
--- /dev/null
+++ b/package/python-jaraco-text/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_JARACO_TEXT
+	bool "python-jaraco-text"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-inflect -> python-pydantic -> python-pydantic-core
+	select BR2_PACKAGE_PYTHON_AUTOCOMMAND # runtime
+	select BR2_PACKAGE_PYTHON_INFLECT # runtime
+	select BR2_PACKAGE_PYTHON_JARACO_CONTEXT # runtime
+	select BR2_PACKAGE_PYTHON_JARACO_FUNCTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_MORE_ITERTOOLS # runtime
+	help
+	  Module for text manipulation.
+
+	  https://github.com/jaraco/jaraco.text
diff --git a/package/python-jaraco-text/python-jaraco-text.hash b/package/python-jaraco-text/python-jaraco-text.hash
new file mode 100644
index 0000000000..704e75d6be
--- /dev/null
+++ b/package/python-jaraco-text/python-jaraco-text.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/jaraco.text/json
+md5  9f63a5cdd56061ebd84d8175d1df3b70  jaraco.text-3.12.0.tar.gz
+sha256  389e25c8d4b32e9715bf530596fab0f5cd3aa47296e43969392e18a541af592c  jaraco.text-3.12.0.tar.gz
+# Locally computed sha256 checksums
+sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-jaraco-text/python-jaraco-text.mk b/package/python-jaraco-text/python-jaraco-text.mk
new file mode 100644
index 0000000000..06b028d65f
--- /dev/null
+++ b/package/python-jaraco-text/python-jaraco-text.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-jaraco-text
+#
+################################################################################
+
+PYTHON_JARACO_TEXT_VERSION = 3.12.0
+PYTHON_JARACO_TEXT_SOURCE = jaraco.text-$(PYTHON_JARACO_TEXT_VERSION).tar.gz
+PYTHON_JARACO_TEXT_SITE = https://files.pythonhosted.org/packages/53/30/52edc6c9997d48b0d9fbedb6a29edab2b397968f637b76aae299a9128c34
+PYTHON_JARACO_TEXT_SETUP_TYPE = setuptools
+PYTHON_JARACO_TEXT_LICENSE = MIT
+PYTHON_JARACO_TEXT_LICENSE_FILES = LICENSE
+PYTHON_JARACO_TEXT_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
