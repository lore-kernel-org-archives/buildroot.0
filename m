Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C5DD0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 22:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54DDC40403;
	Sat, 26 Oct 2024 22:36:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O0S4GPvTcFmr; Sat, 26 Oct 2024 22:36:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1427740493
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1427740493;
	Sat, 26 Oct 2024 22:36:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DA0745C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 22:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7C4760645
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 22:36:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OxZD-hurxplT for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 22:36:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D41C8605FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D41C8605FD
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D41C8605FD
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 22:36:11 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-83aac75fcceso114014439f.0
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:36:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729982170; x=1730586970;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ocb+DR/CSplGvN+yuRK07MLlDAJEUfmSUgCz4hY3hMY=;
 b=jrZ39d4TeQhZFid6hG+jaZuIE6P+XZ0Ura2JLImqe5inwxLsbS21KYOSntK7AqjW0t
 XryY17igNYbIMGxOQZZb6JNFvYd3WZm5gcxLE48jR+P8TnSPac1Ct+phyM6uUlRx3Tys
 r1eSQD/0e6rfARyxmcvz7A5onGTqLlD25wI45DZZS/wYmxCFDzgROhBgH7Tie03G1O1v
 XkhnsRrlNYy8TM0HdzNYKB215yfcu+yrIwnvAVxR5gbiQA06fIm/oFKo7zyInlDH6RHn
 bMPtvaX1PJrT2ZLEqzByRq7yklAbmQMg6Hoa7dSjAtaQRxqCbEZ4EfwgVTPeKPXHpbbQ
 tAow==
X-Gm-Message-State: AOJu0Yz50f7wGRtfuhGdQ4eJ+tTTO2JFGAB0AlDBevaRFZN7xqVfsWax
 eIU592BOrmZKFUDKpuEfvNIpmaS6oHvp7C/kSoxSFcG3Rl2JCppCknjcmw==
X-Google-Smtp-Source: AGHT+IHqy/tcHQFC8krfT5uKnzZEHQ6Wq7aCLIDPS5QV6b7gzx1eQM1zTlJHO+WhiOlK6L2GFgl1+A==
X-Received: by 2002:a05:6602:486:b0:83a:a82b:f861 with SMTP id
 ca18e2360f4ac-83b1c5f409bmr358345339f.16.1729982170433; 
 Sat, 26 Oct 2024 15:36:10 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83b137f6c07sm79643839f.29.2024.10.26.15.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2024 15:36:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 16:36:07 -0600
Message-Id: <20241026223607.3787842-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729982170; x=1730586970; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ocb+DR/CSplGvN+yuRK07MLlDAJEUfmSUgCz4hY3hMY=;
 b=TM593c7fjWyWdTjc1rD2KBlvIaEFXfEu/XSV3L5cKeKpPaSNLxZwKSbi9LtQw7FMfP
 /FWJjdq7DYE3pLsT+xN8cVdfy2wYGfVV6p7bNBJs7TDqcJbjlUjl42MGhJVmhB/nTNVU
 e79RW08VLU6MBn3/FVwd6F06uio81bfM/XjMOuWyAPSu2TanHjfICYaSe6jb9n+8u+IK
 nBQ4iPTGMrZ6ULEdhWPb19u+LZBAzvshy+GQ94rwiaAQJ+MYNC0BdmUzgaACbe+jYsaN
 gkSCca39d4Zg99k1Gzrf3xgRVOETYaGxytkKJVcIyCH2vZ+gsdHNcZFTfUDeYBda2RQ7
 gyDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TM593c7f
Subject: [Buildroot] [PATCH 1/1] package/python-proto-plus: bump to version
 1.25.0
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
 package/python-proto-plus/python-proto-plus.hash | 4 ++--
 package/python-proto-plus/python-proto-plus.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-proto-plus/python-proto-plus.hash b/package/python-proto-plus/python-proto-plus.hash
index e9d3632275..ebf3426886 100644
--- a/package/python-proto-plus/python-proto-plus.hash
+++ b/package/python-proto-plus/python-proto-plus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/proto-plus/json
-md5  7af507ef2f7c1e512321c29ed5cf131c  proto-plus-1.24.0.tar.gz
-sha256  30b72a5ecafe4406b0d339db35b56c4059064e69227b8c3bda7462397f966445  proto-plus-1.24.0.tar.gz
+md5  f1465151dcad7bb3c4ec3271e4afbc3d  proto_plus-1.25.0.tar.gz
+sha256  fbb17f57f7bd05a68b7707e745e26528b0b3c34e378db91eef93912c54982d91  proto_plus-1.25.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-proto-plus/python-proto-plus.mk b/package/python-proto-plus/python-proto-plus.mk
index 9ef85790d2..734c6b2003 100644
--- a/package/python-proto-plus/python-proto-plus.mk
+++ b/package/python-proto-plus/python-proto-plus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROTO_PLUS_VERSION = 1.24.0
-PYTHON_PROTO_PLUS_SOURCE = proto-plus-$(PYTHON_PROTO_PLUS_VERSION).tar.gz
-PYTHON_PROTO_PLUS_SITE = https://files.pythonhosted.org/packages/3e/fc/e9a65cd52c1330d8d23af6013651a0bc50b6d76bcbdf91fae7cd19c68f29
+PYTHON_PROTO_PLUS_VERSION = 1.25.0
+PYTHON_PROTO_PLUS_SOURCE = proto_plus-$(PYTHON_PROTO_PLUS_VERSION).tar.gz
+PYTHON_PROTO_PLUS_SITE = https://files.pythonhosted.org/packages/7e/05/74417b2061e1bf1b82776037cad97094228fa1c1b6e82d08a78d3fb6ddb6
 PYTHON_PROTO_PLUS_SETUP_TYPE = setuptools
 PYTHON_PROTO_PLUS_LICENSE = Apache-2.0
 PYTHON_PROTO_PLUS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
