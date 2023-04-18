Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB9AC77B75
	for <buildroot@archiver.kernel.org>; Tue, 18 Apr 2023 11:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF1AB6140F;
	Tue, 18 Apr 2023 11:42:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF1AB6140F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OGVyvrvD85Mh; Tue, 18 Apr 2023 11:42:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16F1861381;
	Tue, 18 Apr 2023 11:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16F1861381
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2097A1C42AD
 for <buildroot@lists.busybox.net>; Tue, 18 Apr 2023 11:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE39083C38
 for <buildroot@lists.busybox.net>; Tue, 18 Apr 2023 11:42:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE39083C38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ctOH12elfJ3B for <buildroot@lists.busybox.net>;
 Tue, 18 Apr 2023 11:42:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AB4083C32
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9AB4083C32
 for <buildroot@buildroot.org>; Tue, 18 Apr 2023 11:42:13 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id q23so62886474ejz.3
 for <buildroot@buildroot.org>; Tue, 18 Apr 2023 04:42:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681818131; x=1684410131;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8yHW5wPi54FtNU1OwKn+T1ZZu5RA1EzVMS0MFs4CGdo=;
 b=ExE3zbAMY+nI2cVx7KZgEeuhFDXBrtgdfatvPutElsVwLewqy3eLFzuNTeB642EfL6
 HPBFt/dnxX3TTl9Cj+F3F7PKRLDU+yP+6mu7/tIjDAjthJqf0e0LzRYMk8RfFEth5Rb6
 vfcYt/c9vKYGuNrgeOUBQqdIL4UArKahEydno/tUjbgkkVPj1F0smpc+MJsQ/xT/9Fst
 +w4j29ViXIOtOVHVnoFraOVIxr7NwIZpXWw+NEFbuE34z0K8ozqCWBXmmJv3x+fMGRB4
 poMqYjzGM/PwJCD5WaQbs5xdh50wUa7kTeB/V+S0OqUO9M9F/XXEAAmkFyvJ8jOZYTs0
 EAGA==
X-Gm-Message-State: AAQBX9fPzYmcU4zUw+10FMp9/2Q+nZ7OSRRbkAiI1O6MVphxoWWqMYwA
 PwMFTn/0lqp1A1NGyv2etUYF64AlKrO6Nsn0RLY=
X-Google-Smtp-Source: AKy350bK0KuUI4nMqUxxzPXcLDv8BvszY4TM5L4LUHU5+N9M3KidmK1mgaZDAMgQtZlzLE4bh2b5Jg==
X-Received: by 2002:a17:907:77cc:b0:94e:e30e:7245 with SMTP id
 kz12-20020a17090777cc00b0094ee30e7245mr8588629ejc.8.1681818131388; 
 Tue, 18 Apr 2023 04:42:11 -0700 (PDT)
Received: from localhost.localdomain ([91.90.166.178])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a170906038100b0094f5f6ba306sm3484055eja.41.2023.04.18.04.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 04:42:10 -0700 (PDT)
From: Witold Lipieta <witold.lipieta@thaumatec.com>
To: buildroot@buildroot.org
Date: Tue, 18 Apr 2023 13:42:04 +0200
Message-Id: <20230418114204.1773697-1-witold.lipieta@thaumatec.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thaumatec-com.20221208.gappssmtp.com; s=20221208; t=1681818131; x=1684410131;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8yHW5wPi54FtNU1OwKn+T1ZZu5RA1EzVMS0MFs4CGdo=;
 b=S7mzljZVYHyYJGu0Oot8RUGSlpusOudQEcy6DLtgTdfMPe7qOMF3tkyp9VwTJW6vXj
 eIKVTWcHSbraRlVQRqX0AIoifm1HTkF9i3l1ho+EU3sZ/x5d10vsS4PCdMOzQg1cIIyS
 kG/FqbrowJItgJmmNIYiai5KQrW/dENfS2dkFKWRgOx01Zc4FJtQ112pPwQCzRxjNN6I
 GsGS0zmsHMt8U+K9i1KGP5BCG9FRqyLMGZbUOOjqIRqU6jfpCSzTxo6hvEJmcz/7r/eW
 WUxayG+bIlnt6l3qj1bftjxEVtwxSBkHkX0fzIwNnjEM6JI2CNpBdD32nZ+JXakJK3fG
 AASg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=thaumatec-com.20221208.gappssmtp.com
 header.i=@thaumatec-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=S7mzljZV
