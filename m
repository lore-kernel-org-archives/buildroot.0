Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A984C4167B
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 16:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E01383BC5;
	Thu, 14 Dec 2023 16:55:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E01383BC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cs6hUNZBHiHL; Thu, 14 Dec 2023 16:55:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6033783CD1;
	Thu, 14 Dec 2023 16:54:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6033783CD1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8CF221BF28E
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 16:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72E7E41E1E
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 16:54:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72E7E41E1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qUMuPLRyIba6 for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 16:54:45 +0000 (UTC)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 437C941D5F
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 16:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 437C941D5F
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7b71b10391aso307957039f.3
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 08:54:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702572884; x=1703177684;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FTkQPDWW7eU1knpTVlOFhSHmYt49sTKNvSFKoOCeons=;
 b=VjtkHvhB8emfRN6t0iQsTtBe62FFys23+xIL7xG/Jn2eMAQrYvXpJQ6VE+krQdIY/m
 bUKm4DMPl4wrSXbOn2fi8wr+lPlgqoaOcNf7cOS3WWP6xzluVOU3N0SlmSG9y7Lp2gl3
 1idf0w0VEptWXUmbA4t44VoGuL+kfg8fPWUN+Rc7us7S/4ImuLdisza/r+7PJ6EwxY7j
 G6HYhyQC13wJSBUCrojxvDTY00e7pWs0m6Xtds/5oMxWjzsUmejb6qMjEnbtxx2/7C4W
 c8zhFQe9XzPkNn98guJ1ebMYn6NVcd1llBot2IkIkqsrsi6VpJDgr+3WHxDQXkGmGxR6
 eElg==
X-Gm-Message-State: AOJu0YwpxW4mrQL/HaERxH/J2azO/xoC0Zy08VpJvK9OyEp0CAv9Mxn7
 2htrJFbLigTWK3iflkz7dAxI3PrT+MwSFg==
X-Google-Smtp-Source: AGHT+IGxYOZ4HPz1egXLDDsmad90rQnQLdd1XPJXeONI63nKvXmmvjTvhGxtfiLfAInRxumhcKIi9g==
X-Received: by 2002:a05:6602:1855:b0:7b3:59d0:df14 with SMTP id
 d21-20020a056602185500b007b359d0df14mr7672503ioi.4.1702572884017; 
 Thu, 14 Dec 2023 08:54:44 -0800 (PST)
Received: from james-x399.localdomain (97-118-228-42.hlrn.qwest.net.
 [97.118.228.42]) by smtp.gmail.com with ESMTPSA id
 u16-20020a6b4910000000b007b7372af699sm2912178iob.9.2023.12.14.08.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 08:54:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Dec 2023 09:54:14 -0700
Message-Id: <20231214165420.181703-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231214165420.181703-1-james.hilliard1@gmail.com>
References: <20231214165420.181703-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702572884; x=1703177684; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FTkQPDWW7eU1knpTVlOFhSHmYt49sTKNvSFKoOCeons=;
 b=Bs1Oumgn5qQSSzAqyMKqYtcwYWwYSv14csQ1ivuQbddTFFocb+k/3T3MsmW1xJaom1
 HJwwS0f8uKB+M2mbmpVOOv/B4oQL6mmTZLA1R4NhWM31rW+vw7XRLZgM6c6cm0lSaNWt
 EAckaHGyWPrkhsVFHAR4o8FAR434wQeQVgwL0rB6LMZvk1A+wB2Gegpr4Y8PnIrvicCo
 tINzUA0Cg8jBgzfkL9fMwc99pjp/U30eUzyIaYSlrMIfhVcXHN1wDeQNL9XPVg2lmOru
 PzOcZyKaVM+Kl1CLgW2E0wjaJ9sPvif4W2P57n9phKIYqBSEe8aVCWjf//uguMDmYqq0
 iIeQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Bs1Oumgn
Subject: [Buildroot] [PATCH v3 2/8] package/python-anyio: new package
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
Cc: Marcus Hoffmann <marcus.hoffmann@othermo.de>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
---
Changes v1 -> v2:
  - downgrade to version 3.7.1
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
index 0000000000..1cea549bc1
--- /dev/null
+++ b/package/python-anyio/python-anyio.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/anyio/json
+md5  58d288dd84e28e2507ff9ce7e4620010  anyio-3.7.1.tar.gz
+sha256  44a3c9aba0f5defa43261a8b3efb97891f2bd7d804e0e1f56419befa1adfc780  anyio-3.7.1.tar.gz
+# Locally computed sha256 checksums
+sha256  5361ac9dc58f2ef5fd2e9b09c68297c17f04950909bbc8023bdb82eacf22c2b0  LICENSE
diff --git a/package/python-anyio/python-anyio.mk b/package/python-anyio/python-anyio.mk
new file mode 100644
index 0000000000..80404ac660
--- /dev/null
+++ b/package/python-anyio/python-anyio.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-anyio
+#
+################################################################################
+
+PYTHON_ANYIO_VERSION = 3.7.1
+PYTHON_ANYIO_SOURCE = anyio-$(PYTHON_ANYIO_VERSION).tar.gz
+PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/28/99/2dfd53fd55ce9838e6ff2d4dac20ce58263798bd1a0dbe18b3a9af3fcfce
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
