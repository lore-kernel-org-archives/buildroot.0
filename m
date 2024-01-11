Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FDEC47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 20:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD2F86F72C;
	Thu, 11 Jan 2024 20:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD2F86F72C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DQjQUFPS8BzW; Thu, 11 Jan 2024 20:25:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 057DD6F568;
	Thu, 11 Jan 2024 20:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 057DD6F568
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 531751BF2E5
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 20:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38BFC42D2C
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 20:25:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38BFC42D2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FkyYk1TsAkfT for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 20:25:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65D2942D2B
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 20:25:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65D2942D2B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51EA785EDA; Thu, 11 Jan 2024 20:25:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 21:13:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9024e18665232dc4047203edb6d012021baeedfa
X-Git-Newrev: 66414ed526ca44b383baa56b706f58747b90ea52
X-Patchwork-Hint: ignore
Message-Id: <20240111202531.51EA785EDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flutter-sdk-bin: add dart
 arguments for different runtime modes
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

commit: https://git.buildroot.net/buildroot/commit/?id=66414ed526ca44b383baa56b706f58747b90ea52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that profile mode is an option for the flutter-engine package, the logic
in package/flutter-sdk-bin/flutter-sdk-bin.mk is no longer sufficient.

The profile/debug/release logic was inspired by:
https://github.com/meta-flutter/meta-flutter/blob/kirkstone/conf/include/

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[yann.morin.1998@free.fr:
  - make FLUTTER_ENGINE_RUNTIME_MODE_PROFILE win over
    BR2_ENABLE_RUNTIME_DEBUG
  - don't set variables to empty string
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/flutter-sdk-bin/flutter-sdk-bin.mk | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index a28cf645f3..5e5042bea8 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -54,14 +54,20 @@ define HOST_FLUTTER_SDK_BIN_INSTALL_CMDS
 	cp -rpdT $(@D)/. $(HOST_FLUTTER_SDK_BIN_SDK)/
 endef
 
-ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),y)
-HOST_FLUTTER_SDK_BIN_SDK_ROOT = \
-	$(HOST_FLUTTER_SDK_BIN_SDK_ENGINE)/common/flutter_patched_sdk
+ifeq ($(FLUTTER_ENGINE_RUNTIME_MODE_PROFILE),y)
+HOST_FLUTTER_SDK_BIN_PROFILE_FLAGS = --track-widget-creation
 HOST_FLUTTER_SDK_BIN_SDK_PRODUCT = false
+HOST_FLUTTER_SDK_BIN_SDK_ROOT = $(HOST_FLUTTER_SDK_BIN_SDK_ENGINE)/common/flutter_patched_sdk
+HOST_FLUTTER_SDK_BIN_SDK_VM_PROFILE = true
+else ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),y)
+HOST_FLUTTER_SDK_BIN_DEBUG_FLAGS = --enable-asserts
+HOST_FLUTTER_SDK_BIN_SDK_PRODUCT = false
+HOST_FLUTTER_SDK_BIN_SDK_ROOT = $(HOST_FLUTTER_SDK_BIN_SDK_ENGINE)/common/flutter_patched_sdk
+HOST_FLUTTER_SDK_BIN_SDK_VM_PROFILE = false
 else
-HOST_FLUTTER_SDK_BIN_SDK_ROOT = \
-	$(HOST_FLUTTER_SDK_BIN_SDK_ENGINE)/common/flutter_patched_sdk_product
 HOST_FLUTTER_SDK_BIN_SDK_PRODUCT = true
+HOST_FLUTTER_SDK_BIN_SDK_ROOT = $(HOST_FLUTTER_SDK_BIN_SDK_ENGINE)/common/flutter_patched_sdk_product
+HOST_FLUTTER_SDK_BIN_SDK_VM_PROFILE = false
 endif
 
 # The Order matters.Taken from:
@@ -73,8 +79,10 @@ HOST_FLUTTER_SDK_BIN_DART_ARGS = \
 	--sdk-root $(HOST_FLUTTER_SDK_BIN_SDK_ROOT) \
 	--target=flutter \
 	--no-print-incremental-dependencies \
-	-Ddart.vm.profile=false \
+	-Ddart.vm.profile=$(HOST_FLUTTER_SDK_BIN_SDK_VM_PROFILE) \
 	-Ddart.vm.product=$(HOST_FLUTTER_SDK_BIN_SDK_PRODUCT) \
+	$(HOST_FLUTTER_SDK_BIN_DEBUG_FLAGS) \
+	$(HOST_FLUTTER_SDK_BIN_PROFILE_FLAGS) \
 	--aot \
 	--tfa \
 	--target-os linux \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
