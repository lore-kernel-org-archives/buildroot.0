Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1794C4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 04:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5706C61431;
	Thu, 11 Jan 2024 04:45:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5706C61431
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZG8WKLkYqy_m; Thu, 11 Jan 2024 04:45:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EF196143C;
	Thu, 11 Jan 2024 04:45:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EF196143C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 071A11BF8B4
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 04:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1B5061431
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 04:45:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1B5061431
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eLqxIdFgi3XC for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 04:45:35 +0000 (UTC)
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3515613B7
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 04:45:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3515613B7
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7beefdfe71eso84612439f.0
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:45:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704948333; x=1705553133;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aj8i6Jd4Esf+Sa2WPiT1xB5uYG4i/PxS8jjAQyS1sww=;
 b=kQxppXJY8zxeswGE/ogpPp27qAXISMW6sfbYl0mYxlNuqHXmS3AjpIl+pkB9HsxqR9
 Fah9zuYjIa3xKSeQyaferBq7BdJ+iGW8uFeXTPE9VvjVhRuamB5549VpbWERIyQO63ZV
 2Apr1WN5P7WIuq+dfHt5x82jB7IptCU0BQZPves8rDDXDNC1rwPCgthIlEn9x9RM9+hz
 ghSMdmU1WeSHElaqTfYkF3CJ38AZaU/FQfQiHAFGGO1vXU62wPKPt/VFZ7bk6U/RTBov
 VoRtCRALYL+ueQAcG1pn/uJQlq/mnNyd+IF9RPEkMIaG3TrqCqgrbKFeE7V1H3aXA8M8
 ELkg==
X-Gm-Message-State: AOJu0YztC3oP+n7/cGyRh1Ew6N77oa/PsitEqcetWKGygD0KU0yfHSiy
 ihyN4QEr3d5N9HP0mbpcGpd9P6ANOOsLIA==
X-Google-Smtp-Source: AGHT+IGV8w6ueeiAkNnHQcftBQNhwYw885O/3h8q8QtTL7pXV+sw+lscz1FUIjlOcUxGKn35wxuXzA==
X-Received: by 2002:a05:6602:69a:b0:7bb:f2d0:10b4 with SMTP id
 dp26-20020a056602069a00b007bbf2d010b4mr600834iob.34.1704948333252; 
 Wed, 10 Jan 2024 20:45:33 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 g21-20020a02cd15000000b0046df3b352casm97894jaq.38.2024.01.10.20.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 20:45:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 21:45:30 -0700
Message-Id: <20240111044530.2889558-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240111044530.2889558-1-james.hilliard1@gmail.com>
References: <20240111044530.2889558-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704948333; x=1705553133; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aj8i6Jd4Esf+Sa2WPiT1xB5uYG4i/PxS8jjAQyS1sww=;
 b=ZY1bIwfXqiEwxfvrnrLTMUJ3mC6Oncg0b2bIrUB6wYyP2uAkXGr5o1He2CKZPVccI/
 Zc+aTS2xxMbM1EFu/oehDlb9nfAh8bjZllzsKAeYBms/R/IsHZrqFi0HR1J5S/h0A0D7
 0+gqZTcbxImteZRqRozBoK2Mz0G3p4GJDAA/77JMa933/HRSvc0pyc8pBHr+ywkCow+N
 0SKtn6RFV7l0rQ9ocOZhBTL+a5vkvQoSr7t+6CKgfJ0SUHwAi4lsnx7GUgcB6JkvPLEH
 bu8+IEDpANldBCHSQmN//90w4TVb9m4PbN8BIqNz874vK7VbsZMgqTq54tgeM0hoUhbk
 uQug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZY1bIwfX
Subject: [Buildroot] [PATCH 2/2] package/python-qrcode: bump to version 7.4.2
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

Add new python-pypng runtime dependency.

Add new python-typing-extensions runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-qrcode/Config.in          | 2 ++
 package/python-qrcode/python-qrcode.hash | 8 ++++----
 package/python-qrcode/python-qrcode.mk   | 4 ++--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-qrcode/Config.in b/package/python-qrcode/Config.in
index 9a17cc1f08..6e63d83e41 100644
--- a/package/python-qrcode/Config.in
+++ b/package/python-qrcode/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_QRCODE
 	bool "python-qrcode"
+	select BR2_PACKAGE_PYTHON_PYPNG # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  Pure python QR Code generator
 
diff --git a/package/python-qrcode/python-qrcode.hash b/package/python-qrcode/python-qrcode.hash
index 1ab84dd355..48b2d7b2b0 100644
--- a/package/python-qrcode/python-qrcode.hash
+++ b/package/python-qrcode/python-qrcode.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/qrcode/json
-md5  124103c685e96ba3b7a1616760f31c11  qrcode-7.3.1.tar.gz
-sha256  375a6ff240ca9bd41adc070428b5dfc1dcfbb0f2507f1ac848f6cded38956578  qrcode-7.3.1.tar.gz
-# Locally computed
+# md5, sha256 from https://pypi.org/pypi/qrcode/json
+md5  a4c47fe5ff966b105098998cfb2294de  qrcode-7.4.2.tar.gz
+sha256  9dd969454827e127dbd93696b20747239e6d540e082937c90f14ac95b30f5845  qrcode-7.4.2.tar.gz
+# Locally computed sha256 checksums
 sha256  40dfb903c94ee3f789500131311186548ecba5cefd3557623d7700e2522ab994  LICENSE
diff --git a/package/python-qrcode/python-qrcode.mk b/package/python-qrcode/python-qrcode.mk
index 23e7dd3b88..97b181a1e1 100644
--- a/package/python-qrcode/python-qrcode.mk
+++ b/package/python-qrcode/python-qrcode.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_QRCODE_VERSION = 7.3.1
+PYTHON_QRCODE_VERSION = 7.4.2
 PYTHON_QRCODE_SOURCE = qrcode-$(PYTHON_QRCODE_VERSION).tar.gz
-PYTHON_QRCODE_SITE = https://files.pythonhosted.org/packages/94/9f/31f33cdf3cf8f98e64c42582fb82f39ca718264df61957f28b0bbb09b134
+PYTHON_QRCODE_SITE = https://files.pythonhosted.org/packages/30/35/ad6d4c5a547fe9a5baf85a9edbafff93fc6394b014fab30595877305fa59
 PYTHON_QRCODE_SETUP_TYPE = setuptools
 PYTHON_QRCODE_LICENSE = BSD-3-Clause
 PYTHON_QRCODE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
