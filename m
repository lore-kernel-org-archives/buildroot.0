Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964E3C3ABBE
	for <buildroot@archiver.kernel.org>; Fri,  9 May 2025 01:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 045DE82F80;
	Fri,  9 May 2025 01:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id shc0p_Jjhjb6; Fri,  9 May 2025 01:17:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 025E482B84
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 025E482B84;
	Fri,  9 May 2025 01:17:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 883D2E2
 for <buildroot@buildroot.org>; Fri,  9 May 2025 01:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8495040D38
 for <buildroot@buildroot.org>; Fri,  9 May 2025 01:17:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FoHpwLm7TKo7 for <buildroot@buildroot.org>;
 Fri,  9 May 2025 01:17:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com;
 envelope-from=daniel.crowe@maxmine.com.au; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 91DF3407DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91DF3407DA
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91DF3407DA
 for <buildroot@buildroot.org>; Fri,  9 May 2025 01:17:10 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-7411f65811cso1157462b3a.1
 for <buildroot@buildroot.org>; Thu, 08 May 2025 18:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746753429; x=1747358229;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U0Kmv27vE79R5LPS5o3oxm+jytokTuO+L81H4ob4SFE=;
 b=FBdsLyjs1ckiByq174oY1+JXFmMFV/YkqlNYfDI8Xv57RV9QQBsjVgHVmnojeCAenm
 pyNIu5nmlsLqbbBVL1vLfGXLgvUnL9nbR8DpCfJpvTAMOv6HSMp76W0LXQEXYnk67J+s
 l5HWUCQNL8f07n9t8CSluskcnEsqVruasE433vA7tNNh4mrbu11JIF0PhYFmapI+zqcP
 llYlSc2v5Q46hd2dnUm7nOOtvOjZzhG+AsL7aR9Sf89KizSt2qs0HuCHJs3JKn+Om95B
 urR86bsgK/yl9E4MoaKpX6JTnQUb1oRRC0Xl+qR7diD2ncRmddO+7rW+h4Ai0q8qqHCG
 ufwg==
X-Gm-Message-State: AOJu0YwRCuY7P3C3deA7bTyx/OOYkkuU+wLt3rLBUvP+10lDR/AwkPzE
 XNXa4o34R3WZxheyMYEv56uhR4FT3QZC6lZsN0Dz32k6NYkef9nodTh6Fuz66uzi78hS+MJMKEc
 k10E=
X-Gm-Gg: ASbGnctL5Hus+YZ1yzLjRudfTVY/meK5Fuirt1sw7wU5LcwNY7is3aE0p2ZYtaakmt4
 9jvJ3VJbNEUerlLi5eEFwHYda9YG3tjLXEJCubRnYkLhiOn0pujFz8KU160tDOODcA214GYtrgs
 hlE69vlOec9/hHMnvSyejJC5T1RztLMzr+XKzUfjSXw02/fm0OVpPzxzWWQmsQlSSw1IkQX0Lxa
 +bqi8I6mxLH0jRaIk7sJ5MGqtlOZmcRAaMCQSx4WMD653Ulyc78kcUlsWSu/nvETrOX97peon0b
 +kBjlVKouV8+Y5hyed7QdmHG26chn6hKBLO4f0ByvzVXutRyXPd+/x/ZbKwHsRJmxXLYZUZAmxs
 dhH12Tj+dn5zjrA==
X-Google-Smtp-Source: AGHT+IH/3aZn/5efsWzuftz8JGJoX3s2tKFM+F8et8SbJ7/G155KwJt0Cj5Mv1vSk8Nl4J7MiW+qrA==
X-Received: by 2002:a05:6a20:3950:b0:1f5:7280:1cf2 with SMTP id
 adf61e73a8af0-215abb030femr1666904637.12.1746753429458; 
 Thu, 08 May 2025 18:17:09 -0700 (PDT)
Received: from res-0346.adl.internal.resolution.systems ([103.211.209.15])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30c39dd4334sm704994a91.13.2025.05.08.18.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 18:17:09 -0700 (PDT)
From: Daniel Crowe <daniel.crowe@maxmine.com.au>
To: buildroot@buildroot.org
Date: Fri,  9 May 2025 10:45:30 +0930
Message-ID: <20250509011530.202963-2-daniel.crowe@maxmine.com.au>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250509011530.202963-1-daniel.crowe@maxmine.com.au>
References: <20250509011530.202963-1-daniel.crowe@maxmine.com.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maxmine-com-au.20230601.gappssmtp.com; s=20230601; t=1746753429; x=1747358229;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U0Kmv27vE79R5LPS5o3oxm+jytokTuO+L81H4ob4SFE=;
 b=jbSxtIvWUu3ZwXEnUiaXjLwulF2VBGW4gwLrsXwvDy4qbvqc5Vn7LZ4h79xmWRc0bm
 HA+0S3PMBe4mYH7eIou1bCV/a8xE/8NtZNnSKsV6r4CP5ZhjiUMXFC6zjg+Lg9/wfSFg
 Uba921KE76GfsRTx+xTWFjH39epAZo2Ttz9SARlj9NYiumACSpfmO5ScqoAf0thuofU3
 ezm1y4JAeVOlZslk4YItQ+Q6sno9eT66F+8I4tVs6N/kMXnoIbU/8lWa9DdLVyNu1ndV
 9VHo23GTv3uJloOT2haaacHakiE8y4DOcZgUYUlu9neSRURP2+r2N8OXkiaDOQzW3Q7V
 tPNw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=maxmine.com.au
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=maxmine-com-au.20230601.gappssmtp.com
 header.i=@maxmine-com-au.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=jbSxtIvW
