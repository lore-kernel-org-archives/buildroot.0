Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D240C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 18:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C780760F3D;
	Wed,  2 Nov 2022 18:57:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C780760F3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aDX6QoPtjDbb; Wed,  2 Nov 2022 18:57:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A43060E63;
	Wed,  2 Nov 2022 18:57:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A43060E63
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 214501BF4DB
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 18:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F10F560E64
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 18:57:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F10F560E64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fyMZsHu41Mp5 for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 18:57:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C723260A7B
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C723260A7B
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 18:57:42 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id p141so15804543iod.6
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 11:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OAD2MLiEEiqFngKyuYq3pRcgfhNOkyXzi9CC30n4z7c=;
 b=xAM062MJa8YG+g1/FSXJIrP0Vb0Ig4112DyzdrJKQ2LB/RcCVuEERJpacNl5Gr95Tg
 rzd0sZ/f84Y80fr5Yx9YpaerqagLltIe+2VxNjARVS1b6U1WtXIJT2E5WDKYNc6dzvV9
 8pooSfDvB9KMuzMVwyfD2mhz8TPJYm4orWzlHUKk/wVj9qwMeVT1qxffFB2T8cX+Vq+6
 uGgnI/hWhD+fOL0VT9p1ysSukdJhXqX5STSJ8FtU/7uymQysj1jt3OkAgEwZhziT3GiG
 /4m7PAccbpokyfYXnC67xTWR4oYPlXX/IfqErNZJds3sxF4rNHnbf49ObtggfxYnjP5e
 SnlQ==
X-Gm-Message-State: ACrzQf3AWX05QVigescjIhuR0fxgwP7mRTsTg4wY0QSn02yjAxRB400Z
 CK8M3Osxtpz9vFCDpRlNvNqltr5CkUiG6w==
X-Google-Smtp-Source: AMsMyM4h6BnMd1ANQgnvqz4pyBo43umYLal9WoVe2rpxYh5lqNwvGCdvIHfVq9GfK0pLSr2svR7bgA==
X-Received: by 2002:a05:6602:164f:b0:6d4:8783:8019 with SMTP id
 y15-20020a056602164f00b006d487838019mr3351364iow.77.1667415461413; 
 Wed, 02 Nov 2022 11:57:41 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 q30-20020a056638345e00b00349deda465asm5067753jav.39.2022.11.02.11.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 11:57:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 12:57:38 -0600
Message-Id: <20221102185739.2346971-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OAD2MLiEEiqFngKyuYq3pRcgfhNOkyXzi9CC30n4z7c=;
 b=EKebx8ZqVmQBQ66+kPD3sxSc7S8q677h+EWZ19wVXpwbNSzBMKUiA4+zR/89GQlTY4
 xbYDLpXQpfoKk3+fNWS1WEPF4P2X2NivTKqdJPnUGgHxYGk13FsyxARFXXeUHlrNNEs5
 2y/xW7BOtHeOajcZFTRi2Pca6BFvvjeJW1FDxxXE722npxqFNxtPpo7ZCMIx5vAoACoY
 M+iMX9+1Ke4tZMbtN1SPVtH2DlJZ2oYS1Npdg2h6R1ElwsaDGKznrEndDDnFjI1aiKLI
 vGMdI4x2kkN8GwzI18xP7mx5VZW6VCTDXGx9JM72NmYOQtd7VWN8YGwBZsa9v9IB78mL
 VGRg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EKebx8Zq
Subject: [Buildroot] [PATCH 1/2] package/python-dbus-fast: new package
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
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/python-dbus-fast/Config.in             |  7 +++++++
 package/python-dbus-fast/python-dbus-fast.hash |  5 +++++
 package/python-dbus-fast/python-dbus-fast.mk   | 16 ++++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/python-dbus-fast/Config.in
 create mode 100644 package/python-dbus-fast/python-dbus-fast.hash
 create mode 100644 package/python-dbus-fast/python-dbus-fast.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7d27936992..4104a33f7f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1881,6 +1881,7 @@ F:	package/murata-cyw-fw/
 F:	package/netdata/
 F:	package/python-ansicolors/
 F:	package/python-bleak/
+F:	package/python-dbus-fast/
 F:	package/python-dbus-next/
 F:	package/python-iniconfig/
 F:	package/python-intelhex/
diff --git a/package/Config.in b/package/Config.in
index 238d7813f0..db9e94f357 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1015,6 +1015,7 @@ menu "External python modules"
 	source "package/python-daphne/Config.in"
 	source "package/python-dataproperty/Config.in"
 	source "package/python-dateutil/Config.in"
+	source "package/python-dbus-fast/Config.in"
 	source "package/python-dbus-next/Config.in"
 	source "package/python-decorator/Config.in"
 	source "package/python-defusedxml/Config.in"
diff --git a/package/python-dbus-fast/Config.in b/package/python-dbus-fast/Config.in
new file mode 100644
index 0000000000..400e70bd7b
--- /dev/null
+++ b/package/python-dbus-fast/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_DBUS_FAST
+	bool "python-dbus-fast"
+	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
+	help
+	  A faster version of dbus-next.
+
+	  https://github.com/bluetooth-devices/dbus-fast
diff --git a/package/python-dbus-fast/python-dbus-fast.hash b/package/python-dbus-fast/python-dbus-fast.hash
new file mode 100644
index 0000000000..f0dceeb43d
--- /dev/null
+++ b/package/python-dbus-fast/python-dbus-fast.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/dbus-fast/json
+md5  eebf2c558dd1af0f8f32b361e91f2fa3  dbus_fast-1.61.1.tar.gz
+sha256  bda4a7d559047b74f409eda278f68f610a418e86ad3efa0368fa2ed240daa6b6  dbus_fast-1.61.1.tar.gz
+# Locally computed sha256 checksums
+sha256  c37e9c75110e01d1f0c5360dc7d7776a30ac5f70d2440db214423e4b7a77a6af  LICENSE
diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
new file mode 100644
index 0000000000..de7049ba22
--- /dev/null
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-dbus-fast
+#
+################################################################################
+
+PYTHON_DBUS_FAST_VERSION = 1.61.1
+PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
+PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/dd/f4/a280d46b119d59f6a3d84abf474452ae76651558b0963ab8c48ae13b5a44
+PYTHON_DBUS_FAST_SETUP_TYPE = setuptools
+PYTHON_DBUS_FAST_LICENSE = MIT
+PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
+PYTHON_DBUS_FAST_ENV = REQUIRE_CYTHON=1
+PYTHON_DBUS_FAST_DEPENDENCIES = host-python-cython
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
