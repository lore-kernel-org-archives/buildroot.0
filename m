Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B53C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 20:21:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40AC360F91
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 20:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 40AC360F91
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DCE8835BA;
	Mon, 26 Jul 2021 20:21:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cEkIYao0OEfY; Mon, 26 Jul 2021 20:21:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B34D83529;
	Mon, 26 Jul 2021 20:21:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B32A1BF302
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 20:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A58F40359
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 20:16:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xK6OC0yx-tWz for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 20:16:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A285B40342
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 20:16:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 206C288EF6; Mon, 26 Jul 2021 19:42:05 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 22:16:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5c788892102f0e22c9b5694facca0576b09f5ef4
X-Git-Newrev: fb9fc969d91f69851b4c70dba512b607e52bda7b
X-Patchwork-Hint: ignore
Message-Id: <20210726194205.206C288EF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bluez5_utils: expose more disable
 options
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=fb9fc969d91f69851b4c70dba512b607e52bda7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
