Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F86DC4167D
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 09:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50A8C61B19;
	Thu, 14 Dec 2023 09:49:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50A8C61B19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KPwtBYuP1t3y; Thu, 14 Dec 2023 09:49:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 710B761B14;
	Thu, 14 Dec 2023 09:49:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 710B761B14
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 758AB1BF28E
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 09:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E25483C77
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 09:49:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E25483C77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E33q_1MsS6hD for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 09:49:00 +0000 (UTC)
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46F1B8382F
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 09:49:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46F1B8382F
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-35f519f3ea9so19517145ab.3
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 01:49:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702547339; x=1703152139;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J5wrJ4YjU9EW/6wseol+817y6ql6FWSB4cOtUnDMJVk=;
 b=RSbeH4eOQLH2Kt5u+W48M5DVsrNJ3y1hZBGpZi4FaT1rOkABbtRR+VrQPiJopg6s3X
 FOnKT8U/c13lmin4KHszRHsE10DKkuWCWjVB8ZhYzDSoBiEl/Fh6VnLXsU05xY989hiw
 2adKxczDmidJosw2kD8nszuqUakJslYguwMdP6RvlxUmz4SUHZKXXG3Tsi6sbqSdd7DB
 NtjUdeEDfORzdthdyDPD6GhFOuq+VnwXLrLshw42QV0aWKHAcsjsEGtE+PEeuFJrUPfV
 UfibesUQegEZiaI9jRkTaRRaFqhMpOOZT9jI/t+thOAKVHtk6SEZ4bJ0AFhnfyNPEl2A
 6YFQ==
X-Gm-Message-State: AOJu0YzjBdWF1CCTYPGDBvDiK1Rrxa9JrO4Zs3pPQZ0KpTGjUrj0dguo
 Ih+A6QaF/bygIU4UISsKVIlQLKrSfty48Q==
X-Google-Smtp-Source: AGHT+IEM3WNQOcsLQS6AMQphSow6J8DE4p6bHdJF/mauPAYPOVF/HXwpAAZqc1+ClsK21UGMsTNv5A==
X-Received: by 2002:a05:6e02:1c86:b0:35d:73bb:6ee5 with SMTP id
 w6-20020a056e021c8600b0035d73bb6ee5mr8502639ill.63.1702547339037; 
 Thu, 14 Dec 2023 01:48:59 -0800 (PST)
Received: from james-x399.localdomain (97-118-228-42.hlrn.qwest.net.
 [97.118.228.42]) by smtp.gmail.com with ESMTPSA id
 fx5-20020a0566381e0500b00455d85d6656sm3342144jab.173.2023.12.14.01.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 01:48:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Dec 2023 02:48:44 -0700
Message-Id: <20231214094846.115655-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702547339; x=1703152139; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J5wrJ4YjU9EW/6wseol+817y6ql6FWSB4cOtUnDMJVk=;
 b=ff7UtQlTLIwc5QK6ak1rufhlbhfka3Iqg6ozbQWSWy8tPfkx16++InxZaZnEENFeNU
 AgAJuPxRh0SzU2kKXEaM+6wlrMZjcsnyk2E+G7JGnJ05jGpCq7yGTqHTFVdgLjzfveUA
 hDpByj9Ou8ScPskAsOjI3hIjJ3MrFmZSN/zAO95DrNShGLwDffo+om1T95cfnRnpTu1d
 8p8FTNoS3UqHl7/EE5PGOvfhbSxIbZ/D+T/mS8avAHbXtO2xAlVEphAZvZ6A/HyBy6N/
 Z/xX6L+/3PcATCC9O6gFUhMjYwCj5xJnw2SkkrSt3uGIsJTrEyPImJBvjyriXK/Z/vjp
 FrQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ff7UtQlT
Subject: [Buildroot] [PATCH 1/3] package/python-anyio: new package
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
 package/Config.in                      |  1 +
 package/python-anyio/Config.in         |  9 +++++++++
 package/python-anyio/python-anyio.hash |  5 +++++
 package/python-anyio/python-anyio.mk   | 15 +++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/python-anyio/Config.in
 create mode 100644 package/python-anyio/python-anyio.hash
 create mode 100644 package/python-anyio/python-anyio.mk

diff --git a/package/Config.in b/package/Config.in
index fcc09b07c4..c023e0ef3f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -976,6 +976,7 @@ menu "External python modules"
 	source "package/python-alsaaudio/Config.in"
 	source "package/python-annotated-types/Config.in"
 	source "package/python-ansicolors/Config.in"
+	source "package/python-anyio/Config.in"
 	source "package/python-apispec/Config.in"
 	source "package/python-appdirs/Config.in"
 	source "package/python-argh/Config.in"
diff --git a/package/python-anyio/Config.in b/package/python-anyio/Config.in
new file mode 100644
index 0000000000..d843f37af0
--- /dev/null
+++ b/package/python-anyio/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_ANYIO
+	bool "python-anyio"
+	select BR2_PACKAGE_PYTHON_IDNA # runtime
+	select BR2_PACKAGE_PYTHON_SNIFFIO # runtime
+	help
+	  High level compatibility layer for multiple asynchronous
+	  event loop implementations.
+
+	  https://github.com/agronholm/anyio
diff --git a/package/python-anyio/python-anyio.hash b/package/python-anyio/python-anyio.hash
new file mode 100644
index 0000000000..7548563905
--- /dev/null
+++ b/package/python-anyio/python-anyio.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/anyio/json
+md5  fd068b41b2badac98b4a12bba29c5055  anyio-4.1.0.tar.gz
+sha256  5a0bec7085176715be77df87fc66d6c9d70626bd752fcc85f57cdbee5b3760da  anyio-4.1.0.tar.gz
+# Locally computed sha256 checksums
+sha256  5361ac9dc58f2ef5fd2e9b09c68297c17f04950909bbc8023bdb82eacf22c2b0  LICENSE
diff --git a/package/python-anyio/python-anyio.mk b/package/python-anyio/python-anyio.mk
new file mode 100644
index 0000000000..142681c1d3
--- /dev/null
+++ b/package/python-anyio/python-anyio.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-anyio
+#
+################################################################################
+
+PYTHON_ANYIO_VERSION = 4.1.0
+PYTHON_ANYIO_SOURCE = anyio-$(PYTHON_ANYIO_VERSION).tar.gz
+PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/6e/57/075e07fb01ae2b740289ec9daec670f60c06f62d04b23a68077fd5d73fab
+PYTHON_ANYIO_SETUP_TYPE = setuptools
+PYTHON_ANYIO_LICENSE = MIT
+PYTHON_ANYIO_LICENSE_FILES = LICENSE
+PYTHON_ANYIO_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
