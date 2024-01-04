Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2A5C47073
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 17:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9E7983B87;
	Thu,  4 Jan 2024 17:17:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9E7983B87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id awe1mWATPRSY; Thu,  4 Jan 2024 17:17:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E248283B74;
	Thu,  4 Jan 2024 17:17:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E248283B74
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A5AA81BF3C4
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 17:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D36C41A1D
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 17:17:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D36C41A1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 81TkisNYbCHO for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 17:17:43 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80CA740327
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 17:17:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80CA740327
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-336990fb8fbso540272f8f.1
 for <buildroot@buildroot.org>; Thu, 04 Jan 2024 09:17:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704388661; x=1704993461;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/07L+CLljc+MdVF7+Wnn7xp+z+QNk7DJlAfhoBqj1pg=;
 b=s91v+L3b5CZXRDHd2Gt8sWd7Y/+1HcuYqZfmJcuWoNl4X08NEOnQzhNw+uTKK/xoFb
 eT5ruAkuFRvRfd8fP7a7mRw6bhp99GX250gQ2kEldy92sX5ZOdq7AYfpt1dF20CgryVQ
 MyygTxiz2cZ3Iyv8yV8uMC6GGN93dpTHwCNrvpelgwU4yGDDcDXk26tpI1Va4rB1Ftu6
 yHjMY0fuluPLLjGc+LEQhk/r78VR8wLIkHBUkQgo2C33RTMTfqdjpPeKc2qIA9xw6YPT
 folWdfAu5zVmFIccqVmaoM+JANZx21JnAFdlzRXj6QoQaiQqBG3hKbJhXJHPAIgITa7M
 BlGw==
X-Gm-Message-State: AOJu0Yw9FJ397SQvjs2aSzputQcN45lI8KYDjmo3WsuMARVyJOTON71J
 8y8gEIfYeIqGuvonbMm8f+ugS28ly8A=
X-Google-Smtp-Source: AGHT+IF7MPj+LNSB4yJu7aB2mpLQIb1W4r7Jz5s+CwsQ2xE70LSeQL66NXqIJBhE501KakoovYFRtQ==
X-Received: by 2002:adf:eb89:0:b0:337:2e15:21be with SMTP id
 t9-20020adfeb89000000b003372e1521bemr567446wrn.54.1704388661164; 
 Thu, 04 Jan 2024 09:17:41 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j10-20020adff00a000000b003365fc41bcasm33265875wro.51.2024.01.04.09.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jan 2024 09:17:40 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  4 Jan 2024 18:17:36 +0100
Message-ID: <20240104171737.12200-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704388661; x=1704993461; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/07L+CLljc+MdVF7+Wnn7xp+z+QNk7DJlAfhoBqj1pg=;
 b=SrObhPhzgBfVV0XtmNQpwbv2QdQeQiyj8/HGtf+oo1irRPmcnyrhnr1vnHPE5v0fbn
 xB376iZELlo5E2LJGUbxd2l2YTB+beiDxrxG5XOG+0Kc7F7lfxHhPGJz4QQy8BZ4NmLF
 1bIRpP6SB/Sd3Vxiylfx8nzUZKKw4DhStXZ+zPhFI8jS7iZF0+OqUFqkfCRgqNQUZbQ7
 duOwm5UdxQG6vSassfD3Q6tmxEj6gwpVWBLzJQq9imTuKpzLiXEe1ge/W3lJveEC+mm3
 P2Lr9s80OcvBzf5/lpULxZA7f5NTf65TJ0Il81LnhRBHD8jFavUYtKmfu8FUsOh0WUwh
 Dw+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SrObhPhz
Subject: [Buildroot] [PATCH v3,
 1/1] package/python-pysensors: fix build without host lm-sensors
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the
package in commit c8ff8d41c06f6b1cbc5cf8702a516411084ead16:

  File "/home/buildroot/autobuild/instance-2/output-1/build/python-pysensors-0.0.4/setup.py", line 3, in <module>
    import sensors
  File "/home/buildroot/autobuild/instance-2/output-1/build/python-pysensors-0.0.4/sensors/__init__.py", line 20, in <module>
    raise ImportError("can't find the sensors library.")

