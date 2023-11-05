Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA382C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 07:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65EA441949;
	Sun,  5 Nov 2023 07:31:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65EA441949
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kDRkQZAj1ZOX; Sun,  5 Nov 2023 07:31:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EAB841919;
	Sun,  5 Nov 2023 07:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EAB841919
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B9D01BF5A6
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 07:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71EDD82207
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 07:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71EDD82207
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jt2knOfWDPua for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 07:31:19 +0000 (UTC)
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 88058821DA
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 07:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88058821DA
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-35931064a3bso13760505ab.3
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 00:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699169478; x=1699774278;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ltw4txz6axQPihwFMFdMy441N4WKlsPGPvZ3FU7xUA8=;
 b=JS9LM+zBRPTDAYsl2N2vcyifPUvpHC7TFhlvGvDBIuZ/RWwdhkBYnPfZTJH+qeUBbH
 eFEvYMjZus6x5mOjoMR/xfu5TOIxsgDnP7FvFuZIBUIDZAhVoAWBM8whOf7GL7gWvdCa
 vE0lZDu1zlFsVfH5rbGZ4H5FFFoFbM95jg9X6oRGPjPTyJFuY4qIDJYp+WdvOU4OZE2n
 5ZKSrcET/3HOiar7KE4nMlH9tvxR9X8QeL/B+bADkTnm+vIOuRkGSV06WqJUt2DCfnrq
 bG+UgfEReK8SVN/UFvth9vH7zePCQnrYEeB5y+jrWsCnOMrfGrlQQ1VmVXE+oTE58pKl
 qvHw==
X-Gm-Message-State: AOJu0YwrlR2IZEbY5ihJK3H5lhBluorWAXQrPwl12yKwdNVGmZrjRiIt
 TeQT3Jfst+LluzenskPo9DMcNWqPOp8=
X-Google-Smtp-Source: AGHT+IHQb9G16EaeFtXNeoPXT0xikubGVwB9T5RSXK2yTL8//L9Drg5vKZnhK6/0L4/vU0138RcQ6Q==
X-Received: by 2002:a05:6e02:164b:b0:359:6c09:a3d0 with SMTP id
 v11-20020a056e02164b00b003596c09a3d0mr7840648ilu.25.1699169478167; 
 Sun, 05 Nov 2023 00:31:18 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 c8-20020a92c8c8000000b003506f457d70sm1727749ilq.63.2023.11.05.00.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 00:31:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 01:31:15 -0600
Message-Id: <20231105073115.2882141-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699169478; x=1699774278; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ltw4txz6axQPihwFMFdMy441N4WKlsPGPvZ3FU7xUA8=;
 b=axtC+JXvgvv4yTihEJIz1vuQ1MJViAOJ08OaKNyZBVZhRrHpfgvCYEzvzqOymCsh0m
 zrJJODodqOa82EDmcacyFJJoSx9+Kvd/SqFZbcSj2D0nZu/tP5ovS8GxLzt7OY/gj+zh
 AkpTHNuD+XugVtMgOQRzkYWG3SAhxk9YOXZNzUrYN+57lmS+GMfzdgUVady8XaoD7zFg
 JWQT6UizlksE4gd/PLn/by3iJdHwW7wSURVcTKWrVItcEHzO+eMmtKHi5LxCowEF0y8V
 44qGo+1Kvh4KQy8RcdANBXt/4bqpCVdsYRcMzdiChOFX5k1UBeMS25jb6kifhaHkWP/Y
 drKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=axtC+JXv
Subject: [Buildroot] [PATCH 1/1] package/python-hatch-fancy-pypi-readme:
 bump to version 23.1.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-hatch-fancy-pypi-readme.hash                       | 4 ++--
 .../python-hatch-fancy-pypi-readme.mk                         | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash
index 1b287072b7..d9fdb88e1f 100644
--- a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash
+++ b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hatch_fancy_pypi_readme/json
-md5  588776ea8e3608714d4cbba16dffa92b  hatch_fancy_pypi_readme-22.8.0.tar.gz
-sha256  da91282ca09601c18aded8e378daf8b578c70214866f0971156ee9bb9ce6c26a  hatch_fancy_pypi_readme-22.8.0.tar.gz
+md5  8755cce1a4a4d5e5d84992089801acbf  hatch_fancy_pypi_readme-23.1.0.tar.gz
+sha256  b1df44063094af1e8248ceacd47a92c9cf313d6b9823bf66af8a927c3960287d  hatch_fancy_pypi_readme-23.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  e69ea57f96e599e617f61af3e85bf326b87e833994709fb5e5908a81197730a2  LICENSE.txt
diff --git a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
index f28721181a..6195a30436 100644
--- a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
+++ b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HATCH_FANCY_PYPI_README_VERSION = 22.8.0
+PYTHON_HATCH_FANCY_PYPI_README_VERSION = 23.1.0
 PYTHON_HATCH_FANCY_PYPI_README_SOURCE = hatch_fancy_pypi_readme-$(PYTHON_HATCH_FANCY_PYPI_README_VERSION).tar.gz
-PYTHON_HATCH_FANCY_PYPI_README_SITE = https://files.pythonhosted.org/packages/4e/ab/9b48589d6e3a2f72cc1e8f5221c28ff28fcdf116dbbd6e9beb946054212d
+PYTHON_HATCH_FANCY_PYPI_README_SITE = https://files.pythonhosted.org/packages/85/a6/58d585eba4321bf2e7a4d1ed2af141c99d88c1afa4b751926be160f09325
 PYTHON_HATCH_FANCY_PYPI_README_LICENSE = MIT
 PYTHON_HATCH_FANCY_PYPI_README_LICENSE_FILES = LICENSE.txt
 PYTHON_HATCH_FANCY_PYPI_README_SETUP_TYPE = pep517
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
