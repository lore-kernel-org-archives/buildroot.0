Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC11C38142
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 00:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A60DF4056A;
	Wed,  1 Feb 2023 00:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A60DF4056A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dEfTBpbQqhej; Wed,  1 Feb 2023 00:02:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF13540566;
	Wed,  1 Feb 2023 00:02:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF13540566
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D85E91BF281
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 00:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1C18418A8
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 00:02:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1C18418A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lAo_zLdk34NY for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 00:02:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70295418A4
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70295418A4
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 00:02:53 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id o1so2502265ioo.10
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 16:02:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fNvOhkuM/ZqM3Yo6K8IPog4InQGuhs1h57SKPxXYLac=;
 b=Mjp0mt5cNCtrRSu0RfyB8iDFQ/Wt9saLE+UaRVXJlzlk+g15b3pCtc+K7B3uMCf1Qd
 2GA1tGSyD12E/SD4u7XQkNITMDOmWDdZsy4CTgO9ixW1mccTxv4kfzBrUJ66XWrKSJIH
 e/K+N/tOmKqrbelyIcsfUdUFfo1COqfZH60vzQnaGsPmBBrT9dgJYCzZsxXr8Wtf4hIu
 AqpPuNuFwBq1Q9jmrO7KS/xi/CrzvRLIyWC9VKdWdtHRklqE8sbR00Eh1RR0xY9zyjGR
 2YBFNRLXqSOlRC6Af9+SVtYDL2jaoUVdpNvmpwWh1oLBf7UosddBMS54NkiZMKN7YhxS
 RIgA==
X-Gm-Message-State: AO0yUKXITfCVGVrKpcKihsdAl6OZ9FCJfPhGwcqe2iFJe46/d8lplTfm
 WQ/XzW2Sq1VVDFuEjJGVdGhaQPHfxwG8iA==
X-Google-Smtp-Source: AK7set+kFdlWacLj7a3xfAMIfRQLDN4iLkNZzolyxrAsLTO2mnutwwZS0W+R2n5Me+i/7W5XnNog2Q==
X-Received: by 2002:a05:6602:160b:b0:719:4d5:82a2 with SMTP id
 x11-20020a056602160b00b0071904d582a2mr318716iow.11.1675209772221; 
 Tue, 31 Jan 2023 16:02:52 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 m6-20020a02a146000000b0039e9264f42csm6044118jah.80.2023.01.31.16.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 16:02:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 Jan 2023 17:02:48 -0700
Message-Id: <20230201000248.1104432-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fNvOhkuM/ZqM3Yo6K8IPog4InQGuhs1h57SKPxXYLac=;
 b=hiu07LaLbW1FPKuEBgl+QWEt56nvja+Z02bJgf40g5KMFN6v6efgqwDGYJzLdK43q0
 fUQJo33M6blQJMaiVOl4e++eRcHEz9eXPOZsIGsXkawL70pC6lezcPh+Vcjf1PiE1Kkk
 sxBbP2e87Wy59uOxGjWoLXZqDPktkGzo5rE5zc77jq3GNVSHeY8DE5yjHdSqiDlsuHqQ
 +2nKJo23Rf1e2zhzpXy5vpE1dekjCCW5IJ3Eian84VUAs+BL3aP8AlCsuhWARL+W0uz0
 nOHDHmv5ToWoRgvJ1oi4jupdtHMT8KYHt0mPn5rPbme0/eAotWmW550hdpp2Z43K+Y+B
 4c/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hiu07LaL
Subject: [Buildroot] [PATCH 1/1] package/neon-2-sse: bump to version
 097a5ecacd527d5b5c3006e360fb9cb1c1c48a1f
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

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../neon-2-sse/0001-Fix-cmake-languages.patch | 40 -------------------
 package/neon-2-sse/neon-2-sse.hash            |  2 +-
 package/neon-2-sse/neon-2-sse.mk              |  2 +-
 3 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 package/neon-2-sse/0001-Fix-cmake-languages.patch

diff --git a/package/neon-2-sse/0001-Fix-cmake-languages.patch b/package/neon-2-sse/0001-Fix-cmake-languages.patch
deleted file mode 100644
index e0becb1ffa..0000000000
--- a/package/neon-2-sse/0001-Fix-cmake-languages.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 186ec82e033d8c718d760d14945535a9d7e160fd Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Sun, 29 Jan 2023 21:00:27 -0700
-Subject: [PATCH] Fix cmake languages
-
-When no language is set cmake defaults to C and CXX, since we support
-C by itself we should set the project language to C so that we don't
-get a compiler error when building without a CXX toolchain.
-
-Fixes:
-CMake Error at CMakeLists.txt:5 (project):
-  No CMAKE_CXX_COMPILER could be found.
-
-  Tell CMake where to find the compiler by setting either the environment
-  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
-  to the compiler, or to the compiler name if it is in the PATH.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[Upstream status:
-https://github.com/intel/ARM_NEON_2_x86_SSE/pull/62]
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index e4b8980..8f58e79 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -2,7 +2,7 @@
- # Modification: Copyright (C) 2017 David Hirvonen
- 
- cmake_minimum_required(VERSION 3.0)
--project(NEON_2_SSE VERSION 1.0.0)
-+project(NEON_2_SSE VERSION 1.0.0 LANGUAGES C)
- 
- add_library(${PROJECT_NAME} INTERFACE)
- 
--- 
-2.34.1
-
diff --git a/package/neon-2-sse/neon-2-sse.hash b/package/neon-2-sse/neon-2-sse.hash
index ded20d58f5..f964d2fa61 100644
--- a/package/neon-2-sse/neon-2-sse.hash
+++ b/package/neon-2-sse/neon-2-sse.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  019fbc7ec25860070a1d90e12686fc160cfb33e22aa063c80f52b363f1361e9d  neon-2-sse-a15b489e1222b2087007546b4912e21293ea86ff.tar.gz
+sha256  4567ca8c8cbc8ce0ea3ddb9dc0f158707eb85c631cb400fd7010cd299cdc5377  neon-2-sse-097a5ecacd527d5b5c3006e360fb9cb1c1c48a1f.tar.gz
 # License files, locally calculated
 sha256  7022f51b439a5915e933ecc270c83e24ca0cb2cceeb08b0132dcd4dbb03ed2dc  LICENSE
diff --git a/package/neon-2-sse/neon-2-sse.mk b/package/neon-2-sse/neon-2-sse.mk
index 3e87c62e21..ee6f5446b6 100644
--- a/package/neon-2-sse/neon-2-sse.mk
+++ b/package/neon-2-sse/neon-2-sse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEON_2_SSE_VERSION = a15b489e1222b2087007546b4912e21293ea86ff
+NEON_2_SSE_VERSION = 097a5ecacd527d5b5c3006e360fb9cb1c1c48a1f
 NEON_2_SSE_SITE = $(call github,intel,ARM_NEON_2_x86_SSE,$(NEON_2_SSE_VERSION))
 NEON_2_SSE_LICENSE = BSD-2-Clause
 NEON_2_SSE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
