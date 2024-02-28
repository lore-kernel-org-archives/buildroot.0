Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE3FC5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 19:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47FD18246D;
	Wed, 28 Feb 2024 19:53:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pHitPPOz0Ede; Wed, 28 Feb 2024 19:53:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08C7F82390
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08C7F82390;
	Wed, 28 Feb 2024 19:53:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C61D1BF955
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 19:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2803640130
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 19:53:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AQlbbG98lhjS for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 19:53:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 79E50400DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79E50400DC
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79E50400DC
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 19:53:37 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id DBB1C2C8397E;
 Wed, 28 Feb 2024 20:53:34 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 20:53:32 +0100
Message-Id: <20240228195333.712751-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240228195333.712751-1-buildroot@bubu1.eu>
References: <20240228195333.712751-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1709150015; bh=WETutIZX7WRs36Q/X8i1PtANVjCv7y9dXpbMkwVBEEs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=aKYfqKjRmPt3tx9hEm+gxpG8WKviriydkcJ6bP9wX9WbIxhwVLCA0HjvXkM3LDlcR
 wL6ek0kWrfPapzSrGBOV8GLYyzkli/wkdBurmi93xyfOgGNcVatl+UFannWFepp6HS
 Utvj67QQA3jhCvlOlzJrtuJGOBhVrXvy5RnmNbAuRTZihEPGm4EQ/nqy9Rrju8b1ye
 q5d6JIxE1Y7kHuy5YLjNmBN1TM6/fl9fUsM77Vx4q+awDjSD/0yc+Hr+RYF6l8tKvI
 xeZJoU3EXEoaBIP85aG0TvZc0qxzLiKSg0coSGbaU94JudJfDDv31aHODvPcpVXXP8
 Z/R1jhTmoIoWg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=aKYfqKjR
Subject: [Buildroot] [PATCH 2/2] package/picotool: new package
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add the raspberry pi picotool for interacting with rp2040 binaries and
devices.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/Config.in              |  1 +
 package/picotool/Config.in     | 16 ++++++++++++++++
 package/picotool/picotool.hash |  3 +++
 package/picotool/picotool.mk   | 15 +++++++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 package/picotool/Config.in
 create mode 100644 package/picotool/picotool.hash
 create mode 100644 package/picotool/picotool.mk

diff --git a/package/Config.in b/package/Config.in
index b01024ae04..2d4559036b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -583,6 +583,7 @@ endmenu
 	source "package/pciutils/Config.in"
 	source "package/pdbg/Config.in"
 	source "package/picocom/Config.in"
+	source "package/picotool/Config.in"
 	source "package/pifmrds/Config.in"
 	source "package/pigpio/Config.in"
 	source "package/powertop/Config.in"
diff --git a/package/picotool/Config.in b/package/picotool/Config.in
new file mode 100644
index 0000000000..03772bb116
--- /dev/null
+++ b/package/picotool/Config.in
@@ -0,0 +1,16 @@
+comment "picotool needs a toolchain w/ C++ and gcc >= 4.9"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_HOST_GCC_AT_LEAST_4_9
+
+config BR2_PACKAGE_PICOTOOL
+	bool "picotool"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # libusb
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_PICO_SDK
+	help
+	  picotool is a tool for inspecting rp2040 binaries and interacting
+	  with rp2040 devices when they are in bootsel mode or devices USB
+	  stdio support from the Raspberry Pi Pico SDK.
+
+	   https://github.com/raspberrypi/picotool
+
diff --git a/package/picotool/picotool.hash b/package/picotool/picotool.hash
new file mode 100644
index 0000000000..b573ada09e
--- /dev/null
+++ b/package/picotool/picotool.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  f1746ead7815c13be1152f0645db8ea3b277628eb0110d42a0a186db37d40a91  1.1.2.tar.gz
+sha256  483f865953435b66c443dee7558debe3cc3cf8fcbb6a112fd9fc6a795d53f1f6  LICENSE.TXT
diff --git a/package/picotool/picotool.mk b/package/picotool/picotool.mk
new file mode 100644
index 0000000000..c98284c491
--- /dev/null
+++ b/package/picotool/picotool.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# picotool
+#
+################################################################################
+
+PICOTOOL_VERSION = 1.1.2
+PICOTOOL_SITE = https://github.com/raspberrypi/picotool/archive/refs/tags
+PICOTOOL_SOURCE = $(PICOTOOL_VERSION).tar.gz
+PICOTOOL_CONF_OPTS = -DPICO_SDK_PATH=$(STAGING_DIR)/usr/include/pico-sdk
+PICOTOOL_DEPENDENCIES = libusb pico-sdk
+PICOTOOL_LICENSE = BSD-3-Clause
+PICOTOOL_LICENSE_FILES = LICENSE.TXT
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
