Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF13C02185
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 21:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DB80848D0;
	Sat, 18 Jan 2025 21:41:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7a8UaN7khhB5; Sat, 18 Jan 2025 21:40:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14D6A848D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14D6A848D3;
	Sat, 18 Jan 2025 21:40:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 887562F6D
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 21:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68356606AE
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 21:40:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j20ottacTjm4 for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 21:40:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E15D60592
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E15D60592
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E15D60592
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 21:40:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c706.dip0.t-ipconnect.de [79.214.199.6])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 74E86A4C452B;
 Sat, 18 Jan 2025 22:40:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56786)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tZGYn-000000005hH-3UDS;
 Sat, 18 Jan 2025 21:40:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Jan 2025 22:40:52 +0100
Message-Id: <20250118214053.115126-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1737236454;
 bh=wpweEdOO0AP/6tf23A4H4tg4SpVnlWBi0LXcujog6vc=;
 h=From:To:Cc:Subject:Date:From;
 b=N6wxcLxVdpoKuMfZwf6G4Vj6N3r5Bn0R/NSpSZXYaV3ouGnYaR4wNbNPUbBIxxZIi
 pVMeYotZMTpnSLvPdpfbGDpK6M3U6UnHCfKMJ+Gk4CMCBG5+GHdb+w7Q23v1d1sNoI
 DrmU1CZeuDlOoYIKjwhfO416ICWs0n9QQA0vQW7afQ8X3gbobMZSvYblipYiSFQJ1V
 cfAZVzk+XDb6RxsOnvASPcaRlutWdnCLZ7KIFKVPElSsLDiY7bhueGt1qi4Xq1TWty
 bhflOaUrHfVkIllO73Y3b6U0Bf5JlMYz3dfthrB+Qp57TQdnVEUUEFqSQh57Q0HlCx
 PvEnPlz6OG54g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=N6wxcLxV
Subject: [Buildroot] [PATCH 1/2] package/utfcpp: new package
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

Needed for taglib 2.x:
https://github.com/taglib/taglib/commit/6ed0ca28db0d12a75572c0f5dcefdc5ebb34cc21

Upstream discourages the use of CMakeList.txt to install the package:
https://github.com/nemtrif/utfcpp/commit/4965d378fb141a21c8afa7c283a8af4725e6a57e

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/utfcpp/Config.in   |  6 ++++++
 package/utfcpp/utfcpp.hash |  3 +++
 package/utfcpp/utfcpp.mk   | 23 +++++++++++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/utfcpp/Config.in
 create mode 100644 package/utfcpp/utfcpp.hash
 create mode 100644 package/utfcpp/utfcpp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 354a006190..d26e059e04 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -506,6 +506,7 @@ F:	package/tor/
 F:	package/transmission/
 F:	package/tvheadend/
 F:	package/unixodbc/
+F:	package/utfcpp/
 F:	package/vlc/
 F:	package/wget/
 F:	package/wireless-regdb/
diff --git a/package/Config.in b/package/Config.in
index 8aa3a6cc43..6478d017c8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2357,6 +2357,7 @@ menu "Text and terminal handling"
 	source "package/tclap/Config.in"
 	source "package/termcolor/Config.in"
 	source "package/utf8proc/Config.in"
+	source "package/utfcpp/Config.in"
 endmenu
 
 endmenu
diff --git a/package/utfcpp/Config.in b/package/utfcpp/Config.in
new file mode 100644
index 0000000000..d48209aef2
--- /dev/null
+++ b/package/utfcpp/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_UTFCPP
+	bool "utfcpp"
+	help
+	  UTF-8 with C++ in a Portable Way
+
+	  https://github.com/nemtrif/utfcpp
diff --git a/package/utfcpp/utfcpp.hash b/package/utfcpp/utfcpp.hash
new file mode 100644
index 0000000000..65b3ad2a88
--- /dev/null
+++ b/package/utfcpp/utfcpp.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  6920a6a5d6a04b9a89b2a89af7132f8acefd46e0c2a7b190350539e9213816c0  utfcpp-4.0.6.tar.gz
+sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE
diff --git a/package/utfcpp/utfcpp.mk b/package/utfcpp/utfcpp.mk
new file mode 100644
index 0000000000..3a4613841e
--- /dev/null
+++ b/package/utfcpp/utfcpp.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# taglib
+#
+################################################################################
+
+UTFCPP_VERSION = 4.0.6
+UTFCPP_SITE = $(call github,nemtrif,utfcpp,v$(UTFCPP_VERSION))
+UTFCPP_LICENSE = BSL-1.0
+UTFCPP_LICENSE_FILES = LICENSE
+
+# utfcpp is a header-only library, it only makes sense
+# to have it installed into the staging directory.
+UTFCPP_INSTALL_STAGING = YES
+UTFCPP_INSTALL_TARGET = NO
+
+define UTFCPP_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/include/utf8/
+	$(INSTALL) -m 0644 $(@D)/source/utf8.h $(STAGING_DIR)/usr/include/utf8.h
+	$(INSTALL) -m 0644 $(@D)/source/utf8/* $(STAGING_DIR)/usr/include/utf8/
+endef
+
+$(eval $(generic-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
