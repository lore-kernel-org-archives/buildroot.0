Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36432C624B4
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 08:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3ED360E64;
	Sat, 25 Nov 2023 08:11:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3ED360E64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d5Huc-SuV8xZ; Sat, 25 Nov 2023 08:11:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34518615C7;
	Sat, 25 Nov 2023 08:11:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34518615C7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BDA601BF3D2
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 08:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96FA041EBE
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 08:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96FA041EBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hBx56lN3Il7V for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 08:10:59 +0000 (UTC)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0F6841841
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 08:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0F6841841
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7b37dd51311so24415939f.0
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 00:10:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700899858; x=1701504658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1LIOP6eC2Ozc+lxzF3abfNY1bQuf7M465wLLKXFMuAk=;
 b=HXU1QLRU9vN+ib7i/Elr0XYvru0871dds92K+E/FsWZLRblQiCrDdfP4VYtvE7URSU
 9VVeMEtIkyQ9TUDlr8Z8a8auyMB4eTkrTt6kCrQfir6N5nJIV1kqNRLEaqfNiOHXWr9A
 n1W7uFykCgOPGwLN9AY2/8gP7cipPh8qkJ/F82jM4Geymya8VE7CKu4ZxgADK3/LO2Dh
 AEPCmOMkw3SQWg2EBaaI1lBH1uJZ4h8+6WlLY/GNRdNkN7qcom6eVEF7vduVgfsg44Ue
 +5kH5Q2mKllYJjvNNDhIsiN+TyB8v+jF+nuLPHxE6cqHV0KOnOrKM7a6bgybcFGc7ydt
 n3rg==
X-Gm-Message-State: AOJu0YzLKlYDOXqBq+grFm2FJ+Cm4FZBKJURSOWleYIRylCUqdexiAln
 0bMoXiP2C2cg0A5Se2diVzZjl44ZogM=
X-Google-Smtp-Source: AGHT+IHvJFO7vfPQdo72y3WyyaL26roNRFPkIH56YJps82KossLpNNGuhqymX+jvV8aQ307AbdCU9A==
X-Received: by 2002:a05:6602:3f96:b0:783:727a:8e15 with SMTP id
 fb22-20020a0566023f9600b00783727a8e15mr380351iob.6.1700899858296; 
 Sat, 25 Nov 2023 00:10:58 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 z23-20020a6b0a17000000b007a667c41368sm1294634ioi.54.2023.11.25.00.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Nov 2023 00:10:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 01:10:51 -0700
Message-Id: <20231125081052.881728-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231125081052.881728-1-james.hilliard1@gmail.com>
References: <20231125081052.881728-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700899858; x=1701504658; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1LIOP6eC2Ozc+lxzF3abfNY1bQuf7M465wLLKXFMuAk=;
 b=ETyiEDE5okJn22VGWwVj7kx0rmVziko74kNJ4lmMYGEj2XIodLV+43MJklToBZte39
 sBnmT0Eqkw99VOHxbPWTWQauW63yroMmgCz0+9OwLHQ67czcb7q68P8dTMet7OGTmqso
 Btu3VTSJ9I+wl+MJR2f4XT0FwvL7JrymnMk7OMD3NaIvvwmNLKRF9fCUcrxN5TNRMUnt
 JtinNgqt+4Xn8maTY3wCIP/T0FZWxkAbktorHshGK7ee+Zgefv+OZuT0yL9Y98sHOmii
 SMcToicvRNjDxsJRtqfAoAhcigyiflU4HwBxL4X3CBp8Gdd2tbCvVeuSDtqgX9S0tt00
 wEEg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ETyiEDE5
Subject: [Buildroot] [PATCH 2/3] package/python-pydantic-core: new package
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
 package/Config.in                                 |  1 +
 package/python-pydantic-core/Config.in            |  8 ++++++++
 .../python-pydantic-core.hash                     |  4 ++++
 .../python-pydantic-core/python-pydantic-core.mk  | 15 +++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-pydantic-core/Config.in
 create mode 100644 package/python-pydantic-core/python-pydantic-core.hash
 create mode 100644 package/python-pydantic-core/python-pydantic-core.mk

diff --git a/package/Config.in b/package/Config.in
index 68e6e29a4d..fcc09b07c4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1228,6 +1228,7 @@ menu "External python modules"
 	source "package/python-pycups/Config.in"
 	source "package/python-pydal/Config.in"
 	source "package/python-pydantic/Config.in"
+	source "package/python-pydantic-core/Config.in"
 	source "package/python-pydevmem/Config.in"
 	source "package/python-pydyf/Config.in"
 	source "package/python-pyelftools/Config.in"
diff --git a/package/python-pydantic-core/Config.in b/package/python-pydantic-core/Config.in
new file mode 100644
index 0000000000..3eeb1844a2
--- /dev/null
+++ b/package/python-pydantic-core/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_PYDANTIC_CORE
+	bool "python-pydantic-core"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	help
+	  Core validation logic for pydantic written in rust.
+
+	  https://github.com/pydantic/pydantic-core
diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
new file mode 100644
index 0000000000..4927d816be
--- /dev/null
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -0,0 +1,4 @@
+# Locally calculated after vendoring
+sha256  b54296f8317e7ffd72726836636aa3a6c8c977d8f73b68253c443c0fe3731064  pydantic_core-2.14.5.tar.gz
+# Locally computed sha256 checksums
+sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
new file mode 100644
index 0000000000..8b61323ab3
--- /dev/null
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pydantic-core
+#
+################################################################################
+
+PYTHON_PYDANTIC_CORE_VERSION = 2.14.5
+PYTHON_PYDANTIC_CORE_SOURCE = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
+PYTHON_PYDANTIC_CORE_SITE = https://files.pythonhosted.org/packages/64/26/cffb93fe9c6b5a91c497f37fae14a4b073ecbc47fc36a9979c7aa888b245
+PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
+PYTHON_PYDANTIC_CORE_LICENSE = MIT
+PYTHON_PYDANTIC_CORE_LICENSE_FILES = LICENSE
+PYTHON_PYDANTIC_CORE_DEPENDENCIES = host-python-typing-extensions
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
