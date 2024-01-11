Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA361C47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 06:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4611A41E2D;
	Thu, 11 Jan 2024 06:02:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4611A41E2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MB5--PQDhEGd; Thu, 11 Jan 2024 06:02:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 851ED41A04;
	Thu, 11 Jan 2024 06:02:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 851ED41A04
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 52B0A1BF313
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 06:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37D7583B25
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 06:02:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37D7583B25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id chzlkqBKPgQF for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 06:02:18 +0000 (UTC)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4AB8C83A75
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 06:02:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AB8C83A75
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7ba903342c2so307597239f.3
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 22:02:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704952936; x=1705557736;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=phsbvQHb1XB2sPNKEdeK1MmbvPqGMNzeVCcZnCQIBHE=;
 b=WQLbbjWlHwN/E4bzwvmn9Kl+zF6vYvwkOSxv+winWB+q+M+KkdXWmsWKStna7a4+/1
 EP2UXjKT2rOFuyj/rd0lR7/HOV9T54/QUrAeGt1qcjxS41IEnlX7k13IRFveXfUucstI
 ifCTu0Bm50j5rtDH9rZ7u4blLovQNpinop2ISSrrif+A1uNSP2oLE15mPsGR0LZjcpDl
 sk6OEWOLT03r8rL0WE1Daw7bGLEPEnE8ZGkCcBZOkHHH/tsxiisG1OBqifbJogw2Vv5B
 IeD2k5WoKPxnaY/VAYI+bUBp8zXQq0C3JboTy7BYuXPcUz2tnVWBMtXKOj92EOAkaNL9
 7HwQ==
X-Gm-Message-State: AOJu0YwRvVaEEA4MkI2WquJRQnKH2JrMwXv+0IwBmhdIBGlastr2SVR/
 rNjtcCUOilfI6tFS9iHOjJ1lR1IV3Gj7qw==
X-Google-Smtp-Source: AGHT+IFlx196AFBa0r56dj/ELvKhlKW+2TIIW4weL/HEgAw+aHnCB98eJQmJr5F2Qa8/KHh5FDsrcA==
X-Received: by 2002:a6b:590e:0:b0:7bf:3e7:97ec with SMTP id
 n14-20020a6b590e000000b007bf03e797ecmr737665iob.5.1704952936325; 
 Wed, 10 Jan 2024 22:02:16 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 i5-20020a5d8405000000b007bbab8c40d2sm83937ion.44.2024.01.10.22.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 22:02:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 23:02:14 -0700
Message-Id: <20240111060214.3026046-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704952936; x=1705557736; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=phsbvQHb1XB2sPNKEdeK1MmbvPqGMNzeVCcZnCQIBHE=;
 b=fJIangsT4coF72/hI5/k7g6xniWnXDXU3usTA3u9anI7wCwQ872FNibVz+NU6LX8h/
 lN6Duaoc3HiQFATvs6vN5AH3bN5wNm2rb7shkhf8rqysgSkbkmKxiRzJxqnN8PcIYAid
 64WBEOw29nkRNv8PWpqkv+aeRKc+y05Ktikw/aYHGoTvKUOy0u3tV3oxrlveyzpO0cbv
 BdMMsAu+jm3f1/5rOGr3Hl4Tx51MoF76fJBI6dLKSb2lX74AC8IBVVMJ3B5iSe82scYf
 hFl+xVqdlmQIgpkGR/yIkKj2uGkC7vt0tuA0NCQY0Bg1xB13wXQAn/hm+Cmz3kdZefYn
 wSCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fJIangsT
Subject: [Buildroot] [PATCH 1/1] package/python-semver: bump to version 3.0.2
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

Add new host-python-setuptools-scm build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-semver/Config.in          | 2 +-
 package/python-semver/python-semver.hash | 6 +++---
 package/python-semver/python-semver.mk   | 5 +++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-semver/Config.in b/package/python-semver/Config.in
index 4af2bbf449..db83d8edc4 100644
--- a/package/python-semver/Config.in
+++ b/package/python-semver/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_SEMVER
 	bool "python-semver"
 	help
-	  Python helper for Semantic Versioning (http://semver.org/).
+	  Python helper for Semantic Versioning (https://semver.org).
 
 	  https://github.com/python-semver/python-semver
diff --git a/package/python-semver/python-semver.hash b/package/python-semver/python-semver.hash
index 10cb0a8464..1e06167610 100644
--- a/package/python-semver/python-semver.hash
+++ b/package/python-semver/python-semver.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/semver/json
-md5  e98b5fb283ea84daa5195087de83ebf1  semver-2.13.0.tar.gz
-sha256  fa0fe2722ee1c3f57eac478820c3a5ae2f624af8264cbdf9000c980ff7f75e3f  semver-2.13.0.tar.gz
-# Locally computed
+md5  0bbc4d74959c9f1522f75ffb4ae0934d  semver-3.0.2.tar.gz
+sha256  6253adb39c70f6e51afed2fa7152bcd414c411286088fb4b9effb133885ab4cc  semver-3.0.2.tar.gz
+# Locally computed sha256 checksums
 sha256  cda490c32e61d3884dc17791fc8078f2a3e564fba98dd18b4dc64eb2720b2b6f  LICENSE.txt
diff --git a/package/python-semver/python-semver.mk b/package/python-semver/python-semver.mk
index d3a905754f..29d7ba46b1 100644
--- a/package/python-semver/python-semver.mk
+++ b/package/python-semver/python-semver.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_SEMVER_VERSION = 2.13.0
+PYTHON_SEMVER_VERSION = 3.0.2
 PYTHON_SEMVER_SOURCE = semver-$(PYTHON_SEMVER_VERSION).tar.gz
-PYTHON_SEMVER_SITE = https://files.pythonhosted.org/packages/31/a9/b61190916030ee9af83de342e101f192bbb436c59be20a4cb0cdb7256ece
+PYTHON_SEMVER_SITE = https://files.pythonhosted.org/packages/41/6c/a536cc008f38fd83b3c1b98ce19ead13b746b5588c9a0cb9dd9f6ea434bc
 PYTHON_SEMVER_SETUP_TYPE = setuptools
 PYTHON_SEMVER_LICENSE = BSD-3-Clause
 PYTHON_SEMVER_LICENSE_FILES = LICENSE.txt
+PYTHON_SEMVER_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
