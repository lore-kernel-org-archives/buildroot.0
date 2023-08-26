Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB2BEC873D
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3183A820D5;
	Thu,  7 Sep 2023 15:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3183A820D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZUeIr6btkEZJ; Thu,  7 Sep 2023 15:37:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5931B83EB7;
	Thu,  7 Sep 2023 15:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5931B83EB7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 284381BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C039F41DA4
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C039F41DA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cF27jcMEoHH6 for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 692E141E42
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 692E141E42
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55D7F869E0; Thu,  7 Sep 2023 14:51:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Aug 2023 21:50:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4befd0b3256caf6f882a91868717b67306b74350
X-Git-Newrev: 6cfb3efaaf743696da02a45dedba49f1afb3b12f
X-Patchwork-Hint: ignore
Message-Id: <20230907145133.55D7F869E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/i2c-tools: switch python support
 to setuptools
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6cfb3efaaf743696da02a45dedba49f1afb3b12f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In Python 3.12, support for 'distutils' is going to be dropped. In
preparation for this, this commit backports an upstream i2c-tools
patch that switches the build logic to 'setuptools', future-proofing
i2c-tools to the upcoming bump to Python 3.12.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...smbus-Use-setuptools-instead-of-distutils.patch | 38 ++++++++++++++++++++++
 package/i2c-tools/i2c-tools.mk                     | 10 +++---
 2 files changed, 43 insertions(+), 5 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
