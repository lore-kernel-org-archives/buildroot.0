Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF14CCAC599
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 01:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F8BC80818;
	Tue, 16 Sep 2025 01:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cmTeTTjxyKMR; Tue, 16 Sep 2025 01:55:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B487F80819
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B487F80819;
	Tue, 16 Sep 2025 01:55:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10CAB12D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 01:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7DEE409C0
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 01:55:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sdMgslpfkKD6 for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 01:55:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1687B407E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1687B407E9
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1687B407E9
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 01:55:02 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-42404af313aso10027095ab.0
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 18:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757987702; x=1758592502;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jaZv4GEg2AMo5fB0rgpner7b6fimCGCUAfngom3kdSk=;
 b=JzzorZkrV9LTzYWNduPbpuMiP+QCWXtD2e1qBR8V3+extXG2BxLiTKQN3Mr1iVOpxS
 BUxhRBPr4Do9epBOgj7BNFez5HySDK32XMsd0Zl5GC4rPN/pAbOTA8L6ueMGQx5jR+D7
 ba62ZU5ax3fRjiDnZarHGTZZK/23E/hjkHcdJazuJUswCh64WsFuhmP+/WDOO0/J3UTD
 T+C+IfZEbax3jt0L4QJD6wTnKXQiZY/DyeBNZSuRyIR7it6g4HBPx8qkzS6rxVgAoDAL
 xJbjlfyP9mSbeZ+w31tenjdfBXU+lvMDC0zcajPFXETqzdj/bJ5iMAjSuEbiv9mwLJmh
 W7oA==
X-Gm-Message-State: AOJu0YyStyOcpRf7XEDB/7PtcZlZpbcxpMrK9Oox4lEgLkF1jfXnsTsq
 TFsMiE40utRXPySVWrJIiyABoI8c+zqfNiSlNuFktFjEDU7kqIzNixPs4OneQA==
X-Gm-Gg: ASbGncteYvX2w5aK+6zUPiFJ7faQ0KxSVY6tKPlwZk6qRft36/+EmBm3BCaV+1/1qC5
 1+FjoJuCPyOmmGe8sWovd1VyP4KvwUPG6bog1DgNDufHwZ8jz3Ocjq2Zv01wNsfECHgJK7+VNAl
 kdqKRtBMSUqynY1wkPkArPgBahNk5vouP4SIEqXPgKc2uYxW/Rl0Ma+wuq06rEaQntfXzzKxNC/
 kWQVUs0srG7d4j9wzD0EkGadPlTy/GW1y6zWO9qjrm1v4fu+wUY3HSxFzjPDqnjKggkzkK+6uYZ
 xOgz+H3Oy1ruNbvAgmRMGFFY87dGdnc+aDMPGjHrNtOnBx0763ATrIAYsxw7ZMc3rST3noWRpgw
 X2fHT97MFsh/FU7tNq9xYcsK5zSW70eHBEd4Gqmhr9HGo7loZXRlQtV9RkaeT+phdGeUVEJO4dy
 oz
X-Google-Smtp-Source: AGHT+IGe97WVs6fOkjMBUgaKirYBwMOzmGoMBnEio+rmNjrZDyphYSNS7UebGIS3PQCX1AbsgD5Zcw==
X-Received: by 2002:a05:6e02:2584:b0:418:a784:5e1f with SMTP id
 e9e14a558f8ab-420a39c0b5amr121011135ab.16.1757987701672; 
 Mon, 15 Sep 2025 18:55:01 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-512188e8a98sm2897656173.35.2025.09.15.18.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 18:55:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 19:55:00 -0600
