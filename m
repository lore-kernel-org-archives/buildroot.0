Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F0DC4345F
	for <buildroot@archiver.kernel.org>; Sat, 13 Apr 2024 13:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6774882241;
	Sat, 13 Apr 2024 13:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DMDbcNwIp0T2; Sat, 13 Apr 2024 13:18:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB7F48225B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB7F48225B;
	Sat, 13 Apr 2024 13:18:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F97B1BF855
 for <buildroot@lists.busybox.net>; Sat, 13 Apr 2024 13:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 386A6400C4
 for <buildroot@lists.busybox.net>; Sat, 13 Apr 2024 13:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gD4kNOsPk9H3 for <buildroot@lists.busybox.net>;
 Sat, 13 Apr 2024 13:18:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 60B1340012
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60B1340012
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 60B1340012
 for <buildroot@buildroot.org>; Sat, 13 Apr 2024 13:18:04 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-516d2b9cd69so2058482e87.2
 for <buildroot@buildroot.org>; Sat, 13 Apr 2024 06:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713014282; x=1713619082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vhNtNmTR5Kt2gL7rLGuHCCPbIJ/cIUiuBkLXyq6uLAc=;
 b=PHMBObaf1M3YjOO3lQGFcYaSzc7hx/eqLNfJoTlT0yUdejVY+9XdR1v1xOisX1sWyN
 eBP+AQ5pnjy4QyGMVRs4uMT0mmUJ3lEdYrqFj0ILCFIotwqb4m3friISsYEVng+KTEuO
 UCP2OVC7OjY7WstC9A8jRTCURwKDb0Aa+NDv6ZIdG7sCvTgi7gl2pFa7gwaQ+8ntstye
 beMOiYRAryXkWK86AodEif+wvIezPYHyQXJhc36a2A4N+lDYZ0+I3VQePjbZH04/9CCK
 KduJpa2CvjuPlp1jVW+SBzhAJpc5gWL6S5icCiB1DU0z5XR4IFMowAcJ0TpMle+pmZxa
 8riQ==
X-Gm-Message-State: AOJu0YyYoDkhVZAgFR7Rc8YlPHrelhn373uNgSftVp/aIFwd+eLyuK23
 iwY/3UpLgOe78/C9wLpZo7Izbdp/Cp0dB7UDLCwHEQdKwJL1T04Z7gFUxh4Kqo3/wf+6ygOj/xW
 ovi0=
X-Google-Smtp-Source: AGHT+IFfuiyxdOXCb70G0pRvVvF3+bYE0anUSvgnjx/gFwLfEzhXKiw58VHM9u5kmz50fxQaQv19dQ==
X-Received: by 2002:ac2:538d:0:b0:516:dd4f:d9ea with SMTP id
 g13-20020ac2538d000000b00516dd4fd9eamr3477552lfh.5.1713014281822; 
 Sat, 13 Apr 2024 06:18:01 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-8-99-67.retail.telecomitalia.it. [87.8.99.67])
 by smtp.gmail.com with ESMTPSA id
 jy3-20020a170907762300b00a521603e14csm2993302ejc.138.2024.04.13.06.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Apr 2024 06:18:01 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 13 Apr 2024 15:17:56 +0200
Message-ID: <20240413131757.3627575-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240413131757.3627575-1-dario.binacchi@amarulasolutions.com>
References: <20240413131757.3627575-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1713014282; x=1713619082;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vhNtNmTR5Kt2gL7rLGuHCCPbIJ/cIUiuBkLXyq6uLAc=;
 b=EnljfwwKw5yfjy0Cae/fjo9bad5Zd+PKYucoje5skNrWosqMLRkt+kqH2XdxprRUeU
 aeofPWwynX6LZCnX+7kXbwLImGud1Vhw6RlsjSr/d4cfKtBuzgG/d+4NbeOzp+iEhRun
 uYLrUVwv33cL69wppOTzgbw7INbpCJ6Iuygyg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=EnljfwwK
