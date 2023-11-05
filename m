Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050A3C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 20:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD1BF40ABE;
	Sun,  5 Nov 2023 20:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD1BF40ABE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZeHlKTqAtkKP; Sun,  5 Nov 2023 20:30:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE14240A90;
	Sun,  5 Nov 2023 20:30:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE14240A90
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DDFA41BF48C
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B722B61043
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B722B61043
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 788MPEj1lCYP for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 20:26:26 +0000 (UTC)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D04A561040
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 20:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D04A561040
Received: by mail-pl1-x644.google.com with SMTP id
 d9443c01a7336-1cc316ccc38so30942635ad.1
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 12:26:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699215985; x=1699820785;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jSOcJfLYHb7Fgd8yNQimV7paxTyT7mtBTnRgDP/4dK8=;
 b=gcJzQjkH4/SPkbVKjXYOG5su7LaQEgrCK0d/wwU/BX6EyBKTMfz7uTJC0R0mYYAdiI
 q8pD6uJy7ne37dK0sq00H6N7RDDogRKpQkVxSXJjS8wx6lOGNIf7nTRR11HPXGubri67
 H/SnIYUXzmrL0WRwifQruBa2BXIkz58ubu0Kq9NksInwsLSaDUXWbLkcZQHE/cAYdhTt
 t3k5d52sSHPWtBCSW8ROUYftPNSZBHjSkLCgkUVMNOD1bH+qEE6+eapPYw+M36yaoXT+
 jPvSuPxTgxcIII66zgwHYfHzazVVJs4o9zFm/DmoUXGqLRWCLkrlbmYvMRz7GvNhLNP5
 drSw==
X-Gm-Message-State: AOJu0YyC/6KFK6eFiW4jllDrHeokhbnDPa4LX+9DoX1ewscQR8B9ymoC
 T/8txHrMnQkIRzyGz4zDKQ8H+B5U6i6azLB9u6P3M14pgcc=
X-Google-Smtp-Source: AGHT+IEoq6RIwFU9zR6xGaL7oIiz+6+80kNDXuxG9X8f+oEmcezxFaZe4HyIPFXmIm37nf5RPwXLuA==
X-Received: by 2002:a17:903:246:b0:1cc:b09a:b811 with SMTP id
 j6-20020a170903024600b001ccb09ab811mr4586787plh.14.1699215985443; 
 Sun, 05 Nov 2023 12:26:25 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a170902ee1400b001c735421215sm4478175plb.216.2023.11.05.12.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 12:26:24 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 13:25:49 -0700
Message-ID: <20231105202555.359391-18-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
References: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699215985; x=1699820785;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jSOcJfLYHb7Fgd8yNQimV7paxTyT7mtBTnRgDP/4dK8=;
 b=RRBBLC9CdtDSDbcq9Ub7OLTCu8rJZGWnJSd/iYrA9RyrMN/eVBKTH3vRTVcGtbpl48
 JBWQ7SZVXOZi4Mq/MFEvrx0kyTKl/AaTHRPfU+lTweAHl8TZxeDHIXkyPeHqMNvMlGB5
 wj6AVfCZJ133Hq/a4vnrDEexOD2aiTcGy7ueI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=RRBBLC9C
Subject: [Buildroot] [PATCH v2 18/24] package/python-pyxb: Drop package
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
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The last time python-pyxb was updated according to pypi.org is in 2017.
As there are no maintainers listed for the package, and the package uses
distutils which has been removed in Python 3.12.0, remove the package.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Drop the Config option for python-pyxb in this patch.

 Config.in.legacy                     |  7 +++++++
 package/Config.in                    |  1 -
 package/python-pyxb/Config.in        |  8 --------
 package/python-pyxb/python-pyxb.hash |  4 ----
 package/python-pyxb/python-pyxb.mk   | 14 --------------
 5 files changed, 7 insertions(+), 27 deletions(-)
 delete mode 100644 package/python-pyxb/Config.in
 delete mode 100644 package/python-pyxb/python-pyxb.hash
 delete mode 100644 package/python-pyxb/python-pyxb.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 6fef2318b0..312d53943c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2023.11"
 
+config BR2_PACKAGE_PYTHON_PYXB
+	bool "python-pyxb removed"
+	select BR2_LEGACY
+	help
+	  python-pyxb has been removed due to being abandoned and
+	  distutils no longer being supported in python 3.12.0.
+
 config BR2_PACKAGE_OPENJDK_VERSION_11
 	bool "openjdk 11 has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index a0d5339b0a..32347fe4e8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1268,7 +1268,6 @@ menu "External python modules"
 	source "package/python-pytz/Config.in"
 	source "package/python-pyudev/Config.in"
 	source "package/python-pyusb/Config.in"
-	source "package/python-pyxb/Config.in"
 	source "package/python-pyyaml/Config.in"
 	source "package/python-pyzmq/Config.in"
 	source "package/python-qrcode/Config.in"
diff --git a/package/python-pyxb/Config.in b/package/python-pyxb/Config.in
deleted file mode 100644
index 6555ed80b6..0000000000
--- a/package/python-pyxb/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_PYTHON_PYXB
-	bool "python-pyxb"
-	help
-	  PyXB is a pure Python package that generates Python code for
-	  classes that correspond to data structures defined by
-	  XMLSchema.
-
-	  http://pyxb.sourceforge.net/
diff --git a/package/python-pyxb/python-pyxb.hash b/package/python-pyxb/python-pyxb.hash
deleted file mode 100644
index f24cd42e5a..0000000000
--- a/package/python-pyxb/python-pyxb.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# md5 from https://pypi.python.org/pypi/PyXB/json, sha256 locally computed
-md5  4303573fc7094ce4664c5b71cd4bdb48  PyXB-1.2.6.tar.gz
-sha256  2a00f38dd1d87b88f92d79bc5a09718d730419b88e814545f472bbd5a3bf27b4  PyXB-1.2.6.tar.gz
-sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-pyxb/python-pyxb.mk b/package/python-pyxb/python-pyxb.mk
deleted file mode 100644
index 6af10b51e7..0000000000
--- a/package/python-pyxb/python-pyxb.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-pyxb
-#
-################################################################################
-
-PYTHON_PYXB_VERSION = 1.2.6
-PYTHON_PYXB_SOURCE = PyXB-$(PYTHON_PYXB_VERSION).tar.gz
-PYTHON_PYXB_SITE = https://pypi.python.org/packages/e3/09/4fdb190ea2b7cb43d6d3e745276ee69f4d6181be70fcbfda7df3c5f72f0e
-PYTHON_PYXB_LICENSE = Apache-2.0
-PYTHON_PYXB_LICENSE_FILES = LICENSE
-PYTHON_PYXB_SETUP_TYPE = distutils
-
-$(eval $(python-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
