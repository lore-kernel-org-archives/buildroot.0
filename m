Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC48CD11BF
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 09:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30B2A400C4;
	Sun, 24 Mar 2024 09:45:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Os6D72YQ3wx; Sun, 24 Mar 2024 09:45:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 364AE400E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 364AE400E5;
	Sun, 24 Mar 2024 09:45:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B7631BF20B
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 09:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67C8860607
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 09:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ywjE8qotKcD0 for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 09:45:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::29; helo=mail-oa1-x29.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 38FA760606
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38FA760606
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 38FA760606
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 09:45:54 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-22222357d76so1222890fac.2
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 02:45:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711273553; x=1711878353;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9lxIrXQnCR4cM9G1ZXl1mhmjheklU6V4E3M3yMkoZmI=;
 b=uVB9fnY0M+pi9YbIFpNVkbi35RbwbNoaz2viv8g2L7k93znPdOqzTjOEKHuHpevhp9
 TkWw3x92xcqFqGm3qntIHqsbghtdXbJv0yaxiR2ZIKTCqOyiHMIscO8miqaudWHyd+Sl
 JeySn3beHbQai7YSLlldfdKco+/L3MPVouDaDBaByCgiJp5Kg3vIg+ETJdJ5Ndu+WkDn
 Sud2E79gpxGw6zy170xqo4gYnr6cpXC+GXGrpWlpZaylwOur9NcJsBwk00GJdK+blV8t
 Lq+OJr+ZQtagy5TsmxvWont/RvfOMKyoiBb/uPk3gb6qphSAFWZYQtZY5KGItQQ0L129
 qtOA==
X-Gm-Message-State: AOJu0Yw2cEzqw0LExwzfebEDWEU6z1Wp7BThnBuVqZ3q0yJn6AnxJ7eN
 m1Fl/K4Ure8YVhg7U2eoRTPP9GiVLOzDAujmQg+NdtqKkYf7NwO91zy3/+AT
X-Google-Smtp-Source: AGHT+IEEJn9cYQcCegOEEe0DBvjjvstIVMTSIHyyQk3ift2JoMGsVnGqh8LxUYWHypi6bLiboVwBMQ==
X-Received: by 2002:a05:6358:282:b0:178:6c79:6ccf with SMTP id
 w2-20020a056358028200b001786c796ccfmr4967653rwj.17.1711273552628; 
 Sun, 24 Mar 2024 02:45:52 -0700 (PDT)
Received: from localhost.localdomain ([2600:8802:2a05:9000:5be:8083:7ea:b94e])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a17090a304700b0029bf9969afbsm8116947pjl.53.2024.03.24.02.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 02:45:51 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 02:45:49 -0700
Message-Id: <20240324094549.1943918-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711273553; x=1711878353; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9lxIrXQnCR4cM9G1ZXl1mhmjheklU6V4E3M3yMkoZmI=;
 b=E8Ya0ugVXiYEXgAzNlXLexWq+hL0OJ8IaFfBMVqgiTY1n0UTtmW5Bj4zbh32YLKLYg
 KLYYISsX4881qcLj207O8QwB4okoc6VRpwgH5s4emuiuuKeGlzF6hX0V+rQn4nIiORhu
 +4FxIb6owoqXQt02IerMiwjuwInOD63c8aFTPsVJzPUBt2evOuB/C7F55DETaZPY9rgs
 H9JkT1nj3B2eBatInwXjWJIVoHu8KokSQfDB2lfCOAnYhyNrjICg/oFm1oRswSc++5ap
 4Ks7m4ZAIQQeUhPFs8SGo6k9dbj0SzccgP539uDp9yniVzyFh5EIlt6sdqRAOqVVrkkY
 MqnA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=E8Ya0ugV
Subject: [Buildroot] [PATCH 1/1] package/coreutils: bump version to 9.4
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
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog - https://github.com/coreutils/coreutils/blob/9530a14420fc1a267e90d45e8a0d710c3668382d/NEWS

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
$ cat coreutils.config
BR2_PACKAGE_COREUTILS=y
BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES=y

$ ./utils/test-pkg -k -c coreutils.config -p coreutils
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: SKIPPED
                             arm-aarch64 [6/6]: OK
6 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

./utils/check-package package/coreutils/*
211 lines processed
0 warnings generated

cp --version
cp (GNU coreutils) 9.4
Copyright (C) 2023 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by Torbjorn Granlund, David MacKenzie, and Jim Meyering.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/coreutils/coreutils.hash | 2 +-
 package/coreutils/coreutils.mk   | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/coreutils/coreutils.hash b/package/coreutils/coreutils.hash
index 7df1048afa..6304813e44 100644
--- a/package/coreutils/coreutils.hash
+++ b/package/coreutils/coreutils.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  adbcfcfe899235b71e8768dcf07cd532520b7f54f9a8064843f8d199a904bbaa  coreutils-9.3.tar.xz
+sha256  ea613a4cf44612326e917201bbbcdfbd301de21ffc3b59b6e5c07e040b275e52  coreutils-9.4.tar.xz
 # Locally computed
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index e9cb7b67cb..ea6442f8f1 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COREUTILS_VERSION = 9.3
+COREUTILS_VERSION = 9.4
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPL-3.0+
@@ -14,6 +14,10 @@ COREUTILS_CPE_ID_VENDOR = gnu
 COREUTILS_CONF_OPTS = --disable-rpath \
 	$(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
 
+ifneq ($(BR2_TIME_BITS_64),y)
+COREUTILS_CONF_OPTS += --disable-year2038
+endif
+
 ifeq ($(BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES),y)
 COREUTILS_CONF_OPTS += --disable-single-binary
 else
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
