Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A194C4320A
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:49:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40A5660EFF
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 40A5660EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C3D46F8FF;
	Wed,  4 Aug 2021 00:49:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XDbIzkndgJT3; Wed,  4 Aug 2021 00:49:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6881260B3A;
	Wed,  4 Aug 2021 00:49:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C7CE1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E65040F8F
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wzV_GNS8uSNy for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED37A40F9D
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2550187044; Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 28 Jul 2021 21:17:22 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9850f262fd6546d15ae27f84a0e36411abc2b7b5
X-Git-Newrev: aedf2c83d0830af879314db8422d49be345f057d
X-Patchwork-Hint: ignore
Message-Id: <20210803211022.2550187044@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bluez5_utils: make a
 single option for avrcp and a2dp
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

commit: https://git.buildroot.net/buildroot/commit/?id=aedf2c83d0830af879314db8422d49be345f057d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