Subject: [Buildroot] [PATCH 2/2] package/python-pyproj: add version 3.7.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Crowe <daniel.crowe@maxmine.com.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Provides cartographic projections in Python
https://pyproj4.github.io/pyproj/stable/

Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/python-pyproj/Config.in               |  9 +++++++++
 package/python-pyproj/python-pyproj.hash      |  5 +++++
 package/python-pyproj/python-pyproj.mk        | 20 +++++++++++++++++++
 .../tests/package/sample_python_pyproj.py     |  5 +++++
 .../tests/package/test_python_pyproj.py       | 11 ++++++++++
 7 files changed, 52 insertions(+)
 create mode 100644 package/python-pyproj/Config.in
 create mode 100644 package/python-pyproj/python-pyproj.hash
 create mode 100644 package/python-pyproj/python-pyproj.mk
 create mode 100644 support/testing/tests/package/sample_python_pyproj.py
 create mode 100644 support/testing/tests/package/test_python_pyproj.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 36bf42da32..08d669ee0b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -729,6 +729,7 @@ F:	package/python-aniso8601/
 F:	package/python-cachelib/
 F:	package/python-flask-caching/
 F:	package/python-flask-restx/
+F:	package/python-pyproj/
 
 N:	Daniel J. Leach <dleach@belcan.com>
 F:	package/dacapo/
diff --git a/package/Config.in b/package/Config.in
index 9e4b0ea167..a9074ac405 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1332,6 +1332,7 @@ menu "External python modules"
 	source "package/python-pyphen/Config.in"
 	source "package/python-pypika-tortoise/Config.in"
 	source "package/python-pypng/Config.in"
+	source "package/python-pyproj/Config.in"
 	source "package/python-pyqrcode/Config.in"
 	source "package/python-pyqt5/Config.in"
 	source "package/python-pyqt5-sip/Config.in"
diff --git a/package/python-pyproj/Config.in b/package/python-pyproj/Config.in
new file mode 100644
index 0000000000..ee829d71c5
--- /dev/null
+++ b/package/python-pyproj/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_PYPROJ
+	bool "python-pyproj"
+	select BR2_PACKAGE_PYTHON_CERTIFI # runtime
+	select BR2_PACKAGE_PROJ # runtime
+	help
+	  Python interface to PROJ (cartographic projections and
+	  coordinate transformations library).
+
+	  https://github.com/pyproj4/pyproj
diff --git a/package/python-pyproj/python-pyproj.hash b/package/python-pyproj/python-pyproj.hash
new file mode 100644
index 0000000000..6d9d4d2a20
--- /dev/null
+++ b/package/python-pyproj/python-pyproj.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pyproj/json
+md5  ad62b11249d8e62879778190a3e3ef8c  pyproj-3.7.1.tar.gz
+sha256  60d72facd7b6b79853f19744779abcd3f804c4e0d4fa8815469db20c9f640a47  pyproj-3.7.1.tar.gz
+# Locally computed sha256 checksums
+sha256  a652687151814d4c4715445912fcb49e7e58f5b248d47a1a88b859a8815e0822  LICENSE
diff --git a/package/python-pyproj/python-pyproj.mk b/package/python-pyproj/python-pyproj.mk
new file mode 100644
index 0000000000..e2e0fada5b
--- /dev/null
+++ b/package/python-pyproj/python-pyproj.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# python-pyproj
+#
+################################################################################
+
+PYTHON_PYPROJ_VERSION = 3.7.1
+PYTHON_PYPROJ_SOURCE = pyproj-$(PYTHON_PYPROJ_VERSION).tar.gz
+PYTHON_PYPROJ_SITE = https://files.pythonhosted.org/packages/67/10/a8480ea27ea4bbe896c168808854d00f2a9b49f95c0319ddcbba693c8a90
+PYTHON_PYPROJ_SETUP_TYPE = setuptools
+PYTHON_PYPROJ_LICENSE = MIT
+PYTHON_PYPROJ_LICENSE_FILES = LICENSE
+PYTHON_PYPROJ_DEPENDENCIES = host-python-cython proj
+PYTHON_PYPROJ_ENV = \
+	PROJ_DIR=$(HOST_DIR)/bin/ \
+	PROJ_INCDIR=$(HOST_DIR)/include/ \
+	PROJ_LIBDIR=$(TARGET_DIR)/usr/lib/ \
+	PROJ_VERSION=$(PROJ_VERSION)
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_pyproj.py b/support/testing/tests/package/sample_python_pyproj.py
new file mode 100644
index 0000000000..f814f8d2df
--- /dev/null
+++ b/support/testing/tests/package/sample_python_pyproj.py
@@ -0,0 +1,5 @@
+from pyproj import CRS
+
+# WGS 84 - World Geodetic System 1984, used in GPS
+crs_4326 = CRS.from_epsg(4326)
+assert crs_4326.name == "WGS 84"
diff --git a/support/testing/tests/package/test_python_pyproj.py b/support/testing/tests/package/test_python_pyproj.py
new file mode 100644
index 0000000000..2044d517c2
--- /dev/null
+++ b/support/testing/tests/package/test_python_pyproj.py
@@ -0,0 +1,11 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Pyproj(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PYPROJ=y
+        """
+    sample_scripts = ["tests/package/sample_python_pyproj.py"]
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
