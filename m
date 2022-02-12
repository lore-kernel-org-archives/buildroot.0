Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1475BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 11:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8484C40356;
	Sat, 12 Feb 2022 11:34:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zn3dffKT-EoL; Sat, 12 Feb 2022 11:34:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69F2F40278;
	Sat, 12 Feb 2022 11:34:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC9931BF954
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 11:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B21A60ABA
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 11:34:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z6jezuzAVVRr for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 11:34:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B4C346064D
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 11:34:13 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id d188so14436790iof.7
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 03:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U87FjWJlzBu0BwHNOe4sjn6K3ql+i3ZNs69L61Hhj38=;
 b=hrGspCJF+rplWQe9Ycig+hT7kF7szUHrO64QE1ommsZh6pL1+VkRmhU4G1w9l1zlXn
 1O41+ZJXQy6ooyhgE1wVGno9MnVMG+kmwt6iOiyhS+AqmS4OE6X0ByZmWOkqyls91Njl
 qn07fHzg8izPHNSXBzSc1XvZ4yYM+XrEWj7B4DrWaPkWMyvdq3S5w5TTsiUA7tzLuE1O
 uJKVZJoZme6ZAJnd7kBqZyeIewkE6e+/y0FJFfbUuqTL3VqG+EIP1BG93GWPgLsXC1MT
 eWXpyRfjyrw0GLK0nA/ZUnopyV1ffSTTLxU7pAWyhjc1TxN8Ua1nu6a24lXqZztsssJn
 Il7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U87FjWJlzBu0BwHNOe4sjn6K3ql+i3ZNs69L61Hhj38=;
 b=BVuaVUGigMrLTbFLaFDB+msPQ0KBnYK30khH8x3y5zom6/4RNlR/t/QN/rohPxNPXs
 MAugb2hhXF2sJb4B+k6iD4tJxWMuwxpeicqEomsOJhWkn4tT22pht6fKynLShUurtk76
 7XUrz20RjAbqpZuUg7Lqfl4hEftUXUdwL0BqYCrtWvQ7Le0WAvzwVEAqKWX6z0uVZF0z
 IkqcS/ZfDASkXidf2FKDZM96gOZMtXjC1UgBboGQSB3tr8w/sdcG9QUsmqnaU3Z7ERjA
 cxRzbpo0WzFpLc3ZqULI59o1cEQ6eMLHAzvrW73VRJRUi2q9ENrFTcO+kL6vNVTG2XPI
 WMrw==
X-Gm-Message-State: AOAM530NmxRmJOkWQ4G8J6vS+O1yFXHwTbIL59XL1IJnvPOxEeqYpJNX
 RbZhisQKh5eshMd5SQ4TsFntVrAGLVtgaw==
X-Google-Smtp-Source: ABdhPJzbGXrZJD7dV4bZXOu9Rwxk3t9DfLWkd+zeKrIOk04yx3+ByX7M2vxP7XI1qL0zJKXsBGYXdg==
X-Received: by 2002:a5e:8406:: with SMTP id h6mr2952443ioj.144.1644665652652; 
 Sat, 12 Feb 2022 03:34:12 -0800 (PST)
Received: from james-x399.localdomain (97-118-156-98.hlrn.qwest.net.
 [97.118.156.98])
 by smtp.gmail.com with ESMTPSA id s18sm16064403iov.5.2022.02.12.03.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Feb 2022 03:34:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 04:34:07 -0700
Message-Id: <20220212113407.1213446-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220212113407.1213446-1-james.hilliard1@gmail.com>
References: <20220212113407.1213446-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 2/2] package/python-tinycss2: bump to version
 1.1.1
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

This update drops distutils support and requires flit package
infrastructure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - add python-tinycss2 back in series
---
 package/python-tinycss2/Config.in            | 2 ++
 package/python-tinycss2/python-tinycss2.hash | 4 ++--
 package/python-tinycss2/python-tinycss2.mk   | 6 +++---
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-tinycss2/Config.in b/package/python-tinycss2/Config.in
index e6c992b8c5..e7a5bb3659 100644
--- a/package/python-tinycss2/Config.in
+++ b/package/python-tinycss2/Config.in
@@ -4,3 +4,5 @@ config BR2_PACKAGE_PYTHON_TINYCSS2
 	select BR2_PACKAGE_PYTHON_WEBENCODINGS # runtime
 	help
 	  A tiny CSS parser.
+
+	  https://www.courtbouillon.org/tinycss2
diff --git a/package/python-tinycss2/python-tinycss2.hash b/package/python-tinycss2/python-tinycss2.hash
index eeb3754752..e8e1d93f83 100644
--- a/package/python-tinycss2/python-tinycss2.hash
+++ b/package/python-tinycss2/python-tinycss2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tinycss2/json
-md5  7caf513c4e87fc2449dcfbf407a8416f  tinycss2-1.1.0.tar.gz
-sha256  fbdcac3044d60eb85fdb2aa840ece43cf7dbe798e373e6ee0be545d4d134e18a  tinycss2-1.1.0.tar.gz
+md5  60272f58f8d5834b2e09ffbc9bd5de53  tinycss2-1.1.1.tar.gz
+sha256  b2e44dd8883c360c35dd0d1b5aad0b610e5156c2cb3b33434634e539ead9d8bf  tinycss2-1.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6b94acee20ec9f2709333134f3ba70322535fb420af0ce8c1455d9cbe297f1d5  LICENSE
diff --git a/package/python-tinycss2/python-tinycss2.mk b/package/python-tinycss2/python-tinycss2.mk
index 4bf5b97766..e4fc5dc9c5 100644
--- a/package/python-tinycss2/python-tinycss2.mk
+++ b/package/python-tinycss2/python-tinycss2.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_TINYCSS2_VERSION = 1.1.0
+PYTHON_TINYCSS2_VERSION = 1.1.1
 PYTHON_TINYCSS2_SOURCE = tinycss2-$(PYTHON_TINYCSS2_VERSION).tar.gz
-PYTHON_TINYCSS2_SITE = https://files.pythonhosted.org/packages/ce/d3/ece7a98d5826bd134e269a3a3030153d30482194fca71d95a3041812aab8
-PYTHON_TINYCSS2_SETUP_TYPE = distutils
+PYTHON_TINYCSS2_SITE = https://files.pythonhosted.org/packages/1e/5a/576828164b5486f319c4323915b915a8af3fa4a654bbb6f8fc8e87b5cb17
+PYTHON_TINYCSS2_SETUP_TYPE = flit
 PYTHON_TINYCSS2_LICENSE = BSD-3-Clause
 PYTHON_TINYCSS2_LICENSE_FILES = LICENSE
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
