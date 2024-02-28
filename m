Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C763C5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 20:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72E08417C2;
	Wed, 28 Feb 2024 20:24:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MMGM3y31RsV2; Wed, 28 Feb 2024 20:24:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C656417A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C656417A2;
	Wed, 28 Feb 2024 20:24:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 553AD1BF25B
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 20:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40A71400DC
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 20:24:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QriwUdbKPC4d for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 20:24:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D2F89400D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2F89400D9
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2F89400D9
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 20:24:17 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id A376C2C80248;
 Wed, 28 Feb 2024 21:24:14 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 21:24:12 +0100
Message-Id: <20240228202414.719244-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1709151854; bh=L8OpbAgibE3pwIaVozj9hHyZ3GxD2zYxGB7SZ9Bn2sY=;
 h=From:To:Cc:Subject:Date;
 b=CaTwdNUrWCTgl/wpp8/dDbBUer1zcZPE1SYn3RMKo5OWoyaplWEjmBWjIiL80RzTL
 7J4dqtOd3chhH+SIr7x8eTL95Mo3q2DB5WE/kqnumrg1GUmeoC3dcS7EcRq5cIBqf8
 cf7/WMR0NBAyFr5h/qggHzobmaNjak8f8MI9fkO5kDgu2DrKkm+vyWdJsFDBy5H3MR
 vNTERbmTN39DcjEWXsErgzP36LPtIxR8oAk8Uw2NN+b6xQW4ZOkyYRVXJFyFw+XJRE
 S6zp+YQP1nMgIDXiWr8rBQUMMkl2USDCJjxjpKZZE8ZsWQ858J7rswB7YU2I44UApi
 pNjLIWwPz6ExA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=CaTwdNUr
Subject: [Buildroot] [PATCH v2 1/2] package/pico-sdk: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add the pi-pico sdk as a dependency for picotool. This is a bit of a
weird package, because you normally clone the git repository and point
the picotool (or rp2040 firmware project) build to it.

For picotool specifically, only headers are used from the sdk, for
building a firmware project, it is included as source files via cmake,
so this pretty much has the same semantics for that as well.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/Config.in              |  1 +
 package/pico-sdk/Config.in     |  9 +++++++++
 package/pico-sdk/pico-sdk.hash |  3 +++
 package/pico-sdk/pico-sdk.mk   | 20 ++++++++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/pico-sdk/Config.in
 create mode 100644 package/pico-sdk/pico-sdk.hash
 create mode 100644 package/pico-sdk/pico-sdk.mk

diff --git a/package/Config.in b/package/Config.in
index bf0fe078b9..b01024ae04 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1785,6 +1785,7 @@ menu "Hardware handling"
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
index 0000000000..0c475d8aa1
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
+	mkdir -p $(STAGING_DIR)/usr/include/pico-sdk
+	cp -r $(@D)/* $(STAGING_DIR)/usr/include/pico-sdk
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
