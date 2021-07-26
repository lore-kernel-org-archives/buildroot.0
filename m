Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53367C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 20:13:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAC2260F6E
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 20:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DAC2260F6E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E846402E9;
	Mon, 26 Jul 2021 20:13:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uyDWYZQ9bdj4; Mon, 26 Jul 2021 20:13:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDDFA40260;
	Mon, 26 Jul 2021 20:13:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5849D1BF302
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 20:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47CB482FA9
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 20:13:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TuXgcp6voAFb for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 20:13:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68E0A82FA2
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 20:13:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6AC9718287E; Mon, 26 Jul 2021 22:13:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1627330415; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=71YDQK8Obo87W1uZplFx2lPDiknAWRTteS26eYJ62DM=;
 b=Jra5H5WVtTDGbeLtvsk8XZjrjDzML5IgUYxO3DTzp2qS0ZaGQuAgtPNMjYrk33UqWuDbzk
 D+KjARjOPtMxbVl53eJFH8tD87qGO/2WGNKz7/xJTrg3LPyIFzBdiCttQz13XwS2t9CMPT
 C5dyKxvPHk1lhypQtjTeSz7YXkEo8PQ=
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 22:12:42 +0200
Message-Id: <20210726201244.43070-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.2
Subject: [Buildroot] [PATCH] package/bluez5_utils: expose more disable
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
From: Michael Nosthoff via buildroot <buildroot@busybox.net>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Michael Nosthoff <buildroot@heine.tech>, Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

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
---
 package/bluez5_utils/Config.in       | 36 ++++++++++++++++++++++++
 package/bluez5_utils/bluez5_utils.mk | 41 ++++++++++++++++++++++++++++
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
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
