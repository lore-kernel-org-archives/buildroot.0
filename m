Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0587C4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 11:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BCF76F59A;
	Thu, 14 Dec 2023 11:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BCF76F59A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jgOd23_9ru2l; Thu, 14 Dec 2023 11:25:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EB2460803;
	Thu, 14 Dec 2023 11:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EB2460803
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E22B61BF2F0
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 11:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB2E04096A
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 11:24:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB2E04096A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BM8XFY2pxqQx for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 11:24:44 +0000 (UTC)
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C04C74095A
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 11:24:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C04C74095A
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-7b71d65021dso11737439f.1
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 03:24:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702553083; x=1703157883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O6jaNC8pkHoQR57P1ijEFnievnqROKSBymEBBNYGJXA=;
 b=VKXMW2obtkMtCAlQo7T2eFWMCvhobxQzOhLY/m8NPHlIoXkObO65moW6rsJ90NObiY
 501ZMNNdAQlcuJi0xZthVbXYZDvMe4BtQBrzQVXQVBgp0gLS2eHR8ZuieYVUUsDaginS
 8fyjPkyivV0j1HK41gWJnJ6ZDpdMQOZOfKvAPs/oi63vpaPjw7Os5saUv8pEGDe3j/eB
 u5oICHr1/lzuKeSpQ5+2jqNUdFxs12Z3FRAoQUu1Q7chIkezrREd4+f2H07OulO9lXQu
 TCA1qQ+NckO3GBhI8AFwAOddKOfxVWd98ISOOryOXuqbZwGqNTJiOyh/JnIQ3BQDjP0f
 hp0A==
X-Gm-Message-State: AOJu0Yz/+K9RdcLs0WORv3c50CGVeRlKKpAjckfwPArUOW/kG7Pdp2ND
 oTS35LFLvBn62qzDaaOkSXfqLZV9hIH3jA==
X-Google-Smtp-Source: AGHT+IHdD+w0mqMAfYM7N16NeD0+awCq9VSv+LBTVHvZzp3W6ErhasvoHqbj4Jerzgdg3KR1QdprPw==
X-Received: by 2002:a6b:5c04:0:b0:7b4:2909:736 with SMTP id
 z4-20020a6b5c04000000b007b429090736mr8041904ioh.13.1702553083446; 
 Thu, 14 Dec 2023 03:24:43 -0800 (PST)
Received: from james-x399.localdomain (97-118-228-42.hlrn.qwest.net.
 [97.118.228.42]) by smtp.gmail.com with ESMTPSA id
 x10-20020a02970a000000b00468ea2264e1sm3338599jai.73.2023.12.14.03.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 03:24:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Dec 2023 04:24:36 -0700
Message-Id: <20231214112436.144804-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231214112436.144804-1-james.hilliard1@gmail.com>
References: <20231214112436.144804-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702553083; x=1703157883; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O6jaNC8pkHoQR57P1ijEFnievnqROKSBymEBBNYGJXA=;
 b=CAJv0L8YEZ32d13+naeD9eviURTmdo5Co2AJbkHmjV6LdQAzFfklDtIcfR17zksWug
 Ol83ZrTSa14/hT8jSKwhH2ZtkNgO+fpDPak+VbVQ39dEE5ZW2poo//WBG/tUVOjNSPnS
 2z4MV7G4kodMKSHUzLD95i11oHO7X2GC+o2cR9vugQRn8YkCbMJEnbR1yZzOA+wXlBPe
 rTOjwzwcJhVsLCevqzxLsDoNdNkYolduSpQf9JtrHyG8WWbW1Mq6gQVtTaRqcWTbOfNT
 cqnOgKSwHck65SXjLdV33ug3x+cyaeSMXfjrr/Yt+vDwFcMieFyy8vFn5BBikejH59ww
 HPng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CAJv0L8Y
Subject: [Buildroot] [PATCH v2 3/3] package/python-fastapi: new package
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
