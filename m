Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5A4CF9C68
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 08:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8DA86061F;
	Sun, 22 Sep 2024 08:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7UN7cTjuDIey; Sun, 22 Sep 2024 08:30:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFECE60643
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFECE60643;
	Sun, 22 Sep 2024 08:30:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 29A991BF870
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 08:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 261AA60643
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 08:30:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 81-2LL_1W2zn for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 08:30:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2118A6061F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2118A6061F
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2118A6061F
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 08:30:30 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-39f54ab8e69so14791375ab.1
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 01:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726993830; x=1727598630;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tKggX0JmRfl0y/MrM56C25AopS1eZWWy8sNdPGRALBM=;
 b=TzX1CCeV+GrG9XkHTy6negsiPpQSPOQZ8XCioCv21TDdoVkRjEv01UsVQZ5HZ1IAzV
 3smuTBpsGk2ZcIeEZFjquxVaefluGeaX1NQ9mUMvtoxQbxL4TN5Ml20f2Q2pKQ6gP9RF
 azVrsyNiuiIO7CeyyF48WpkRYhW/p0xSiYIyIqviXYS4BkVTqpPXbI0nH+D6Ya7ZVzAM
 J4/5gOJt8xaiOCYQ0bczqlF08xIRM72vEdNy/TBnQlajU7qAPc4mreVYMGV3w4RQChqK
 y54hbmLpjrZPYJpBZyZLWZE80iUlXxnuTZPBajrU8RrTCKdzQM1tL0YrKzccyXMawFdT
 WZig==
X-Gm-Message-State: AOJu0YxFJzvxvLvkqt2of1q8wMszA4sT+t8LyTrkjtZCQEIQPhI5zzmj
 cZMouhZSBEtOepboTXxvn0A88PEXgw1pq+GTboKQ/+PmHW8CuXqaSvwCWg==
X-Google-Smtp-Source: AGHT+IHsty/NyYjQMvVbzQXmagEXKVS13+E79RmvT3LQy7yfiwiOWJJdPFgpL1LVJSsCb2aKgQ7v6g==
X-Received: by 2002:a05:6e02:1d07:b0:3a1:92bb:1e70 with SMTP id
 e9e14a558f8ab-3a192bb1fc7mr25506125ab.7.1726993829605; 
 Sun, 22 Sep 2024 01:30:29 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed60f34sm4495087173.173.2024.09.22.01.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 01:30:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 02:30:27 -0600
Message-Id: <20240922083027.1005650-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726993830; x=1727598630; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tKggX0JmRfl0y/MrM56C25AopS1eZWWy8sNdPGRALBM=;
 b=nmiiOb3ZoS/bVj8I6CCDsvuSq6lcPVaRq0vLekefzf/YpUoR9Y4H49IqA6MKEQrQr4
 +Wowu2HzOdCkKf7q+H0NE4IC22M3jfSCLPoQB+YlM3VuINSQAEC3gvtIjifsg+gg4/3W
 GlKrLEWCUnytFj1IkopHg8ncfCImYMLX0a8btK5gXtxyyWs/pupQUO6U+aH/g4hCAY5v
 JGo3Yp/WGLdae3gygZjTkE+XoUAxxhYRdxq7RhXOUi81DQ3i69yCVwWTORgIoSRilhe+
 nhdryygVK4jTzobee1qySoy8CFEBsDYWFHaqSgROZIbq7oAwrI6sGD/SG9GI0WxLiDRv
 W7Nw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nmiiOb3Z
Subject: [Buildroot] [PATCH 1/1] package/python-configobj: bump to version
 5.0.9
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
