Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98C2C25B48
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 09:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F5C14184C;
	Thu, 26 Oct 2023 09:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F5C14184C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bJICXRpoCyNz; Thu, 26 Oct 2023 09:33:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46B5B41840;
	Thu, 26 Oct 2023 09:33:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46B5B41840
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BAD71BF2B8
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67FA740911
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67FA740911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a0mmkeInYh85 for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 09:27:33 +0000 (UTC)
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9CF2C42109
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 09:27:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CF2C42109
Received: by mail-ej1-x642.google.com with SMTP id
 a640c23a62f3a-9adca291f99so99541766b.2
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 02:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698312451; x=1698917251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ygvI/eDTIvYTCc0zsLiIwwKnDr5An+aN5QKm7QrHYk=;
 b=ALBkRPtHSXilMhj7mAY8OpsQnq3KvoqL+U15QwgkxYljpYTzKPzqGEaa50XiuSqoKw
 6UDUaSqHpsnFAC+/Kv9yBzSPs+nWkE6VOCku/vF/AAySkXP2MqO7RUseHMbZvJ62lL9O
 rHy7hyZjQaWer5isx2dzsNE8/y1+tv9OUr4UFvAQskN5g4BOQBzmH5K+XkbwkOilRCM5
 wBDcJqd7E2lzsSEvSjnIh/ciV2O+AJjKEwBl/HCPQVRqmC+KPJW4KnlXz3opJ8ukMU5n
 IvNSU1aF9Cvytc82QKgUHYujPB2Y3cZeaXnyowm0J9A0ffGJZuF62vy3NOz27rqDHnvL
 0d1A==
X-Gm-Message-State: AOJu0YxuOTIl8W1Nr6C4KjjFr89EJKlWf7AZTP9HBxxt17F8wV/r5VEF
 EoPwLvhckf6oIY8YjiDzrCaxx2T6PuN+07EUOp7+JbZyLkvIW/RF
X-Google-Smtp-Source: AGHT+IE48uJW3lLwFf/cNVDqNjmKydSDm9QwCToZAak6EM6f8TFBoQg+met63uAU4u7jVoupfGz2Qw==
X-Received: by 2002:a17:907:944d:b0:9be:45b3:3116 with SMTP id
 dl13-20020a170907944d00b009be45b33116mr13250931ejc.71.1698312451545; 
 Thu, 26 Oct 2023 02:27:31 -0700 (PDT)
Received: from fedora.. ([77.241.232.0]) by smtp.gmail.com with ESMTPSA id
 mb8-20020a170906eb0800b009b947f81c4asm11268438ejb.155.2023.10.26.02.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 02:27:31 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 11:26:58 +0200
Message-ID: <20231026092701.12345-28-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698312451; x=1698917251;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ygvI/eDTIvYTCc0zsLiIwwKnDr5An+aN5QKm7QrHYk=;
 b=f3Hf5Oo73LUeuq8ck5fbMAeQaFN0BQV9ar+YVXIxi0VTxE5rRB4lGq2r36khHrtZ7l
 pqU0oR+HnGuaFDMsDWcvNoYp7i5lzxEdMOJLN/bM7MjP7UHmJS5BgmOz5aYIgTx++S4O
 sfcIw/36eJWglK7KJcjB8VvgMKLILjIjkq0x4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=f3Hf5Oo7
Subject: [Buildroot] [PATCH 27/30] package/python-pyxb: Drop package
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The last time python-pyxb was updated according to pypi.org is in 2017.
As there are no maintainers listed for the package, and the package uses
distutils which has been removed in Python 3.12.0, remove the package.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 Config.in.legacy                     |  7 +++++++
 package/python-pyxb/Config.in        |  8 --------
 package/python-pyxb/python-pyxb.hash |  4 ----
 package/python-pyxb/python-pyxb.mk   | 14 --------------
 4 files changed, 7 insertions(+), 26 deletions(-)
 delete mode 100644 package/python-pyxb/Config.in
 delete mode 100644 package/python-pyxb/python-pyxb.hash
 delete mode 100644 package/python-pyxb/python-pyxb.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index ca80279212..8e406f2b13 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2023.11"
 
+config BR2_PACKAGE_PYTHON_PYXB
+	bool "python-pyxb removed"
+	select BR2_LEGACY
+	help
+	  python-pyxb has been removed due to being abandoned and
+	  distutils no longer being supported in python 3.12.0.
+
 config BR2_KERNEL_HEADERS_6_4
 	bool "kernel headers version 6.4.x are no longer supported"
 	select BR2_LEGACY
diff --git a/package/python-pyxb/Config.in b/package/python-pyxb/Config.in
deleted file mode 100644
index 6555ed80b6..0000000000
--- a/package/python-pyxb/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_PYTHON_PYXB
-	bool "python-pyxb"
-	help
-	  PyXB is a pure Python package that generates Python code for
-	  classes that correspond to data structures defined by
-	  XMLSchema.
-
-	  http://pyxb.sourceforge.net/
diff --git a/package/python-pyxb/python-pyxb.hash b/package/python-pyxb/python-pyxb.hash
deleted file mode 100644
index f24cd42e5a..0000000000
--- a/package/python-pyxb/python-pyxb.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# md5 from https://pypi.python.org/pypi/PyXB/json, sha256 locally computed
-md5  4303573fc7094ce4664c5b71cd4bdb48  PyXB-1.2.6.tar.gz
-sha256  2a00f38dd1d87b88f92d79bc5a09718d730419b88e814545f472bbd5a3bf27b4  PyXB-1.2.6.tar.gz
-sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-pyxb/python-pyxb.mk b/package/python-pyxb/python-pyxb.mk
deleted file mode 100644
index 6af10b51e7..0000000000
--- a/package/python-pyxb/python-pyxb.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-pyxb
-#
-################################################################################
-
-PYTHON_PYXB_VERSION = 1.2.6
-PYTHON_PYXB_SOURCE = PyXB-$(PYTHON_PYXB_VERSION).tar.gz
-PYTHON_PYXB_SITE = https://pypi.python.org/packages/e3/09/4fdb190ea2b7cb43d6d3e745276ee69f4d6181be70fcbfda7df3c5f72f0e
-PYTHON_PYXB_LICENSE = Apache-2.0
-PYTHON_PYXB_LICENSE_FILES = LICENSE
-PYTHON_PYXB_SETUP_TYPE = distutils
-
-$(eval $(python-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
