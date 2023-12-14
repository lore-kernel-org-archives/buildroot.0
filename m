Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC1AC4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 19:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BACF083D65;
	Thu, 14 Dec 2023 19:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BACF083D65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x7JBtRFLrB3U; Thu, 14 Dec 2023 19:25:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D35E083C7E;
	Thu, 14 Dec 2023 19:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D35E083C7E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DDE081BF3EA
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 19:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6CF060C11
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 19:24:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6CF060C11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YnwSef0LnWbT for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 19:24:49 +0000 (UTC)
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B739260BF8
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 19:24:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B739260BF8
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-7b70139d54cso316812439f.1
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 11:24:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702581888; x=1703186688;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eOHnHhFaPmEm6vBNZRt1Zru1L8w3k+yA/anfrIj6+KQ=;
 b=AMPC/rxCLugF+9XCd+69xYWNNi+qv8T49OSmO9No92nIuZKuqs1CZCavlGa5kgxdYF
 DQCtoj6AZoPGeuAaOqDRXJpHq9RjQvoIrhaBcih1TSYWTGj4zqfa5k0KAEQk1m4SxsY1
 VtkbcWcTJ1PJwwXykBPoHFxoI4WXyP0boSuUe1Rtqnygd2/gSC8CxkjMU4L6xIdV3OHU
 RJ3sJo2oLLCI6Lx1N0JbNJjp1i3E2yM9rMSwcGdsNzDvPf60oBZHwa6uTnJeknCdLZXp
 2+Lq+GT9TnqfanLCa5gF7lrcaZEKHI8NriwX0f4tIFh4FSglqWdMEgJD1AUMp/MA3V6R
 DoJw==
X-Gm-Message-State: AOJu0YzjNCjxsc1WgA8Gb4VcwjDT0kYwURDKY6i0W8Mpan7yMc3vrLw7
 0VlnK4LAML4TKoCvXogJoOAtR8nC8aI/eQ==
X-Google-Smtp-Source: AGHT+IHbFm3eb1YH+DbTbTWG4kSZafFXG8w57IR+NQk6kFDP2m1njxvs27SjEdZhy/i+rYIZ7u8NJg==
X-Received: by 2002:a05:6602:35b:b0:7b6:eebd:bfd2 with SMTP id
 w27-20020a056602035b00b007b6eebdbfd2mr11068343iou.4.1702581888465; 
 Thu, 14 Dec 2023 11:24:48 -0800 (PST)
Received: from james-x399.localdomain (97-118-228-42.hlrn.qwest.net.
 [97.118.228.42]) by smtp.gmail.com with ESMTPSA id
 c16-20020a0290d0000000b00468e80fa254sm1345615jag.148.2023.12.14.11.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 11:24:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Dec 2023 12:24:38 -0700
Message-Id: <20231214192439.259156-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231214192439.259156-1-james.hilliard1@gmail.com>
References: <20231214192439.259156-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702581888; x=1703186688; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eOHnHhFaPmEm6vBNZRt1Zru1L8w3k+yA/anfrIj6+KQ=;
 b=f9f2AZFrSuqO1WpNLxpPkfFUFIx5x/Ao8tzJlZQYsQY4qY0CERP3L5uFhAUGB4DbX7
 wXdVGv0qB19X5alNDSUFDAYZl6qA1BHCHR3RUnoDTJSt30MZtui6yW8hBcopPBj062jl
 dbgUMDSHhyeAiv5cf6kxmbB0IQQigMhIvoMCwG1+p7kEBDQ01qkCBi4gnov8fG/V21hR
 mocT7GGTBlcWaCfLHBO1/y6o1R3WEdB+xoqc0pByqef0rWUycDEvkSKcI1SpWy1ZKkIh
 2IQO0TamiG7jNU9t1OmR5/bumxbkH+qN21H69ZrY+SG7gSkXii/zfjxLDK1DJoUr7J8G
 7Rfg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=f9f2AZFr
Subject: [Buildroot] [PATCH 6/7] package/python-google-api-core: new package
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
 package/Config.in                                  |  1 +
 package/python-google-api-core/Config.in           | 10 ++++++++++
 .../python-google-api-core.hash                    |  5 +++++
 .../python-google-api-core.mk                      | 14 ++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/python-google-api-core/Config.in
 create mode 100644 package/python-google-api-core/python-google-api-core.hash
 create mode 100644 package/python-google-api-core/python-google-api-core.mk

diff --git a/package/Config.in b/package/Config.in
index 5c9d5b6197..4a65104d60 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1094,6 +1094,7 @@ menu "External python modules"
 	source "package/python-gnupg/Config.in"
 	source "package/python-gobject/Config.in"
 	source "package/python-googleapis-common-protos/Config.in"
+	source "package/python-google-api-core/Config.in"
 	source "package/python-google-auth/Config.in"
 	source "package/python-gpiozero/Config.in"
 	source "package/python-greenlet/Config.in"
diff --git a/package/python-google-api-core/Config.in b/package/python-google-api-core/Config.in
new file mode 100644
index 0000000000..689923a2f4
--- /dev/null
+++ b/package/python-google-api-core/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_GOOGLE_API_CORE
+	bool "python-google-api-core"
+	select BR2_PACKAGE_PYTHON_GOOGLE_AUTH # runtime
+	select BR2_PACKAGE_PYTHON_GOOGLEAPIS_COMMON_PROTOS # runtime
+	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
+	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
+	help
+	  Google API client core library.
+
+	  https://github.com/googleapis/python-api-core
diff --git a/package/python-google-api-core/python-google-api-core.hash b/package/python-google-api-core/python-google-api-core.hash
new file mode 100644
index 0000000000..5a1cd7f1cb
--- /dev/null
+++ b/package/python-google-api-core/python-google-api-core.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/google-api-core/json
+md5  58a4ce34a405e514cdb5295c80834cfd  google-api-core-2.15.0.tar.gz
+sha256  abc978a72658f14a2df1e5e12532effe40f94f868f6e23d95133bd6abcca35ca  google-api-core-2.15.0.tar.gz
+# Locally computed sha256 checksums
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-google-api-core/python-google-api-core.mk b/package/python-google-api-core/python-google-api-core.mk
new file mode 100644
index 0000000000..84042d8d7a
--- /dev/null
+++ b/package/python-google-api-core/python-google-api-core.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-google-api-core
+#
+################################################################################
+
+PYTHON_GOOGLE_API_CORE_VERSION = 2.15.0
+PYTHON_GOOGLE_API_CORE_SOURCE = google-api-core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
+PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/2c/e4/56b14d35057a23cab9067dd8fb841407d05d32b5d6c7a3c66c1360e8a7c0
+PYTHON_GOOGLE_API_CORE_SETUP_TYPE = setuptools
+PYTHON_GOOGLE_API_CORE_LICENSE = Apache-2.0
+PYTHON_GOOGLE_API_CORE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