Subject: [Buildroot] [PATCH 2/3] package/bmap-tools: rename to bmaptool
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
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch aligns the package name in Buildroot with the current one on
GitHub.
The bmaptool (previously bmap-tools) has been moved under the Yocto Project
umbrella and is now hosted at https://github.com/yoctoproject/bmaptool.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 Config.in.legacy                                     |  7 +++++++
 DEVELOPERS                                           |  8 ++++----
 package/Config.in                                    |  2 +-
 package/Config.in.host                               |  2 +-
 package/{bmap-tools => bmaptool}/Config.in           |  4 ++--
 package/{bmap-tools => bmaptool}/Config.in.host      |  4 ++--
 .../bmap-tools.hash => bmaptool/bmaptool.hash}       |  2 +-
 .../bmap-tools.mk => bmaptool/bmaptool.mk}           | 12 ++++++------
 .../{sample_bmap_tools.sh => sample_bmaptool.sh}     |  0
 .../package/{test_bmap_tools.py => test_bmaptool.py} |  6 +++---
 10 files changed, 27 insertions(+), 20 deletions(-)
 rename package/{bmap-tools => bmaptool}/Config.in (96%)
 rename package/{bmap-tools => bmaptool}/Config.in.host (88%)
 rename package/{bmap-tools/bmap-tools.hash => bmaptool/bmaptool.hash} (51%)
 rename package/{bmap-tools/bmap-tools.mk => bmaptool/bmaptool.mk} (51%)
 rename support/testing/tests/package/{sample_bmap_tools.sh => sample_bmaptool.sh} (100%)
 rename support/testing/tests/package/{test_bmap_tools.py => test_bmaptool.py} (95%)

diff --git a/Config.in.legacy b/Config.in.legacy
index 76af1da3488f..ced76d072b79 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.05"
 
+config BR2_PACKAGE_BMAP_TOOLS
+	bool "bmap_tools has been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_BMAPTOOL
+	help
+	  The bmap-tools package has been renamed to bmaptool.
+
 config BR2_TARGET_TI_K3_IMAGE_GEN
 	bool "ti-k3-image-gen removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 399b2931ff3d..8e3b7a464c26 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2316,7 +2316,7 @@ F:	board/intel/galileo/
 F:	configs/galileo_defconfig
 
 N:	Nicolas Carrier <nicolas.carrier@orolia.com>
-F:	package/bmap-tools/
+F:	package/bmaptool/
 F:	package/composer/
 F:	package/libdbi/
 F:	package/libdbi-drivers/
@@ -2331,12 +2331,12 @@ F:	package/python-augeas/
 F:	package/python-flask-expects-json/
 F:	package/python-git/
 F:	package/python-unittest-xml-reporting/
-F:	support/testing/tests/package/sample_bmap_tools.sh
+F:	support/testing/tests/package/sample_bmaptool.sh
 F:	support/testing/tests/package/sample_python_augeas.py
 F:	support/testing/tests/package/sample_python_flask_expects_json.py
 F:	support/testing/tests/package/sample_python_git.py
 F:	support/testing/tests/package/sample_python_unittest_xml_reporting.py
-F:	support/testing/tests/package/test_bmap_tools.py
+F:	support/testing/tests/package/test_bmaptool.py
 F:	support/testing/tests/package/test_lua_augeas.py
 F:	support/testing/tests/package/test_php_apcu.py
 F:	support/testing/tests/package/test_php_pecl_dbus.py
@@ -2992,7 +2992,7 @@ F:	configs/stm32mp157c_dk2_defconfig
 F:	package/android-tools/
 F:	package/b43-firmware/
 F:	package/b43-fwcutter/
-F:	package/bmap-tools/
+F:	package/bmaptool/
 F:	package/c-periphery/
 F:	package/cdrkit/
 F:	package/cifs-utils/
diff --git a/package/Config.in b/package/Config.in
index 1935077f0f45..a47a75331014 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -213,7 +213,7 @@ menu "Filesystem and flash utilities"
 	source "package/aufs/Config.in"
 	source "package/aufs-util/Config.in"
 	source "package/autofs/Config.in"
-	source "package/bmap-tools/Config.in"
+	source "package/bmaptool/Config.in"
 	source "package/btrfs-progs/Config.in"
 	source "package/cifs-utils/Config.in"
 	source "package/cpio/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index 9543a22ffc6a..2f8a95933b3b 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -7,7 +7,7 @@ menu "Host utilities"
 	source "package/android-tools/Config.in.host"
 	source "package/asn1c/Config.in.host"
 	source "package/babeltrace2/Config.in.host"
-	source "package/bmap-tools/Config.in.host"
+	source "package/bmaptool/Config.in.host"
 	source "package/bootgen/Config.in.host"
 	source "package/btrfs-progs/Config.in.host"
 	source "package/cbootimage/Config.in.host"
