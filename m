Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA89AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 03:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 419BA40B31;
	Sun, 24 Jul 2022 03:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 419BA40B31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5G8QOY1kWHKe; Sun, 24 Jul 2022 03:08:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 257FF405E5;
	Sun, 24 Jul 2022 03:08:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 257FF405E5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7EE691BF401
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 03:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 591CB814A9
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 03:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 591CB814A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ROGDHnqZqYc for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 03:08:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C171B8145F
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C171B8145F
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 03:08:53 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id 1so4068246ill.11
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jj8LkpPQ/dNiqnujwzFIeLOk1iKFLEON6L+SO2Jfxi4=;
 b=cpz3z/KqUnAmhVLDFYYjQsEZgLjrOO45xl/6UEsPxnQvgIDCtyM4PXnaFkJZio7S26
 d3JzAjEqLLuWQUare0rFT1uIksoL+Y4TavvmTdHUL7BWVw8rYcmhkCiS6Iz9y2jIYU2e
 Gk9MhQQ7Yz4YGrsd39ZT4pzk2eIFsWPjLoSoWTXZogbovdGR7Rf2SEZoRrSLAJDFpIPi
 QpmwlD+BNkctvQDnr21luq1L8mSxyoq0EvO8kIo50lrqCmw5g10Sca8xIIHjRJ+gJkTx
 f2kmA8rSPi1XUpgA9xk8czxeoNu6IOBMhVfbfTYEO1guTNEGG9cHLMNgk5xf6DaxtYH0
 PKrw==
X-Gm-Message-State: AJIora/qausPqeBoDiTtIBvWwJPqCBUqTWyoPBTggQ5XEfNqyKWD5lCU
 3Tcfgmf9ifMTNZeEsM9WaIPYo5sTNj6O+w==
X-Google-Smtp-Source: AGRyM1t+XXvuexchN1bpkBH9zeNEu/GJrHA2m6jPkOLJ9bFZv16alUWCavfxDBkYMiZIPMD32GBQSA==
X-Received: by 2002:a05:6e02:168a:b0:2dd:286d:c3a2 with SMTP id
 f10-20020a056e02168a00b002dd286dc3a2mr2107205ila.109.1658632132586; 
 Sat, 23 Jul 2022 20:08:52 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 g17-20020a05663810f100b00331598832besm3854455jae.25.2022.07.23.20.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 20:08:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 21:08:50 -0600
Message-Id: <20220724030850.1107827-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jj8LkpPQ/dNiqnujwzFIeLOk1iKFLEON6L+SO2Jfxi4=;
 b=MruuQ2C7heSEVJ5hR1sJoUhAdMislDshCBDZ1XjoXJoLDEuoiv7pm80V5BreIAeKuQ
 yzR50OmzQf7kT14up9DdR1db589Yz3NaMSuPBHClcFHPHluNWP+tSykQ2bnMgV6MIjld
 tfF3rpLEcObXvJkLnZgGd4QGFFbdeAHOweK7fd1jFuVvV0PDZma5cwPdARSVtFneTipL
 yr6P4gDppSwcdzzm3os5AHSxESleXIgT4oRvfYaItiSiiqyJSOk8KyqfHzOK9ccYaMNh
 ob4ArnfgW5j5OrU9ihgtn9XObL3sCItmLQdGK29d9JMNQ2Zp5ItmbmofqMsEEwRDiIIx
 Tm9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MruuQ2C7
Subject: [Buildroot] [PATCH 1/1] package/python-pillow: bump to version 9.2.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...Search-pkg-config-system-libs-cflags.patch | 33 -------------------
 package/python-pillow/python-pillow.hash      |  4 +--
 package/python-pillow/python-pillow.mk        |  4 +--
 3 files changed, 4 insertions(+), 37 deletions(-)
 delete mode 100644 package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch

diff --git a/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch b/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch
deleted file mode 100644
index d0552ce0f4..0000000000
--- a/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 9ea46247048f861f088f09541cd434aeb16e6f9c Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Tue, 15 Mar 2022 23:31:59 -0600
-Subject: [PATCH] Search pkg-config system libs/cflags.
-
-We need to search the system paths as well from pkg-config for
-some packages to be found properly.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-9ea46247048f861f088f09541cd434aeb16e6f9c]
----
- setup.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 9a05e5105..d41aedbd6 100755
---- a/setup.py
-+++ b/setup.py
-@@ -252,8 +252,8 @@ def _cmd_exists(cmd):
- def _pkg_config(name):
-     try:
-         command = os.environ.get("PKG_CONFIG", "pkg-config")
--        command_libs = [command, "--libs-only-L", name]
--        command_cflags = [command, "--cflags-only-I", name]
-+        command_libs = [command, "--libs-only-L", "--keep-system-libs", name]
-+        command_cflags = [command, "--cflags-only-I", "--keep-system-cflags", name]
-         if not DEBUG:
-             command_libs.append("--silence-errors")
-             command_cflags.append("--silence-errors")
--- 
-2.25.1
-
diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index ff23ed6299..0e407bd55c 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  f0d347298e72b403fbc3198677f394bb  Pillow-9.1.1.tar.gz
-sha256  7502539939b53d7565f3d11d87c78e7ec900d3c72945d4ee0e2f250d598309a0  Pillow-9.1.1.tar.gz
+md5  218bdb951f3e59e8b782e329ece3416d  Pillow-9.2.0.tar.gz
+sha256  75e636fd3e0fb872693f23ccb8a5ff2cd578801251f3a4f6854c6a5d437d3c04  Pillow-9.2.0.tar.gz
 
 # Locally computed sha256 checksums
 sha256  a6554cb737ba6c9b47d3301f78de03b4ed0d3f08d6cf9400714f3d4c894f6943  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 0d189ac0ca..7cff54e9ea 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 9.1.1
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/43/6e/59853546226ee6200f9ba6e574d11604b60ad0754d2cbd1c8f3246b70418
+PYTHON_PILLOW_VERSION = 9.2.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/8c/92/2975b464d9926dc667020ed1abfa6276e68c3571dcb77e43347e15ee9eed
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
