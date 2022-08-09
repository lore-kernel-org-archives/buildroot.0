Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052E2C19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 13:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A99141514;
	Tue,  9 Aug 2022 13:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A99141514
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rjfVSzdgFChQ; Tue,  9 Aug 2022 13:27:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8D95410B0;
	Tue,  9 Aug 2022 13:27:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8D95410B0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 830F91BF5E6
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 13:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D13560E59
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 13:27:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D13560E59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6vdanA_2VB-u for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 13:27:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D636260BD1
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D636260BD1
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 13:27:35 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id z12so14315668wrs.9
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 06:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=dYL+UveiEXl0DV5kDaRIrLxOJuhRtsVCuQBw1jyRSNg=;
 b=B3Dz+y/KHLp5beVxrOSuubtrd6d0kPxPDPq+X5sOfmdrcVJ6L3eOQOjr+ueBcQT5L0
 9Nj4pOEOR21RmE9R7EuWOrkMBHMbY6gZmNeK8uiTjI1Lw+UMIWFd7CbPmZfjVGfFRWLq
 9E6aDmuddczOSWN4We0q1qTn2L06sFpsiKviXgBjj4VLvrCzGhlj6BkvCIbMSgZhTdnG
 Ht4w3EpkQBBNRIwXJ120nr91UkhCvhSPWf98GEm5fu8qBdL+Zj2VeXvgU8QWFVcNvhUE
 hJWgqcz4qKyjMBg6/jGOkFIXflcT1fiRZBPO8vPh9ubDKKxoxiW/JolnqdmlvqI4x9xt
 osrA==
X-Gm-Message-State: ACgBeo0DBqrhHdiV600pmEN/Hx4d7wi+8xyTi9W5mhBtTAUUewgi0ieA
 tExI6Kmj/rrQETDjCMASVTaVcScwo5KrYQ==
X-Google-Smtp-Source: AA6agR7FVC5nrGwbLZfxoIophShmeLXB1Kwdr7UYtXm3BQhO+57NmVSiBdkIYouVrTseb/yY1lIVXw==
X-Received: by 2002:a5d:5985:0:b0:222:c5dd:b7c8 with SMTP id
 n5-20020a5d5985000000b00222c5ddb7c8mr7648701wri.511.1660051654071; 
 Tue, 09 Aug 2022 06:27:34 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a05600c4e8600b003a37d8b864esm18305288wmq.30.2022.08.09.06.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 06:27:33 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 15:27:29 +0200
Message-Id: <20220809132730.232111-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=dYL+UveiEXl0DV5kDaRIrLxOJuhRtsVCuQBw1jyRSNg=;
 b=Ixy1nQyrl+F3cZJcPaGcKU25NDY9jjWelyC16SVDbRJSzFPOVgfxBUOrYFO2IU2waM
 PoyAvcdnhAJXkEsQ81gDpeL1Sn64R4PicFH45+09Pclxjr1q7mmCHiHdu/QjkHaTxqBA
 44QlhYz5wVaHt8oUU4bsdqtO8rK9LBZEbALanlbu3RNFloj8Hoer4u6+SxLssFZT7Nga
 Y5n7sI5RO6HrSPr8yOfU7YaPM0DTbHRukd0KDyA/p/gOQY0BBRz5x5EaoGX2CT/NUiUV
 0JzRvOZCj3glgU1eBTr8wt8CETLU7tLE7O4wVx1y+/+w9rgpBoUt1jwZzsv9O88HwHrV
 eH4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=Ixy1nQyr
Subject: [Buildroot] [PATCH 1/2] package/phython-libevdev: new package
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python-libevdev is needed for libinput replay command:

$ libinput replay recording.yml
Error: No module named 'libevdev'
One or more python modules are missing. Please install those modules and re-run this tool.

Indeed only libinput-replay tool is a python script
(like libinput-analyze-recording, libinput-measure-fuzz...)

phython-libevdev itself requires a kernel built with
CONFIG_INPUT_UINPUT option enabled, enable this option
if a kernel is built by Buildroot.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-libevdev/Config.in            |  7 +++++++
 package/python-libevdev/python-libevdev.hash |  5 +++++
 package/python-libevdev/python-libevdev.mk   | 20 ++++++++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/python-libevdev/Config.in
 create mode 100644 package/python-libevdev/python-libevdev.hash
 create mode 100644 package/python-libevdev/python-libevdev.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d2bd0d809a..5f1ef3df52 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2580,6 +2580,7 @@ F:	package/ogre/
 F:	package/openpowerlink/
 F:	package/physfs/
 F:	package/piglit/
+F:	package/python-libevdev/
 F:	package/qemu/
 F:	package/solarus/
 F:	package/stress-ng/
diff --git a/package/Config.in b/package/Config.in
index 2ddd240150..25562ac839 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1094,6 +1094,7 @@ menu "External python modules"
 	source "package/python-kiwisolver/Config.in"
 	source "package/python-lark/Config.in"
 	source "package/python-libconfig/Config.in"
+	source "package/python-libevdev/Config.in"
 	source "package/python-libusb1/Config.in"
 	source "package/python-lmdb/Config.in"
 	source "package/python-lockfile/Config.in"
diff --git a/package/python-libevdev/Config.in b/package/python-libevdev/Config.in
new file mode 100644
index 0000000000..2d6aa49ce0
--- /dev/null
+++ b/package/python-libevdev/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_LIBEVDEV
+	bool "python-libevdev"
+	select BR2_PACKAGE_LIBEVDEV # runtime
+	help
+	  Python wrapper for libevdev.
+
+	  https://gitlab.freedesktop.org/libevdev/python-libevdev
diff --git a/package/python-libevdev/python-libevdev.hash b/package/python-libevdev/python-libevdev.hash
new file mode 100644
index 0000000000..2799078cc8
--- /dev/null
+++ b/package/python-libevdev/python-libevdev.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/libevdev/json
+md5  34b48098c1fba26de79a0d67a17a588a  libevdev-0.11.tar.gz
+sha256  e9ca006a4df2488a60bd9a740011ee948d81904be2364f017e560169508f560f  libevdev-0.11.tar.gz
+# Locally computed sha256 checksums
+sha256  a547b196da4e5bb9588a6e24f1f36ae9e2349ca5375e2cf9c315186e237d9f6d  COPYING
diff --git a/package/python-libevdev/python-libevdev.mk b/package/python-libevdev/python-libevdev.mk
new file mode 100644
index 0000000000..e5256064c9
--- /dev/null
+++ b/package/python-libevdev/python-libevdev.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# python-libevdev
+#
+################################################################################
+
+PYTHON_LIBEVDEV_VERSION = 0.11
+PYTHON_LIBEVDEV_SOURCE = libevdev-$(PYTHON_LIBEVDEV_VERSION).tar.gz
+PYTHON_LIBEVDEV_SITE = https://files.pythonhosted.org/packages/b0/49/2fe589ce1fa6ca0f05ae0b1717923650f2cc6eec6307c71fbc7789738902
+PYTHON_LIBEVDEV_SETUP_TYPE = setuptools
+PYTHON_LIBEVDEV_LICENSE = MIT
+PYTHON_LIBEVDEV_LICENSE_FILES = COPYING
+
+# Requires a kernel built with user level driver support (uinput).
+define PYTHON_LIBEVDEV_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INPUT_MISC)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INPUT_UINPUT)
+endef
+
+$(eval $(python-package))
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
