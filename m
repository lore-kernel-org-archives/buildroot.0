Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA92C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF9486FBA4;
	Tue, 21 Feb 2023 01:29:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF9486FBA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ia_JjyYVim0O; Tue, 21 Feb 2023 01:29:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFE786FBE0;
	Tue, 21 Feb 2023 01:29:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFE786FBE0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 159401BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67A7C6FBFC
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67A7C6FBFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zFqJfdSvQme3 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A1616FBF9
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A1616FBF9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8868F7FF06; Mon, 20 Feb 2023 20:52:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 09:50:15 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bfef88762d19b2fd8f99b55cee5c9ebaf986e1c7
X-Git-Newrev: c90bd74ebb264ccc925f10a142ccd82ef63a4601
X-Patchwork-Hint: ignore
Message-Id: <20230220205247.8868F7FF06@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/barebox: pass required
 environment variables for reproducible build
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

commit: https://git.buildroot.net/buildroot/commit/?id=c90bd74ebb264ccc925f10a142ccd82ef63a4601
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Barebox makes use of the same variables as the linux kernel does for
handling reproducible build -- KBUILD_BUILD_HOST,
KBUILD_BUILD_TIMESTAMP, KBUILD_BUILD_USER. This patch sets the proper
variables based on linux/linux.mk, and passes them to the make
invocation when building, to ensure a reproducible build is possible
when BR2_REPRODUCIBLE is enabled.

Signed-off-by: Casey Reeves <casey@xogium.me>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/barebox/barebox.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index da151d3c25..90be8c1ecc 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -74,6 +74,13 @@ endif
 $(1)_MAKE_FLAGS = ARCH=$$($(1)_ARCH) CROSS_COMPILE="$$(TARGET_CROSS)"
 $(1)_MAKE_ENV = $$(TARGET_MAKE_ENV)
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+$(1)_MAKE_ENV += \
+	KBUILD_BUILD_USER=buildroot \
+	KBUILD_BUILD_HOST=buildroot \
+	KBUILD_BUILD_TIMESTAMP="$(shell LC_ALL=C date -d @$(SOURCE_DATE_EPOCH))"
+endif
+
 ifeq ($$(BR2_TARGET_$(1)_USE_DEFCONFIG),y)
 $(1)_KCONFIG_DEFCONFIG = $$(call qstrip,$$(BR2_TARGET_$(1)_BOARD_DEFCONFIG))_defconfig
 else ifeq ($$(BR2_TARGET_$(1)_USE_CUSTOM_CONFIG),y)
@@ -121,7 +128,7 @@ endef
 
 define $(1)_BUILD_CMDS
 	$$($(1)_BUILD_BAREBOXENV_CMDS)
-	$$(TARGET_MAKE_ENV) $$(MAKE) $$($(1)_MAKE_FLAGS) -C $$(@D)
+	$$($(1)_MAKE_ENV) $$(MAKE) $$($(1)_MAKE_FLAGS) -C $$(@D)
 	$$($(1)_BUILD_CUSTOM_ENV)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
