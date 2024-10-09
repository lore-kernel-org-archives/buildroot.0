Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C681ACEE32A
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 16:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 752FA40DD9;
	Wed,  9 Oct 2024 16:12:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P8yxmaK8uVa4; Wed,  9 Oct 2024 16:12:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2753340DDD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2753340DDD;
	Wed,  9 Oct 2024 16:12:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 93A131BF3F6
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 16:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F395608DC
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 16:12:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LkwHNpoj6VxO for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 16:12:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6DF4A608CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DF4A608CE
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6DF4A608CE
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 16:12:02 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-82cdb749598so296839239f.1
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 09:12:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728490321; x=1729095121;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dQVgmsMSqEHjoAq6SKBcmclPy2F0X+7Q7lk1WkdL+4Q=;
 b=ule2vCqmZJpp/VryH7YaXn6il5oOCuEIjFVNjYYIvyA3p8WNI3VB0sHhl/F8fFswP/
 08ZzyfTpl0NNsMAiNNmsTBVqxRfh92yu608JufER52WQIdj/MCbqwo2ZobQKKNOZW1zp
 Cv22mhRBxZJl72LUWEg/zVvMYbYmreE3x7WYLT1FIWN1IPySEk406K6iTwgW43j9+77o
 ek5TsGhxbIxKEi9LYiwXp6Y0ayohrcr2FzQwZWM6Af19GcNKNz+E8/aGXVvQvQICK1Jq
 +Jb/NtmgNrVHWmzcamD0BtjtT/7shMKhBuqkn29HS1nwlV0yZ2uMeUU44t28C144NipL
 tPgQ==
X-Gm-Message-State: AOJu0YzaviKX2Bc9D9UmvNaphtFVioSoCt8f1ZMuaASqRvinOcAz3FrA
 qg+BXI8qGuaAScQAR/pUNr3EzbhCyPn8gzELyWLtrZg/1RuMznjI7YiBpJeI
X-Google-Smtp-Source: AGHT+IGd6Vfhg2g7sr4VBcyJ+UwxjJi6zkpqD8x58j4Gc4paKg9hsyP0jxQqWgOQvmPaOYOa64FNkg==
X-Received: by 2002:a05:6602:27c2:b0:82c:ed57:ebd9 with SMTP id
 ca18e2360f4ac-8353d4f9c9amr419854639f.10.1728490320830; 
 Wed, 09 Oct 2024 09:12:00 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83503b151edsm228082439f.38.2024.10.09.09.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 09:12:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 10:11:58 -0600
Message-Id: <20241009161158.3809830-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728490321; x=1729095121; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dQVgmsMSqEHjoAq6SKBcmclPy2F0X+7Q7lk1WkdL+4Q=;
 b=R/kjDAySVx2ZDVPydPyU+9L8Y9N3Y1NV84E/bieKY5EgmeA9vkUd4FXgh8L3uqBWxh
 +tnrPt1wuuHYvwVGt7wPCTKzcH+GLF9uUqG7amxY6DgEjLOWILaipb4vw6oi8hJ7hG3l
 8Sbh/XM46pKy4ppwW77jM2mz1PFjkGrUV52oVBnhjahbZItNQQs91x8yNvUubcHQY8pg
 l4tUynWcEhHL/ezz6uX3zmb2NiXqVaA6gixzAjYnM1OvA7UwsiWWBPVWR5ww66SF34xI
 CnqCz2eMisUfRH5jdXZcWufOvXvIYYULTZWhKkrB3ExMAt0SwYm92O2z08jhNXby/mY6
 Zncg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=R/kjDAyS
Subject: [Buildroot] [PATCH 1/1] package/python-fire: bump to version 0.7.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop no longer required python-six runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-fire/Config.in        | 1 -
 package/python-fire/python-fire.hash | 4 ++--
 package/python-fire/python-fire.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-fire/Config.in b/package/python-fire/Config.in
index 9c816b0fd0..0d5787044c 100644
--- a/package/python-fire/Config.in
+++ b/package/python-fire/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_FIRE
 	bool "python-fire"
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TERMCOLOR # runtime
 	help
 	  A library for automatically generating command line
diff --git a/package/python-fire/python-fire.hash b/package/python-fire/python-fire.hash
index f58b5d633f..375b5c8c03 100644
--- a/package/python-fire/python-fire.hash
+++ b/package/python-fire/python-fire.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fire/json
-md5  4b63d0465633a5683b656342980e153e  fire-0.6.0.tar.gz
-sha256  54ec5b996ecdd3c0309c800324a0703d6da512241bc73b553db959d98de0aa66  fire-0.6.0.tar.gz
+md5  4f2da2e8111c45e60b8806529949fda0  fire-0.7.0.tar.gz
+sha256  961550f07936eaf65ad1dc8360f2b2bf8408fad46abbfa4d2a3794f8d2a95cdf  fire-0.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a5de77b62266bca0bb97bf058992f0b0f308a83a8ca55ee10fbf6bd8ed8f7ed0  LICENSE
diff --git a/package/python-fire/python-fire.mk b/package/python-fire/python-fire.mk
index 8ca0fa84ed..4318707321 100644
--- a/package/python-fire/python-fire.mk
+++ b/package/python-fire/python-fire.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FIRE_VERSION = 0.6.0
+PYTHON_FIRE_VERSION = 0.7.0
 PYTHON_FIRE_SOURCE = fire-$(PYTHON_FIRE_VERSION).tar.gz
-PYTHON_FIRE_SITE = https://files.pythonhosted.org/packages/1b/1b/84c63f592ecdfbb3d77d22a8d93c9b92791e4fa35677ad71a7d6449100f8
+PYTHON_FIRE_SITE = https://files.pythonhosted.org/packages/6b/b6/82c7e601d6d3c3278c40b7bd35e17e82aa227f050aa9f66cb7b7fce29471
 PYTHON_FIRE_SETUP_TYPE = setuptools
 PYTHON_FIRE_LICENSE = Apache-2.0
 PYTHON_FIRE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
