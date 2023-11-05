Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47106C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 07:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBE8241B68;
	Sun,  5 Nov 2023 07:02:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBE8241B68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kXJ5VTzslKAv; Sun,  5 Nov 2023 07:02:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58B7541B60;
	Sun,  5 Nov 2023 07:02:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58B7541B60
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E30861BF2F9
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 07:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA84B4013D
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 07:02:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA84B4013D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2XeP3agaP02l for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 07:02:42 +0000 (UTC)
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5949F400D6
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 07:02:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5949F400D6
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-7a69a71cc1dso128359939f.0
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 00:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699167761; x=1699772561;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8vmfdTa5jlmt06/7/9ALcoHxwYeRIIUmG5d0GP4BC/w=;
 b=bld3TXkE7yFAcplgx2VRPec0LwQPHahNrG8C/Jb0MSz1F4/SfKKlptQoO+5UBS/aV9
 HYchBi0z2RM6RF3c4E+DyysG7TdUvRkBG87QSWIoqTOfy2IEdMt3YJXCb1eSxkC/xU7a
 WUM57zXIimxo4wfeDCpK36ZXy6oLpuhZDuPCqC0xjHsyLLKLlV+Bvh6pfQR6tM7gEL3Z
 N2oXAiM3Gj4cY4wXyYlInuZzmdOU2LGp8pYNS6rv9BkEpW1MCkcAlWMW+4IkpMko7VKl
 VcKgONuySE2XKwojUHHD8r8vV5vSsG2lPoAykBvQ16HUKKIsV7O8SC/CeycXUl6nUj9h
 akyg==
X-Gm-Message-State: AOJu0YxkmushFDWg03R5t/XG+WFq4NogGLIq2z4RChheHNRV8EESitPI
 kBC978gUbEDzOjTug4Bo0dnhB3Aq0dY=
X-Google-Smtp-Source: AGHT+IEDwl5GTc6NvXolhZTjJzw8WhZIhl31X1/Xg9qWjivZtth7XeebPD+kSjnNor+vqsh/qtLDPw==
X-Received: by 2002:a05:6602:1506:b0:7a9:945f:e46 with SMTP id
 g6-20020a056602150600b007a9945f0e46mr35409610iow.13.1699167760861; 
 Sun, 05 Nov 2023 00:02:40 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 l8-20020a6b7b08000000b00786cf14a8absm1554659iop.43.2023.11.05.00.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 00:02:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 01:02:38 -0600
Message-Id: <20231105070238.2868381-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699167761; x=1699772561; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8vmfdTa5jlmt06/7/9ALcoHxwYeRIIUmG5d0GP4BC/w=;
 b=ZO6uPiFtRYDcYPqa5lSNJ2bzgWRLZmvrWpbYBiF5tNI/Ix/7SKMBsbwzu3DxUWGSmC
 lOpbRhu2Ozf11zezfnvXzsOxVN6Zkn0oPf+0TNpyb75FDE+L1tan0CBu/Uf+VX5Cne8i
 y3g83Xsrpt0e2BCVjcgzjyGFu8EIuDgZskA8mQYpTXfBONRvoYQ6qmwtVxlUTEH4BnQg
 kJ6nqzZnLmtI3kXhkS44G0gl1KCkhRBSmZsnm9EsA87GXh4DETtlejEW3B1uNkp0ZJB0
 eL8ZCu/LUx5HLhWjAcow63rzFSByvgcS5iBjhZk8be57E5f2GB01zbxX+PPoranQ0u1q
 nCTg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZO6uPiFt
Subject: [Buildroot] [PATCH 1/1] package/python-git: bump to version 3.1.40
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

Drop no longer required python-typing-extensions dependency.

Switch to pypi based source download.

License hash changed due to formatting tweaks:
https://github.com/gitpython-developers/GitPython/commit/e1af18377fd69f9c1007f8abf6ccb95b3c5a6558

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-git/Config.in       | 1 -
 package/python-git/python-git.hash | 8 +++++---
 package/python-git/python-git.mk   | 5 +++--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-git/Config.in b/package/python-git/Config.in
index 3c23f91c36..183b377c46 100644
--- a/package/python-git/Config.in
+++ b/package/python-git/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_PYTHON_GIT
 	depends on BR2_USE_MMU # git
 	select BR2_PACKAGE_GIT # runtime
 	select BR2_PACKAGE_PYTHON_GITDB2 # runtime
-	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  GitPython is a python library used to interact with git
 	  repositories, high-level like git-porcelain, or low-level
diff --git a/package/python-git/python-git.hash b/package/python-git/python-git.hash
index 0c8c764bf3..a979871796 100644
--- a/package/python-git/python-git.hash
+++ b/package/python-git/python-git.hash
@@ -1,3 +1,5 @@
-# locally computed hashes
-sha256  8282d0d1169a3a98546979bfae1524608670fadc4ca7636517aadd428e0cfbeb  python-git-3.1.24.tar.gz
-sha256  fd657ffc2cef63d25c78cab7808d414dd03a282e63893491fd11c32f98be67fb  LICENSE
+# md5, sha256 from https://pypi.org/pypi/gitpython/json
+md5  db4f2a27c8abc4a7e25504e3aeab4a84  GitPython-3.1.40.tar.gz
+sha256  22b126e9ffb671fdd0c129796343a02bf67bf2994b35449ffc9321aa755e18a4  GitPython-3.1.40.tar.gz
+# Locally computed sha256 checksums
+sha256  86fc94c321a9afbc11514713511bafded225f25100dcc0f7350e82bc231b8beb  LICENSE
diff --git a/package/python-git/python-git.mk b/package/python-git/python-git.mk
index 9b2771ca07..91d6b07ab1 100644
--- a/package/python-git/python-git.mk
+++ b/package/python-git/python-git.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GIT_VERSION = 3.1.24
-PYTHON_GIT_SITE = $(call github,gitpython-developers,GitPython,$(PYTHON_GIT_VERSION))
+PYTHON_GIT_VERSION = 3.1.40
+PYTHON_GIT_SOURCE = GitPython-$(PYTHON_GIT_VERSION).tar.gz
+PYTHON_GIT_SITE = https://files.pythonhosted.org/packages/0d/b2/37265877ae607a2cbf9a471f4581dbf5ed13a501b90cb4c773f9ccfff3ea
 PYTHON_GIT_LICENSE = BSD-3-Clause
 PYTHON_GIT_LICENSE_FILES = LICENSE
 PYTHON_GIT_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