Fixes:
 - http://autobuild.buildroot.org/results/acd8583fb635ea27811405a2478182ddcd5642f7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3 (after review of Thomas Petazzoni):
 - Drop dependency and add a patch  instead

Changes v1 -> v2 (after review of Brandon Maier):
 - Replace lm-sensors dependency by host-lm-sensors and set SENSORS_LIB

 ...-Remove-import-sensors-from-setup-py.patch | 55 +++++++++++++++++++
 package/python-pysensors/Config.in            |  2 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 package/python-pysensors/0001-Remove-import-sensors-from-setup-py.patch

diff --git a/package/python-pysensors/0001-Remove-import-sensors-from-setup-py.patch b/package/python-pysensors/0001-Remove-import-sensors-from-setup-py.patch
new file mode 100644
index 0000000000..737f194fd4
--- /dev/null
+++ b/package/python-pysensors/0001-Remove-import-sensors-from-setup-py.patch
@@ -0,0 +1,55 @@
+Remove import sensors from setup.py
+
+Don't import sensors in setup.py to avoid adding a dependency on host
+lm-sensors. Instead, move __version__, __author__, __contact__ and
+__license__ to setup.py
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: upstream is dead since 2019
+
+diff '--color=auto' -Nura PySensors-0.0.4.orig/sensors/__init__.py PySensors-0.0.4/sensors/__init__.py
+--- PySensors-0.0.4.orig/sensors/__init__.py	2024-01-04 13:47:07.114179107 +0100
++++ PySensors-0.0.4/sensors/__init__.py	2024-01-04 14:07:24.701178768 +0100
+@@ -6,12 +6,6 @@
+ 
+ from sensors import stdc
+ 
+-__version__ = "0.0.4"
+-__date__ = "2019-09-19"
+-__author__ = "Marc 'BlackJack' Rintsch"
+-__contact__ = 'marc@rintsch.de'
+-__license__ = 'LGPL v2.1'
+-
+ API_VERSION = 4
+ DEFAULT_CONFIG_FILENAME = b"/etc/sensors3.conf"
+ 
+diff '--color=auto' -Nura PySensors-0.0.4.orig/setup.py PySensors-0.0.4/setup.py
+--- PySensors-0.0.4.orig/setup.py	2024-01-04 13:47:07.114179107 +0100
++++ PySensors-0.0.4/setup.py	2024-01-04 14:07:04.657260411 +0100
+@@ -1,17 +1,21 @@
+ #!/usr/bin/env python3
+ from setuptools import setup
+-import sensors
++
++__version__ = "0.0.4"
++__author__ = "Marc 'BlackJack' Rintsch"
++__contact__ = 'marc@rintsch.de'
++__license__ = 'LGPL v2.1'
+ 
+ setup(
+     name='PySensors',
+-    version=sensors.__version__,
+-    author=sensors.__author__,
+-    author_email=sensors.__contact__,
++    version=__version__,
++    author=__author__,
++    author_email=__contact__,
+     packages=['sensors'],
+     # scripts=[],
+     url='http://pypi.python.org/pypi/PySensors/',
+     # download_url='',
+-    license=sensors.__license__,
++    license=__license__,
+     description='Python bindings to libsensors (via ctypes)',
+     long_description=open('README.rst').read(),
+     long_description_content_type="text/x-rst",
diff --git a/package/python-pysensors/Config.in b/package/python-pysensors/Config.in
index f8e056506b..952d14c351 100644
--- a/package/python-pysensors/Config.in
+++ b/package/python-pysensors/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYSENSORS
 	bool "python-pysensors"
-	select BR2_PACKAGE_LM_SENSORS
+	select BR2_PACKAGE_LM_SENSORS # runtime
 	help
 	  Python bindings for libsensors.so from the lm-sensors project
 	  via ctypes. Supports API version 4, i.e. libsensors version
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
