Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA42C3ABDA
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 20:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53EDD414B4;
	Wed, 14 May 2025 20:21:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IwMXI5HuikUb; Wed, 14 May 2025 20:21:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6899C41481
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6899C41481;
	Wed, 14 May 2025 20:21:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EB6B613D
 for <buildroot@buildroot.org>; Wed, 14 May 2025 20:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D13758126B
 for <buildroot@buildroot.org>; Wed, 14 May 2025 20:21:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ESKyCaAbMD2D for <buildroot@buildroot.org>;
 Wed, 14 May 2025 20:21:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 00F2B8124A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00F2B8124A
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 00F2B8124A
 for <buildroot@buildroot.org>; Wed, 14 May 2025 20:21:36 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3d93deba52fso802705ab.0
 for <buildroot@buildroot.org>; Wed, 14 May 2025 13:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747254096; x=1747858896;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KKSq17H075CczK5vU7G1HsAhHgWQ/blXSZCwRQKXIgU=;
 b=sh7tz57FK2ERtsR8YVy2AJMrRfTcZYyXuvk9HWjbkabuRwetTtLZV1AvvK6HusGlAd
 fVt5P2R5Q+yDZGZFG2962JCJyLrdmRtrQJ+gr700o8a/lqZ6ECgBznBwf6CvI+H82/t4
 0T5SCMuhbEnmQyi6MrBinpjhUgR+mjxQFOWlsdYwU7UMp752bf0DVDaVqOoUzJ2Qiz4K
 HWQFjN1H/NwL3BM8b7zR2z4fl5vtKPKaYK+3e7Kn1mla7Fulnb7ACbajfGmeOCya9RxP
 xUIpDvT9//QVusyPn+K6lDS8E7BuF5ohfaV+MbzIJye98XaH0YWA5sMj+kicKNOchlvH
 vSsA==
X-Gm-Message-State: AOJu0Yy3D5gK3UOx/9IamQEAWBex+TZDic5QH36FLmRpiTPmtTuYMQiH
 SZpvPF++3FxJe58+xhlgF4peadbpXM0noU3RvuYE2fX+te0ByvJeHOPS0ZKd
X-Gm-Gg: ASbGncvxfjp75R4xuK3URbnIcqA8sUtswNNgQPwr6c5DmqLYG+EYiwM6ckY4cLxodUv
 MoRXRhcFH+Rj9To9V5w9vzr3npiFow2z5VY7HguZscUJPf1j54pDuuBohnjniYamowxbL8H8waK
 JBbMB0wrHtk28UGtPoErQBx+wNaVmtqbFtm+rjAbrXoUyZ9K3WNodpEw3lGz+P9rfr+pIrbOeL1
 pZv+AXMfcihM6hsdzqx65vzOBm714b8pBbGKwIPuxIKqN+PB1Y3Mt5FsXpGQqZwFkApg2Cn171D
 KjcWNTMpAb8LFrpDAhBQzNXpOxVQrDx9NxqOQ1mHsEYjxV1yEE9SXBzYBWkAeAzL6sYChEn0bDK
 yn4UwaNgJ7i4UOMLd7DRO9ACHa7bLlw==
X-Google-Smtp-Source: AGHT+IFGmhufTl883LedmDkc197mPXzUnpSlsUNzgnR2INFAF1paktiOyYTEBWC65B4lhJwBApYtmg==
X-Received: by 2002:a05:6e02:4506:10b0:3db:7007:2982 with SMTP id
 e9e14a558f8ab-3db70072a5amr31892515ab.8.1747254095720; 
 Wed, 14 May 2025 13:21:35 -0700 (PDT)
Received: from james-x399.localdomain (71-218-120-130.hlrn.qwest.net.
 [71.218.120.130]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4fa22685fc3sm2739055173.141.2025.05.14.13.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 13:21:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 May 2025 14:21:31 -0600
Message-Id: <20250514202131.687200-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747254096; x=1747858896; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KKSq17H075CczK5vU7G1HsAhHgWQ/blXSZCwRQKXIgU=;
 b=ZlVPUJtoOG75WXrRwYSBTKl5qeQjGXElDBzCRIUTsqSvcJl1v3v+/MIeFaRz4rPTsX
 b9z53z/vqmu12ps8Yo/1Topm7jpy7sjf+2e83tkjIP58M2qZaDOzi5brQIMbgCeWiL6K
 +WLu4AxLXWmkVTQ/EGYZxsgXju6DzjOTlvafQg/BvGT4ZpDVA9gOPc5Ei/FAAqdAr9/x
 RCMUN1QMeCGq8qqkLzsoyfSiaFV5NNAUISIVNg+rhFcIkhMkPsC9aJcW2F6Wp9/e3kkw
 tbO1ueaJtTBHT8mElZE3bLyDl3R1lvcJzheJkL3QNy4Xndg8fJF1v2UaFbKrCfNuRrMd
 IK5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZlVPUJto
Subject: [Buildroot] [PATCH v2 1/1] package/libubootenv: fix cmake 4
 compatibility
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a patch fixing cmake 4 compatibility.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - also fix src/CMakeLists.txt
---
 ...Update-cmake_minimum_required-to-3.5.patch | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 package/libubootenv/0002-Update-cmake_minimum_required-to-3.5.patch

diff --git a/package/libubootenv/0002-Update-cmake_minimum_required-to-3.5.patch b/package/libubootenv/0002-Update-cmake_minimum_required-to-3.5.patch
new file mode 100644
index 0000000000..531623bc53
--- /dev/null
+++ b/package/libubootenv/0002-Update-cmake_minimum_required-to-3.5.patch
@@ -0,0 +1,53 @@
+From 87581f45d442903af8a9f331b11052bdd836c7f6 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Wed, 14 May 2025 14:03:38 -0600
+Subject: [PATCH] Update cmake_minimum_required to 3.5
+
+This supports compilation with cmake-4.0.0.
+
+Fixes:
+CMake Error at CMakeLists.txt:5 (cmake_minimum_required):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+  to tell CMake that the project requires at least <min> but has been updated
+  to work with policies introduced by <max> or earlier.
+
+  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://patchwork.ozlabs.org/project/swupdate/patch/20250514201740.686772-1-james.hilliard1@gmail.com/
+---
+ CMakeLists.txt     | 2 +-
+ src/CMakeLists.txt | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 796d7bc..0a11730 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -2,7 +2,7 @@
+ #
+ # SPDX-License-Identifier:     LGPL-2.1-or-later
+ 
+-cmake_minimum_required (VERSION 2.6)
++cmake_minimum_required (VERSION 3.5)
+ project (libubootenv C)
+ 
+ # The version number.
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index c56d0c7..3370232 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ # SPDX-FileCopyrightText: 2019-2021 Stefano Babic <stefano.babic@swupdate.org>
+ #
+ # SPDX-License-Identifier:     LGPL-2.1-or-later
+-cmake_minimum_required (VERSION 2.6)
++cmake_minimum_required (VERSION 3.5)
+ # Sources and private headers
+ SET(libubootenv_SOURCES
+   uboot_env.c
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
