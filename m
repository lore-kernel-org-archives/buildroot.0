Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081F0EC8733
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B657382321;
	Thu,  7 Sep 2023 15:00:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B657382321
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bmpqQlqcaNCi; Thu,  7 Sep 2023 15:00:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C35A82358;
	Thu,  7 Sep 2023 15:00:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C35A82358
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 517121BF990
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35C886125D
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35C886125D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g_iPZqYnsJFB for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E81161263
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E81161263
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CC60869E0; Thu,  7 Sep 2023 14:51:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 7 Aug 2023 19:37:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0fe729f70ef695d0f355226d69b7ae7ab4a9b56b
X-Git-Newrev: a0c0bc9d33eb1a3b481e30021d31d20e257b337d
X-Patchwork-Hint: ignore
Message-Id: <20230907145127.7CC60869E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-cmake: fix late expansion in
 infra
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a0c0bc9d33eb1a3b481e30021d31d20e257b337d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 4cf79d9b71ff (pkg-cmake: add option to select the Ninja
generator) forgot to account for the late expansion rule in the inner
infrastructure macros, which breaks the build in two ways:

 1. the expansion of $(firstword $$(MAKE)) does not actually expands to
    the first word, but to the full value of $(MAKE);

 2. the paths are invalid for per-package directories.

Fix that by applying the proper double-dollar rule for inner macros.

Reported-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-cmake.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index e085fb2b5d..8f391eb4c9 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -65,7 +65,7 @@ endif
 ifeq ($$($(3)_CMAKE_BACKEND),make)
 $(2)_GENERATOR = "Unix Makefiles"
 # $$(MAKE) can be 'make -jN', we just want 'make'  (possibly with a full path)
-$(2)_GENERATOR_PROGRAM = $(firstword $$(MAKE))
+$(2)_GENERATOR_PROGRAM = $$(firstword $$(MAKE))
 # Generator specific code (make) should be avoided,
 # but for now, copy them to the new variables.
 $(2)_BUILD_ENV ?= $$($(2)_MAKE_ENV)
@@ -74,7 +74,7 @@ $(2)_BUILD_OPTS ?= -- $$($(2)_MAKE_OPTS)
 else ifeq ($$($(3)_CMAKE_BACKEND),ninja)
 $(2)_DEPENDENCIES += host-ninja
 $(2)_GENERATOR = "Ninja"
-$(2)_GENERATOR_PROGRAM = $(HOST_DIR)/bin/ninja
+$(2)_GENERATOR_PROGRAM = $$(HOST_DIR)/bin/ninja
 
 else
 $$(error Unsupported cmake backend "$$($(3)_CMAKE_BACKEND)")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
