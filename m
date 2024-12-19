Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FB4E77188
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 00:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 847DA4155B;
	Thu, 19 Dec 2024 00:49:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xo01zw9bsydX; Thu, 19 Dec 2024 00:49:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D7CE41581
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D7CE41581;
	Thu, 19 Dec 2024 00:49:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D627E9
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 00:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AF1D614A8
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 00:49:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6OBXUwVzZfzJ for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 00:49:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 159B261410
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 159B261410
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 159B261410
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 00:49:24 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3a777958043so804485ab.2
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 16:49:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734569364; x=1735174164;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JRtbuk64A6MQ3RWActtbnrCwwGivSTkM6UwQRBOpZuM=;
 b=H3RAyUptrvrIxKykSmnD1TzjlagCOIYvQomIUAVlTFJ/u+1p5CLbGIQZxjNQHIHWm4
 F/vQRRmS8SVkYSd/Ws2J8tdUGp2YZ0LPSZR9Z2RvgJNcu105+l68SQgewLQvjrfIbc1G
 PFJC4PLPZkseXb5YazMacvrZah3nr4C2gJjmEq02qi61fyb2ZJmzlmF+vb6ZF7abpDf/
 pAxPNylLcOcuLmq/FRYz+ziST9fD/CF87M4phk0omsZpc0QPULHAiTLCSVohK4M+BiTG
 4Rhneikun+l4IWqUBm+p/v0j6vinkdlCkRaRSby8QfkslshCiDwjHG9uOYIk8MeSKUZ1
 nM7w==
X-Gm-Message-State: AOJu0YxvPguEuaqUPurJHxUy9/7n+MQOhy39F6MWx8wYpcnCprI4a8Z0
 csLMlXYqqIvinNo7UcEHnKW9nVJMpkQc9OUtwMB34Jkw4Hg/EOI1lsMdLoCtfr0=
X-Gm-Gg: ASbGncv8WtH8WsOGCNnj9A6ScV5M4CDzGEIfkIgSjNu/Y1MdPAOtaoNvJeeoztWYt03
 FwtAMgHS37IlgOPdxls4Rj/UtTymwcISvdjgnAwJsIzojPnAAVlKJP696PRkGg10UK0uOXXAL18
 y7IHZfLqaQiEA5gLbfPMldQqTwfsz5PcRkXR293+UouMxhl2+ntNmwl+LFF8/uByrUoGG8GM5Tu
 wmf+WBvV3wvL1HjCOhlC9EaK0eLfS7Uy4t4m5NZpHXiq6Z7r9vTIWgk3PN7y15+2cKsUz4en3VJ
 JSNRS/6+816x5ca7gCuYHzTzKrnCRYRwXQ==
X-Google-Smtp-Source: AGHT+IFRe7OS9RoBLhorBOh4eD0lnMrC2F2BarA3BUpv4qArmggDuEZbXNUEWpZ7Opf5mkII7Rh3zQ==
X-Received: by 2002:a05:6e02:1f84:b0:3a7:c5b1:a55c with SMTP id
 e9e14a558f8ab-3bdbb16d609mr47633695ab.0.1734569363715; 
 Wed, 18 Dec 2024 16:49:23 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3c0e47d6edasm294505ab.67.2024.12.18.16.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 16:49:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Dec 2024 17:49:21 -0700
Message-Id: <20241219004921.229845-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734569364; x=1735174164; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JRtbuk64A6MQ3RWActtbnrCwwGivSTkM6UwQRBOpZuM=;
 b=WqqRHeSDVEmcwjJW/af/rgPEDwuqVxh8XE47x3CP0AZfpDXqzUHXVb4QTsHoehqMl3
 QHgRZxl6hziHK+u89GJNuL6EO1jCz/3m4m8gYmK/hw0ve0dM6JVC2pDI5RQYX2/ttCWi
 Th8mQVTwPd7yHChwlgPdXVyyAYkmLg4POm3BolRLGkaZdF8AIaUJYbg/0j8Xk+EdRfdC
 tScRUcpKJZYWwzqDNK2RfKdvz6qceXsm9boEvrFEjqgDETGBRkehMuChFULxNVdyEnvw
 gwuYCHoXRId9ESdRObuYkjWuUaoJOpjS2ADir2M1k4Zrkx/zVMZR1oi3S+LY4OPicnv7
 PP6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WqqRHeSD
Subject: [Buildroot] [PATCH 1/1] package/python-tortoise-orm: bump to
 version 0.22.2
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tortoise-orm/python-tortoise-orm.hash | 4 ++--
 package/python-tortoise-orm/python-tortoise-orm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tortoise-orm/python-tortoise-orm.hash b/package/python-tortoise-orm/python-tortoise-orm.hash
index 5e97c6302f..2297290616 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.hash
+++ b/package/python-tortoise-orm/python-tortoise-orm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tortoise-orm/json
-md5  328373e7e6112eab38984d6c1c7caf41  tortoise_orm-0.21.7.tar.gz
-sha256  8a790a931828aa37ac364b344c561e603422aced2af5e403f6790575da0f19c5  tortoise_orm-0.21.7.tar.gz
+md5  21f9f3624ef82b3b9c23ed1fb7d70766  tortoise_orm-0.22.2.tar.gz
+sha256  f1e808bc27265b3e4682dae89b725a66d8311cc20c206d512c57dd8a1c78096b  tortoise_orm-0.22.2.tar.gz
 # Locally computed sha256 checksums
 sha256  f955d347b975d5867ee364f978476b3012878a706d468571b9758cac74de6041  LICENSE.txt
diff --git a/package/python-tortoise-orm/python-tortoise-orm.mk b/package/python-tortoise-orm/python-tortoise-orm.mk
index 0a8f173c86..6bd1276bd1 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.mk
+++ b/package/python-tortoise-orm/python-tortoise-orm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORTOISE_ORM_VERSION = 0.21.7
+PYTHON_TORTOISE_ORM_VERSION = 0.22.2
 PYTHON_TORTOISE_ORM_SOURCE = tortoise_orm-$(PYTHON_TORTOISE_ORM_VERSION).tar.gz
-PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/e8/0e/ad8e7554b0259072887d602617a67ef21055e1d8aa061936e381ecc1a9a5
+PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/5c/19/c32752a3042580b40300aeffa48859e087a023114f50a2846ba95c26c87d
 PYTHON_TORTOISE_ORM_SETUP_TYPE = poetry
 PYTHON_TORTOISE_ORM_LICENSE = Apache-2.0
 PYTHON_TORTOISE_ORM_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
