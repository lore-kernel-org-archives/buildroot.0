Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11112C3065A
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 17:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7C41600B5;
	Mon,  1 Jul 2024 17:23:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQn8vC7LU5jf; Mon,  1 Jul 2024 17:23:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B02A260631
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B02A260631;
	Mon,  1 Jul 2024 17:23:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9942B1BF342
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 17:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 848FF8176F
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 17:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OXhXMvPfBo47 for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 17:23:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8573281769
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8573281769
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8573281769
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 17:23:43 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7f3d884e70bso174893239f.3
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 10:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719854622; x=1720459422;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9iuyneYzmadhu+6f+jaGRnUMQT5u5VvelQ1mfagMC4I=;
 b=HV5zD02rTXuSYDeM+U6o+/J0YWCdfB+9Ua82YoFDLD42PzykyTk1+I5tUTZOTfEx5M
 LgV0avomY89Ly+jQJ+dUv4HHhpLtNfSYA1wbDT8pJuReDS9loxrCgyBkc62onaXXL8qE
 ngSeFehmVoRYD4H5BPIuznXGr9tLmRkrSkvsji/wv/vygCB0e4iW7NwXJ5xczukN/+NI
 ABfTSh+hegtCMoj9Tpqu/lpyWjCd2AeHNY8HNiDcOcuHJbK8CuI2t/BZCND0bkQ7/dbS
 7Z7l1Fwpu7mCPNjgmkjhBl5MMXc0m9/dAYZ3LSdeXG+0L/2A4e58KUWnMtI1jybbeiXo
 sMlw==
X-Gm-Message-State: AOJu0YzSHIwXirMScsblJF5ohO19hBZF0aifishwjCxBgpPVTMfFxK1q
 5zMheOn6W8HEeJ56DYGUGOxkrOjo37uTRz3eqPQdK2QBBdJxeA12ZB0KyQ==
X-Google-Smtp-Source: AGHT+IG19SQHkgLT/LSYhcAt7OPByl9s4f2ABah7x7lcBI5ZlGOWrhM0l2JBS5+DNFxahEUnv9002Q==
X-Received: by 2002:a05:6602:2358:b0:7f6:369f:262c with SMTP id
 ca18e2360f4ac-7f6369f328bmr578946739f.10.1719854622224; 
 Mon, 01 Jul 2024 10:23:42 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4bb73bbcf12sm2321874173.22.2024.07.01.10.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 10:23:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 11:23:40 -0600
Message-Id: <20240701172340.1715937-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719854622; x=1720459422; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9iuyneYzmadhu+6f+jaGRnUMQT5u5VvelQ1mfagMC4I=;
 b=iflSsseDQ4xm1eBwP4Wao38Odsovcbs93T5AXPhpcDDtWx1MzcWfIflumjO3Jz6ud8
 OQ+gPfOS6kWCesvNDJlZwRVg3WoJaWbWUVQCxhxtAy30N+39YUBMB+++c0TYv5Rz0Hv/
 VIhQcU+t8lpkVp2RKBhd5KgUL5xt1lQd7dLDDVRZOyoT2tcDKtZynvh5BYncekB+cdmM
 H9pxwlqqIHjA7iO7KHrkdlm/5NbBrsXMOefmJm+eLDgeqve60rttuS3YN6+jlis1dCFb
 P46CwMluda8SNsO4jKVdG1g/tupJe9dyhDLw61z03bRAIOVCxqQT+Wvenn9e8HrQJaz1
 nVTg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iflSsseD
Subject: [Buildroot] [PATCH 1/1] package/python-cython: bump to version
 0.29.37
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cython/python-cython.hash | 4 ++--
 package/python-cython/python-cython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index 08ad8f6d84..42c063014e 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5  a4d0f9fbc9c137f1a88937cd40e8c5ee  Cython-0.29.36.tar.gz
-sha256  41c0cfd2d754e383c9eeb95effc9aa4ab847d0c9747077ddd7c0dcb68c3bc01f  Cython-0.29.36.tar.gz
+md5  d9a1e8416f2278857a189347858ed9d0  Cython-0.29.37.tar.gz
+sha256  f813d4a6dd94adee5d4ff266191d1d95bf6d4164a4facc535422c021b2504cfb  Cython-0.29.37.tar.gz
 # Locally computed sha256 checksums
 sha256  a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
 sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index 47e105c065..024c8c1e50 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYTHON_VERSION = 0.29.36
+PYTHON_CYTHON_VERSION = 0.29.37
 PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/38/db/df0e99d6c5fe19ee5c981d22aad557be4bdeed3ecfae25d47b84b07f0f98
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/2a/97/8cc3fe7c6de4796921236a64d00ca8a95565772e57f0d3caae68d880b592
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
