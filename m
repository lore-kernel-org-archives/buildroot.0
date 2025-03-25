Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB01C35FFC
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 13:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A143940302;
	Tue, 25 Mar 2025 13:12:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GNGw7oYeJ9q6; Tue, 25 Mar 2025 13:12:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C833E4076C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C833E4076C;
	Tue, 25 Mar 2025 13:12:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EA83C0
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 13:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 249D380D83
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 13:12:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bcK5CeEPdwVh for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 13:12:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=163.172.193.142;
 helo=mail0.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 13E2E80BBE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13E2E80BBE
Received: from mail0.insia.net (mail0.insia.net [163.172.193.142])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13E2E80BBE
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 13:12:14 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail0.insia.net (Postfix) with ESMTP id E88E11FBA8;
 Tue, 25 Mar 2025 14:12:08 +0100 (CET)
Received: from UDERZO.insia.net (unknown [192.168.1.35])
 by smtp.insia.net (Postfix) with ESMTP id 67FB65F497;
 Tue, 25 Mar 2025 14:13:31 +0100 (CET)
From: Guillaume Chaye <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Julien Olivain <ju.o@free.fr>,
 Guillaume Chaye <guillaume.chaye@zeetim.com>
Date: Tue, 25 Mar 2025 09:11:36 -0400
Message-Id: <20250325131136.572799-1-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail0; t=1742908328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=nm3ZBjLARwM8b0URJIvF+6x+EdO15c1ZmDDs1AJJJto=;
 b=tMF1aWo183+ORSLuxmxUWlFjENCnsBuZSDkr4P4ey+MMHt5jwgp45GayRT1FPIbHlwuseJ
 ol4oCCaILK6uBzSh9tb+V5sxugHrwxCpd9iaX7MS5L5al5Db1bM/2jsC7UZFc6tMYvt4vh
 iLS0b0jeVT2rj9wiHtbQWDiqNe/1yI7p977/bMvQIjMU23I7HEjOFAi3l2IlYJ2VqdJgR7
 WzXKuYKMp/1lwQ/DLrHER+BHTmXwM/enTihSzCniKYFTZhHWZAYS8IeLdCRPhYS2j6zoZz
 bmaPMKZKROnVxksvkuT+jd/ewhSd8wk+NvnqoUc6a+AcKuH5kRAT2ec9FWoGWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail0 header.b=tMF1aWo1
Subject: [Buildroot] [PATCH 1/1] package/sane-airscan: add new package.
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
index c080608bcf..cdf6aff997 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1354,6 +1354,9 @@ F:	package/python-rpi-ws281x/
 F:	package/python-wtforms/
 F:	package/rpi-rgb-led-matrix/
 
+N:	Guillaume Chaye
+F:	package/sane-airscan/
+
 N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
 F:	package/libnids/
 F:	package/libxcrypt/
diff --git a/package/Config.in b/package/Config.in
index d8751fc19f..21b38515a8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -610,6 +610,7 @@ endmenu
 	source "package/rtl8821au/Config.in"
 	source "package/rtl8821cu/Config.in"
 	source "package/rtl8822cs/Config.in"
+	source "package/sane-airscan/Config.in"
 	source "package/sane-backends/Config.in"
 	source "package/sdparm/Config.in"
 	source "package/sedutil/Config.in"
diff --git a/package/sane-airscan/Config.in b/package/sane-airscan/Config.in
new file mode 100644
index 0000000000..4f4a0ac7cc
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
index 0000000000..40fb84e32d
--- /dev/null
+++ b/package/sane-airscan/sane-airscan.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  647f41f84f9bce743c796ca84c1fda67e519968fab407490c28fd0cc6d7ac485  sane-airscan-0.99.33.tar.gz
+sha256  a2631c1b81992bd6f66db6be8b009ed7e3e998d1e2db4de497fa82d65011d373  LICENSE
diff --git a/package/sane-airscan/sane-airscan.mk b/package/sane-airscan/sane-airscan.mk
new file mode 100644
index 0000000000..d5d86d9145
--- /dev/null
+++ b/package/sane-airscan/sane-airscan.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# sane-airscan
+#
+################################################################################
+
+SANE_AIRSCAN_VERSION = 0.99.33
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
