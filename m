Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A17C433FE
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 21:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D65C60B4E;
	Mon, 13 Dec 2021 21:15:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5yrIrBG9j_9b; Mon, 13 Dec 2021 21:15:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3B4260B4A;
	Mon, 13 Dec 2021 21:15:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C7FC91BF97C
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 21:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C56C860B4A
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 21:15:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zg_RAOjsuyWm for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 21:15:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F3FD60B4B
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 21:15:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 35DF683799; Mon, 13 Dec 2021 21:09:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Dec 2021 22:09:27 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 83d27c0f1e7aff01f1ba707046d618ea777c8740
X-Git-Newrev: 3c77943de2ed46e05158f88d2f345cb5805ca4ef
X-Patchwork-Hint: ignore
Message-Id: <20211213210952.35DF683799@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/bluez5_utils:
 make a single option for avrcp and a2dp
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c77943de2ed46e05158f88d2f345cb5805ca4ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Build of avrcp without a2dp is broken since commit
fb9fc969d91f69851b4c70dba512b607e52bda7b:

/home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/9.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: profiles/audio/bluetoothd-avrcp.o: in function `avrcp_handle_set_volume':
avrcp.c:(.text+0x9c4): undefined reference to `media_transport_update_device_volume'

However, build of a2dp without avrcp is also broken:

/data/buildroot-autobuilder/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv32-buildroot-linux-gnu/10.2.0/../../../../riscv32-buildroot-linux-gnu/bin/ld: profiles/audio/bluetoothd-media.o: in function `.L50':
media.c:(.text+0x508): undefined reference to `avrcp_unregister_player'
/data/buildroot-autobuilder/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv32-buildroot-linux-gnu/10.2.0/../../../../riscv32-buildroot-linux-gnu/bin/ld: profiles/audio/bluetoothd-media.o: in function `match_endpoint_by_path':
media.c:(.text+0x824): undefined reference to `avrcp_register_player'

Fixes:
 - http://autobuild.buildroot.org/results/d54cdfc03212fff772a863d1bc8afd3cfb605831
 - http://autobuild.buildroot.org/results/64d75af986a4d6e9c5a176efb6e22046f4d82350

So make a single audio option for a2dp and avrcp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit aedf2c83d0830af879314db8422d49be345f057d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bluez5_utils/Config.in       | 12 +++---------
 package/bluez5_utils/bluez5_utils.mk | 15 ++++-----------
 2 files changed, 7 insertions(+), 20 deletions(-)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index f2b63b0a1c..40973e13cd 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -58,17 +58,11 @@ config BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL
 	  "Nokia OBEX PC Suite tool". So, only if OBEX support is
 	  enabled this option has an effect.
 
-config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_A2DP
-	bool "build a2dp plugin"
+config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO
+	bool "build audio plugins (a2dp and avrcp)"
 	default y
 	help
-	  Build plugin for A2DP (audio) profiles.
-
-config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AVRCP
-	bool "build avrcp plugin"
-	default y
-	help
-	  Build plugin for AVRCP (audio) profiles.
+	  Build plugins for audio profiles (for A2DP and AVRCP).
 
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HEALTH
 	bool "build health plugin"
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 7b7e31500f..3551b14a69 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -53,18 +53,11 @@ else
 BLUEZ5_UTILS_CONF_OPTS += --disable-experimental
 endif
 
-# enable a2dp plugin
-ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_A2DP),y)
-BLUEZ5_UTILS_CONF_OPTS += --enable-a2dp
+# enable audio plugins (a2dp and avrcp)
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO),y)
+BLUEZ5_UTILS_CONF_OPTS += --enable-a2dp --enable-avrcp
 else
-BLUEZ5_UTILS_CONF_OPTS += --disable-a2dp
-endif
-
-#enable avrcp plugin
-ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AVRCP),y)
-BLUEZ5_UTILS_CONF_OPTS += --enable-avrcp
-else
-BLUEZ5_UTILS_CONF_OPTS += --disable-avrcp
+BLUEZ5_UTILS_CONF_OPTS += --disable-a2dp --disable-avrcp
 endif
 
 # enable health plugin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
