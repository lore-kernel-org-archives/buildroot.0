Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6243EC4321E
	for <buildroot@archiver.kernel.org>; Thu,  1 Dec 2022 01:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFB164180C;
	Thu,  1 Dec 2022 01:45:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFB164180C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id APpJ0qrG6Z_r; Thu,  1 Dec 2022 01:45:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C0C54180D;
	Thu,  1 Dec 2022 01:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C0C54180D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B6C51BF2F9
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 01:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3D326102E
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 01:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3D326102E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pAMVE1NLeaT3 for <buildroot@lists.busybox.net>;
 Thu,  1 Dec 2022 01:45:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF9E0607FE
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF9E0607FE
 for <buildroot@buildroot.org>; Thu,  1 Dec 2022 01:45:41 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id w129so496428pfb.5
 for <buildroot@buildroot.org>; Wed, 30 Nov 2022 17:45:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5K8SC3vGvKelR7RjhIB0oHhtiL137D89loUXdRK2Avs=;
 b=6mCvIZerRWTWnlg+Xkh3wMf/FjG5PfF0VbvK5+516ojH6B+pIDc3caUWMzt1pnM+XN
 iIc9Wu1DjqIrnubDdkv4Zek+Y+q4uoXQTm3s5Amof3RNHv6idu86/xO6clKLy/JDs41F
 qlFeZ7dCWumXd289TWRkp9Tv+TClKsu5TuLbDrLc/XtFMl0kd1WzJUBVLtyvZEHLCB4a
 L+MXtNt24u8tepRHQrvwlqjL2YsUpQOGq1EXCbA97cKFUF0wMKB1No35d6mj1kn2Pncq
 j2NsMGrHe6a/SHAQs84NdYPUnq8yRdvbrL/W3lS22ygstcbTLWkFVyngXu/6dDfZ/4YT
 ZK5w==
X-Gm-Message-State: ANoB5pkwppwuJqjpBAS8dPdoUHgi73qTEtElStLWhC5zpk1n3inZ5KJV
 PL0Hnxv4Uw9W9DDgLbOalFqjrtkkkx0=
X-Google-Smtp-Source: AA0mqf5TVku8I3CPFVpKV6o7uGiDCCOb2SJOAXhbTf/E3UI6ZwvAUBZW0UteM8ZmNV4xKB2S8+Ia+g==
X-Received: by 2002:a63:2447:0:b0:478:645f:e975 with SMTP id
 k68-20020a632447000000b00478645fe975mr3607494pgk.61.1669859140724; 
 Wed, 30 Nov 2022 17:45:40 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 e4-20020a056a0000c400b0057293b17c8bsm2004227pfj.22.2022.11.30.17.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 17:45:40 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 30 Nov 2022 17:45:38 -0800
Message-Id: <20221201014538.679048-1-christian@paral.in>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/rtl8821cu: new package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adds support for USB rtl8821cu wifi cards.

Similar to rtl8821au and rtl8812au-aircrack-ng packages.

https://github.com/morrownr/8821cu-20210118

Signed-off-by: Christian Stewart <christian@paral.in>

---

v1 -> v2:

  - add myself to DEVELOPERS
  - bump to latest commit 615995
    - fixes build failure against the odroid xu4 kernel
  - simplify -Werror=date-time fix-patch
  - simplify makefile patches

Signed-off-by: Christian Stewart <christian@paral.in>
---
 DEVELOPERS                                    |   1 +
 package/Config.in                             |   1 +
 .../0001-makefile-cleanup-whitespace.patch    | 122 ++++++++++++++++++
 ...akefile-remove-Wno-date-time-warning.patch |  30 +++++
 package/rtl8821cu/Config.in                   |  10 ++
 package/rtl8821cu/rtl8821cu.hash              |   3 +
 package/rtl8821cu/rtl8821cu.mk                |  19 +++
 7 files changed, 186 insertions(+)
 create mode 100644 package/rtl8821cu/0001-makefile-cleanup-whitespace.patch
 create mode 100644 package/rtl8821cu/0002-makefile-remove-Wno-date-time-warning.patch
 create mode 100644 package/rtl8821cu/Config.in
 create mode 100644 package/rtl8821cu/rtl8821cu.hash
 create mode 100644 package/rtl8821cu/rtl8821cu.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index bfebf8163c..6d274749da 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -551,6 +551,7 @@ F:	package/mosh/
 F:	package/nerdctl/
 F:	package/pkg-golang.mk
 F:	package/rtl8821au/