diff --git a/package/bmap-tools/Config.in b/package/bmaptool/Config.in
similarity index 96%
rename from package/bmap-tools/Config.in
rename to package/bmaptool/Config.in
index 425b7dfb9e07..821508b35665 100644
--- a/package/bmap-tools/Config.in
+++ b/package/bmaptool/Config.in
@@ -1,5 +1,5 @@
-config BR2_PACKAGE_BMAP_TOOLS
-	bool "bmap-tools"
+config BR2_PACKAGE_BMAPTOOL
+	bool "bmaptool"
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime, pkg_resources
diff --git a/package/bmap-tools/Config.in.host b/package/bmaptool/Config.in.host
similarity index 88%
rename from package/bmap-tools/Config.in.host
rename to package/bmaptool/Config.in.host
index cb4d35a437fa..9a341d38775a 100644
--- a/package/bmap-tools/Config.in.host
+++ b/package/bmaptool/Config.in.host
@@ -1,5 +1,5 @@
-config BR2_PACKAGE_HOST_BMAP_TOOLS
-	bool "host bmap-tools"
+config BR2_PACKAGE_HOST_BMAPTOOL
+	bool "host bmaptool"
 	select BR2_PACKAGE_HOST_PYTHON_SIX # runtime
 	help
 	  Tool to flash image files to block devices using the block map
diff --git a/package/bmap-tools/bmap-tools.hash b/package/bmaptool/bmaptool.hash
similarity index 51%
rename from package/bmap-tools/bmap-tools.hash
rename to package/bmaptool/bmaptool.hash
index 82a570ecacdb..9d621e76a52a 100644
--- a/package/bmap-tools/bmap-tools.hash
+++ b/package/bmaptool/bmaptool.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0658afb972e7221aa16fece3f84e29e5102e901c929253d7fb6040bde28243f7  bmap-tools-3.6.tar.gz
+sha256  7a2e1305bf7e06bc4a580cc719f0facf9d99af8d41659b57c0acae4ad93ff45a  bmaptool-3.6.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/bmap-tools/bmap-tools.mk b/package/bmaptool/bmaptool.mk
similarity index 51%
rename from package/bmap-tools/bmap-tools.mk
rename to package/bmaptool/bmaptool.mk
index 69a22c4745ab..34664d13b37f 100644
--- a/package/bmap-tools/bmap-tools.mk
+++ b/package/bmaptool/bmaptool.mk
@@ -1,14 +1,14 @@
 ################################################################################
 #
-# bmap-tools
+# bmaptool
 #
 ################################################################################
 
-BMAP_TOOLS_VERSION = 3.6
-BMAP_TOOLS_SITE = $(call github,yoctoproject,bmaptool,v$(BMAP_TOOLS_VERSION))
-BMAP_TOOLS_LICENSE = GPL-2.0
-BMAP_TOOLS_LICENSE_FILES = COPYING
-BMAP_TOOLS_SETUP_TYPE = setuptools
+BMAPTOOL_VERSION = 3.6
+BMAPTOOL_SITE = $(call github,yoctoproject,bmaptool,v$(BMAPTOOL_VERSION))
+BMAPTOOL_LICENSE = GPL-2.0
+BMAPTOOL_LICENSE_FILES = COPYING
+BMAPTOOL_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
 $(eval $(host-python-package))
diff --git a/support/testing/tests/package/sample_bmap_tools.sh b/support/testing/tests/package/sample_bmaptool.sh
similarity index 100%
rename from support/testing/tests/package/sample_bmap_tools.sh
rename to support/testing/tests/package/sample_bmaptool.sh
diff --git a/support/testing/tests/package/test_bmap_tools.py b/support/testing/tests/package/test_bmaptool.py
similarity index 95%
rename from support/testing/tests/package/test_bmap_tools.py
rename to support/testing/tests/package/test_bmaptool.py
index a179027633df..f88239ecf81e 100644
--- a/support/testing/tests/package/test_bmap_tools.py
+++ b/support/testing/tests/package/test_bmaptool.py
@@ -7,7 +7,7 @@ from infra.basetest import BRTest
 
 class TestBmapTools(BRTest):
     __test__ = False
-    sample_script = "tests/package/sample_bmap_tools.sh"
+    sample_script = "tests/package/sample_bmaptool.sh"
     copy_script = 'tests/package/copy-sample-script-to-target.sh'
     config = \
         """
@@ -15,7 +15,7 @@ class TestBmapTools(BRTest):
         BR2_cortex_a8=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_PACKAGE_BMAP_TOOLS=y
+        BR2_PACKAGE_BMAPTOOL=y
         BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
         BR2_ROOTFS_POST_SCRIPT_ARGS="{}"
         BR2_TARGET_ROOTFS_EXT2=y
@@ -56,7 +56,7 @@ class TestPy3BmapTools(TestBmapTools):
 class TestHostBmapTools(BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
-        BR2_PACKAGE_HOST_BMAP_TOOLS=y
+        BR2_PACKAGE_HOST_BMAPTOOL=y
         # BR2_TARGET_ROOTFS_TAR is not set
         BR2_TARGET_ROOTFS_EXT2=y
         """
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
