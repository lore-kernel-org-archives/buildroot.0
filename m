Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED5FC4707C
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 03:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EE7A83E4F;
	Thu, 11 Jan 2024 03:00:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EE7A83E4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8igJlwn_Y9sp; Thu, 11 Jan 2024 03:00:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E98B83E4D;
	Thu, 11 Jan 2024 03:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E98B83E4D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F0DA81BF588
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 03:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9FE683E4D
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 03:00:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9FE683E4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i45j-qP5FyRv for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 03:00:26 +0000 (UTC)
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D55C083E4C
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 03:00:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D55C083E4C
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-7bed9f5d35dso102949639f.3
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 19:00:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704942024; x=1705546824;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EMczvPmpGDMZbn7mZMAa6D8bay+4u1insvjgHLyHa4k=;
 b=lTCHfTnoPIlBLqowvZOiNKetbcn4OvXSiHh/CU57U0SGOVSR4MjT6aq4DtcRB+SLqr
 WM/vY+JxGyBc2zJNp+Y4TkKEQCqlVzx+vHET52EdRcpXNFR526+IVr7kPRofSzm2KohZ
 /XkRsEuLx242pdo5osvMwl0TYW4DluCCXVSVETig9n+YRi2X0pKFZgzv/0dxilgWntMR
 b/KkljcdVBkSRgburh3sEtqayAPeSnFuHuiOm5WDZTgZXiigmAr+oaT5an+vm3tpZEzl
 MybBXxvebuCNDs/J6xCspydIsDhXX3wtHqV7BoPmzacNEOcSMO2aEe76aTe0IixA+0/w
 Wxfg==
X-Gm-Message-State: AOJu0YybfvNJAJMirDV9vvPllqoYKiHSSOQWWPR0X0ZgpDhVrCqTT5m0
 lJq/tjcxHF+HAgIKFL6RhmVgDryPF9RGlg==
X-Google-Smtp-Source: AGHT+IEMyRb/vAo0AX3ZIWyfjuNHjcShfQC1w4cXnyFIMM8BeLOY0bxTbYiZddBJkO9xpBQBMqXquQ==
X-Received: by 2002:a05:6602:2dd4:b0:7bf:824:d57a with SMTP id
 l20-20020a0566022dd400b007bf0824d57amr479948iow.24.1704942024404; 
 Wed, 10 Jan 2024 19:00:24 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 cq9-20020a056638478900b00469328386c8sm53717jab.162.2024.01.10.19.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 19:00:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 20:00:21 -0700
Message-Id: <20240111030022.2676853-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704942024; x=1705546824; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EMczvPmpGDMZbn7mZMAa6D8bay+4u1insvjgHLyHa4k=;
 b=i7vDJ8CbNLIPyjbY7mFV5laK72o88kiOY4P5omPN2eLpkI0hVo36jqm0vydqmAeT63
 rTRv1IXqSjqOb2xjqzDv+7DYaFc/cwxhfX4UK3PnbCLRJE5HqQe30bzs2gG3XgudZi27
 Ik46flBEfhzY7bgcAPJ8LoAljWxo+zDjJWj5ASEiLMVHivOcK4Y9Nvtc9flusukLT5hT
 0mAcpIw+mfcD/8XQt9eseKL4bupFOh2OORkRIJ7g9m4oTwKNrujZoUIU+GDa2bQHvETU
 oJkxwOWKDwMFZaMY6jVFYu8FrEWiY1xyB1H3EnOx9BGbbQuRu4QcEnerM13KP+/TO/CJ
 nO1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=i7vDJ8Cb
Subject: [Buildroot] [PATCH 1/2] package/python-tcolorpy: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                            |  1 +
 package/python-tcolorpy/Config.in            |  7 +++++++
 package/python-tcolorpy/python-tcolorpy.hash |  5 +++++
 package/python-tcolorpy/python-tcolorpy.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-tcolorpy/Config.in
 create mode 100644 package/python-tcolorpy/python-tcolorpy.hash
 create mode 100644 package/python-tcolorpy/python-tcolorpy.mk

diff --git a/package/Config.in b/package/Config.in
index 5b8b15fa54..47f2f87522 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1365,6 +1365,7 @@ menu "External python modules"
 	source "package/python-starlette/Config.in"
 	source "package/python-systemd/Config.in"
 	source "package/python-tabledata/Config.in"
+	source "package/python-tcolorpy/Config.in"
 	source "package/python-tempora/Config.in"
 	source "package/python-termcolor/Config.in"
 	source "package/python-terminaltables/Config.in"
diff --git a/package/python-tcolorpy/Config.in b/package/python-tcolorpy/Config.in
new file mode 100644
index 0000000000..e3e9058483
--- /dev/null
+++ b/package/python-tcolorpy/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_TCOLORPY
+	bool "python-tcolorpy"
+	help
+	  Tcolopy is a Python library to apply true color for
+	  terminal text.
+
+	  https://github.com/thombashi/tcolorpy
diff --git a/package/python-tcolorpy/python-tcolorpy.hash b/package/python-tcolorpy/python-tcolorpy.hash
new file mode 100644
index 0000000000..cf5ca0e5f3
--- /dev/null
+++ b/package/python-tcolorpy/python-tcolorpy.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/tcolorpy/json
+md5  ca571cccff812ecdc0c73968c9d24ebf  tcolorpy-0.1.4.tar.gz
+sha256  f0dceb1cb95e554cee63024b3cd2fd8d4628c568773de2d1e6b4f0478461901c  tcolorpy-0.1.4.tar.gz
+# Locally computed sha256 checksums
+sha256  f41a0456d5f2bba25fd4d7e50b51a95de304770ff1db5a79515d03397a914d8d  LICENSE
diff --git a/package/python-tcolorpy/python-tcolorpy.mk b/package/python-tcolorpy/python-tcolorpy.mk
new file mode 100644
index 0000000000..5c42320c17
--- /dev/null
+++ b/package/python-tcolorpy/python-tcolorpy.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-tcolorpy
+#
+################################################################################
+
+PYTHON_TCOLORPY_VERSION = 0.1.4
+PYTHON_TCOLORPY_SOURCE = tcolorpy-$(PYTHON_TCOLORPY_VERSION).tar.gz
+PYTHON_TCOLORPY_SITE = https://files.pythonhosted.org/packages/ba/e0/20b99847e76bb89784b68634399261d770b01054bca16cd19a06ac9c2e67
+PYTHON_TCOLORPY_SETUP_TYPE = setuptools
+PYTHON_TCOLORPY_LICENSE = MIT
+PYTHON_TCOLORPY_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
