Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2925C3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 19:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7864B40316;
	Mon, 15 Jul 2024 19:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ax3m2Ud5jai6; Mon, 15 Jul 2024 19:43:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2416A405F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2416A405F2;
	Mon, 15 Jul 2024 19:43:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 117DF1BF3D4
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 19:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08E88607B6
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 19:43:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fyh_uNtCS_6Y for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 19:43:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 102E06074B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 102E06074B
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 19:43:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED3CF86C6C; Mon, 15 Jul 2024 19:43:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 21:42:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aacca7f0639bac6bb3fb262d0b1738c4387edeb0
X-Git-Newrev: 5511e26b4f39c42c57a202d5da53c3cb570961d9
X-Patchwork-Hint: ignore
Message-Id: <20240715194316.ED3CF86C6C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pico-sdk: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=5511e26b4f39c42c57a202d5da53c3cb570961d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the pi-pico sdk as a dependency for picotool. This is a bit of a
weird package, because you normally clone the git repository and point
the picotool (or rp2040 firmware project) build to it.

For picotool specifically, only headers are used from the sdk, for
building a firmware project, it is included as source files via cmake,
so this pretty much has the same semantics for that as well.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/pico-sdk/Config.in     |  9 +++++++++
 package/pico-sdk/pico-sdk.hash |  3 +++
 package/pico-sdk/pico-sdk.mk   | 20 ++++++++++++++++++++
 5 files changed, 34 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4a22b74779..7e709feb3a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2186,6 +2186,7 @@ F:	utils/config
 F:	utils/diffconfig
 
 N:	Marcus Hoffmann <bubu@bubu1.eu>
+F:	package/pico-sdk/
 F:	package/python-jc/
 F:	package/python-ruamel-yaml-clib/
 F:	support/testing/tests/package/test_python_fastapi.py
diff --git a/package/Config.in b/package/Config.in
index 6c390f7bd3..0ba816d378 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1807,6 +1807,7 @@ menu "Hardware handling"
 	source "package/opensc/Config.in"
 	source "package/owfs/Config.in"
 	source "package/pcsc-lite/Config.in"
+	source "package/pico-sdk/Config.in"
 	source "package/rpi-rgb-led-matrix/Config.in"
 	source "package/tslib/Config.in"
 	source "package/uhd/Config.in"
diff --git a/package/pico-sdk/Config.in b/package/pico-sdk/Config.in
new file mode 100644
index 0000000000..962139925c
--- /dev/null
+++ b/package/pico-sdk/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PICO_SDK
+	bool "pico-sdk"
+	help
+	  Raspberry Pi Pico SDK. Provides the headers, libraries
+	  and build system necessary to write programs for the
+	  RP2040-based devices such as the Raspberry Pi Pico in
+	  C, C++ or assembly language.
+
+	  https://github.com/raspberrypi/pico-sdk
diff --git a/package/pico-sdk/pico-sdk.hash b/package/pico-sdk/pico-sdk.hash
new file mode 100644
index 0000000000..5db7e8bdb4
--- /dev/null
+++ b/package/pico-sdk/pico-sdk.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  95f5e522be3919e36a47975ffd3b208c38880c14468bd489ac672cfe3cec803c  pico-sdk-1.5.1.tar.gz
+sha256  483f865953435b66c443dee7558debe3cc3cf8fcbb6a112fd9fc6a795d53f1f6  LICENSE.TXT
diff --git a/package/pico-sdk/pico-sdk.mk b/package/pico-sdk/pico-sdk.mk
new file mode 100644
index 0000000000..27930651b9
--- /dev/null
+++ b/package/pico-sdk/pico-sdk.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# pico-sdk
+#
+################################################################################
+
+PICO_SDK_VERSION = 1.5.1
+PICO_SDK_SITE = $(call github,raspberrypi,pico-sdk,$(PICO_SDK_VERSION))
+PICO_SDK_LICENSE = BSD-3-Clause
+PICO_SDK_LICENSE_FILES = LICENSE.TXT
+PICO_SDK_INSTALL_STAGING = YES
+# Header-only lib, as far as buildroot is concerned
+PICO_SDK_INSTALL_TARGET = NO
+
+define PICO_SDK_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/share/pico-sdk
+	cp -r $(@D)/* $(STAGING_DIR)/usr/share/pico-sdk
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
