Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7C5CF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 06:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99931402E4;
	Sun, 22 Sep 2024 06:19:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y8TL53I1tfB8; Sun, 22 Sep 2024 06:19:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37C2C40360
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37C2C40360;
	Sun, 22 Sep 2024 06:19:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F1C181BF575
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 06:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFE98405E9
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 06:19:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jTABQFXDInOY for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 06:19:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 988F840598
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 988F840598
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 988F840598
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 06:19:40 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3a0b5973fe0so16807515ab.3
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 23:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726985979; x=1727590779;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rne05XIYeB7FN7Y3fJSVt6QYi3gakze9pRIZAn2wSy0=;
 b=vlD7FyHkAhpVigiSOp2k4zhCSlZ5RaJ+gws06VrO3podN0l9DVvEI8fVCr77Zb6cSk
 m3QihTfnrxEJCYkywKL+ddct4RhMhv7PRFg78+5KW2W8c5McG3C3KuyLcdEf7mRjnIxr
 udMcYQeNBzH2BdZAEmOkmoK84yleUpRwI2siXxGt/DnW22PbxCaSk3aD1VK/x2O/bvoY
 So1zMxKOhQ26uBhnYhQN4723Rm+vR5PG1Y3aLjlv1tX3TUtaWWe2SwiDNDsPRGZb8K+b
 JqKMMteqlDsQCaxIXOdNu0K9ZEv+ddVbn/PPRITdcpdX3hYevBTSSMxDGN1LHY81xySZ
 WvUQ==
X-Gm-Message-State: AOJu0YwLGyMpAAx9eXlGMcujzfPm2kwkBm/z35nDTHlnd8kviUHoUpHR
 CBrFVx6JI2NL+vIDANW8WxPF8rPksFVwUnLaplL5OHPESXqv167+4643Hg==
X-Google-Smtp-Source: AGHT+IH3tjAnRMghXtR3EM3YAYR4ohvGS/o+iC6tQYuMsYXa/3yc1WMz3fdrrQtFjM8ePJu68EznBw==
X-Received: by 2002:a92:cda5:0:b0:3a0:98f7:101d with SMTP id
 e9e14a558f8ab-3a0c8d231d4mr52622815ab.21.1726985979279; 
 Sat, 21 Sep 2024 23:19:39 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e90107sm52545845ab.85.2024.09.21.23.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 23:19:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 00:19:37 -0600
Message-Id: <20240922061937.962203-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726985979; x=1727590779; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rne05XIYeB7FN7Y3fJSVt6QYi3gakze9pRIZAn2wSy0=;
 b=KZPgEaHfRU1HHfSDbxo6Cs6pUn2O/nTDZXtUc1b6Ue/Uz/guNNIa7z/8/7Bm79fEeO
 4hiWCcHn0dzmd1IHGTBFJiymm3N/1G82GmbiuN6O+4stHw6wwCx3P4iM3KP7zS/qwbx+
 b3wX38RorDX6B1ZXRWjTTIzplw9OigRBOkx3XF4HqUWTJbK9DWpWcqfQf093PkYHMe3A
 hm1ki+YdSrZyWj79SEnHT69V/hkT2ialH0NzOlVkdwUsdR/FUYISNeOGvCWLwMkvIbxf
 /5GvEY6Okb8ZHTmnNt9PxqoupndbAsk29mqqF554B5a6hhWB0uI0NIhFye1llAS6mT0U
 ruMQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KZPgEaHf
Subject: [Buildroot] [PATCH 1/1] package/python-watchdog: bump to version
 5.0.2
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

Drop all runtime dependendencies which are no longer required.

License hash changed due to header update:
https://github.com/gorakhargosh/watchdog/commit/80576b4124dc0892a393365754ffe4e1521e3427

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-watchdog/Config.in            | 4 ----
 package/python-watchdog/python-watchdog.hash | 6 +++---
 package/python-watchdog/python-watchdog.mk   | 4 ++--
 3 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/package/python-watchdog/Config.in b/package/python-watchdog/Config.in
index 18f569ee44..06518e0fde 100644
--- a/package/python-watchdog/Config.in
+++ b/package/python-watchdog/Config.in
@@ -1,9 +1,5 @@
 config BR2_PACKAGE_PYTHON_WATCHDOG
 	bool "python-watchdog"
-	select BR2_PACKAGE_PYTHON_ARGH # runtime
-	select BR2_PACKAGE_PYTHON_PATHTOOLS # runtime
-	select BR2_PACKAGE_PYTHON_PYYAML # runtime
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	help
 	  Python API and shell utilities to monitor file system events.
 
diff --git a/package/python-watchdog/python-watchdog.hash b/package/python-watchdog/python-watchdog.hash
index 0653787110..0d6047e21b 100644
--- a/package/python-watchdog/python-watchdog.hash
+++ b/package/python-watchdog/python-watchdog.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/watchdog/json
-md5  04cda210c7ffd04582d2466328ee7368  watchdog-2.2.1.tar.gz
-sha256  cdcc23c9528601a8a293eb4369cbd14f6b4f34f07ae8769421252e9c22718b6f  watchdog-2.2.1.tar.gz
+md5  7e4eff2cd9a3e62f0dccd55801d5b0c0  watchdog-5.0.2.tar.gz
+sha256  dcebf7e475001d2cdeb020be630dc5b687e9acdd60d16fea6bb4508e7b94cf76  watchdog-5.0.2.tar.gz
 # Locally computed sha256 checksums
-sha256  02c8760f988a76e92a9d6cb525456a86f7b0fd1953870dd491de5955cb974d41  COPYING
+sha256  39f081828db6f94c70123fa4fb30c1bce3e215a8fdece53a49991fe076a69c08  COPYING
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-watchdog/python-watchdog.mk b/package/python-watchdog/python-watchdog.mk
index 9c058e38ad..2a2b80b04b 100644
--- a/package/python-watchdog/python-watchdog.mk
+++ b/package/python-watchdog/python-watchdog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WATCHDOG_VERSION = 2.2.1
+PYTHON_WATCHDOG_VERSION = 5.0.2
 PYTHON_WATCHDOG_SOURCE = watchdog-$(PYTHON_WATCHDOG_VERSION).tar.gz
-PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/11/6f/0396d373e039b89c60e23a1a9025edc6dd203121fe0af7d1427e85d5ec98
+PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/cd/5e/95dcd86d8339fcf76385f7fad5e49cbfd989b6c6199127121c9587febc65
 PYTHON_WATCHDOG_SETUP_TYPE = setuptools
 PYTHON_WATCHDOG_LICENSE = Apache-2.0
 PYTHON_WATCHDOG_LICENSE_FILES = LICENSE COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
