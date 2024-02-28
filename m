Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D324C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 20:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 182AD4177F;
	Wed, 28 Feb 2024 20:24:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3zfBzA3QW1Jb; Wed, 28 Feb 2024 20:24:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1963441793
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1963441793;
	Wed, 28 Feb 2024 20:24:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD09B1BF25B
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 20:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B801C60A5F
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 20:24:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fu7ABaDj6STb for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 20:24:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B456460A5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B456460A5C
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B456460A5C
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 20:24:17 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 800DC2C8397E;
 Wed, 28 Feb 2024 21:24:15 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 21:24:13 +0100
Message-Id: <20240228202414.719244-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240228202414.719244-1-buildroot@bubu1.eu>
References: <20240228202414.719244-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1709151855; bh=0K1fQxFgpd9CY9I6dt5KUdf8+8u2lDpwvjIkteaesn8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=L2hoVu0EBTJImyeX5hN1sm01Q842L9051GBnVtM9q4BQiI//rTia1xJg5FVlnfqwb
 LSsrS4u2i4XcO78s8/OW+FDUXgjIKz+/mqwf2sywrwtpvb+kiGEy5OWFRBfnoyrswl
 59eDpWlj4DsB48yeYOoRn9XBdfFgNiP1aYk8NtCwRtE3Mf+bZ7K0AwMX54KmGKWcWC
 DALuAJXpYsWvOBMLTeDdMPSkFzRnRp2sEzOiOAOw8aAa6PzszwLivU+mO7iMOMUw1D
 hMJDIf6iUklirtsEygkee/gAmW2xCGEbUfrL7BK0D8Q8fo/yFnmchzX07onBANFJVx
 7/xG2McJzNRog==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=L2hoVu0E
Subject: [Buildroot] [PATCH v2 2/2] package/picotool: new package
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
Changes v1 -> v2:
  - fix check-package

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
index 0000000000..0046f8ad61
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
+	  picotool is a tool for inspecting rp2040 binaries and
+	  interacting with rp2040 devices when they are in bootsel
+	  mode or devices USBstdio support from the Raspberry Pi Pico
+	  SDK.
+
+	  https://github.com/raspberrypi/picotool
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
