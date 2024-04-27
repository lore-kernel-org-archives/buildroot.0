Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D09EC4345F
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 15:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CF43404C9;
	Sat, 27 Apr 2024 15:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nB3JxCfvAJ62; Sat, 27 Apr 2024 15:31:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F96B4012B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F96B4012B;
	Sat, 27 Apr 2024 15:31:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 226701BF42D
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 15:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F6FC6069E
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 15:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 28qRXGZv32L9 for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 15:31:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3DC916069C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DC916069C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3DC916069C
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 15:31:08 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 39A08B00573;
 Sat, 27 Apr 2024 17:30:59 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Apr 2024 17:30:44 +0200
Message-ID: <20240427153045.2907889-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714231865;
 bh=rc+6eI1zZ0xMeWWyi+hMkh5P67GBdA+Y9CbGfBiY5UY=;
 h=From:To:Cc:Subject:Date:From;
 b=Tlkv8of8m2O5YgUk4I+LYCJiydQoFH3IVMvFJ3hj/HlnXB9UFSFtJZ5rqUfd3zS7v
 H9z8YUIvmh+0qFSmZmjcEBRWUAr5tjGtlf63MNBjaJbEk3Lh2IEGALbyO4ZhfRtOQG
 P66hFvX8MucY+rzQocXRLvDXVhJuSH1hs3u8yUnecpeZ89yRgnk4p4yl0cX9fxmwh7
 Xh9uqcXKPzvDSgXHj6DNMKqhEUF0RRRDY8/lb0xveEkjZdHPelmetmE3Tdg4oK0jtp
 MjZn9d/SvMJzbeYfONr0er33izptw1pnv8Tn0ebl3h5WkK4CClFTqRMMHmjacoIqKS
 pwMPbuE+qGxGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Tlkv8of8
Subject: [Buildroot] [PATCH 1/2] package/python-mpmath: new package
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
Cc: Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mpmath is a free (BSD licensed) Python library for real and
complex floating-point arithmetic with arbitrary precision.

https://mpmath.org/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                       |  2 ++
 package/Config.in                                |  1 +
 package/python-mpmath/Config.in                  |  7 +++++++
 package/python-mpmath/python-mpmath.hash         |  3 +++
 package/python-mpmath/python-mpmath.mk           | 14 ++++++++++++++
 .../tests/package/sample_python_mpmath.py        | 16 ++++++++++++++++
 .../testing/tests/package/test_python_mpmath.py  | 12 ++++++++++++
 7 files changed, 55 insertions(+)
 create mode 100644 package/python-mpmath/Config.in
 create mode 100644 package/python-mpmath/python-mpmath.hash
 create mode 100644 package/python-mpmath/python-mpmath.mk
 create mode 100644 support/testing/tests/package/sample_python_mpmath.py
 create mode 100644 support/testing/tests/package/test_python_mpmath.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 399b2931ff3..e44a7298822 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1766,6 +1766,7 @@ F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_hwdata.py
 F:	support/testing/tests/package/sample_python_midiutil.py
 F:	support/testing/tests/package/sample_python_ml_dtypes.py
+F:	support/testing/tests/package/sample_python_mpmath.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/sample_python_spake2.py
 F:	support/testing/tests/package/test_acl.py
@@ -1851,6 +1852,7 @@ F:	support/testing/tests/package/test_python_hwdata.py
 F:	support/testing/tests/package/test_python_magic_wormhole.py
 F:	support/testing/tests/package/test_python_midiutil.py
 F:	support/testing/tests/package/test_python_ml_dtypes.py
+F:	support/testing/tests/package/test_python_mpmath.py
 F:	support/testing/tests/package/test_python_pyalsa.py
 F:	support/testing/tests/package/test_python_spake2.py
 F:	support/testing/tests/package/test_rdma_core.py
diff --git a/package/Config.in b/package/Config.in
index 1935077f0f4..09e8b47a3c7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1197,6 +1197,7 @@ menu "External python modules"
 	source "package/python-modbus-tk/Config.in"
 	source "package/python-more-itertools/Config.in"
 	source "package/python-mpd2/Config.in"
+	source "package/python-mpmath/Config.in"
 	source "package/python-msgfy/Config.in"
 	source "package/python-msgpack/Config.in"
 	source "package/python-multidict/Config.in"
diff --git a/package/python-mpmath/Config.in b/package/python-mpmath/Config.in
new file mode 100644
index 00000000000..497b7d2ae3d
--- /dev/null
+++ b/package/python-mpmath/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_MPMATH
+	bool "python-mpmath"
+	help
+	  mpmath is a free (BSD licensed) Python library for real and
+	  complex floating-point arithmetic with arbitrary precision.
+
+	  https://mpmath.org/
diff --git a/package/python-mpmath/python-mpmath.hash b/package/python-mpmath/python-mpmath.hash
new file mode 100644
index 00000000000..1b263c925f7
--- /dev/null
+++ b/package/python-mpmath/python-mpmath.hash
@@ -0,0 +1,3 @@
+# Locally computed sha256 checksums
+sha256  7a28eb2a9774d00c7bc92411c19a89209d5da7c4c9a9e227be8330a23a25b91f  mpmath-1.3.0.tar.gz
+sha256  c26cae81da4508e5e249985777a33821f183223ebb74d7f8cfbf90fe7eef2fb7  LICENSE
diff --git a/package/python-mpmath/python-mpmath.mk b/package/python-mpmath/python-mpmath.mk
new file mode 100644
index 00000000000..caa64929619
--- /dev/null
+++ b/package/python-mpmath/python-mpmath.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-mpmath
+#
+################################################################################
+
+PYTHON_MPMATH_VERSION = 1.3.0
+PYTHON_MPMATH_SOURCE = mpmath-$(PYTHON_MPMATH_VERSION).tar.gz
+PYTHON_MPMATH_SITE = https://mpmath.org/files
+PYTHON_MPMATH_SETUP_TYPE = setuptools
+PYTHON_MPMATH_LICENSE = BSD-3-Clause
+PYTHON_MPMATH_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_mpmath.py b/support/testing/tests/package/sample_python_mpmath.py
new file mode 100644
index 00000000000..5e3d9ad1c24
--- /dev/null
+++ b/support/testing/tests/package/sample_python_mpmath.py
@@ -0,0 +1,16 @@
+#! /usr/bin/env python3
+
+# Test inspired from example published on the project page:
+# https://mpmath.org/
+
+from mpmath import mp
+
+mp.dps = 50
+
+result = mp.quad(lambda x: mp.exp(-x**2), [-mp.inf, mp.inf]) ** 2
+
+# Pi digits can be cross-checked here:
+# https://www.angio.net/pi/digits.html
+expected_result = "3.1415926535897932384626433832795028841971693993751"
+
+assert str(result) == expected_result
diff --git a/support/testing/tests/package/test_python_mpmath.py b/support/testing/tests/package/test_python_mpmath.py
new file mode 100644
index 00000000000..c20c910fbec
--- /dev/null
+++ b/support/testing/tests/package/test_python_mpmath.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3MpMath(TestPythonPackageBase):
+    __test__ = True
+
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_MPMATH=y
+        """
+    sample_scripts = ["tests/package/sample_python_mpmath.py"]
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
