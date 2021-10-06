Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BCF4C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 23:39:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB0DF610A1
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 23:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB0DF610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AB3740241;
	Wed,  6 Oct 2021 23:39:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nm3r0_3j8Hu8; Wed,  6 Oct 2021 23:39:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 301504038C;
	Wed,  6 Oct 2021 23:39:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3EC6D1BF30B
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 23:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 297034038C
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 23:39:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q9EdGMrnyuUc for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 23:39:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E890C40241
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 23:39:30 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id p80so4692718iod.10
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 16:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5DeqOUj8mCQ2cYIxEx3VRKmPfGimDcriND5G7qaJhAQ=;
 b=hG702TCaJnMHOjWksZOfyeQMiOIINFpwa3q1SR8nV6kg/vxbbz8iidHIVkCDhOBppx
 nf6LeaIKyMs9uwKc2SYRPm/MpiIy3lDkRoHaaQC5To/tlVvK0FZRXxclpkxrvACjsGvW
 +WfZKz3AdM0k9tH7zcj8l4ust63hH0HSf5+cYKJMpolFMutH2fwFnfCRqOBM3cz8uzc2
 g+gKRiA1VbqKr7riuBy3ufQZYbVJgzRM1EXuzRkmd7ZVLDtoHHQ0UI1EGq9vPxZrMXLP
 CfwY3/sOVuisUKkVgOVxxYA/3bR5wQR/buwYDYZKQWhBZ6rwPp6qB65+w1HKOIr0OcUG
 oE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5DeqOUj8mCQ2cYIxEx3VRKmPfGimDcriND5G7qaJhAQ=;
 b=LTz1UUTQmAVDZfIBvg7nFcxfgLOQ1V2oYuHazy3IpmRmsZ1dTvjKGq/TFm4ZQkMAM6
 m5jJ0GusCG9EYyGxKdUvuy1TgxdbBY2TBSZmQSyoDzma2epYu3FSJ+4209R+r2i2M5oE
 4RQVwiqOwnNjSUCZFJl9n9ufq20EYQgjYpFrWegYyRYPHUf264Te35Ctz328rm6aMXBY
 9rZjNlsi85BXa2TFiCJksG5A5YbKj0OAzrXSzzW72+BC0CG91il5/svnMz8fDgvRhKdC
 m8EjtWe90LMe2rVZ9k2GeR/kgUHhL6hWBT6MTX7ONLLiy3LjWVQaFpfiLJNYnqKZuYuS
 yd/Q==
X-Gm-Message-State: AOAM533YPAWbCXOn0XtF7j0cKduxc2ZVbaEElWXiQhHldHhvNiRZmCHv
 zlIisNtWFk58amLjjqZVqdyAif1+Uh4=
X-Google-Smtp-Source: ABdhPJw9JoD2c9gwESv13n7fk2Qs29baABO1dBk55EJj4vBTeIG7M8uDAAJob3Ptvesjq1qcXvbKaQ==
X-Received: by 2002:a05:6602:1591:: with SMTP id
 e17mr847470iow.146.1633563569821; 
 Wed, 06 Oct 2021 16:39:29 -0700 (PDT)
Received: from james-x399.localdomain (97-118-169-148.hlrn.qwest.net.
 [97.118.169.148])
 by smtp.gmail.com with ESMTPSA id o3sm12400335iou.11.2021.10.06.16.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 16:39:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 17:39:21 -0600
Message-Id: <20211006233923.3225201-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/python-engineio: bump to version
 4.2.1
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

Drop python2 support and propagate reverse dependency.

Remove six dependency as it is no longer required.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-engineio/Config.in            |  5 ++---
 package/python-engineio/python-engineio.hash |  4 ++--
 package/python-engineio/python-engineio.mk   | 14 ++------------
 package/python-socketio/Config.in            |  1 +
 4 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/package/python-engineio/Config.in b/package/python-engineio/Config.in
index b12db922a2..48f3391e53 100644
--- a/package/python-engineio/Config.in
+++ b/package/python-engineio/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_PYTHON_ENGINEIO
 	bool "python-engineio"
-	select BR2_PACKAGE_PYTHON_SIX # runtime
-	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_ZLIB
 	help
 	  Engine.IO server.
 
diff --git a/package/python-engineio/python-engineio.hash b/package/python-engineio/python-engineio.hash
index ef852cf1ad..5762303af0 100644
--- a/package/python-engineio/python-engineio.hash
+++ b/package/python-engineio/python-engineio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-engineio/json
-md5  e6ea8b3f2f32eeeb02014c46092f2adb  python-engineio-3.12.1.tar.gz
-sha256  2481732d93646998f7372ef0ecf003af7817b82720b881db173c3d50b4887916  python-engineio-3.12.1.tar.gz
+md5  d2bc7184d64e9d5a692bfad29ff73dea  python-engineio-4.2.1.tar.gz
+sha256  d510329b6d8ed5662547862f58bc73659ae62defa66b66d745ba021de112fa62  python-engineio-4.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index 4f835da0a4..81bd49fb64 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -4,21 +4,11 @@
 #
 ################################################################################
 
-PYTHON_ENGINEIO_VERSION = 3.12.1
-PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/71/5d/620b75396ce993001cbccc80dd786ab09a16a8e3f6c4878ad05f051064d6
+PYTHON_ENGINEIO_VERSION = 4.2.1
+PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/74/1e/33e402011bb2fe33ab12762e5a66d66df1d47302a23e9c5e8310e11b1403
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
 PYTHON_ENGINEIO_CPE_ID_VENDOR = python-engineio_project
 
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-# only needed/valid for python 3.x
-define PYTHON_ENGINEIO_RM_PY3_FILES
-	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/engineio/async_drivers \
-		$(TARGET_DIR)/usr/lib/python*/site-packages/engineio/asyncio_*.py
-endef
-
-PYTHON_ENGINEIO_POST_INSTALL_TARGET_HOOKS += PYTHON_ENGINEIO_RM_PY3_FILES
-endif
-
 $(eval $(python-package))
diff --git a/package/python-socketio/Config.in b/package/python-socketio/Config.in
index af0f6f32e8..096e75a623 100644
--- a/package/python-socketio/Config.in
+++ b/package/python-socketio/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_SOCKETIO
 	bool "python-socketio"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_ENGINEIO # runtime
 	help
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
