Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762F7CF3963
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 18:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B68784B5B;
	Thu, 19 Sep 2024 18:46:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HpO5Wpfq8YvX; Thu, 19 Sep 2024 18:46:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27B4D84B5E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27B4D84B5E;
	Thu, 19 Sep 2024 18:46:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 69CE21BF5A3
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 18:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D40A42AD8
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 18:46:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uHi6r91yb4gY for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 18:46:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4CBD142ADE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CBD142ADE
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4CBD142ADE
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 18:46:04 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-39f56df0ddbso4763075ab.3
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 11:46:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726771563; x=1727376363;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nIo9rJNPuKbyfTM+cy8p/a+cF8ggpkoTKD0Uc29L0oE=;
 b=cbv6ujbPeKTp9J1ppAFzjOrjGmqYFfHT3WBkkgWSm0yRvtqhNrABgHt6bL9xD6x3va
 A93Clc2ljkFYoFPieuddPuqFL7qx+jDjCx9qwty/JqzAXzMDR+C/7Xbi4DEQRFIBNovb
 fcg7bpsivtqfRg+puuYrn4u49dEo2Uft+FP1zkL867x5CRXkggR2ZtM7r7MUWSAZhxVj
 2Mt44xWHNuCPeffrdAEo2OA8o9MwQnfDF1NNdv9TD3KrdmMfo0RU03hxdI4Y8IqjE0nm
 AoI4hAq/gtEqryRasGZeExizSYDtwx9ILxrENHykFcNNQpEmtto/Amd4Xx1/xdnZpPGT
 NFPg==
X-Gm-Message-State: AOJu0Yz5W/EXq2O5/2Zsx7Ym1wMhdlxf3fNUUfuAMhLIFn7wdUB5QEJ+
 yL2myKVudpEaLc0/Yj9jfnJ0jPHVpiqpf/hUSEdbqIWqziqy24n7PaMBRg==
X-Google-Smtp-Source: AGHT+IH8QjHqrPxf3V3O9gvb4jaHiwIYWtdmzaJKP0JWdbEfVLSWdlkY+Zu7DiJ0TykW0sw7ybOnYQ==
X-Received: by 2002:a05:6e02:2143:b0:3a0:c88c:e674 with SMTP id
 e9e14a558f8ab-3a0c8c7b698mr4408495ab.1.1726771563025; 
 Thu, 19 Sep 2024 11:46:03 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e9011fsm35077905ab.86.2024.09.19.11.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2024 11:46:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 12:46:01 -0600
Message-Id: <20240919184601.654247-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726771563; x=1727376363; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nIo9rJNPuKbyfTM+cy8p/a+cF8ggpkoTKD0Uc29L0oE=;
 b=Jb97kW+3frPwC33K//jgaAXbSiQmmZpDE2bHpcQFilWPwcqKmW6vUNT4wRA3nlT7l6
 gCYxuOJlcsKztf6NNyAm55Ym286isQGoqY4cgIIfSuq/7u1GhYUNf5psczUg0msRpIAw
 U/LZ/nwnwLazDn/9BlvKRsO9R9wt75FddYB5RlvnXigsI4T4iziLd6L8AAxn9SA72Xgg
 x9ah/3MIGUznjwYfghfS8mqfZItD8px5Vizzlx29Pd9d5XRAh3fwnpg+aPXn3vsrTMO0
 agFPxYnyjK2NmsV91vG+S7wm3qSgDxOzv1Eaq2cHR//MWKNuTjLefGRV08nQeM0y0kpH
 mo5A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Jb97kW+3
Subject: [Buildroot] [PATCH 1/1] package/python-ruamel-yaml: bump to version
 0.18.6
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

License hash changed due to date update:
https://sourceforge.net/p/ruamel-yaml/code/ci/6f41eb6001661917fceb0e88ed0693ae1a7c50f4/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-ruamel-yaml/python-ruamel-yaml.hash | 6 +++---
 package/python-ruamel-yaml/python-ruamel-yaml.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.hash b/package/python-ruamel-yaml/python-ruamel-yaml.hash
index 02845d112b..94a0d43544 100644
--- a/package/python-ruamel-yaml/python-ruamel-yaml.hash
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ruamel.yaml/json
-md5  24fac3544a3c7bd7eeaf6e4f704a056e  ruamel.yaml-0.18.5.tar.gz
-sha256  61917e3a35a569c1133a8f772e1226961bf5a1198bea7e23f06a0841dea1ab0e  ruamel.yaml-0.18.5.tar.gz
+md5  964a8e48646e26533d8e5f03cff99dde  ruamel.yaml-0.18.6.tar.gz
+sha256  8b27e6a217e786c6fbe5634d8f3f11bc63e0f80f6a5890f28863d9c45aac311b  ruamel.yaml-0.18.6.tar.gz
 # Locally computed sha256 checksums
-sha256  ba45629abb7022949148ce65de4a59e7ee164d30c94450389a6afdd3ebe4e9e0  LICENSE
+sha256  e84ff196f03668af751abae0c4cbd9169aa365121f50c30bb9a329666ab6260a  LICENSE
diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.mk b/package/python-ruamel-yaml/python-ruamel-yaml.mk
index bbdac591ca..83a4aa12e8 100644
--- a/package/python-ruamel-yaml/python-ruamel-yaml.mk
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RUAMEL_YAML_VERSION = 0.18.5
+PYTHON_RUAMEL_YAML_VERSION = 0.18.6
 PYTHON_RUAMEL_YAML_SOURCE = ruamel.yaml-$(PYTHON_RUAMEL_YAML_VERSION).tar.gz
-PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/82/43/fa976e03a4a9ae406904489119cd7dd4509752ca692b2e0a19491ca1782c
+PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/29/81/4dfc17eb6ebb1aac314a3eb863c1325b907863a1b8b1382cdffcb6ac0ed9
 PYTHON_RUAMEL_YAML_SETUP_TYPE = setuptools
 PYTHON_RUAMEL_YAML_LICENSE = MIT
 PYTHON_RUAMEL_YAML_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
