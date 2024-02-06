Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98075C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5295B612CF;
	Tue,  6 Feb 2024 16:58:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5295B612CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e5kZg1OEWCbf; Tue,  6 Feb 2024 16:58:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A057C612D2;
	Tue,  6 Feb 2024 16:58:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A057C612D2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 53F9A1BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D4D282E19
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:57:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1VXdFbRkmJWS for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:57:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7936282E1A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7936282E1A
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:57:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66D1A8717B; Tue,  6 Feb 2024 16:57:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 17:57:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b95ff658bf4859eb5cffd28cbbedd1826fad9a6
X-Git-Newrev: e0e7a1d3d15727a2f14db83b7c651db73f2a50f1
X-Patchwork-Hint: ignore
Message-Id: <20240206165731.66D1A8717B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/toolchain-bare-metal-buildroot:
 wire up newlib-bare-metal
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e0e7a1d3d15727a2f14db83b7c651db73f2a50f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in                                                     | 1 +
 toolchain/toolchain-bare-metal-buildroot/Config.in                      | 2 ++
 .../toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk    | 2 +-
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 64a07f91dc..407a03c42e 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -927,6 +927,7 @@ comment "Bare metal toolchain"
 
 config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
 	bool "Build a bare metal toolchain"
+	select BR2_PACKAGE_NEWLIB_BARE_METAL
 	help
 	  Select if you need a bare-metal toolchain for building
 	  platform specific firmware images.
diff --git a/toolchain/toolchain-bare-metal-buildroot/Config.in b/toolchain/toolchain-bare-metal-buildroot/Config.in
index 3c99c7e1b5..6fe969357f 100644
--- a/toolchain/toolchain-bare-metal-buildroot/Config.in
+++ b/toolchain/toolchain-bare-metal-buildroot/Config.in
@@ -6,4 +6,6 @@ config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
 	  This option allows to define the architecture tuple for the
 	  bare-metal toolchain.
 
+source "package/newlib-bare-metal/Config.in"
+
 endif # BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
diff --git a/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk b/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk
index 4dc36ef3f3..dbfe30a910 100644
--- a/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk
+++ b/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_BARE_METAL_BUILDROOT_DEPENDENCIES =
+TOOLCHAIN_BARE_METAL_BUILDROOT_DEPENDENCIES = newlib-bare-metal
 TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE = $(call qstrip,$(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH))
 TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT = $(HOST_DIR)/$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE)/sysroot
 TOOLCHAIN_BARE_METAL_BUILDROOT_ADD_TOOLCHAIN_DEPENDENCY = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
