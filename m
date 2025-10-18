Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6910CCD193
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 19:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9900660E92;
	Sat, 18 Oct 2025 19:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hUJwqecI-xDN; Sat, 18 Oct 2025 19:43:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2AC760E57
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2AC760E57;
	Sat, 18 Oct 2025 19:43:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A84791CD
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F13E80EA7
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3wY3L-qpt5-p for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 19:43:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8D36780E65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D36780E65
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D36780E65
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:43:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 0E0C6C09A1F;
 Sat, 18 Oct 2025 19:43:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 728F16069D;
 Sat, 18 Oct 2025 19:43:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E4FF6102F2390; 
 Sat, 18 Oct 2025 21:43:48 +0200 (CEST)
To: Buildroot List <buildroot@buildroot.org>
Date: Sat, 18 Oct 2025 21:43:03 +0200
Message-ID: <20251018194314.114284-6-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251018194314.114284-1-thomas.petazzoni@bootlin.com>
References: <20251018194314.114284-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760816630; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=RtUMes9WS09S8FCWpDTPxn2GNynh7EPA1ZzZqoB+l6A=;
 b=gQfNQBKBccvaIyxSsRolYr1oXJCpS0fbBi+1rKdb8b1ruNmuoOP2LkeHFXokpkNOtHDnQ2
 WBdXpWxit4rCf+VZaxugGya/uGLpWhxlTeK4hEJg4Ka8YFEgVLz2ggrPw0BFbhW1nsIlDc
 eEPu1lUpzkr/Hw3hHvt2zd5htGxesRu5NO1vU+lmxg+FDRVl6xdGwXBHvmrSqn8V+FAPb4
 YPJuQ2HgyBWnCeiVuSV7CR1gbViQcqbqchGi8GZUFZxh1agGTMb2QnmaSlToXW2CTEv2S+
 xoxFtwfa6Ha8Tn+bO0V4K5kXrucXQGmofNAYjWEI6OQLixphXElVmoXsq+HVKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=gQfNQBKB
Subject: [Buildroot] [PATCH 05/11] package/python-tftpy: add host variant
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
 Colin Foster <colin.foster@in-advantage.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, romain.gantois@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A host variant of python-tftpy will be needed for Snagboot, so enable
it, and add a very simple test for the host package. We considered
adding a test that actually starts a TFTP server with tftpy and then
downloads from that server with the client-side of tftpy, but
allocating an available UDP port reliably is tricky, so we kept the
test case very simple for now.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-tftpy/python-tftpy.mk               | 1 +
 support/testing/tests/package/test_python_tftpy.py | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/package/python-tftpy/python-tftpy.mk b/package/python-tftpy/python-tftpy.mk
index 66de17eaab..322d514f1f 100644
--- a/package/python-tftpy/python-tftpy.mk
+++ b/package/python-tftpy/python-tftpy.mk
@@ -11,3 +11,4 @@ PYTHON_TFTPY_LICENSE_FILES = LICENSE
 PYTHON_TFTPY_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
+$(eval $(host-python-package))
diff --git a/support/testing/tests/package/test_python_tftpy.py b/support/testing/tests/package/test_python_tftpy.py
index d64f2c29d7..1dfbde0b67 100644
--- a/support/testing/tests/package/test_python_tftpy.py
+++ b/support/testing/tests/package/test_python_tftpy.py
@@ -1,4 +1,5 @@
 from tests.package.test_python import TestPythonPackageBase
+import infra.basetest
 
 
 class TestPythonTftpy(TestPythonPackageBase):
@@ -9,3 +10,11 @@ class TestPythonTftpy(TestPythonPackageBase):
         BR2_PACKAGE_PYTHON_TFTPY=y
         """
     sample_scripts = ["tests/package/sample_python_tftpy.py"]
+
+
+class TestHostPythonTftpy(infra.basetest.BRHostPkgTest):
+    hostpkgs = ["host-python-tftpy"]
+
+    def test_run(self):
+        cmd = ["host/bin/python3", "-c", "import tftpy"]
+        infra.run_cmd_on_host(self.builddir, cmd)
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
