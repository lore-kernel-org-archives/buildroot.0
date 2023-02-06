Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A76BC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 082966FFFA;
	Tue, 21 Feb 2023 01:32:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 082966FFFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NCUbTa5-YWXT; Tue, 21 Feb 2023 01:32:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2046E70047;
	Tue, 21 Feb 2023 01:32:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2046E70047
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DFC491BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 713356FBFF
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 713356FBFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5LiT349TDI92 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD3116FBFA
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD3116FBFA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A431281979; Mon, 20 Feb 2023 20:52:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 12:07:12 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c96b2b21f7aedd78094fd009f03d8f82361e5105
X-Git-Newrev: 46306d135e5aab14073eece713d38e8c827c58ae
X-Patchwork-Hint: ignore
Message-Id: <20230220205248.A431281979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/optee-os: add
 out-of-source OPTEE-OS device tree support
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

commit: https://git.buildroot.net/buildroot/commit/?id=46306d135e5aab14073eece713d38e8c827c58ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Similarly to U-Boot, this patch adds the ability to copy in and build
out-of-source device tree sources during an OPTEE-OS build. To build
the external device tree source file, the OP-TEE OS configuration must
refer to it with the CFG_EMBED_DTB_SOURCE_FILE option and no platform
flavor needs to be specified.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/optee-os/Config.in   | 11 +++++++++++
 boot/optee-os/optee-os.mk |  5 +++++
 2 files changed, 16 insertions(+)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 8bcce22306..617ff93c44 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -130,6 +130,17 @@ config BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR
 	  Value for the optional PLATFORM_FLAVOR build directive
 	  provided to OP-TEE OS.
 
+config BR2_TARGET_OPTEE_OS_CUSTOM_DTS_PATH
+	string "Device Tree Source file paths"
+	help
+	  Space-separated list of paths to device tree source files
+	  that will be copied to core/arch/arm/dts/ before starting the
+	  build.
+
+	  To use this device tree source file, the OP-TEE OS configuration
+	  must refer to it with the CFG_EMBED_DTB_SOURCE_FILE option and
+	  no platform flavor needs to be specified.
+
 config BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES
 	string "Additional build variables"
 	help
diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index 38b0d367ef..33b4e2e1ab 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -84,6 +84,8 @@ endif
 
 OPTEE_OS_IMAGE_FILES = $(call qstrip,$(BR2_TARGET_OPTEE_OS_CORE_IMAGES))
 
+OPTEE_OS_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_TARGET_OPTEE_OS_CUSTOM_DTS_PATH))
+
 ifeq ($(BR2_TARGET_OPTEE_OS_CORE),y)
 define OPTEE_OS_BUILD_CORE
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) O=$(OPTEE_OS_BUILDDIR_OUT) \
@@ -120,6 +122,9 @@ endef
 endif # BR2_TARGET_OPTEE_OS_SDK
 
 define OPTEE_OS_BUILD_CMDS
+	$(if $(OPTEE_OS_CUSTOM_DTS_PATH),
+		cp -f $(OPTEE_OS_CUSTOM_DTS_PATH) $(@D)/core/arch/arm/dts/
+	)
 	$(OPTEE_OS_BUILD_CORE)
 	$(OPTEE_OS_BUILD_SDK)
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
