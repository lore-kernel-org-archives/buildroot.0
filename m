Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B1BC4167D
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 16:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9316F80C93;
	Thu, 14 Dec 2023 16:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9316F80C93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GMKlXfAItDMk; Thu, 14 Dec 2023 16:55:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CC6580C2D;
	Thu, 14 Dec 2023 16:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CC6580C2D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9BF771BF28E
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 16:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 753CE41E1E
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 16:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 753CE41E1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5VXLLiQUUvoB for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 16:54:48 +0000 (UTC)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90FAD41D5F
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 16:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90FAD41D5F
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7b7039d30acso487615039f.3
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 08:54:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702572887; x=1703177687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O6jaNC8pkHoQR57P1ijEFnievnqROKSBymEBBNYGJXA=;
 b=Z5UfPq8Zl+qgSaE32LIZ2Nj0L2/zZbbWQi22W3a3aU+BALW73YToqi3W4CHqyn2qh8
 cpa2hk3lvbBQFX92uR3ZacD5mMSW+rx1j+UXZnDuFujNw53vinwTw97icvKcW3Qlylck
 wmMROmUDe2ifheMECCaqxXEku5Aiq6KdongBDAwum+tuLKa+EH4Kc3mjJtacUuOZlr37
 fxdwn9y9yYpA6Q48J/tU+ew0JaC14dLGnJiqwDoLBji4yEtAGFJRODjGhvAFLRJA6Tsc
 UPkur9bAhNaRfYNPssXH9GSOexbv1llnUzLZAVDUVUQ+L8cpdpm49Zfc+oABdZb5IO95
 mN3Q==
X-Gm-Message-State: AOJu0YwSBw/uAMv4s4Q3N95YorTLK3eWM2INLaOf5JWHWv7Hzz+KA7KS
 W8XccbQo8VVNL8dFPJj6l+dVxIHe1GxWZA==
X-Google-Smtp-Source: AGHT+IE0kk+Dm/5BkU2HS31QNrQ2x8pSutAgBX2LfEcY0ufPhfOucnaUI+t5kqpSBOSre3AAmcDsZA==
X-Received: by 2002:a05:6602:2c53:b0:7b3:9356:665 with SMTP id
 x19-20020a0566022c5300b007b393560665mr13545318iov.4.1702572887153; 
 Thu, 14 Dec 2023 08:54:47 -0800 (PST)
Received: from james-x399.localdomain (97-118-228-42.hlrn.qwest.net.
 [97.118.228.42]) by smtp.gmail.com with ESMTPSA id
 u16-20020a6b4910000000b007b7372af699sm2912178iob.9.2023.12.14.08.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 08:54:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Dec 2023 09:54:16 -0700
Message-Id: <20231214165420.181703-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231214165420.181703-1-james.hilliard1@gmail.com>
References: <20231214165420.181703-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702572887; x=1703177687; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O6jaNC8pkHoQR57P1ijEFnievnqROKSBymEBBNYGJXA=;
 b=npse5CK+34Lr4s9zOjZvDWFBlIarUx2NYfNxxQnqA9iKHnktTdX2eHUopDbqERS2GZ
 d9jWpCRqBoCcnvy8tLmn6M2r2whHvfJhEs9an3KlXHXDCQU0kvhsNFr/LBqem84UbejS
 0CpT6olqBJsmThnRi5Y4vZ+LlvdoBa4E0wbvXKlbs/2reOj7/6IIV71mCj/aTivwXbAX
 ih/JoBool9wPiDbC9uovqpO9H7KzUxFkQb+1AOS6pMmQcPm9cgmbO9hcgqi/dk0uXyQx
 zDphy7B+eY05TCkyawi8xvMO3ozZwsTUAuG4VPlFKkxdMFsAEPHruF7Jrpi4y9V2nmHp
 BcSA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=npse5CK+
Subject: [Buildroot] [PATCH v3 4/8] package/python-fastapi: new package
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
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                          |  1 +
 package/python-fastapi/Config.in           | 12 ++++++++++++
 package/python-fastapi/python-fastapi.hash |  5 +++++
 package/python-fastapi/python-fastapi.mk   | 15 +++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/python-fastapi/Config.in
 create mode 100644 package/python-fastapi/python-fastapi.hash
 create mode 100644 package/python-fastapi/python-fastapi.mk

diff --git a/package/Config.in b/package/Config.in
index 3a4bf21a2a..8a97eb2897 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1073,6 +1073,7 @@ menu "External python modules"
 	source "package/python-evdev/Config.in"
 	source "package/python-executing/Config.in"
 	source "package/python-falcon/Config.in"
+	source "package/python-fastapi/Config.in"
 	source "package/python-filelock/Config.in"
 	source "package/python-fire/Config.in"
 	source "package/python-flask/Config.in"
diff --git a/package/python-fastapi/Config.in b/package/python-fastapi/Config.in
new file mode 100644
index 0000000000..7d376d3dd7
--- /dev/null
+++ b/package/python-fastapi/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_FASTAPI
+	bool "python-fastapi"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
+	select BR2_PACKAGE_PYTHON_ANYIO # runtime
+	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
+	select BR2_PACKAGE_PYTHON_STARLETTE # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	help
+	  FastAPI framework, high performance, easy to learn, fast to
+	  code, ready for production.
+
+	  https://github.com/tiangolo/fastapi
diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
new file mode 100644
index 0000000000..3dc1578cb7
--- /dev/null
+++ b/package/python-fastapi/python-fastapi.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/fastapi/json
+md5  06bfa7c610fc9e81d05b0319eb70cae7  fastapi-0.105.0.tar.gz
+sha256  4d12838819aa52af244580675825e750ad67c9df4614f557a769606af902cf22  fastapi-0.105.0.tar.gz
+# Locally computed sha256 checksums
+sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
new file mode 100644
index 0000000000..db86bfce30
--- /dev/null
+++ b/package/python-fastapi/python-fastapi.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-fastapi
+#
+################################################################################
+
+PYTHON_FASTAPI_VERSION = 0.105.0
+PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/77/bb/5941e6e2ce3020f64b539a49d39f49be05de17d0c47fea95012589f812a5
+PYTHON_FASTAPI_SETUP_TYPE = pep517
+PYTHON_FASTAPI_LICENSE = MIT
+PYTHON_FASTAPI_LICENSE_FILES = LICENSE
+PYTHON_FASTAPI_DEPENDENCIES = host-python-hatchling
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
