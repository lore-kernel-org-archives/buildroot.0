Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4881FC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 060D2408C5;
	Mon, 15 Jul 2024 14:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WW2N7nm_Irmk; Mon, 15 Jul 2024 14:35:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 147B740981
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 147B740981;
	Mon, 15 Jul 2024 14:35:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 346E91BF3AD
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 342A140967
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z1Y7KKPxDr6i for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:35:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4138040931
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4138040931
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 14:35:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B6EE86C5B; Mon, 15 Jul 2024 14:35:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 16:34:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51aa8da4e5bd3006a045a5202392888eb6b9fc1f
X-Git-Newrev: 664f02a60c98536e516ba8a802bceba40418a34c
X-Patchwork-Hint: ignore
Message-Id: <20240715143511.2B6EE86C5B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/optee-os: Add support to build with
 host-cmake
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=664f02a60c98536e516ba8a802bceba40418a34c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some specific versions of OP-TEE need cmake on the host to build the scmi
firmware, like the newly release STMicroelectronics 3.19.0-stm32mp-r2
version.

To allow building such OP-TEE OS versions, this commit adds the option
BR2_TARGET_OPTEE_OS_NEEDS_CMAKE which when enabled ensures that host-cmake
is built before OP-TEE OS.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
[Arnout: use BR2_CMAKE_HOST_DEPENDENCY]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 boot/optee-os/Config.in   | 6 ++++++
 boot/optee-os/optee-os.mk | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 34ea993136..7870629732 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -91,6 +91,12 @@ config BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY
 	  python-cryptography. Select this option if optee-os needs
 	  python-cryptography to be built.
 
+config BR2_TARGET_OPTEE_OS_NEEDS_CMAKE
+	bool "OP-TEE OS needs cmake"
+	help
+	  Select this option if your OP-TEE OS platform configuration
+	  requires the cmake build system to be available.
+
 config BR2_TARGET_OPTEE_OS_CORE
 	bool "Build core"
 	default y
diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index 33b4e2e1ab..6b04a0f5e1 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -30,6 +30,10 @@ endif
 
 OPTEE_OS_DEPENDENCIES = host-openssl host-python3 host-python-pyelftools
 
+ifeq ($(BR2_TARGET_OPTEE_OS_NEEDS_CMAKE),y)
+OPTEE_OS_DEPENDENCIES += $(BR2_CMAKE_HOST_DEPENDENCY)
+endif
+
 ifeq ($(BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY),y)
 OPTEE_OS_DEPENDENCIES += host-python-cryptography
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
