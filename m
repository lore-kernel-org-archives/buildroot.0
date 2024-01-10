Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2113CC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 05:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C20BF81094;
	Wed, 10 Jan 2024 05:38:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C20BF81094
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YbNoUCaf1qP3; Wed, 10 Jan 2024 05:38:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0767581006;
	Wed, 10 Jan 2024 05:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0767581006
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 992CF1BF34C
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 05:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 761CA408D5
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 05:38:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 761CA408D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6LJgCMtyAvjf for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 05:38:54 +0000 (UTC)
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 580214028B
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 05:38:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 580214028B
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-7ba903342c2so265220039f.3
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 21:38:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704865133; x=1705469933;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5ZKfYR2aLAgZ+WegjYCEIbadjWqv7PE7KXyxDNPb3nc=;
 b=Q8gAVuldqsexub11Ev53klOV2FJhPk3w8sqV/EWfGTP1BkDLlSdGFPIqHjahs7/fjX
 Q1b8kToDFTW30OhdejlJ/rZwU7b+ydO2ixW9X1c2/IFRekmrO0Tbnj0YSepy4aq4KkiR
 uQbSLbVczMUATG6m13dpadxRGdG3/o5boE77EA5qRnLD12VLO7kcFjHR/bSZ8UNE+dE4
 j0bC9uxobCiRmMebkNQSToxuKwhFfa8R49u4d/lff9TBGWN3yFXMji7z7XYf0Th/HonW
 t6SZrhsPjrx4P+2YGaX2pBoXFvKPp951R2ueZzTG2Q4yDmyN/niNAzAi2dr8ll7Lxwqk
 /C3A==
X-Gm-Message-State: AOJu0Yy80O7KE4+C6l3otuSEHAFLwFHnHBePuEbAm0rxN+6rgZg5MTI1
 3A1yI4nF/qfqR6lt0iA04ARJBr0VNhFCGg==
X-Google-Smtp-Source: AGHT+IHmNwkLY73Ho969/eGDYkXUhqqWsk8oPSGTrimT8lX8wbcVWTZYrjPBMW6B3e0FoU94ZHNfWw==
X-Received: by 2002:a6b:db02:0:b0:7be:e783:850e with SMTP id
 t2-20020a6bdb02000000b007bee783850emr212240ioc.39.1704865132864; 
 Tue, 09 Jan 2024 21:38:52 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 k13-20020a5e890d000000b007b7f3506685sm440600ioj.17.2024.01.09.21.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 21:38:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 22:38:50 -0700
Message-Id: <20240110053850.1159643-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704865133; x=1705469933; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5ZKfYR2aLAgZ+WegjYCEIbadjWqv7PE7KXyxDNPb3nc=;
 b=mF+JW6F3UZhecCU3JvMUTBCl6XHsNRI5zSEIWyKK/J8/oRodED2+tMyZYkG4SBwQAC
 MYJL9sKxnvprDSATW5j6jwUhURlVQ0g6Ls0Iy0DQJcEfUkclwbLhU6cOQgmKu7E47y6H
 R4rU4zBuspG72AdfocbNDKnjOUnzlFXXLmJACBD1GUB0ZODk/QWOQZ9mpp98J3RB6mox
 GDjtYyYkg+6c5lyCNAYGNrS8/X1PpPcwsTTe+3JyJFOEZvmXOgvGNo1dgeYPXDZJWQfr
 h3DTlbg2ZMimIimBZC5FmwFT240i03MIlKFoqNJHbJ846nQHrc0oBSDVFI2MNj+g7NEN
 qXGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mF+JW6F3
Subject: [Buildroot] [PATCH 1/1] package/python-pymodbus: bump to version
 3.6.3
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
Cc: Falco Hyfing <hyfinglists@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to year range update:
https://github.com/pymodbus-dev/pymodbus/commit/131d30391efd9c64f1fec857ae0372746374e6d2

Drop no longer required python-six runtime dependency.

Drop no longer required python-serial runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pymodbus/Config.in            | 6 ++----
 package/python-pymodbus/python-pymodbus.hash | 6 +++---
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/python-pymodbus/Config.in b/package/python-pymodbus/Config.in
index 0ba6fb88f0..dac6716b87 100644
--- a/package/python-pymodbus/Config.in
+++ b/package/python-pymodbus/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYMODBUS
 	bool "python-pymodbus"
-	select BR2_PACKAGE_PYTHON_SIX # runtime
-	select BR2_PACKAGE_PYTHON_SERIAL # runtime
 	help
-	  Pymodbus is a full Modbus protocol implementation.
+	  A fully featured modbus protocol stack in python.
 
-	  https://github.com/riptideio/pymodbus
+	  https://github.com/pymodbus-dev/pymodbus/
diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index d9337ffe84..5f60af52d8 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  89da6585b27b8c4b3887eb9f7d1e950b  pymodbus-3.0.2.tar.gz
-sha256  704cb7fb90631c45f9c3a70b89d0c990fe0e208ac56f14a5c449e21bebd1e201  pymodbus-3.0.2.tar.gz
+md5  e8a618bf4699db477ca07cdee54818d0  pymodbus-3.6.3.tar.gz
+sha256  862f64376ae201f979c91ca2398f0ed5df8f136b76491e0995edeebbd0fa8940  pymodbus-3.6.3.tar.gz
 # Locally computed sha256 checksums
-sha256  796a47993313691ea404d8af7e4c0f9daf1d2760e3900938985b59c9008eee2f  LICENSE
+sha256  47f904249172e795a6b32de91f471073297befffd74e17cafc288d348a55972e  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index 54879d38e9..21e7fdcfba 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.0.2
+PYTHON_PYMODBUS_VERSION = 3.6.3
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/94/f7/6149a1b107fa54378a7adec83db7cd3679bf02216a6f5c83b37f55335897
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/ca/8b/d779c6ac03479aa719c1c6ed11711176661ea200dae0ec29f04231f0e596
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
