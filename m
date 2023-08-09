Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA857C0015E
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 18:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1600F418C2;
	Wed,  9 Aug 2023 18:19:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1600F418C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k856rrkuRXEz; Wed,  9 Aug 2023 18:19:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C63E3418C3;
	Wed,  9 Aug 2023 18:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C63E3418C3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A1CEA1BF30D
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 18:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79A71418C3
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 18:19:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79A71418C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q0wCpvufnsux for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 18:19:27 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A657418C2
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 18:19:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A657418C2
Received: from fli4l.lan.fli4l (p54a1be35.dip0.t-ipconnect.de [84.161.190.53])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 60ABCA4C0160;
 Wed,  9 Aug 2023 20:19:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53646)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTnmH-0001Tw-0S;
 Wed, 09 Aug 2023 20:19:25 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 20:19:25 +0200
Message-Id: <20230809181925.1345919-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691605165;
 bh=gKKBYPf8YVYq92HLCNwIMWDSKMitaBoC2UQ4Iosw6IM=;
 h=From:To:Cc:Subject:Date:From;
 b=VA96RN7Vnjsj3L6icTGjL7S9qGWcnCfJDFDlBeTZi21o3MkBxkFAqgMZHd+3J+vF3
 KXfl0yM7V4HTkeTtAXwtUdBqXHbUPn0Ds0kJk8KAdsePkVk5hxW4yQleC+YUujbt9t
 Aqe5bSW9BJR/qbA7IlD/GFhdAmzb/yXIOJ1J9fHtT/NOHGvwz08pjloN3gsz+JLWic
 PZR/SA4hCPSLXTVveFaSJBM32BKn93xSjRbgP/JaGW7EI0Q+Euj35axvttkXzJ/gAM
 HvhWyZ/h9W1EL9ox5E5AiVI+aISjY4d/l2Fcyh1YHiAAFCG0kDBPIFLFSyNKYq0qZC
 suqJc997gDvBA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=VA96RN7V
Subject: [Buildroot] [PATCH/next 1/1] package/i2c-tools: switch python
 support to setuptools
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add upstream patch to make package compatible with python 3.12.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-Use-setuptools-instead-of-distutils.patch | 38 +++++++++++++++++++
 package/i2c-tools/i2c-tools.mk                | 10 ++---
 2 files changed, 43 insertions(+), 5 deletions(-)
 create mode 100644 package/i2c-tools/0001-py-smbus-Use-setuptools-instead-of-distutils.patch

diff --git a/package/i2c-tools/0001-py-smbus-Use-setuptools-instead-of-distutils.patch b/package/i2c-tools/0001-py-smbus-Use-setuptools-instead-of-distutils.patch
new file mode 100644
index 0000000000..63b2a7f82f
--- /dev/null
+++ b/package/i2c-tools/0001-py-smbus-Use-setuptools-instead-of-distutils.patch
@@ -0,0 +1,38 @@
+From cf3541b8a7ed50782edd05836020d31230fb86c6 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 19 Jan 2022 12:08:53 +0100
+Subject: py-smbus: Use setuptools instead of distutils
+
+As per [1], distutils is deprecated in Python 3.10 and will be removed
+entirely in Python 3.12.
+
+As setuptools is essentially an enhanced version of distutils, it's
+trivial to port to that.
+
+[1] https://docs.python.org/3/whatsnew/3.10.html#distutils-deprecated
+
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+Signed-off-by: Jean Delvare <jdelvare@suse.de>
+
+Upstream: https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/commit/?id=cf3541b8a7ed50782edd05836020d31230fb86c6
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ py-smbus/setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/py-smbus/setup.py b/py-smbus/setup.py
+index 28a4500..26db33a 100644
+--- a/py-smbus/setup.py
++++ b/py-smbus/setup.py
+@@ -1,6 +1,6 @@
+ #!/usr/bin/env python
+ 
+-from distutils.core import setup, Extension
++from setuptools import setup, Extension
+ 
+ setup(	name="smbus",
+ 	version="1.1",
+-- 
+cgit 
+
diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index 5c9ce26628..adccd9475d 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -14,7 +14,7 @@ I2C_TOOLS_MAKE_OPTS = EXTRA=eeprog
 I2C_TOOLS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
-I2C_TOOLS_DEPENDENCIES += python3
+I2C_TOOLS_DEPENDENCIES += host-python-setuptools python3
 endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
@@ -28,23 +28,23 @@ endif
 # Build/install steps mirror the distutil python package type in the python package
 # infrastructure
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
-# BASE_ENV taken from PKG_PYTHON_DISTUTILS_ENV in package/pkg-python.mk
+# BASE_ENV taken from PKG_PYTHON_SETUPTOOLS_ENV in package/pkg-python.mk
 I2C_TOOLS_PYTHON_BASE_ENV = \
-	$(PKG_PYTHON_DISTUTILS_ENV) \
+	$(PKG_PYTHON_SETUPTOOLS_ENV) \
 	CFLAGS="$(TARGET_CFLAGS) -I../include"
 
 define I2C_TOOLS_BUILD_PYSMBUS
 	(cd $(@D)/py-smbus; \
 	$(I2C_TOOLS_PYTHON_BASE_ENV) \
 		$(HOST_DIR)/bin/python setup.py build \
-		$(PKG_PYTHON_DISTUTILS_BUILD_OPTS))
+		$(PKG_PYTHON_SETUPTOOLS_BUILD_OPTS))
 endef
 
 define I2C_TOOLS_INSTALL_PYSMBUS
 	(cd $(@D)/py-smbus; \
 	$(I2C_TOOLS_PYTHON_BASE_ENV) \
 		$(HOST_DIR)/bin/python setup.py install \
-		$(PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS))
+		$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS))
 endef
 
 endif # BR2_PACKAGE_PYTHON3
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
