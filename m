Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFA9C433FE
	for <buildroot@archiver.kernel.org>; Tue, 11 Oct 2022 18:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAE22832DB;
	Tue, 11 Oct 2022 18:54:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAE22832DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eeUNoFiPDtMW; Tue, 11 Oct 2022 18:54:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0497982FE4;
	Tue, 11 Oct 2022 18:54:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0497982FE4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 530AF1BF239
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 18:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F24160F7F
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 18:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F24160F7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8SwR11PsIU97 for <buildroot@lists.busybox.net>;
 Tue, 11 Oct 2022 18:53:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BA616104D
 for <buildroot@buildroot.org>; Tue, 11 Oct 2022 18:53:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BA616104D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 57D8386BD3; Tue, 11 Oct 2022 18:53:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 11 Oct 2022 20:18:41 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 3a3521a38060070b25f5e1af849d8c2a76c4c512
X-Git-Newrev: a0771a6b36aeb6f4d9d3b4d7d13377e47728c9b0
X-Patchwork-Hint: ignore
Message-Id: <20221011185356.57D8386BD3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/nodejs: don't
 install nodejs host-tools
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

commit: https://git.buildroot.net/buildroot/commit/?id=a0771a6b36aeb6f4d9d3b4d7d13377e47728c9b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

The target nodejs package is building those tools, and running them
under Qemu, so it is not necessary for the host variant to install
them.

Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ec5589611ad79664bc5bf238cc786a65458f3c93)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.mk | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 3154dcd7ec..92a9493e25 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -102,13 +102,6 @@ define HOST_NODEJS_CONFIGURE_CMDS
 		--ninja
 endef
 
-NODEJS_HOST_TOOLS_V8 = \
-	torque \
-	gen-regexp-special-case \
-	bytecode_builtins_list_generator
-NODEJS_HOST_TOOLS_NODE = mkcodecache
-NODEJS_HOST_TOOLS = $(NODEJS_HOST_TOOLS_V8) $(NODEJS_HOST_TOOLS_NODE)
-
 HOST_NODEJS_CXXFLAGS = $(HOST_CXXFLAGS)
 
 define HOST_NODEJS_BUILD_CMDS
@@ -121,10 +114,6 @@ define HOST_NODEJS_INSTALL_CMDS
 	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
 		$(MAKE) -C $(@D) install \
 		$(HOST_NODEJS_MAKE_OPTS)
-
-	$(foreach f,$(NODEJS_HOST_TOOLS), \
-		$(INSTALL) -m755 -D $(@D)/out/Release/$(f) $(HOST_DIR)/bin/$(f)
-	)
 endef
 
 ifeq ($(BR2_i386),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
