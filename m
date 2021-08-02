Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50031C4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 15:15:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D589160FF2
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 15:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D589160FF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABD1760848;
	Mon,  2 Aug 2021 15:15:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kbf1Jf7eEoS0; Mon,  2 Aug 2021 15:15:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7383606DE;
	Mon,  2 Aug 2021 15:15:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CEDD1BF4D5
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 15:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D00D1403D4
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 15:14:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MjhL3uy0eomk for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 15:14:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87E4840015
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 15:14:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B6B178A576; Mon,  2 Aug 2021 15:14:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 2 Aug 2021 17:06:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 03c148c8dec4e8c3fa13fcde4a730b3ab97f3f10
X-Git-Newrev: 2245000fed43a53f35b8348441a7814d309adbdc
X-Patchwork-Hint: ignore
Message-Id: <20210802151418.B6B178A576@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bluez5_utils: make tools optional
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

commit: https://git.buildroot.net/buildroot/commit/?id=2245000fed43a53f35b8348441a7814d309adbdc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The tools are currently always build and installed. In many cases
those tools are not needed in a production system. So make this
step optional. This saves up to 2MB on the target.

Further tweak the deprecated option. It has effects when the --enable-tools
is set as well as when --enable-client is set. So explain this in the
options description and update the install step for gatttool to only be
added when client is enabled.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/bluez5_utils/Config.in       | 16 +++++++++++++---
 package/bluez5_utils/bluez5_utils.mk | 13 +++++++++++--
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 40973e13cd..30e70fa03f 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -43,13 +43,23 @@ config BR2_PACKAGE_BLUEZ5_UTILS_MONITOR
 	help
 	  Build monitor utility btmon.
 
+config BR2_PACKAGE_BLUEZ5_UTILS_TOOLS
+	bool "build tools"
+	help
+	  Build tools like bluemoon, btattach, hex2hcd, l2test,
+	  l2ping, mpris-proxy, rctest.
+
 config BR2_PACKAGE_BLUEZ5_UTILS_DEPRECATED
 	bool "install deprecated tools"
-	depends on BR2_PACKAGE_BLUEZ5_UTILS_CLIENT
+	depends on BR2_PACKAGE_BLUEZ5_UTILS_CLIENT || BR2_PACKAGE_BLUEZ5_UTILS_TOOLS
 	help
-	  Build deprecated tools. These currently include:
+	  Build deprecated tools.
+
+	  When "build tools" is selected these tools are installed:
 	  hciattach, hciconfig, hcitool, hcidump, rfcomm, sdptool,
-	  ciptool, gatttool.
+	  ciptool.
+
+	  When CLI client is enabled "gatttool" is installed.
 
 config BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL
 	bool "build experimental tools"
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 3551b14a69..5f5a7f44c9 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -20,7 +20,6 @@ BLUEZ5_UTILS_DEPENDENCIES = \
 	libglib2
 
 BLUEZ5_UTILS_CONF_OPTS = \
-	--enable-tools \
 	--enable-library \
 	--disable-cups \
 	--disable-manpages \
@@ -46,6 +45,12 @@ else
 BLUEZ5_UTILS_CONF_OPTS += --disable-monitor
 endif
 
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_TOOLS),y)
+BLUEZ5_UTILS_CONF_OPTS += --enable-tools
+else
+BLUEZ5_UTILS_CONF_OPTS += --disable-tools
+endif
+
 # experimental plugins
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL),y)
 BLUEZ5_UTILS_CONF_OPTS += --enable-experimental
@@ -125,12 +130,16 @@ else
 BLUEZ5_UTILS_CONF_OPTS += --disable-sixaxis
 endif
 
-# install gatttool (For some reason upstream choose not to do it by default)
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_DEPRECATED),y)
+# install gatttool (For some reason upstream choose not to do it by default)
+# gattool depends on the client for readline
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_CLIENT),y)
 define BLUEZ5_UTILS_INSTALL_GATTTOOL
 	$(INSTALL) -D -m 0755 $(@D)/attrib/gatttool $(TARGET_DIR)/usr/bin/gatttool
 endef
 BLUEZ5_UTILS_POST_INSTALL_TARGET_HOOKS += BLUEZ5_UTILS_INSTALL_GATTTOOL
+endif
+
 # hciattach_bcm43xx defines default firmware path in `/etc/firmware`, but
 # Broadcom firmware blobs are usually located in `/lib/firmware`.
 BLUEZ5_UTILS_CONF_ENV += \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
