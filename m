Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B67C54EAA
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 04:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9110C41591;
	Mon, 30 Jan 2023 04:10:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9110C41591
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aZfMbAWdc4Z6; Mon, 30 Jan 2023 04:10:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 669624159C;
	Mon, 30 Jan 2023 04:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 669624159C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 33B471BF333
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 04:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07BB140146
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 04:10:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07BB140146
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JmIOlibo3My1 for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 04:10:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06A0540126
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06A0540126
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 04:10:13 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id w13so609561ilv.3
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 20:10:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7DOZupcMmywVDQckO6Bp2wyKH6Rf/SqeJLbtj+NXgzw=;
 b=QZk1vXv1t6WlDPQj2PRFZvmHBu5ywdGQ44wAXUW3n4q2k5tiaH0dNrjPD3Rwf6gaXT
 FAfTCuQYC63X3T7frmBEiCTd54OSjd54Y1bqPqVbCt0jsavmWZvw2u3ldxIgZDDmQX1G
 puHv16n0Sr6PpFfKl9uhzGoU8x+6+XYX/3sH/5LBOagtFgZ6y5/zSKzL7Sk37HQSSV7A
 VgGxq9qVD2Ib7AmOMjPYm2p0Qfzgj4XH0pRnmBlYlY+1xR0XIJJqqXsodKC3eMSLJiTx
 z/GeJR+nDn9Mh7Lzt9sI/NGuNFb2Jjpkwkw0PlTSp4Am51EiXpYqukFV1S5cKZ21KnsV
 PnfQ==
X-Gm-Message-State: AFqh2kr4qFQ3ADFNpsqiifIKq0fT2qLlXro7KsuprBhFrH0duN/Z41Wt
 gwjkjW3/8L3bfKoA+mqytNHkPXZJTnPZQA==
X-Google-Smtp-Source: AMrXdXvasV1ICETzisFlE1LYHe9xjOT2DcW7kzOtguZegGUx2hNs/SaLxCtx1k1xpp3cRpCbguTj8Q==
X-Received: by 2002:a05:6e02:1a61:b0:30c:5c54:c25a with SMTP id
 w1-20020a056e021a6100b0030c5c54c25amr46089462ilv.14.1675051812827; 
 Sun, 29 Jan 2023 20:10:12 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 h13-20020a056638062d00b003a970f21f9asm3386738jar.78.2023.01.29.20.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:10:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 21:10:09 -0700
Message-Id: <20230130041009.3531224-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7DOZupcMmywVDQckO6Bp2wyKH6Rf/SqeJLbtj+NXgzw=;
 b=U+pbFBhF62IJUOx2bwtkhSCOV5PazL+0CQvUhzriuBSbe/WSmgkWK5umxuzVu4WsM8
 rmb7iRTsQaQ7ugcdyr4wJqJ0Hm75sBna+TLlShjN+CGmDeu+Rzv0JY3TOQX6vvLFo6Qg
 M6J4u/JlZYE3bKtR1jjeTZJ2Zx1jRqu7BvsaS3e767PTjOc6lts5jMAFT5Rgr0JBPAM7
 CK/x8p7DXdoh+Tv0IomqUJxsbIJ8a92bARKFhnh6q6v/B1+BZeOkmgLZnMyoW0Zu1JwD
 30s1T/zbfKfKDf0/yEJuMdrACd6D0CdGnzvhnz+TNz7zL/vqOyM5G071NVvAkS0SVOOB
 7INA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=U+pbFBhF
Subject: [Buildroot] [PATCH 1/1] package/neon-2-sse: fix build without C++
 toolchain
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The cmake project for neon-2-sse doesn't correctly set the project
language to C which causes cmake to try and detect a C++ compiler.

Add a patch which fixes the project language setting.

Fixes:
 - http://autobuild.buildroot.net/results/0eb/0ebb8c886e0a432b6fb43ab21010f625f6797b9e
 - http://autobuild.buildroot.net/results/a5d/a5db2f286dbd69e84d518d086df857ef434b936a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../neon-2-sse/0001-Fix-cmake-languages.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/neon-2-sse/0001-Fix-cmake-languages.patch

diff --git a/package/neon-2-sse/0001-Fix-cmake-languages.patch b/package/neon-2-sse/0001-Fix-cmake-languages.patch
new file mode 100644
index 0000000000..e0becb1ffa
--- /dev/null
+++ b/package/neon-2-sse/0001-Fix-cmake-languages.patch
@@ -0,0 +1,40 @@
+From 186ec82e033d8c718d760d14945535a9d7e160fd Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Sun, 29 Jan 2023 21:00:27 -0700
+Subject: [PATCH] Fix cmake languages
+
+When no language is set cmake defaults to C and CXX, since we support
+C by itself we should set the project language to C so that we don't
+get a compiler error when building without a CXX toolchain.
+
+Fixes:
+CMake Error at CMakeLists.txt:5 (project):
+  No CMAKE_CXX_COMPILER could be found.
+
+  Tell CMake where to find the compiler by setting either the environment
+  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
+  to the compiler, or to the compiler name if it is in the PATH.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/intel/ARM_NEON_2_x86_SSE/pull/62]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e4b8980..8f58e79 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -2,7 +2,7 @@
+ # Modification: Copyright (C) 2017 David Hirvonen
+ 
+ cmake_minimum_required(VERSION 3.0)
+-project(NEON_2_SSE VERSION 1.0.0)
++project(NEON_2_SSE VERSION 1.0.0 LANGUAGES C)
+ 
+ add_library(${PROJECT_NAME} INTERFACE)
+ 
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
