Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BD4CF9C5B
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 00:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24E5260035;
	Sun, 22 Sep 2024 00:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FXfnddt7vPSK; Sun, 22 Sep 2024 00:51:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F22F1606B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F22F1606B1;
	Sun, 22 Sep 2024 00:51:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC4561BF86D
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 00:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E83EC605AD
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 00:51:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1wvzXyy_7Zfg for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 00:51:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C60C860035
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C60C860035
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C60C860035
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 00:51:23 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-82a109bc459so153850039f.1
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 17:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726966282; x=1727571082;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0vP0zCYsz0bnnlCNp6tGfjY6NGbkhScD2CU876F4Obs=;
 b=UNkua0MxpXyi4skcmVlDkuCeLvxxwJw2kfyVGE9tbLHvvG8VX8g7tm4N9U5/T41Sm3
 usR3n/nClPhErraZhKXaFyiyIQPj7XcrpTCDNZAUGgDRgYq7AAaJCH558q8xdyjefmzd
 3/Im0FLJnSDGi1kPXlOA1wtbGP6RWFhULEyye+r+3ycDimpPXEYZsrjfYE1i+sQ+AkDJ
 cp9rDJppdOA5FKXinJmYwGgT6GY+d0SMD4euIqRWMOA/QHk4ICNVcavb8DjCCJUWqOBb
 /tFYhvQLcDsnMzA+S5aTuSYNgSQXXCmKjarZHW50qSs7ZUrDmWyJRIAyGnZNgRaxx2BB
 pkdA==
X-Gm-Message-State: AOJu0Yx/kD7swHiqYLWXNj6+CYeR0rUg4H3jz3ehtA0Pu5K9IbTqabpm
 fqtGkJTezJsL5sV7vuGIVx7rpl28fPC/Z6KGjSbBv+j+03662a0ed0jp6Q==
X-Google-Smtp-Source: AGHT+IEBUl0fgc+jyp0Tw09o2Vws4hqIziMTpOBU0ozaMzZ3DNGg43BWzrnXzPiArbGJcz5YKEwe0A==
X-Received: by 2002:a05:6602:275a:b0:82a:284c:a807 with SMTP id
 ca18e2360f4ac-831fbe0f3e7mr732616039f.0.1726966282542; 
 Sat, 21 Sep 2024 17:51:22 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ebf4e1csm4418970173.20.2024.09.21.17.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 17:51:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 18:51:20 -0600
Message-Id: <20240922005120.728800-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726966282; x=1727571082; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0vP0zCYsz0bnnlCNp6tGfjY6NGbkhScD2CU876F4Obs=;
 b=EU2jxuB59h+rm79hdqwPGQrb1bJ5Shh4QXGLOr6fmXQr2YKXJ6UKPKZMxMZZdejKe9
 20vlfe0YGwM7lYRprnnfgXNRG1fA87Hr4AeYjLAZ8FZ9xFvAz9XgUzdkaururqlR7nhR
 ++MfC+S7RgvE4v+iTDbHrpFx7gp476PisJgWLAPXgAm85uKsvb38ouS/9OJiENssx59H
 K3+jOSWdMnvjgmsUhI3T7Z16idNDTBQ+JuMnOwTNx0jQ0eUvQK02u7GHHsn5RRksHoAI
 Qa+MowVkhX0q82QyZnak1xNmYhZyjdwTUc84XChH8UOp/4qrjaz5e6XZIGbzFyf3sBrS
 SP0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EU2jxuB5
Subject: [Buildroot] [PATCH 1/1] package/python-simplelogging: bump to
 version 0.12.0
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
Cc: Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch which is now upstream.

License hash changed due to year update:
https://github.com/vpoulailleau/simplelogging/commit/f1e551b962f55afd547cc842e416a95b20c860d1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...-Switch-build-backend-to-poetry-core.patch | 31 -------------------
 .../python-simplelogging.hash                 |  6 ++--
 .../python-simplelogging.mk                   |  4 +--
 3 files changed, 5 insertions(+), 36 deletions(-)
 delete mode 100644 package/python-simplelogging/0001-Switch-build-backend-to-poetry-core.patch

