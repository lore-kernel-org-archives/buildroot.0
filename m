Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85851C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 20:39:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C45260F92
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 20:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C45260F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC778400C3;
	Sat, 31 Jul 2021 20:39:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9yfgZ6FdsMJx; Sat, 31 Jul 2021 20:39:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF0F8400F1;
	Sat, 31 Jul 2021 20:39:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 02D201BF34F
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 20:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6DA583267
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 20:39:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KqeJSHUXQlhA for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 20:39:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A16D831C1
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 20:39:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 09F921827C5; Sat, 31 Jul 2021 22:39:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1627763970; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=SRa8FhQ2GnEHkS+Qa76ebtZKzcsDugO9VetdMJVsPjI=;
 b=b9nRCfA2MYD8Pd4HKWNiydHLxGPifq4c4Rweh2TUaxfgr0tEuORtouDbKBu6yz0JL7OgB7
 gZ8mN5TPqWoJjnnErLmH/fJjm/KgaNob/yXWrS+b9YJmowqUgCFD9MmI6LIC2WM5/8Wfk1
 ImfZMXpfLxvPo+W4DXjYv5u6SD9POkM=
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 22:38:03 +0200
Message-Id: <20210731203814.68125-2-buildroot@heine.tech>
In-Reply-To: <20210731203814.68125-1-buildroot@heine.tech>
References: <20210731203814.68125-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.2
Subject: [Buildroot] [PATCH 01/10] package/bluez5_utils: make tools optional
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
Cc: Michael Nosthoff <buildroot@heine.tech>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

The tools are currently always build and installed. In many cases
those tools are not needed in a production system. So make this
step optional. This saves up to 2MB on the target.

Further tweak the deprecated option. It has effects when the --enable-tools
is set as well as when --enable-client is set. So explain this in the
options description and update the install step for gatttool to only be
added when client is enabled.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
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
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
