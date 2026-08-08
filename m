Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC93C5AC67
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 10:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6566D80F4A;
	Sat,  8 Aug 2026 10:14:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o5pXbdAxLDVK; Sat,  8 Aug 2026 10:14:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8012480F4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786184046;
	bh=jn1B2eGz/whqsiZR3UTVGh8cwnnLbGrOm50xSY+FCjY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LtDB5zyjAWGiHcIN7D66K0SlJtuQYgmIl2J33hIe4oI5ihSfEzX9XBWqXRubsN60V
	 RBiXdbl9SRcc1to5h+C+vyCzLV7vdBtDa7MWC9jcy2PQAwgvfQ4B9TgsoytK4dJOZA
	 uQfTMrdLgKkY0NEOC9hfMyho4d85j0Ip0F8P7qmb/5MknKaWBdiuJC2M6MXfsBDSGO
	 fbtHfQpq5b48ugkpSzbkfwbhaCi3qh2f8KC/t3XGEiN/eiOXR21A/l/LAWDW934365
	 gadOFja5LsJyjb2O7eqt9uI05xLJxwDcS8fRUF5tYbWjitzhcinupvU6CCeI3WafYU
	 qVqAy2sgNOEEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8012480F4B;
	Sat,  8 Aug 2026 10:14:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C5514198
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 10:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5AE6606D5
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 10:14:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5NQ32sL1Rv8 for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 10:14:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F38C0606AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F38C0606AA
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F38C0606AA
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 10:14:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B52A81A14DE
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 10:14:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8B12A6045E
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 10:14:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F418A11C483B5; 
 Sat,  8 Aug 2026 12:13:57 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  8 Aug 2026 12:13:47 +0200
Message-ID: <20260808101348.924397-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260808101348.924397-1-thomas.petazzoni@bootlin.com>
References: <20260808101348.924397-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786184038; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=EOSI6v5sxSzoef4FPf59qr77gxxdn3AcQwa8CFdlTGg=;
 b=Uf9se4qODJaCyo3ZJqTSUsebu0ioWXXz0FRp2sCitBqZWctqlmQxLRvekcmqV0uiIq4lgj
 sg/CWpus1A76ifqAGWaGjKRNOp8UfB2O/cEsJWumGaPRz8LS2YhxHvyVmE0kJ+Ek/dnb1M
 umV6j+fDwV1bFKXqn0FFV2FQKOLahAAfCKfg5B7/pJNmLDd+Nw+rcCpYEyyn8qmZboag+W
 hmXUFR5tGVoS/VWZ0N6UpkN7LDjE4bY7Wa6H9KyaxQRDjjp9FyM28VdrdmlCjagKQ1ovKy
 7i+d8t9UVh44SnXmmcQQPT5tKX/LrdHwkZKL0e1L+hwyfD7qgHPD31zYgFcQtQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Uf9se4qO
Subject: [Buildroot] [PATCH 2/2] support/testing: add pyudev test
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

In order to verify that pyudev works fine, including with just
libudev-zero, add a basic test for this package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                           |  2 ++
 .../testing/tests/package/sample_python_pyudev.py    |  4 ++++
 support/testing/tests/package/test_python_pyudev.py  | 12 ++++++++++++
 3 files changed, 18 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_pyudev.py
 create mode 100644 support/testing/tests/package/test_python_pyudev.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 56dd9f3943..353f4a2ccf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3285,6 +3285,7 @@ F:	support/testing/tests/package/sample_python_augeas.py
 F:	support/testing/tests/package/sample_python_flask.py
 F:	support/testing/tests/package/sample_python_flask_expects_json.py
 F:	support/testing/tests/package/sample_python_git.py
+F:	support/testing/tests/package/sample_python_pyudev.py
 F:	support/testing/tests/package/sample_python_unittest_xml_reporting.py
 F:	support/testing/tests/package/test_nodejs.py
 F:	support/testing/tests/package/test_python_augeas.py
@@ -3294,6 +3295,7 @@ F:	support/testing/tests/package/test_python_flask_expects_json.py
 F:	support/testing/tests/package/test_python_fs.py
 F:	support/testing/tests/package/test_python_git.py
 F:	support/testing/tests/package/test_python_pyfatfs.py
+F:	support/testing/tests/package/test_python_pyudev.py
 F:	support/testing/tests/package/test_python_pyusb.py
 F:	support/testing/tests/package/test_python_serial.py
 F:	support/testing/tests/package/test_snagboot.py
diff --git a/support/testing/tests/package/sample_python_pyudev.py b/support/testing/tests/package/sample_python_pyudev.py
new file mode 100644
index 0000000000..8e4ae32511
--- /dev/null
+++ b/support/testing/tests/package/sample_python_pyudev.py
@@ -0,0 +1,4 @@
+import pyudev
+
+context = pyudev.Context()
+assert('/dev/ttyAMA0' in [ d.device_node for d in context.list_devices() ])
diff --git a/support/testing/tests/package/test_python_pyudev.py b/support/testing/tests/package/test_python_pyudev.py
new file mode 100644
index 0000000000..ec8985b31f
--- /dev/null
+++ b/support/testing/tests/package/test_python_pyudev.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3PyUdev(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_LIBUDEV_ZERO=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PYUDEV=y
+        """
+    sample_scripts = ["tests/package/sample_python_pyudev.py"]
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