diff --git a/package/python-simplelogging/0001-Switch-build-backend-to-poetry-core.patch b/package/python-simplelogging/0001-Switch-build-backend-to-poetry-core.patch
deleted file mode 100644
index 2c345fe268..0000000000
--- a/package/python-simplelogging/0001-Switch-build-backend-to-poetry-core.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 76c1c545bad28f592405ca1e5bcf6081051c946a Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Tue, 13 Feb 2024 13:37:00 -0700
-Subject: [PATCH] Switch build-backend to poetry-core
-
-poetry-core is the lightweight counterpart of poetry that is intended
-to be used as a build-backend. Unlike poetry, it does not require
-installing all the dependencies of the package manager, making
-the builds much faster. The generated artifacts are the same.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-Upstream: https://github.com/vpoulailleau/simplelogging/pull/230
----
- pyproject.toml | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index a89ab64..79403cb 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -55,5 +55,5 @@ commands =
- """
- 
- [build-system]
--requires = ["poetry>=0.12"]
--build-backend = "poetry.masonry.api"
-+requires = ["poetry-core>=1.0.0"]
-+build-backend = "poetry.core.masonry.api"
--- 
-2.34.1
-
diff --git a/package/python-simplelogging/python-simplelogging.hash b/package/python-simplelogging/python-simplelogging.hash
index 6d80fb93ec..f080a3b123 100644
--- a/package/python-simplelogging/python-simplelogging.hash
+++ b/package/python-simplelogging/python-simplelogging.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/simplelogging/json
-md5  97b5f2a5cd9cff1b60c727cd03b3ffe1  simplelogging-0.11.0.tar.gz
-sha256  23a128b47d3e88213adc51fdd102aae15a398cf459d782eb19534945d23f0bc5  simplelogging-0.11.0.tar.gz
+md5  993862aca6fe6d0962effe07a335b554  simplelogging-0.12.0.tar.gz
+sha256  a9695b05090951c029733606f14e24a783c7a100bbe96f8f16a5f2c4c9b08102  simplelogging-0.12.0.tar.gz
 # Locally computed sha256 checksums
-sha256  bd2a0fe3b3bab7092ffa7f58d46bb05d98f12f107b3a6be947c098f7c2ad1d1a  LICENSE
+sha256  71cc6fb7236f1a0734c24b4e5dff18d3afc87a5fb68f25f2d368d8fe099a6cda  LICENSE
diff --git a/package/python-simplelogging/python-simplelogging.mk b/package/python-simplelogging/python-simplelogging.mk
index dbd9ce3ae3..d725cccdd8 100644
--- a/package/python-simplelogging/python-simplelogging.mk
+++ b/package/python-simplelogging/python-simplelogging.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIMPLELOGGING_VERSION = 0.11.0
+PYTHON_SIMPLELOGGING_VERSION = 0.12.0
 PYTHON_SIMPLELOGGING_SOURCE = simplelogging-$(PYTHON_SIMPLELOGGING_VERSION).tar.gz
-PYTHON_SIMPLELOGGING_SITE = https://files.pythonhosted.org/packages/73/d6/4c06aa7f2c3b9fc09429a1196fd357357cc555de5e16c09b2d12e9db1ebb
+PYTHON_SIMPLELOGGING_SITE = https://files.pythonhosted.org/packages/30/71/d6b6513598e6a4300f6142a839d1b0e10a25a4707f1b586d9a6331be91bb
 PYTHON_SIMPLELOGGING_SETUP_TYPE = pep517
 PYTHON_SIMPLELOGGING_LICENSE = BSD-3-Clause
 PYTHON_SIMPLELOGGING_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