+F:	package/rtl8821cu/
 F:	package/runc/
 F:	package/tini/
 F:	support/testing/tests/package/test_docker_compose.py
diff --git a/package/Config.in b/package/Config.in
index aef80f9ab0..f94999a84f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -584,6 +584,7 @@ endmenu
 	source "package/rtl8723ds/Config.in"
 	source "package/rtl8812au-aircrack-ng/Config.in"
 	source "package/rtl8821au/Config.in"
+	source "package/rtl8821cu/Config.in"
 	source "package/sane-backends/Config.in"
 	source "package/sdparm/Config.in"
 	source "package/sedutil/Config.in"
diff --git a/package/rtl8821cu/0001-makefile-cleanup-whitespace.patch b/package/rtl8821cu/0001-makefile-cleanup-whitespace.patch
new file mode 100644
index 0000000000..b09a0ef70f
--- /dev/null
+++ b/package/rtl8821cu/0001-makefile-cleanup-whitespace.patch
@@ -0,0 +1,122 @@
+From 839960e49d82eb3c463a8020a039cec888a95511 Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@paral.in>
+Date: Wed, 30 Nov 2022 16:07:28 -0800
+Subject: [PATCH] makefile: cleanup whitespace
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ Makefile | 28 ++++++++++++++--------------
+ 1 file changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index df5380d..7d79fcd 100644
+--- a/Makefile
++++ b/Makefile
+@@ -309,8 +309,8 @@ endif
+ EXTRA_CFLAGS += -DCONFIG_RTL8188E
+ 
+ _HAL_INTFS_FILES +=	hal/HalPwrSeqCmd.o \
+-					hal/$(RTL871X)/Hal8188EPwrSeq.o\
+- 					hal/$(RTL871X)/$(RTL871X)_xmit.o\
++					hal/$(RTL871X)/Hal8188EPwrSeq.o \
++					hal/$(RTL871X)/$(RTL871X)_xmit.o \
+ 					hal/$(RTL871X)/$(RTL871X)_sreset.o
+ 
+ _HAL_INTFS_FILES +=	hal/$(RTL871X)/$(RTL871X)_hal_init.o \
+@@ -365,8 +365,8 @@ MODULE_NAME = 8192ee
+ endif
+ EXTRA_CFLAGS += -DCONFIG_RTL8192E
+ _HAL_INTFS_FILES += hal/HalPwrSeqCmd.o \
+-					hal/$(RTL871X)/Hal8192EPwrSeq.o\
+-					hal/$(RTL871X)/$(RTL871X)_xmit.o\
++					hal/$(RTL871X)/Hal8192EPwrSeq.o \
++					hal/$(RTL871X)/$(RTL871X)_xmit.o \
+ 					hal/$(RTL871X)/$(RTL871X)_sreset.o
+ 
+ _HAL_INTFS_FILES +=	hal/$(RTL871X)/$(RTL871X)_hal_init.o \
+@@ -425,8 +425,8 @@ endif
+ 
+ _HAL_INTFS_FILES +=  hal/HalPwrSeqCmd.o \
+ 					hal/$(RTL871X)/Hal8812PwrSeq.o \
+-					hal/$(RTL871X)/Hal8821APwrSeq.o\
+-					hal/$(RTL871X)/$(RTL871X)_xmit.o\
++					hal/$(RTL871X)/Hal8821APwrSeq.o \
++					hal/$(RTL871X)/$(RTL871X)_xmit.o \
+ 					hal/$(RTL871X)/$(RTL871X)_sreset.o
+ 
+ _HAL_INTFS_FILES +=	hal/$(RTL871X)/$(RTL871X)_hal_init.o \
+@@ -532,7 +532,7 @@ endif
+ EXTRA_CFLAGS += -DCONFIG_RTL8723B
+ 
+ _HAL_INTFS_FILES += hal/HalPwrSeqCmd.o \
+-					hal/$(RTL871X)/Hal8723BPwrSeq.o\
++					hal/$(RTL871X)/Hal8723BPwrSeq.o \
+ 					hal/$(RTL871X)/$(RTL871X)_sreset.o
+ 
+ _HAL_INTFS_FILES +=	hal/$(RTL871X)/$(RTL871X)_hal_init.o \
+@@ -594,7 +594,7 @@ EXTRA_CFLAGS += -DCONFIG_RTL8814A
+ 
+ _HAL_INTFS_FILES +=  hal/HalPwrSeqCmd.o \
+ 					hal/$(RTL871X)/Hal8814PwrSeq.o \
+-					hal/$(RTL871X)/$(RTL871X)_xmit.o\
++					hal/$(RTL871X)/$(RTL871X)_xmit.o \
+ 					hal/$(RTL871X)/$(RTL871X)_sreset.o
+ 
+ _HAL_INTFS_FILES +=	hal/$(RTL871X)/$(RTL871X)_hal_init.o \
+@@ -654,7 +654,7 @@ endif
+ EXTRA_CFLAGS += -DCONFIG_RTL8703B
+ 
+ _HAL_INTFS_FILES += hal/HalPwrSeqCmd.o \
+-					hal/$(RTL871X)/Hal8703BPwrSeq.o\
++					hal/$(RTL871X)/Hal8703BPwrSeq.o \
+ 					hal/$(RTL871X)/$(RTL871X)_sreset.o
+ 
+ _HAL_INTFS_FILES +=	hal/$(RTL871X)/$(RTL871X)_hal_init.o \
+@@ -710,7 +710,7 @@ endif
+ EXTRA_CFLAGS += -DCONFIG_RTL8723D
+ 
+ _HAL_INTFS_FILES += hal/HalPwrSeqCmd.o \
+-					hal/$(RTL871X)/Hal8723DPwrSeq.o\
++					hal/$(RTL871X)/Hal8723DPwrSeq.o \
+ 					hal/$(RTL871X)/$(RTL871X)_sreset.o
+ 
+ _HAL_INTFS_FILES +=	hal/$(RTL871X)/$(RTL871X)_hal_init.o \
+@@ -778,7 +778,7 @@ endif
+ EXTRA_CFLAGS += -DCONFIG_RTL8188F
+ 
+ _HAL_INTFS_FILES += hal/HalPwrSeqCmd.o \
+-					hal/$(RTL871X)/Hal8188FPwrSeq.o\
++					hal/$(RTL871X)/Hal8188FPwrSeq.o \
+ 					hal/$(RTL871X)/$(RTL871X)_sreset.o
+ 
+ _HAL_INTFS_FILES +=	hal/$(RTL871X)/$(RTL871X)_hal_init.o \
+@@ -825,7 +825,7 @@ endif
+ EXTRA_CFLAGS += -DCONFIG_RTL8188GTV
+ 
+ _HAL_INTFS_FILES += hal/HalPwrSeqCmd.o \
+-					hal/$(RTL871X)/Hal8188GTVPwrSeq.o\
++					hal/$(RTL871X)/Hal8188GTVPwrSeq.o \
+ 					hal/$(RTL871X)/$(RTL871X)_sreset.o
+ 
+ _HAL_INTFS_FILES +=	hal/$(RTL871X)/$(RTL871X)_hal_init.o \
+@@ -903,7 +903,7 @@ endif
+ EXTRA_CFLAGS += -DCONFIG_RTL8710B
+ 
+ _HAL_INTFS_FILES += hal/HalPwrSeqCmd.o \
+-					hal/$(RTL871X)/Hal8710BPwrSeq.o\
++					hal/$(RTL871X)/Hal8710BPwrSeq.o \
+ 					hal/$(RTL871X)/$(RTL871X)_sreset.o
+ 
+ _HAL_INTFS_FILES +=	hal/$(RTL871X)/$(RTL871X)_hal_init.o \
+@@ -950,7 +950,7 @@ endif
+ EXTRA_CFLAGS += -DCONFIG_RTL8192F
+ 
+ _HAL_INTFS_FILES += hal/HalPwrSeqCmd.o \
+-					hal/$(RTL871X)/Hal8192FPwrSeq.o\
++					hal/$(RTL871X)/Hal8192FPwrSeq.o \
+ 					hal/$(RTL871X)/$(RTL871X)_sreset.o
+ 
+ _HAL_INTFS_FILES +=	hal/$(RTL871X)/$(RTL871X)_hal_init.o \
+-- 
+2.38.1
+
diff --git a/package/rtl8821cu/0002-makefile-remove-Wno-date-time-warning.patch b/package/rtl8821cu/0002-makefile-remove-Wno-date-time-warning.patch
new file mode 100644
index 0000000000..9cfef82256
--- /dev/null
+++ b/package/rtl8821cu/0002-makefile-remove-Wno-date-time-warning.patch
@@ -0,0 +1,30 @@
+From 7379f5ff5bd8c3f8d67db1345f4bb95850d24cd6 Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@paral.in>
+Date: Wed, 30 Nov 2022 16:08:25 -0800
+Subject: [PATCH] makefile: remove Wno-date-time warning
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ Makefile | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 7d79fcd..4d1de64 100644
+--- a/Makefile
++++ b/Makefile
+@@ -22,11 +22,7 @@ EXTRA_CFLAGS += -Wno-implicit-fallthrough
+ # gcc-12
+ EXTRA_CFLAGS += -Wno-address
+ EXTRA_CFLAGS += -Wframe-larger-than=1648
+-
+-GCC_VER_49 := $(shell echo `$(CC) -dumpversion | cut -f1-2 -d.` \>= 4.9 | bc )
+-ifeq ($(GCC_VER_49),1)
+-EXTRA_CFLAGS += -Wno-date-time	# Fix compile error && warning on gcc 4.9 and later
+-endif
++EXTRA_CFLAGS += -Wno-error=date-time
+ 
+ EXTRA_CFLAGS += -I$(src)/include
+ 
+-- 
+2.38.1
+
diff --git a/package/rtl8821cu/Config.in b/package/rtl8821cu/Config.in
new file mode 100644
index 0000000000..a5a7b9d255
--- /dev/null
+++ b/package/rtl8821cu/Config.in
@@ -0,0 +1,10 @@
+comment "rtl8821cu needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_RTL8821CU
+	bool "rtl8821cu"
+	depends on BR2_LINUX_KERNEL
+	help
+	  rtl8821cu wifi driver
+
+	  https://github.com/brektrou/rtl8821CU
diff --git a/package/rtl8821cu/rtl8821cu.hash b/package/rtl8821cu/rtl8821cu.hash
new file mode 100644
index 0000000000..08210ab48e
--- /dev/null
+++ b/package/rtl8821cu/rtl8821cu.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  f270453b197f8054ff74c23d17fc5f9c16d39edcb31e0b633ac35bf3912ad4e7  rtl8821cu-615995394599ab238bf282f0d3b7b9894f56873a.tar.gz
+sha256  9210367ff7e694e79743ad0c6cf4cbc844d32dba70deaba085805ed0e0515935  LICENSE
diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
new file mode 100644
index 0000000000..45727eee93
--- /dev/null
+++ b/package/rtl8821cu/rtl8821cu.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# rtl8821cu
+#
+################################################################################
+
+RTL8821CU_VERSION = 615995394599ab238bf282f0d3b7b9894f56873a
+RTL8821CU_SITE = $(call github,morrownr,8821cu-20210118,$(RTL8821CU_VERSION))
+RTL8821CU_LICENSE = GPL-2.0
+RTL8821CU_LICENSE_FILES = LICENSE
+
+RTL8821CU_MODULE_MAKE_OPTS = \
+	CONFIG_RTL8821CU=m \
+	KVER=$(LINUX_VERSION_PROBED) \
+	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
+		-DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT"
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
