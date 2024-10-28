Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4737D1358F
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 00:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 682F8401B3;
	Mon, 28 Oct 2024 00:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 54Nl69tTP3Ph; Mon, 28 Oct 2024 00:45:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 293814031F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 293814031F;
	Mon, 28 Oct 2024 00:45:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BA018AEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 00:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A697F4028F
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 00:45:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QiQb7sTcxbMA for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 00:45:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5C6E840104
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C6E840104
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C6E840104
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 00:45:16 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-83aac75fcceso131878039f.0
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 17:45:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730076315; x=1730681115;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s6OZ5Ej4lDj11IvS5QPAVktVtUWQdmzUr7BNY/edxI4=;
 b=F7AYJzy17+WVqlymjVUqFm33zLauexTRSfYdkSWeiFy/ARdE7Ih3LhmffToS6Rh5AM
 t72oVqERHi9n91WOxY4jDweENabfCP1QD2M+Pi3zAnkAgWIBgblaUuFqgBsh9g9p4YoQ
 lx+DKx9mkQoAqf+O+Zq5ayCYIVzbdddRU+ALCZscCvJfTnjvpIXUWOnPJDdcXq7Klf4w
 aO09OypFxrOdrsKLJgY65mNbPeeHesSBlWc6puHW72OxppGXe7WM+pC+5oFQ931L3mnp
 6w0eKGsEnAZZ/NghUgm4pBvN1KFR2CBCi+GFSjhxGEdcjoq72G+xUrnxZJZ5zKo+wWV1
 HqwQ==
X-Gm-Message-State: AOJu0Yz2uIghj+ayd2yuf2H0ZobcFiUKV8HL3NOI8A1P4MO1QINGtpu8
 5g9XCfCOdqG/UnCamyecJAQ/qRKzrbFCqrqvPXUD/+S5ee9417GAFHj7/Q==
X-Google-Smtp-Source: AGHT+IF33u16SSOZb+s5GNCOXy8WIB9JjSfbA6ExNOYwHoQCWzaqtv3WjLMaN9I8ef2EL0w7NmqtGg==
X-Received: by 2002:a05:6602:6c0f:b0:837:51ba:60c with SMTP id
 ca18e2360f4ac-83b1c436315mr523090139f.7.1730076315007; 
 Sun, 27 Oct 2024 17:45:15 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83b13891e23sm124699639f.47.2024.10.27.17.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 17:45:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 18:45:12 -0600
Message-Id: <20241028004512.4114090-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730076315; x=1730681115; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s6OZ5Ej4lDj11IvS5QPAVktVtUWQdmzUr7BNY/edxI4=;
 b=dtrVYj9rEKnEHye2XW9/TkKGBn9yDHSAzpmM1UF2zxi4T4PsBKiWTiKw43HMkYIJPz
 MQfjYprEYXU0p2AB0boIRzz++raJhRoiOwWGllFlMd0NhHna1q+Gdn4TdmhwQoGri+kj
 D7niZMUpFS0yhdG6OANlWlfRDjMA5I++lpSut9X4Vqw4YeBxwxPHCOoW3n3zmI9PRcYs
 QtcP/9Onh4xSZyMwk9aR9ILkxGqlhdaMoyPABq/6TXn/F/7bd5yHnE4UUXGhviu14SLn
 +LyB3Ko+3fp84tm+VkGJ/PtZ+h58kop76bOGYkmv2UiElPy+/YfA53pRKMHN4T8akpI+
 Dg6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dtrVYj9r
Subject: [Buildroot] [PATCH 1/1] package/python-tortoise-orm: bump to
 version 0.21.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tortoise-orm/python-tortoise-orm.hash | 4 ++--
 package/python-tortoise-orm/python-tortoise-orm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tortoise-orm/python-tortoise-orm.hash b/package/python-tortoise-orm/python-tortoise-orm.hash
index 5a57e3af11..5e97c6302f 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.hash
+++ b/package/python-tortoise-orm/python-tortoise-orm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tortoise-orm/json
-md5  6035547e880b23990fa1b0c7f030810b  tortoise_orm-0.21.6.tar.gz
-sha256  0fbc718001647bf282c01eaaa360f94f1432c9281701244180703d48d58a88ec  tortoise_orm-0.21.6.tar.gz
+md5  328373e7e6112eab38984d6c1c7caf41  tortoise_orm-0.21.7.tar.gz
+sha256  8a790a931828aa37ac364b344c561e603422aced2af5e403f6790575da0f19c5  tortoise_orm-0.21.7.tar.gz
 # Locally computed sha256 checksums
 sha256  f955d347b975d5867ee364f978476b3012878a706d468571b9758cac74de6041  LICENSE.txt
diff --git a/package/python-tortoise-orm/python-tortoise-orm.mk b/package/python-tortoise-orm/python-tortoise-orm.mk
index eb8ba8e053..423e87b46b 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.mk
+++ b/package/python-tortoise-orm/python-tortoise-orm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORTOISE_ORM_VERSION = 0.21.6
+PYTHON_TORTOISE_ORM_VERSION = 0.21.7
 PYTHON_TORTOISE_ORM_SOURCE = tortoise_orm-$(PYTHON_TORTOISE_ORM_VERSION).tar.gz
-PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/00/fc/8d70e3dbaa091986a0933a7941b73646c37792709443e701cb76d8a6e680
+PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/e8/0e/ad8e7554b0259072887d602617a67ef21055e1d8aa061936e381ecc1a9a5
 PYTHON_TORTOISE_ORM_SETUP_TYPE = pep517
 PYTHON_TORTOISE_ORM_LICENSE = Apache-2.0
 PYTHON_TORTOISE_ORM_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
