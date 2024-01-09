Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B0FC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 06:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8334041901;
	Tue,  9 Jan 2024 06:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8334041901
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id duN24ZsxwWFH; Tue,  9 Jan 2024 06:01:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 955EE41989;
	Tue,  9 Jan 2024 06:01:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 955EE41989
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 920741BF3D8
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 06:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A05760743
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 06:01:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A05760743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZpJYKjVUtaAx for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 06:01:32 +0000 (UTC)
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33A1A60ADE
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 06:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33A1A60ADE
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3608e206f27so12030535ab.1
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 22:01:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704780090; x=1705384890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lOf/sQiatWIdp8Jehw5zhTPF/py6uVa7Q5wk13pHPvU=;
 b=O1iZV2imQ1tKEVtHMMHVXVeWPvaBSxHJ7xw9yNtNUJrDxQo72PW9CTCmKxUHDKW7O2
 ReouZ4vBK2WG9jdkUZKAbU278NiSfBR9/Vk7VLjllzgmjXuzdRT44sZbCR0dWBIM4AJ1
 AiNDemfLM6AlGrlMq95j2eLMMnau4sVnyUtwJvKsn9MwYC7Gt9sCaSVMsNUFXFUpgqcC
 NVxglCr0O8lN2Kvw59rh4kuCcmoAze/lmIVG4TNXI0CkPOF/TmFwuop1R8hjpM4y6xjE
 ZL2Z2v6aFQWQU6BTBWLWcNrxfrRm+DfiJ/M9NcGQyPDeGqgWUdaHMKhVkNHEwynX8wdD
 gmTg==
X-Gm-Message-State: AOJu0Yz2xnCQcaHVQKNRJA0ekZgk4icwfqtHp1EwXHgpXv0sSPTIXWAh
 14Uwym9Cg05z2MZCgBhbyR1ZuUm4NVKv0Q==
X-Google-Smtp-Source: AGHT+IHoCgdIVDi94hhWaV7DYk41JboDvnh3D8bUNup8RVRVU+t03NT5tj3aGh6wmDxfim9PHyKHWg==
X-Received: by 2002:a92:cd88:0:b0:360:ab6:b850 with SMTP id
 r8-20020a92cd88000000b003600ab6b850mr7300459ilb.77.1704780090527; 
 Mon, 08 Jan 2024 22:01:30 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 n15-20020a92d9cf000000b0036063b51610sm410975ilq.27.2024.01.08.22.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 22:01:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 23:01:24 -0700
Message-Id: <20240109060128.3974794-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240109060128.3974794-1-james.hilliard1@gmail.com>
References: <20240109060128.3974794-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704780090; x=1705384890; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lOf/sQiatWIdp8Jehw5zhTPF/py6uVa7Q5wk13pHPvU=;
 b=MXcxJz/mcLoAmD/q3QjR4m24uGxfPsRjrreQwYpVZ9hk5P7TsK0fa6aPjfibqqzSJ4
 hn7X8TWIeRWqnPehWWb5UlZUfpZ3DAKpAa30+WbBwlLKZZysrfD3uZcFAZniPmbcRt+Y
 CWtqoCqXE8z8SullspwZZYjtlfbUAIP1lfQeQ7nde8zcqH1WYdv8CQWSVAtGcmvXIbFh
 lCSkdWoEVlZXDKYv7kvEfIfQEjhTC37mFL2YAqUJHMQK56BbdwX5ujwQIfU///u6RKUe
 pRC7mGYgzx/fikhAxpIEPr6y72tvdV62C2dPAXgB+5/YlVRaX4XAjVZlJW+uYjBYzYsN
 /2zg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MXcxJz/m
Subject: [Buildroot] [PATCH 2/6] package/python-inflect: new package
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
 package/Config.in                          |  1 +
 package/python-inflect/Config.in           | 10 ++++++++++
 package/python-inflect/python-inflect.hash |  5 +++++
 package/python-inflect/python-inflect.mk   | 15 +++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/python-inflect/Config.in
 create mode 100644 package/python-inflect/python-inflect.hash
 create mode 100644 package/python-inflect/python-inflect.mk

diff --git a/package/Config.in b/package/Config.in
index 7f9800a7e1..d9b97b22a3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1134,6 +1134,7 @@ menu "External python modules"
 	source "package/python-idna/Config.in"
 	source "package/python-ifaddr/Config.in"
 	source "package/python-incremental/Config.in"
+	source "package/python-inflect/Config.in"
 	source "package/python-inflection/Config.in"
 	source "package/python-influxdb/Config.in"
 	source "package/python-iniconfig/Config.in"
diff --git a/package/python-inflect/Config.in b/package/python-inflect/Config.in
new file mode 100644
index 0000000000..daf6bd4a32
--- /dev/null
+++ b/package/python-inflect/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_INFLECT
+	bool "python-inflect"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
+	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	help
+	  Correctly generate plurals, singular nouns, ordinals,
+	  indefinite articles; convert numbers to words.
+
+	  https://github.com/jaraco/inflect
diff --git a/package/python-inflect/python-inflect.hash b/package/python-inflect/python-inflect.hash
new file mode 100644
index 0000000000..3faa4cc5a5
--- /dev/null
+++ b/package/python-inflect/python-inflect.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/inflect/json
+md5  61c670cf5c4d09314f6a4d3b99d3b98d  inflect-7.0.0.tar.gz
+sha256  63da9325ad29da81ec23e055b41225795ab793b4ecb483be5dc1fa363fd4717e  inflect-7.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-inflect/python-inflect.mk b/package/python-inflect/python-inflect.mk
new file mode 100644
index 0000000000..cef4c06627
--- /dev/null
+++ b/package/python-inflect/python-inflect.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-inflect
+#
+################################################################################
+
+PYTHON_INFLECT_VERSION = 7.0.0
+PYTHON_INFLECT_SOURCE = inflect-$(PYTHON_INFLECT_VERSION).tar.gz
+PYTHON_INFLECT_SITE = https://files.pythonhosted.org/packages/9f/90/1d0a889847fdce963ebe9684de24a749e4fad627bf595e9f0d32730f85a8
+PYTHON_INFLECT_SETUP_TYPE = setuptools
+PYTHON_INFLECT_LICENSE = MIT
+PYTHON_INFLECT_LICENSE_FILES = LICENSE
+PYTHON_INFLECT_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