Message-ID: <20250916015500.2621356-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757987702; x=1758592502; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jaZv4GEg2AMo5fB0rgpner7b6fimCGCUAfngom3kdSk=;
 b=CZqUDmHKdtscd3bKcTda4icoOO9OjZn/NeEvXtgG9iREFFUmYhnMzv8e/8SPlHk5aF
 aWqmx4nQ1+eib2ktF8wQ8LBwI3MsvFGsA8MuQGcDeaCnJRUX6SoRa5ADYLfsfx5Oah3O
 gUNaFFES9QrYz6K5oGkGhwKQMGQaEinwOB9DWGvo5PQenFPGG9GWhrfRqj0B2kIlAgmS
 1MiryxWdamesE8UkZuE3NNXqAav3tDQAN7xEQZ3ijODED1F01DkBiJ37PNczd+x2qIA9
 baxftRPiKzwKfteXyCMlmfy54lj4MTs2PDO8Q3cf7JJBcm6iBex14XadYJQLl4H9x8xd
 8b2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CZqUDmHK
Subject: [Buildroot] [PATCH 1/1] package/python-mypy: bump to version 1.18.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-pathspec runtime/build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-mypy/Config.in        | 1 +
 package/python-mypy/python-mypy.hash | 4 ++--
 package/python-mypy/python-mypy.mk   | 6 ++++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/python-mypy/Config.in b/package/python-mypy/Config.in
index 38ea7dc30f..6c58bc4fc1 100644
--- a/package/python-mypy/Config.in
+++ b/package/python-mypy/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_MYPY
 	bool "python-mypy"
 	select BR2_PACKAGE_PYTHON_MYPY_EXTENSIONS # runtime
+	select BR2_PACKAGE_PYTHON_PATHSPEC # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  Optional static typing for Python.
diff --git a/package/python-mypy/python-mypy.hash b/package/python-mypy/python-mypy.hash
index 21b2c9aba0..ff49a92b18 100644
--- a/package/python-mypy/python-mypy.hash
+++ b/package/python-mypy/python-mypy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mypy/json
-md5  8297bf7865feffd704735f0fdb5a4150  mypy-1.14.1.tar.gz
-sha256  7ec88144fe9b510e8475ec2f5f251992690fcf89ccb4500b214b4226abcd32d6  mypy-1.14.1.tar.gz
+md5  fb9ff268550456e6d100a21e02fc6574  mypy-1.18.1.tar.gz
+sha256  9e988c64ad3ac5987f43f5154f884747faf62141b7f842e87465b45299eea5a9  mypy-1.18.1.tar.gz
 # Locally computed sha256 checksums
 sha256  de341f6e031d021aab9eb27bdf713cc6fb844dee832ef3bcd4688bff5517220b  LICENSE
diff --git a/package/python-mypy/python-mypy.mk b/package/python-mypy/python-mypy.mk
index 26614b2948..6127975756 100644
--- a/package/python-mypy/python-mypy.mk
+++ b/package/python-mypy/python-mypy.mk
@@ -4,19 +4,21 @@
 #
 ################################################################################
 
-PYTHON_MYPY_VERSION = 1.14.1
+PYTHON_MYPY_VERSION = 1.18.1
 PYTHON_MYPY_SOURCE = mypy-$(PYTHON_MYPY_VERSION).tar.gz
-PYTHON_MYPY_SITE = https://files.pythonhosted.org/packages/b9/eb/2c92d8ea1e684440f54fa49ac5d9a5f19967b7b472a281f419e69a8d228e
+PYTHON_MYPY_SITE = https://files.pythonhosted.org/packages/14/a3/931e09fc02d7ba96da65266884da4e4a8806adcdb8a57faaacc6edf1d538
 PYTHON_MYPY_SETUP_TYPE = setuptools
 PYTHON_MYPY_LICENSE = Apache-2.0, Python-2.0.1
 PYTHON_MYPY_LICENSE_FILES = LICENSE
 PYTHON_MYPY_DEPENDENCIES = \
 	host-python-mypy-extensions \
+	host-python-pathspec \
 	host-python-types-psutil \
 	host-python-types-setuptools \
 	host-python-typing-extensions
 HOST_PYTHON_MYPY_DEPENDENCIES = \
 	host-python-mypy-extensions \
+	host-python-pathspec \
 	host-python-types-psutil \
 	host-python-types-setuptools \
 	host-python-typing-extensions
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
