Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31FECCD195
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 19:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B16D60E42;
	Sat, 18 Oct 2025 19:44:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yEStvahtPUvP; Sat, 18 Oct 2025 19:44:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E20A860EC8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E20A860EC8;
	Sat, 18 Oct 2025 19:44:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D0781CD
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62EE860ECC
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:44:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HAhGofn64fg0 for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 19:44:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 56A2860EA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56A2860EA6
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56A2860EA6
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:44:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4DE281A14F1;
 Sat, 18 Oct 2025 19:44:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 236C16069D;
 Sat, 18 Oct 2025 19:44:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ED4D8102F238F; 
 Sat, 18 Oct 2025 21:43:55 +0200 (CEST)
To: Buildroot List <buildroot@buildroot.org>
Date: Sat, 18 Oct 2025 21:43:05 +0200
Message-ID: <20251018194314.114284-8-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251018194314.114284-1-thomas.petazzoni@bootlin.com>
References: <20251018194314.114284-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760816637; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=iLV3Dys9GIrPrjJsfpUBFUEB31c8ydbJrm7pjBWd/b8=;
 b=wkTI9j3P6ycma2fgLvDuB2lDxQMPEcEDf/ycX0JVrdiv37jZhSVJgbAVw3IoHPxLgqbY6E
 ZsARzSEpErxQkCWtB4yOxEWF6N/YS79OoCCJkM72AlyDqVG5obS3QJRvDhHQ6Yz+WGClwD
 ZVc6Ri3OAEezKvZ/JjDfqx/SzHoRM8rhTP+K8gkLnK2I3D+hU7ldAR5gXkGqA7MNd8/Qls
 6M9GRcflq+Djxo/YC7nFZF12fseaoDc0J6cvhz4MB9tWeLuZlxpJ9PKRbLI03lZsgLlPM9
 Y1hBukLz+uG0n5gyjNo3WUSD1tsgtwuhZaEg0umofVAj8SPgOCQm9lrgHJZPxw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=wkTI9j3P
Subject: [Buildroot] [PATCH 07/11] package/python-xmodem: add host variant
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, romain.gantois@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The host variant of python-xmodem will be needed by Snagboot, so this
commit enables it. We also add a very simple test case that simply
makes sure we can import the module. Testing xmodem more extensively
is difficult without an actual serial port to open.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                          | 1 +
 package/python-xmodem/python-xmodem.mk              | 1 +
 support/testing/tests/package/test_python_xmodem.py | 9 +++++++++
 3 files changed, 11 insertions(+)
 create mode 100644 support/testing/tests/package/test_python_xmodem.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 4501a1c98d..63c8d5673c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3288,6 +3288,7 @@ F:	support/testing/tests/package/test_python_git.py
 F:	support/testing/tests/package/test_python_pyusb.py
 F:	support/testing/tests/package/test_python_serial.py
 F:	support/testing/tests/package/test_python_unittest_xml_reporting.py
+F:	support/testing/tests/package/test_python_xmodem.py
 F:	support/testing/tests/toolchain/test_external_arm.py
 F:	toolchain/
 
diff --git a/package/python-xmodem/python-xmodem.mk b/package/python-xmodem/python-xmodem.mk
index d7040f7245..1ef5f53bec 100644
--- a/package/python-xmodem/python-xmodem.mk
+++ b/package/python-xmodem/python-xmodem.mk
@@ -12,3 +12,4 @@ PYTHON_XMODEM_LICENSE = MIT
 PYTHON_XMODEM_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
diff --git a/support/testing/tests/package/test_python_xmodem.py b/support/testing/tests/package/test_python_xmodem.py
new file mode 100644
index 0000000000..b9feb78109
--- /dev/null
+++ b/support/testing/tests/package/test_python_xmodem.py
@@ -0,0 +1,9 @@
+import infra.basetest
+
+
+class TestHostPythonXmodem(infra.basetest.BRHostPkgTest):
+    hostpkgs = ["host-python-xmodem"]
+
+    def test_run(self):
+        cmd = ["host/bin/python3", "-c", "import xmodem"]
+        infra.run_cmd_on_host(self.builddir, cmd)
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
