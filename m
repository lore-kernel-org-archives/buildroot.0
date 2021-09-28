Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70DE5C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 12:33:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B27EB611C3
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 12:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B27EB611C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 467E880F5F;
	Tue, 28 Sep 2021 12:33:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O29Kjf7HIfss; Tue, 28 Sep 2021 12:33:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAB8280F34;
	Tue, 28 Sep 2021 12:33:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 073431BF368
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 12:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E26BD60B22
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 12:33:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o7VQJL1YCw9C for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 12:33:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A613360B16
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 12:33:06 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 b192-20020a1c1bc9000000b0030cfaf18864so2628519wmb.4
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 05:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1obU6LG9Y53CC3eHO0hSGTMXqbPMYEBK4EyQZBL69lk=;
 b=qxuILylIjA3oE0iKLaVtQ5gJf76SZWyaxNy4Uvl7Ff/AGQcBO8ubjch0Ot6AOR8+Z4
 +98OO9yCsJPL5ifNAHdGWMlOBw9Mv7dq5NKT5Zdf7mRYkv8IMrf13t0HgVhdMIGw8L7F
 fwAV6yv3R45QQGm951m5HcG+bypwxL4vXHbIgLllRogs8eUtD7T/9ndHoMi9nJ68VPqA
 fCMv5i2rAS5OVPivGPl9Fq5kMKwssBA1SZQV07T6JOsm92VzxoxQ3iqKTZ4YFY6IDdAW
 YngBIy28cTnSXW7TDfQKhCHTjf7QBG27uQibjv0qd1ztY4fz+xoGYIyc3mHJG1bhJbsV
 0qfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1obU6LG9Y53CC3eHO0hSGTMXqbPMYEBK4EyQZBL69lk=;
 b=Bb/NNkqGatpL2GeyboaUl9R8JpdyQD7oPKnsFouZvOoUGM4yirE+IOAK4lhS5wHq6u
 Uf3rpdSD6paZIWCHBCCW6sF66A4dnZkVnIX34wQe6uIAOIl7AHBmgZq+sxWm6SD3yRGY
 +5dyaCPs2EYutVu2rDz4urxgkCl/gK2DPjsKkj/On38gkvygzrdXmf6VJjnp7a42k7T/
 b3z3jKWIvwUBlOaqJ+eOV96YJFUxKMRyYp1qOC8PeRq234jEGMbMlhiVdntbEEF1xdPw
 x/x5ObmzbjZLrt3Wtq1hpsRXcUUi/rYcwVGPEKD45CDbUd40NkBxeivySD+NB8ZFtN88
 7Dlg==
X-Gm-Message-State: AOAM533L/Xsbef2E4/9c8T/HJgAdBnfCGkIOPPIcVRmM658P3GtwAnA9
 XXRRgaeGFEuNw+GvtJsb5bvzSqRy1oE=
X-Google-Smtp-Source: ABdhPJymnmDbnJ67zYVgg664Z0c3wY29EgQoS8+9YPStdrEEzIVA99jzHJzmxlVp5s+gbC1ZmdUu9Q==
X-Received: by 2002:a7b:c415:: with SMTP id k21mr3366073wmi.187.1632832384529; 
 Tue, 28 Sep 2021 05:33:04 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:4689:4da0:eeb9:bbe0])
 by smtp.gmail.com with ESMTPSA id i7sm12752353wrp.5.2021.09.28.05.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 05:33:04 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 15:32:57 +0300
Message-Id: <20210928123257.617634-1-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pyhamcrest: bump to version
 2.0.2
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

* The package doesn't support python2 anymore.
* Indent with two spaces in the hash file.
* License was changed with a year bump.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pyhamcrest/Config.in              | 1 +
 package/python-pyhamcrest/python-pyhamcrest.hash | 6 +++---
 package/python-pyhamcrest/python-pyhamcrest.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-pyhamcrest/Config.in b/package/python-pyhamcrest/Config.in
index c2a4dc06f7..1bbae3fec7 100644
--- a/package/python-pyhamcrest/Config.in
+++ b/package/python-pyhamcrest/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYHAMCREST
 	bool "python-pyhamcrest"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
diff --git a/package/python-pyhamcrest/python-pyhamcrest.hash b/package/python-pyhamcrest/python-pyhamcrest.hash
index 0c1660e08a..b2e84d7d1f 100644
--- a/package/python-pyhamcrest/python-pyhamcrest.hash
+++ b/package/python-pyhamcrest/python-pyhamcrest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyhamcrest/json
-md5	8b833a3fa30197455df79424f30c8c3f  PyHamcrest-1.9.0.tar.gz
-sha256	8ffaa0a53da57e89de14ced7185ac746227a8894dbd5a3c718bf05ddbd1d56cd  PyHamcrest-1.9.0.tar.gz
+md5  7a086f0b067f8d38958ec32f054559b4  PyHamcrest-2.0.2.tar.gz
+sha256  412e00137858f04bde0729913874a48485665f2d36fe9ee449f26be864af9316  PyHamcrest-2.0.2.tar.gz
 # Locally computed sha256 checksums
-sha256	ec76c04449607010d061b1e29c9d20a5ffae74db9d04670ae82538ccfe68b941  LICENSE.txt
+sha256  71beae6c8151362cfe398cbd350191a1cc52d3d28499839a7830b25f5b50a7fe  LICENSE.txt
diff --git a/package/python-pyhamcrest/python-pyhamcrest.mk b/package/python-pyhamcrest/python-pyhamcrest.mk
index 244aa8c606..28979600dd 100644
--- a/package/python-pyhamcrest/python-pyhamcrest.mk
+++ b/package/python-pyhamcrest/python-pyhamcrest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYHAMCREST_VERSION = 1.9.0
+PYTHON_PYHAMCREST_VERSION = 2.0.2
 PYTHON_PYHAMCREST_SOURCE = PyHamcrest-$(PYTHON_PYHAMCREST_VERSION).tar.gz
-PYTHON_PYHAMCREST_SITE = https://files.pythonhosted.org/packages/a4/89/a469aad9256aedfbb47a29ec2b2eeb855d9f24a7a4c2ff28bd8d1042ef02
+PYTHON_PYHAMCREST_SITE = https://files.pythonhosted.org/packages/58/05/7b993fabb44ff0b52a90916d96bfd91a65ecf90b8248e72bba325ba8e438
 PYTHON_PYHAMCREST_SETUP_TYPE = setuptools
 PYTHON_PYHAMCREST_LICENSE = BSD-3-Clause
 PYTHON_PYHAMCREST_LICENSE_FILES = LICENSE.txt
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
