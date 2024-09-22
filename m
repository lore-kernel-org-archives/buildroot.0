Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1DECF9C6B
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 03:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA1B4400E4;
	Sun, 22 Sep 2024 03:29:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dIPeIZdWgBzN; Sun, 22 Sep 2024 03:29:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83B6440124
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83B6440124;
	Sun, 22 Sep 2024 03:29:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5522E1BF292
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 03:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50D8840124
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 03:29:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XV3iSQk7ddt2 for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 03:29:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 05AB0400E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05AB0400E4
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05AB0400E4
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 03:29:31 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-82ce603d8daso120238639f.0
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 20:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726975771; x=1727580571;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3sGf+UO1O8UCZErXF6LAwPJx2Y4B2XtT7t1nMNxioe8=;
 b=As96Hb6Zs919VAsDq5bstzIgcadCtGyz2CGK/W4fvolC9vEWc+bzXNJa9cGBa0sPtM
 M+H1cqT0DAi2M9e491DmXBZTDvWmNNcrtGacrq/aSi7IQ7S6KHteLFTNbAGTElB+JPYK
 C05PETespjniheH9BhmTxkHGSAsRyKnfVUUDaBQ/5yJYGP0z9dFg0UTCGJT/bmdk0hlJ
 1h/VAv379lRwmdFTLLTNUuqlJXRBqyT7ZTJ3TDAciIfNMTkyLbDk4oGaQYw1j+BE1yhx
 WqADNMTNwq4MjSNRFIuYRTY+JU2OLZeK6WajhrswStNVqzsdCYW7+HPuXuKiURPcnSRZ
 I7Zg==
X-Gm-Message-State: AOJu0YwQF74InT93j3CRQjLKeY8NHvFe+uZxawoM9SvZZ6nggUV1mIGW
 SJIJ3xJKzVMVzKRPI3tj1mNpxdX6oP5exlBU9zJsiRsGl1ko7pZTDL11Ag==
X-Google-Smtp-Source: AGHT+IF20TbK7nccti/kFMem9RM6fZxz9qacGwH0L1cddO5Qp97eZAnBjKZuUPQZGjt89OBkIz7yGA==
X-Received: by 2002:a05:6e02:13a7:b0:3a0:9aff:5047 with SMTP id
 e9e14a558f8ab-3a0c8d1d445mr67447535ab.22.1726975770561; 
 Sat, 21 Sep 2024 20:29:30 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed1bee4sm4390561173.91.2024.09.21.20.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 20:29:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 21:29:28 -0600
Message-Id: <20240922032928.844023-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726975771; x=1727580571; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3sGf+UO1O8UCZErXF6LAwPJx2Y4B2XtT7t1nMNxioe8=;
 b=da8XbkqKyDkGq+5qd1+eTzj4gV9z8avD/U8/I5RxwoJk3e/FlmYAXmvQevnuge4bbU
 wO6TwiXo3gIRigSmpRScWjItY9buLFfiNkfMHWvMiCr78AkxKF8W9ICvx94GCnj/6R4D
 2xRhgxfGEF7gwyjAgP968Pi2NsfSp0teKRfELmWk4coLI7ZCCwVJzGTmYQProrgnFI/p
 RdoinuGOHx3JtUC4EE/zMFmFoZiHGf1JA4doBau6vvpMLTplzYWvmgZwB5bJmUBxrFx5
 91TJFqlOCEfBj5T8LeK+n2FBIGz9XRneaegEq6gsrkVaWDVASkHp2t/7b0Le6IpRktU2
 b0rQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=da8XbkqK
Subject: [Buildroot] [PATCH 1/1] package/python-tcolorpy: bump to version
 0.1.6
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

Add new host-python-setuptools-scm build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tcolorpy/python-tcolorpy.hash | 4 ++--
 package/python-tcolorpy/python-tcolorpy.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-tcolorpy/python-tcolorpy.hash b/package/python-tcolorpy/python-tcolorpy.hash
index cf5ca0e5f3..0bba6e47fe 100644
--- a/package/python-tcolorpy/python-tcolorpy.hash
+++ b/package/python-tcolorpy/python-tcolorpy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tcolorpy/json
-md5  ca571cccff812ecdc0c73968c9d24ebf  tcolorpy-0.1.4.tar.gz
-sha256  f0dceb1cb95e554cee63024b3cd2fd8d4628c568773de2d1e6b4f0478461901c  tcolorpy-0.1.4.tar.gz
+md5  a4a8404d2b6ecfae4eeca8c71e4634c6  tcolorpy-0.1.6.tar.gz
+sha256  8cea0bf5f8cf03f77528a9acfbf312df935573892ba5ea3b2516e61fa54de9a5  tcolorpy-0.1.6.tar.gz
 # Locally computed sha256 checksums
 sha256  f41a0456d5f2bba25fd4d7e50b51a95de304770ff1db5a79515d03397a914d8d  LICENSE
diff --git a/package/python-tcolorpy/python-tcolorpy.mk b/package/python-tcolorpy/python-tcolorpy.mk
index 5c42320c17..bdc66f61bc 100644
--- a/package/python-tcolorpy/python-tcolorpy.mk
+++ b/package/python-tcolorpy/python-tcolorpy.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_TCOLORPY_VERSION = 0.1.4
+PYTHON_TCOLORPY_VERSION = 0.1.6
 PYTHON_TCOLORPY_SOURCE = tcolorpy-$(PYTHON_TCOLORPY_VERSION).tar.gz
-PYTHON_TCOLORPY_SITE = https://files.pythonhosted.org/packages/ba/e0/20b99847e76bb89784b68634399261d770b01054bca16cd19a06ac9c2e67
+PYTHON_TCOLORPY_SITE = https://files.pythonhosted.org/packages/af/f6/b17885354c5addfb93c14f3ed7172c33494f989dd5f83c0340d2c8fa3b69
 PYTHON_TCOLORPY_SETUP_TYPE = setuptools
 PYTHON_TCOLORPY_LICENSE = MIT
 PYTHON_TCOLORPY_LICENSE_FILES = LICENSE
+PYTHON_TCOLORPY_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
