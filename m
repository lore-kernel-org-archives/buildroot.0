Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0840C02194
	for <buildroot@archiver.kernel.org>; Thu,  6 Feb 2025 15:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BE2680F66;
	Thu,  6 Feb 2025 15:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5na3ge1v-AXd; Thu,  6 Feb 2025 15:45:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5141E80F6C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5141E80F6C;
	Thu,  6 Feb 2025 15:45:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 10A3BE2
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 15:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08BB140E21
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 15:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mj28Ud5lWcNS for <buildroot@buildroot.org>;
 Thu,  6 Feb 2025 15:45:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.44.123;
 helo=mail1.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C5D1F4040E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5D1F4040E
Received: from mail1.insia.net (mail1.insia.net [188.165.44.123])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5D1F4040E
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 15:45:20 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail1.insia.net (Postfix) with ESMTP id CE7AE3F83B;
 Thu,  6 Feb 2025 16:45:13 +0100 (CET)
Received: from UDERZO.MYINSIA.INT (unknown [192.168.1.35])
 by smtp.insia.net (Postfix) with ESMTP id CE8195F497;
 Thu,  6 Feb 2025 16:45:38 +0100 (CET)
From: Guillaume Chaye <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Guillaume, Chaye,
 Guillaume Chaye <guillaume.chaye@zeetim.com>
Date: Thu,  6 Feb 2025 10:45:00 -0500
Message-Id: <20250206154500.2638319-1-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail1; t=1738856713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=3ESwMC+fXsw5f4xpKKJMDocqUtF5RqHSpYQ7dvFRLwo=;
 b=NNkI02r8qVi0/Ni5D2VHuWFf+3YE51JmEfhyDWLM2yMPYO4N6sUDIMm9U3AsUvbCVIUa7L
 nAKR2RgaR/AIAvzO/Ms+YZjO8YGc4dwJg8pC5kbpDE/qlT4BU90w9vR10zOQHk/NaopYPq
 D9kMi/ZEJPdIviqDACZFD4qUcrySrwSqVz7+gIEAYsBqb8umxtky9+9sxOQLi9mLyBvIdV
 jjKWTRYa/42eH32TvlmfwOqAEtdINDYkRZkrDqrJdGEq5DXG19AHG/xKuJlywFHpYmmgot
 RyQ5vrqkwbiEeF19uXmZq6tU3+TyQQWjcRf1SWDpmSbWAu9jgXXe4edsGaN1Bg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail1 header.b=NNkI02r8
Subject: [Buildroot] [PATCHv3 1/1] package/sane-airscan: add new package.
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>
---
 DEVELOPERS                             |  3 +++
 package/Config.in                      |  1 +
 package/sane-airscan/Config.in         | 20 ++++++++++++++++++++
 package/sane-airscan/sane-airscan.hash |  3 +++
 package/sane-airscan/sane-airscan.mk   | 13 +++++++++++++
 5 files changed, 40 insertions(+)
 create mode 100644 package/sane-airscan/Config.in
 create mode 100644 package/sane-airscan/sane-airscan.hash
 create mode 100644 package/sane-airscan/sane-airscan.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 059383d364..6879d868f2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1330,6 +1330,9 @@ F:	package/python-rpi-ws281x/
 F:	package/python-wtforms/
 F:	package/rpi-rgb-led-matrix/
 
+N:	Guillaume Chaye
+F:	package/sane-airscan/
+
 N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
 F:	package/libnids/
 F:	package/libxcrypt/
diff --git a/package/Config.in b/package/Config.in
index 400183516e..0ce6dfe420 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -611,6 +611,7 @@ endmenu
 	source "package/rtl8821au/Config.in"
 	source "package/rtl8821cu/Config.in"
 	source "package/rtl8822cs/Config.in"
+	source "package/sane-airscan/Config.in"
 	source "package/sane-backends/Config.in"
 	source "package/sdparm/Config.in"
 	source "package/sedutil/Config.in"
diff --git a/package/sane-airscan/Config.in b/package/sane-airscan/Config.in
new file mode 100644
index 0000000000..d5d02f9948
--- /dev/null
+++ b/package/sane-airscan/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_SANE_AIRSCAN
+	bool "sane-airscan"
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_SANE_BACKENDS
+	select BR2_PACKAGE_AVAHI
+	select BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_TIFF
+
+	help
+	  SANE backend for AirScan (eSCL) and WSD document scanners
+
+	  https://github.com/alexpevzner/sane-airscan
+
+	  Similar to how most modern network printers support
+	  "driverless" printing, using the universal vendor-neutral
+	  printing protocol, many modern network scanners and MFPs
+	  support "driverless" scanning.
diff --git a/package/sane-airscan/sane-airscan.hash b/package/sane-airscan/sane-airscan.hash
new file mode 100644
index 0000000000..6600cab3b8
--- /dev/null
+++ b/package/sane-airscan/sane-airscan.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  67782be6a4fd36e753fc4766b8989d75f806bc6d1d2e92f617ea686be2924c14  sane-airscan-0.99.31.tar.gz
+sha256  a2631c1b81992bd6f66db6be8b009ed7e3e998d1e2db4de497fa82d65011d373  LICENSE
diff --git a/package/sane-airscan/sane-airscan.mk b/package/sane-airscan/sane-airscan.mk
new file mode 100644
index 0000000000..d19dde232c
--- /dev/null
+++ b/package/sane-airscan/sane-airscan.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# sane-airscan
+#
+################################################################################
+
+SANE_AIRSCAN_VERSION = 0.99.31
+SANE_AIRSCAN_SITE = $(call github,alexpevzner,sane-airscan,$(SANE_AIRSCAN_VERSION))
+SANE_AIRSCAN_DEPENDENCIES=  dbus sane-backends avahi gnutls libxml2 jpeg libpng tiff
+SANE_AIRSCAN_LICENSE = GPLv2
+SANE_AIRSCAN_LICENSE_FILES = LICENSE
+
+$(eval $(meson-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
