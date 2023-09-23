Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E578CE7A89
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 09:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17AD641899;
	Sat, 23 Sep 2023 09:39:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17AD641899
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L7m8pTUYvfBX; Sat, 23 Sep 2023 09:39:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CE0E41D71;
	Sat, 23 Sep 2023 09:39:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CE0E41D71
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A21E1BF834
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 09:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E683C4189D
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 09:39:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E683C4189D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MOknsv3ZNnWX for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 09:39:05 +0000 (UTC)
Received: from mail.light-speed.de (mail.light-speed.de
 [IPv6:2a01:238:43f2:8900:dd04:e3a0:ee11:a73d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A5CDD41899
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 09:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5CDD41899
Received: from bilbo.fritz.box (ip5f5a8b4a.dynamic.kabel-deutschland.de
 [95.90.139.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.light-speed.de (Postfix) with ESMTPSA id 4781A3D42A65;
 Sat, 23 Sep 2023 11:39:02 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sat, 23 Sep 2023 11:39:01 +0200
Message-Id: <20230923093901.1372593-1-mail@jens-maus.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jens-maus.de; s=mail; t=1695461942;
 bh=tckRiRwIQqRY9X9jC6gz+n41boTNwXO6+g4qndP3FKU=;
 h=From:To:Cc:Subject:Date;
 b=i1ujDf3bJcmZkZeu3NvD+tfTtjJfuDTWuPUO91qH5RZDMI9gqvOR8aShTkWH9PNPD
 y/tPrZ2B7qBjao7IeoTgnjbVR92jbQylZL4Pqdt/UgSe5nQNfUprEcd14GUrWDk2A+
 VfJqY4h7lGTM+frfJz8ByYdmWZiRa7DVfyPBHUyI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=jens-maus.de header.i=@jens-maus.de
 header.a=rsa-sha256 header.s=mail header.b=i1ujDf3b
Subject: [Buildroot] [PATCH] package/nodejs: fix parallel build
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
From: Jens Maus via buildroot <buildroot@buildroot.org>
Reply-To: Jens Maus <mail@jens-maus.de>
Cc: Martin Bark <martin@barkynet.com>, Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In ninja-based nodejs builds performing parallel builds using "make -jX"
is not working during buildroot initiated builds because the JOBS
variable is set in the MAKE_OPTS variables in nodejs.mk. This commit
remedies the issue by setting JOBS to BR2_JLEVEL and also by fixing the
top-level Makefile of nodejs due to an incorrect tab-based indentation
being used. Furthermore, it is important to also set LD_LIBRARY_PATH in
v8-qemu-wrapper.in to our staging libdirs as otherwise execution of
build tools fail due to host OS libraries being preferred.

Signed-off-by: Jens Maus <mail@jens-maus.de>
---
 ...-fixing-Makefile-for-parallel-builds.patch | 37 +++++++++++++++++++
 package/nodejs/nodejs.mk                      |  6 ++-
 package/nodejs/v8-qemu-wrapper.in             |  1 +
 3 files changed, 42 insertions(+), 2 deletions(-)
 create mode 100644 package/nodejs/0005-fixing-Makefile-for-parallel-builds.patch

diff --git a/package/nodejs/0005-fixing-Makefile-for-parallel-builds.patch b/package/nodejs/0005-fixing-Makefile-for-parallel-builds.patch
new file mode 100644
index 0000000000..73db129979
--- /dev/null
+++ b/package/nodejs/0005-fixing-Makefile-for-parallel-builds.patch
@@ -0,0 +1,37 @@
+From 1c4582c7dd7c80fbac89031d8fa8cf418249d01e Mon Sep 17 00:00:00 2001
+From: Jens Maus <mail@jens-maus.de>
+Date: Sat, 23 Sep 2023 11:09:50 +0200
+Subject: [PATCH] fixing Makefile for parallel builds
+
+This change fixing incorrect GNU makefile indentation in the top-level
+Makefile which causes issues with parallel "make -jXX" builds.
+
+Upstream: N/A (specific to buildroot builds)
+Signed-off-by: Jens Maus <mail@jens-maus.de>
+---
+ Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index b7871bf218..87c47bcc0b 100644
+--- a/Makefile
++++ b/Makefile
+@@ -138,12 +138,12 @@ else
+ ifeq ($(BUILD_WITH), ninja)
+ NINJA ?= ninja
+ ifeq ($(V),1)
+-	NINJA_ARGS := $(NINJA_ARGS) -v
++NINJA_ARGS := $(NINJA_ARGS) -v
+ endif
+ ifdef JOBS
+-	NINJA_ARGS := $(NINJA_ARGS) -j$(JOBS)
++NINJA_ARGS := $(NINJA_ARGS) -j$(JOBS)
+ else
+-	NINJA_ARGS := $(NINJA_ARGS) $(filter -j%,$(MAKEFLAGS))
++NINJA_ARGS := $(NINJA_ARGS) $(filter -j%,$(MAKEFLAGS))
+ endif
+ $(NODE_EXE): config.gypi out/Release/build.ninja
+ 	$(NINJA) -C out/Release $(NINJA_ARGS)
+-- 
+2.34.1
+
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index fe629ada21..4e70bd71a3 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -46,14 +46,16 @@ HOST_NODEJS_MAKE_OPTS = \
 	CXXFLAGS="$(HOST_NODEJS_CXXFLAGS)" \
 	LDFLAGS.host="$(HOST_LDFLAGS)" \
 	NO_LOAD=cctest.target.mk \
-	PATH=$(@D)/bin:$(BR_PATH)
+	PATH=$(@D)/bin:$(BR_PATH) \
+	JOBS=$(BR2_JLEVEL)
 
 NODEJS_MAKE_OPTS = \
 	$(TARGET_CONFIGURE_OPTS) \
 	NO_LOAD=cctest.target.mk \
 	PATH=$(@D)/bin:$(BR_PATH) \
 	LDFLAGS="$(NODEJS_LDFLAGS)" \
-	LD="$(TARGET_CXX)"
+	LD="$(TARGET_CXX)" \
+	JOBS=$(BR2_JLEVEL)
 
 # nodejs's build system uses python which can be a symlink to an unsupported
 # python version (e.g. python 3.10 with nodejs 14.18.1). We work around this by
diff --git a/package/nodejs/v8-qemu-wrapper.in b/package/nodejs/v8-qemu-wrapper.in
index e1083f47f7..48222d089b 100644
--- a/package/nodejs/v8-qemu-wrapper.in
+++ b/package/nodejs/v8-qemu-wrapper.in
@@ -5,5 +5,6 @@
 exec @QEMU_USER@ -r @TOOLCHAIN_HEADERS_VERSION@ \
     @QEMU_USERMODE_ARGS@ \
    -L "${STAGING_DIR}/" \
+   -E LD_LIBRARY_PATH="${STAGING_DIR}/lib:${STAGING_DIR}/usr/lib/" \
     "$@"
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
