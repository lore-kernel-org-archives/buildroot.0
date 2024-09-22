Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4433ACF9C64
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7DCC81393;
	Sun, 22 Sep 2024 10:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0HfEOfr0vOzT; Sun, 22 Sep 2024 10:31:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4CEE813AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4CEE813AE;
	Sun, 22 Sep 2024 10:31:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 508001BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F57F6060B
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:31:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OnvybnO8ylYs for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:31:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3D8F560606
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D8F560606
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D8F560606
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:31:00 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-82aef2c1e5fso135630339f.1
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 03:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727001059; x=1727605859;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ouTskB/o6vlkHbQJiSlNsXMFzU+zFWGT+t4cIZhesao=;
 b=txwCPoIXWNCYgyHVB4hXVd5z5xANR6J6J9n98Eggine9RNNvfnJ5GUWkSbxTN+Ttgg
 nqnyrWLQpUtpMv+u8MnyVPdg1nQPmoMYuNG/URZ09gc2d3kynRo1a8JFGXZhU8GgfDd4
 EldNgc/LZmQMj1c6tgjhmFmroA5zZ9gDg6/CFM6MdNXbEAuUHrfJIr6W5KxEoWOBIHAY
 AmLAXI1DgqTWQx2AVRIicV5XwFcm5tLbi8YBBW9pcWf+IgcdW4ylJPVsC6gZEffqdXbx
 Up3j+WaN3PO0rAf5ovPFwuEgLwkcZ036rh7f0RrZd7cDrITRwvnd9ZzXrp9pT8LMDGgw
 vy2A==
X-Gm-Message-State: AOJu0YzwuIlhLg5DVYeYqrJoysj8Ul9BnZ6UIca1C0muGDlSNvEfsVll
 xT/+bNSCXvT7L34ni3unOTk88TDcG41MhEct7Dusy9FXw8pMVHoenyysNg==
X-Google-Smtp-Source: AGHT+IH1wgXw8IZeZVWiGwlLU1jCC4brb/1CVwmH4uOeyaFFKXv5KwPLyt12vulFT2FXorU2Foah3g==
X-Received: by 2002:a05:6602:6302:b0:831:fbd3:88d3 with SMTP id
 ca18e2360f4ac-83209ce0ad9mr697273439f.2.1727001058972; 
 Sun, 22 Sep 2024 03:30:58 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d492b94b4sm499960539f.32.2024.09.22.03.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 03:30:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 04:30:55 -0600
Message-Id: <20240922103055.1130268-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727001059; x=1727605859; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ouTskB/o6vlkHbQJiSlNsXMFzU+zFWGT+t4cIZhesao=;
 b=jQACe6quLiTo442BdlyTJCsLWaB0Py0nU2aFN21Kz8yW+C6dr+p7viRgxxnRTFpgKK
 rX8256T7asa4pw2lJx/K7ea+ay5LOd2tJFSXN+BfRgWDp3aQkrBSGdSy40PH954iKl/n
 opd1vBhCetmleREuQlf2kIwP2kpAW4rUcmaw2WQQRY3w/4JaT+8qGnSLv0fsT0EP4fqC
 iy7g3JMfkSnCZy41WPoFLDJdcsQn/uKcFK4IYQptO73jL02ZrWMQl9Df9lVmFfYyy+Kh
 RnreeeK1f7ckPswlQlTHplViz8X+ppJgpLGXzNYW0ivdA/CcJVinxBazeUdQTDwRYlfp
 ByiA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jQACe6qu
Subject: [Buildroot] [PATCH v2 1/1] package/python-configobj: bump to
 version 5.0.9
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

License hash changed due to removing extra "2014" in license:
https://github.com/DiffSK/configobj/commit/fdf3634418d9acfc72a534b26a796d195c4a7e42

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - add comment about license hash change
---
 package/python-configobj/Config.in             | 1 -
 package/python-configobj/python-configobj.hash | 6 +++---
 package/python-configobj/python-configobj.mk   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-configobj/Config.in b/package/python-configobj/Config.in
index 365aa17fcb..cb9d914745 100644
--- a/package/python-configobj/Config.in
+++ b/package/python-configobj/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_CONFIGOBJ
 	bool "python-configobj"
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Config file reading, writing and validation.
 
diff --git a/package/python-configobj/python-configobj.hash b/package/python-configobj/python-configobj.hash
index 682dc987f1..b173f0cdd7 100644
--- a/package/python-configobj/python-configobj.hash
+++ b/package/python-configobj/python-configobj.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/configobj/json
-md5  8dda7b31bb3aea87ecfe3b7a87812b17  configobj-5.0.8.tar.gz
-sha256  6f704434a07dc4f4dc7c9a745172c1cad449feb548febd9f7fe362629c627a97  configobj-5.0.8.tar.gz
+md5  496b60edcd943a900ddc0cb04132e81c  configobj-5.0.9.tar.gz
+sha256  03c881bbf23aa07bccf1b837005975993c4ab4427ba57f959afdd9d1a2386848  configobj-5.0.9.tar.gz
 # Locally computed sha256 checksums
-sha256  0d95e648469a711f5ec1e59e6d4492150ec65d968c1ea6c6d96154a92879997a  LICENSE
+sha256  fd227649f1956788444397bf0899e977140a5bc662d86826657bc2aad833fe2a  LICENSE
diff --git a/package/python-configobj/python-configobj.mk b/package/python-configobj/python-configobj.mk
index fe1776f79f..963bbcb2b8 100644
--- a/package/python-configobj/python-configobj.mk
+++ b/package/python-configobj/python-configobj.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CONFIGOBJ_VERSION = 5.0.8
+PYTHON_CONFIGOBJ_VERSION = 5.0.9
 PYTHON_CONFIGOBJ_SOURCE = configobj-$(PYTHON_CONFIGOBJ_VERSION).tar.gz
-PYTHON_CONFIGOBJ_SITE = https://files.pythonhosted.org/packages/cb/87/17d4c6d634c044ab08b11c0cd2a8a136d103713d438f8792d7be2c5148fb
+PYTHON_CONFIGOBJ_SITE = https://files.pythonhosted.org/packages/f5/c4/c7f9e41bc2e5f8eeae4a08a01c91b2aea3dfab40a3e14b25e87e7db8d501
 PYTHON_CONFIGOBJ_SETUP_TYPE = setuptools
 PYTHON_CONFIGOBJ_LICENSE = BSD-3-Clause
 PYTHON_CONFIGOBJ_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
