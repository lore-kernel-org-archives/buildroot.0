Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB95CCD195
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 19:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6B1640FDC;
	Sat, 18 Oct 2025 19:44:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O4Na1asszpq1; Sat, 18 Oct 2025 19:44:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAACC40FC2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAACC40FC2;
	Sat, 18 Oct 2025 19:44:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 67E631CD
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E3C540AD9
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:44:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SkB-lM-l0ZXT for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 19:44:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 511CB40A56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 511CB40A56
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 511CB40A56
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:44:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B8DA44E41186
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:44:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 90B386069D
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:44:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EC03F102F2390; 
 Sat, 18 Oct 2025 21:44:09 +0200 (CEST)
To: Buildroot List <buildroot@buildroot.org>
Cc: romain.gantois@bootlin.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Oct 2025 21:43:09 +0200
Message-ID: <20251018194314.114284-12-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251018194314.114284-1-thomas.petazzoni@bootlin.com>
References: <20251018194314.114284-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760816650; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=61DYts9QZWluS+r9GwvqFpdAE/FAGIrEIav5KNM7X44=;
 b=dWzKiwFiIV+4WCO8jd2y/AiLRYIFos+d0BGUYzONCEAYO0zND7q8Hy0sn7HoKYDxPRf5gl
 EXmTqDIpzMh6VMb/eL0tYpT932WbDpY2uDA+M950qp2e2TKtCC/irR/857AnC0vzj6QSz+
 hFo7GqenqAo4EtL4xVgh4Rg7EG2Sz4P1Wroij9FI5TKC0IfG4o5Duq0F0qNWJ/8HCdzWUJ
 w9fT+Gdfmm0I1YX16E70R2X1komSfjFBhii7M0wCnw3AsI5j1OyxyvT5MsESy1bGKiAlsg
 fDqcbvCQMNnK6zTgf2JZHfZQQ9MeDJU7iCT/1kDHn1vz+9eGSVWuuFbeZZefuA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=dWzKiwFi
Subject: [Buildroot] [PATCH 11/11] package/snagboot: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit adds a package for Snagboot, the open-source
vendor-neutral recover and reflashing tool for embedded targets. We
install the dependencies needed for snagrecover and snagflash, but we
don't bother installing the dependencies of the GUI-based snagfactory,
as that would require Kivy on the host, which is Qt based.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                    |  2 ++
 package/Config.in.host                        |  1 +
 package/snagboot/Config.in.host               |  8 +++++
 package/snagboot/snagboot.hash                |  3 ++
 package/snagboot/snagboot.mk                  | 29 +++++++++++++++++++
 .../testing/tests/package/test_snagboot.py    | 16 ++++++++++
 6 files changed, 59 insertions(+)
 create mode 100644 package/snagboot/Config.in.host
 create mode 100644 package/snagboot/snagboot.hash
 create mode 100644 package/snagboot/snagboot.mk
 create mode 100644 support/testing/tests/package/test_snagboot.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 7d48975896..1bc0824952 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3267,6 +3267,7 @@ F:	package/rt-tests/
 F:	package/rtc-tools/
 F:	package/sam-ba/
 F:	package/scons/
+F:	package/snagboot/
 F:	package/squashfs/
 F:	package/tinifier/
 F:	package/wayland/
@@ -3291,6 +3292,7 @@ F:	support/testing/tests/package/test_python_git.py
 F:	support/testing/tests/package/test_python_pyfatfs.py
 F:	support/testing/tests/package/test_python_pyusb.py
 F:	support/testing/tests/package/test_python_serial.py
+F:	support/testing/tests/package/test_snagboot.py
 F:	support/testing/tests/package/test_python_unittest_xml_reporting.py
 F:	support/testing/tests/package/test_python_xmodem.py
 F:	support/testing/tests/toolchain/test_external_arm.py
diff --git a/package/Config.in.host b/package/Config.in.host
index b0f7529a13..d0088364d0 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -112,6 +112,7 @@ menu "Host utilities"
 	source "package/sentry-cli/Config.in.host"
 	source "package/skopeo/Config.in.host"
 	source "package/sloci-image/Config.in.host"
+	source "package/snagboot/Config.in.host"
 	source "package/squashfs/Config.in.host"
 	source "package/starfive-spltool/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
diff --git a/package/snagboot/Config.in.host b/package/snagboot/Config.in.host
new file mode 100644
index 0000000000..3087348a87
--- /dev/null
+++ b/package/snagboot/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_SNAGBOOT
+	bool "host snagboot"
+	help
+	  Snagboot intends to be an open-source and generic
+	  replacement to the vendor-specific, sometimes proprietary,
+	  tools used to recover and/or reflash embedded platforms.
+
+	  https://github.com/bootlin/snagboot/
diff --git a/package/snagboot/snagboot.hash b/package/snagboot/snagboot.hash
new file mode 100644
index 0000000000..e5978617aa
--- /dev/null
+++ b/package/snagboot/snagboot.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  a3ace4245472141c0cdcd8e095530652ce95d804f7515a29613ddb07d2c32033  snagboot-2.4.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/snagboot/snagboot.mk b/package/snagboot/snagboot.mk
new file mode 100644
index 0000000000..12f77c0b14
--- /dev/null
+++ b/package/snagboot/snagboot.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# snagboot
+#
+################################################################################
+
+SNAGBOOT_VERSION = 2.4
+SNAGBOOT_SITE = $(call github,bootlin,snagboot,v$(SNAGBOOT_VERSION))
+SNAGBOOT_LICENSE = GPL-2.0
+SNAGBOOT_LICENSE_FILES = LICENSE
+SNAGBOOT_SETUP_TYPE = setuptools
+HOST_SNAGBOOT_DEPENDENCIES = \
+	host-python-pyyaml \
+	host-python-pyusb \
+	host-python-serial \
+	host-python-xmodem \
+	host-python-tftpy \
+	host-python-crccheck \
+	host-python-pylibfdt \
+	host-python-packaging \
+	host-python-pyfatfs
+
+# We do not install the dependencies for the snagfactory GUI
+define SNAGBOOT_REMOVE_SNAGFACTORY
+	$(RM) $(HOST_DIR)/bin/snagfactory
+endef
+HOST_SNAGBOOT_POST_INSTALL_HOOKS += SNAGBOOT_REMOVE_SNAGFACTORY
+
+$(eval $(host-python-package))
diff --git a/support/testing/tests/package/test_snagboot.py b/support/testing/tests/package/test_snagboot.py
new file mode 100644
index 0000000000..65fe196520
--- /dev/null
+++ b/support/testing/tests/package/test_snagboot.py
@@ -0,0 +1,16 @@
+import infra.basetest
+
+
+class TestHostSnagboot(infra.basetest.BRHostPkgTest):
+    hostpkgs = ["host-snagboot"]
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_HOST_SNAGBOOT=y
+        """
+
+    def test_run(self):
+        cmd = ["host/bin/snagrecover", "--help"]
+        infra.run_cmd_on_host(self.builddir, cmd)
+
+        cmd = ["host/bin/snagflash", "--help"]
+        infra.run_cmd_on_host(self.builddir, cmd)
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