Subject: [Buildroot] [PATCH v2 1/1] package/python-segno: new package
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
Cc: Witold Lipieta <witold.lipieta@thaumatec.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

segno 1.5.2 https://pypi.org/project/segno/

Signed-off-by: Witold Lipieta <witold.lipieta@thaumatec.com>
---
Changes v1 -> v2:
 - resolve runtime dependency
 - add basic runtime check
---
 package/Config.in                                  |  1 +
 package/python-segno/Config.in                     |  7 +++++++
 package/python-segno/python-segno.hash             |  5 +++++
 package/python-segno/python-segno.mk               | 14 ++++++++++++++
 .../testing/tests/package/sample_python_segno.py   | 13 +++++++++++++
 support/testing/tests/package/test_python_segno.py | 11 +++++++++++
 6 files changed, 51 insertions(+)
 create mode 100644 package/python-segno/Config.in
 create mode 100644 package/python-segno/python-segno.hash
 create mode 100644 package/python-segno/python-segno.mk
 create mode 100644 support/testing/tests/package/sample_python_segno.py
 create mode 100644 support/testing/tests/package/test_python_segno.py

diff --git a/package/Config.in b/package/Config.in
index eaac32a01a..a4ad4c6ee8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1274,6 +1274,7 @@ menu "External python modules"
 	source "package/python-sdnotify/Config.in"
 	source "package/python-secretstorage/Config.in"
 	source "package/python-see/Config.in"
+	source "package/python-segno/Config.in"
 	source "package/python-selenium/Config.in"
 	source "package/python-semver/Config.in"
 	source "package/python-sentry-sdk/Config.in"
diff --git a/package/python-segno/Config.in b/package/python-segno/Config.in
new file mode 100644
index 0000000000..3957cd79bf
--- /dev/null
+++ b/package/python-segno/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_SEGNO
+	bool "python-segno"
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+	help
+	  QR Code and Micro QR Code generator for Python 2 and Python 3
+
+	  https://github.com/heuer/segno/
diff --git a/package/python-segno/python-segno.hash b/package/python-segno/python-segno.hash
new file mode 100644
index 0000000000..286bdf3615
--- /dev/null
+++ b/package/python-segno/python-segno.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/segno/json
+md5  6d7c852f951501cd3af85ef061d6bee4  segno-1.5.2.tar.gz
+sha256  983424b296e62189d70fc73460cd946cf56dcbe82b9bda18c066fc1b24371cdc  segno-1.5.2.tar.gz
+# Locally computed sha256 checksums
+sha256  98b0a86ca0cbf68c95051741bc983425a43fdece775fe0e2712e66be459cc9d1  LICENSE
diff --git a/package/python-segno/python-segno.mk b/package/python-segno/python-segno.mk
new file mode 100644
index 0000000000..c832f38f4b
--- /dev/null
+++ b/package/python-segno/python-segno.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-segno
+#
+################################################################################
+
+PYTHON_SEGNO_VERSION = 1.5.2
+PYTHON_SEGNO_SOURCE = segno-$(PYTHON_SEGNO_VERSION).tar.gz
+PYTHON_SEGNO_SITE = https://files.pythonhosted.org/packages/90/2a/2fedf1023f9273d8326362df7936748ebadef92ba53ab7970d9b8df1a6c2
+PYTHON_SEGNO_SETUP_TYPE = setuptools
+PYTHON_SEGNO_LICENSE = BSD-3-Clause
+PYTHON_SEGNO_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_segno.py b/support/testing/tests/package/sample_python_segno.py
new file mode 100644
index 0000000000..c96d6087ce
--- /dev/null
+++ b/support/testing/tests/package/sample_python_segno.py
@@ -0,0 +1,13 @@
+import segno
+import os
+import tempfile
+
+qr = segno.make_qr('http:/www.example.org/')
+with tempfile.NamedTemporaryFile('wb', suffix='.png', delete=False) as f:
+    fn = f.name
+qr.save(fn)
+expected = b'\211PNG\r\n\032\n'  # PNG magic number
+with open(fn, mode='rb') as f:
+    val = f.read(len(expected))
+os.unlink(fn)
+assert expected == val
diff --git a/support/testing/tests/package/test_python_segno.py b/support/testing/tests/package/test_python_segno.py
new file mode 100644
index 0000000000..75e7124399
--- /dev/null
+++ b/support/testing/tests/package/test_python_segno.py
@@ -0,0 +1,11 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Segno(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_SEGNO=y
+        """
+    sample_scripts = ["tests/package/sample_python_segno.py"]
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
