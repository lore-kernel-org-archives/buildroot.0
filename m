Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53020C433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 21:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF51640182;
	Mon, 13 Dec 2021 21:17:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Ib1sSxE71A6; Mon, 13 Dec 2021 21:17:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D70B44047C;
	Mon, 13 Dec 2021 21:17:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D1B91BF2B0
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 21:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B81E8134C
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 21:15:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XuWwpTlFfCeN for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 21:15:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE3FD8136C
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 21:15:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1E8A183825; Mon, 13 Dec 2021 21:09:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Dec 2021 22:09:27 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 573978d29ddb73533e20e1de4af92d76896e38fe
X-Git-Newrev: 075b9ebfa56f794d8eb1e02b35f2adcd3ea15d2e
X-Patchwork-Hint: ignore
Message-Id: <20211213210952.1E8A183825@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/bluez5_utils:
 expose more disable options
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

commit: https://git.buildroot.net/buildroot/commit/?id=075b9ebfa56f794d8eb1e02b35f2adcd3ea15d2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

BlueZ builds a lot of Classic BT profiles by default but allows
to disable them. This is especially handy when only BLE is needed
and enabled in the kernel.

Otherwise this yields warnings like this on bootup:

 profiles/network/bnep.c:bnep_init() kernel lacks bnep-protocol support
 src/plugin.c:plugin_init() System does not support network plugin

Also it allows to disable btmon which should not be needed on
production systems and is ~800KB in size.

Expose those options but default to 'y' to no break existing
configurations.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fb9fc969d91f69851b4c70dba512b607e52bda7b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bluez5_utils/Config.in       | 36 +++++++++++++++++++++++++++++++
 package/bluez5_utils/bluez5_utils.mk | 41 ++++++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 2c8625a66d..9f20bf83ac 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -37,6 +37,12 @@ config BR2_PACKAGE_BLUEZ5_UTILS_CLIENT
 	help
 	  Build the command line client "bluetoothctl".
 
+config BR2_PACKAGE_BLUEZ5_UTILS_MONITOR
+	bool "build monitor utility"
+	default y
+	help
+	  Build monitor utility btmon.
+
 config BR2_PACKAGE_BLUEZ5_UTILS_DEPRECATED
 	bool "install deprecated tools"
 	depends on BR2_PACKAGE_BLUEZ5_UTILS_CLIENT
@@ -52,11 +58,35 @@ config BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL
 	  "Nokia OBEX PC Suite tool". So, only if OBEX support is
 	  enabled this option has an effect.
 
+config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_A2DP
+	bool "build a2dp plugin"
+	default y
+	help
+	  Build plugin for A2DP (audio) profiles.
+
+config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AVRCP
+	bool "build avrcp plugin"
+	default y
+	help
+	  Build plugin for AVRCP (audio) profiles.
+
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HEALTH
 	bool "build health plugin"
 	help
 	  Build plugin for health profiles.
 
+config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID
+	bool "build hid plugin"
+	default y
+	help
+	  Build plugin for HID (input) profiles.
+
+config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HOG
+	bool "build hog plugin"
+	default y
+	help
+	  Build plugin for HoG (input) profiles.
+
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_MESH
 	bool "build mesh plugin"
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12 # ell
@@ -76,6 +106,12 @@ config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_MIDI
 	help
 	  Build MIDI support via ALSA sequencer.
 
+config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_NETWORK
+	bool "build network plugin"
+	default y
+	help
+	  Build plugin for PANU, NAP, GN profiles.
+
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_NFC
 	bool "build nfc plugin"
 	help
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 3bd3f5490d..7b7e31500f 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -40,6 +40,12 @@ else
 BLUEZ5_UTILS_CONF_OPTS += --disable-client
 endif
 
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_MONITOR),y)
+BLUEZ5_UTILS_CONF_OPTS += --enable-monitor
+else
+BLUEZ5_UTILS_CONF_OPTS += --disable-monitor
+endif
+
 # experimental plugins
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL),y)
 BLUEZ5_UTILS_CONF_OPTS += --enable-experimental
@@ -47,6 +53,20 @@ else
 BLUEZ5_UTILS_CONF_OPTS += --disable-experimental
 endif
 
+# enable a2dp plugin
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_A2DP),y)
+BLUEZ5_UTILS_CONF_OPTS += --enable-a2dp
+else
+BLUEZ5_UTILS_CONF_OPTS += --disable-a2dp
+endif
+
+#enable avrcp plugin
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AVRCP),y)
+BLUEZ5_UTILS_CONF_OPTS += --enable-avrcp
+else
+BLUEZ5_UTILS_CONF_OPTS += --disable-avrcp
+endif
+
 # enable health plugin
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HEALTH),y)
 BLUEZ5_UTILS_CONF_OPTS += --enable-health
@@ -54,6 +74,20 @@ else
 BLUEZ5_UTILS_CONF_OPTS += --disable-health
 endif
 
+# enable hid plugin
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID),y)
+BLUEZ5_UTILS_CONF_OPTS += --enable-hid
+else
+BLUEZ5_UTILS_CONF_OPTS += --disable-hid
+endif
+
+# enable hog plugin
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HOG),y)
+BLUEZ5_UTILS_CONF_OPTS += --enable-hog
+else
+BLUEZ5_UTILS_CONF_OPTS += --disable-hog
+endif
+
 # enable mesh profile
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_MESH),y)
 BLUEZ5_UTILS_CONF_OPTS += --enable-external-ell --enable-mesh
@@ -70,6 +104,13 @@ else
 BLUEZ5_UTILS_CONF_OPTS += --disable-midi
 endif
 
+# enable network plugin
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_NETWORK),y)
+BLUEZ5_UTILS_CONF_OPTS += --enable-network
+else
+BLUEZ5_UTILS_CONF_OPTS += --disable-network
+endif
+
 # enable nfc plugin
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_NFC),y)
 BLUEZ5_UTILS_CONF_OPTS += --enable-nfc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
