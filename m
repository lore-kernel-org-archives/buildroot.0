Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88616C0218F
	for <buildroot@archiver.kernel.org>; Mon, 27 Jan 2025 09:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 311D0402D9;
	Mon, 27 Jan 2025 09:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FZBqzugwNPOG; Mon, 27 Jan 2025 09:18:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CD9140346
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CD9140346;
	Mon, 27 Jan 2025 09:18:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C21271F
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 09:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79B5860670
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 09:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_dPd10Rks5t for <buildroot@buildroot.org>;
 Mon, 27 Jan 2025 09:18:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=163.172.193.142;
 helo=mail0.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 48CC260630
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48CC260630
Received: from mail0.insia.net (mail0.insia.net [163.172.193.142])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48CC260630
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 09:18:00 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail0.insia.net (Postfix) with ESMTP id 29F141FB9F;
 Mon, 27 Jan 2025 10:17:24 +0100 (CET)
Received: from UDERZO.MYINSIA.INT (unknown [192.168.1.35])
 by smtp.insia.net (Postfix) with ESMTP id 6E7CE5F497;
 Mon, 27 Jan 2025 10:17:36 +0100 (CET)
From: Guillaume Chaye <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Guillaume, Chaye,
 Guillaume Chaye <guillaume.chaye@zeetim.com>
Date: Mon, 27 Jan 2025 10:17:11 +0100
Message-Id: <20250127091711.3877692-2-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250127091711.3877692-1-guillaume.chaye@zeetim.com>
References: <20250127091711.3877692-1-guillaume.chaye@zeetim.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail0; t=1737969444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aeEcASR3bVJsKiuwMVMbD5vrZflhP0CQsuSWPF+qsBo=;
 b=sR0SZlCwDvN8lzn1BBaMXO9OErHzUT/bo8MSEBZI6DJ5B/TEtLJnoNSkriv7xHv6Va8ljp
 ARthw1yBD8kZVrb2KDBX0hdg6zB+8qLTkbEKlXa/wVZrTMezwzJJsMxWCqF+N7l6oZ8P3Y
 jZ9raCCBvwMTpprJwWcarSEQP7ZQW2u0SRNAHJlM+IbX0e6VcoOj+aXZnf6CMUaqlhPzrJ
 aVNcp7sRBJNeXbJ4db7n44oMgXEZ1J8kDVd0wOiGCYC3PQf3lV8dDAMLVZciYUBLcSNvQY
 vgRGFxEdxVCHtR7FpGEvWg9oH+KOW7yePDxtg+2RVTBe170+kWH3t3447gKOAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail0 header.b=sR0SZlCw
Subject: [Buildroot] [PATCHv2 2/2] package/sane-airscan: add new package.
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
+	select BR2_PACKAGE_SANE_BACKENDS
+	select BR2_PACKAGE_AVAHI
+	select BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT
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
+SANE_AIRSCAN_DEPENDENCIES=  sane-backends avahi gnutls libxml2 jpeg libpng tiff
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
