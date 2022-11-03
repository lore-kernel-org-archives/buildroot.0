Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF37C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 19:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9B1240216;
	Thu,  3 Nov 2022 19:05:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9B1240216
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BtEX3VIm-uWi; Thu,  3 Nov 2022 19:05:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C601401D6;
	Thu,  3 Nov 2022 19:05:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C601401D6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 208281BF3C0
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07986401CB
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:05:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07986401CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kzJ_qUdxmbVu for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 19:04:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 514574016E
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 514574016E
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 19:04:58 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id 21so4536490edv.3
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 12:04:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yk9uDceJVcznaPfSTltPMp/KzoE7EkzGkHNjc3KrcXQ=;
 b=4vviJjQrjD3FtyMy5cDUJchVHUcw/teu+Msz/1WQpUrtbrhel/VEfaFJWiXJA5z5eZ
 LC/wwHYJBY3OyUxbHOLvMvpIBORqxyjp/mAJBft82LdzL7JdQmTKqDnVLqy/fLOrLW6+
 FinwS7/Pb9CVV9JM7U9D9D9vCGY/WIkkB9lvxlSEifJrTC1bmBh+9lWyv8v7xe3d7p+h
 1fI1uQ/Gfcczq6w6wFGPqAczHYywmMD/xwBvF/DZ/H0eZoG6xke/MVGQanUvaJZMf83v
 zA7WjJgoSuLZVIZbL4VJVTNY3AnTPb0x7QCn8cz6bRaHqgJSRvr/aTYDf+mG67BEb5f2
 7KMQ==
X-Gm-Message-State: ACrzQf0CzE4I0bPQMidDSCed/VPPhL4RfpEC8AeuyCwQCZjGWheI2bfg
 pi2tPEkJ1vLt4NG/zhg852Z7iQ89ZdVtRA==
X-Google-Smtp-Source: AMsMyM7ZvyznGy0lBgWNv72QKJtuEsVu0wtG7wCeJapBmJnFRqescVT5YrqFED4jwho3Add7R3RgEA==
X-Received: by 2002:a05:6402:1d4a:b0:461:d375:7927 with SMTP id
 dz10-20020a0564021d4a00b00461d3757927mr32521464edb.18.1667502295853; 
 Thu, 03 Nov 2022 12:04:55 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net
 (192.234-180-91.adsl-dyn.isp.belgacom.be. [91.180.234.192])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a1709061daa00b007ae1ab8f887sm842649ejh.14.2022.11.03.12.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 12:04:55 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 20:04:46 +0100
Message-Id: <20221103190446.3574423-1-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Yk9uDceJVcznaPfSTltPMp/KzoE7EkzGkHNjc3KrcXQ=;
 b=mUtkwdh64N02LH6iRWD10Lx4TZv1V4nk8dqJ9ZKuSanMLGwFm9uMIjToce9ctzuXBX
 9CZs8p0BBhJUm54QxcFdvQ57Nc5HsVMDRLjcrYtQCdBokNSJQm7KDtrijk+i8cAOITbz
 0bJ1k8rKMkAkD8U92X0o+DoZhdRRAE9067QzoWPWai4KSNEiDT5MW9sE4OcMlIeUsB2R
 MblaqT0TKFSKZiwtRBEehUsYDQDMDLZdyBejOIytJJO2SRmUDNn5/xforeYgDRkr2S+s
 V4rVU8P/jSAiGa5r0WGTHzu6odMAMdXUEMTDCrO1/ObWMwudPFrCd4Qr3bROsTFzWfvi
 eJwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mUtkwdh6
Subject: [Buildroot] [PATCH 1/1] package/qt6: Add qmake functionality
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The qmake functionality had been missing due to the new host/target
build requirement, to get it working the main parts of the qt5 qmake
has been kept, we're still making our own device spec which we use to
run qmake with along with passing some additional device options for our
flags/cross-compiler the biggest difference is that where previously
qt.conf was used to fixup per-paths builds, this is now always
created with changed contents so qmake looks at the correct target
directories.

A big thanks to Angelo Compagnucci for the encouragement and testing.

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/qt6.mk                  | 12 ++++++++++
 package/qt6/qt6base/qmake.conf.in   | 36 +++++++++++++++++++++++++++++
 package/qt6/qt6base/qplatformdefs.h |  1 +
 package/qt6/qt6base/qt.conf.in      |  7 ++++++
 package/qt6/qt6base/qt6base.mk      | 18 +++++++++++++++
 5 files changed, 74 insertions(+)
 create mode 100644 package/qt6/qt6base/qmake.conf.in
 create mode 100644 package/qt6/qt6base/qplatformdefs.h
 create mode 100644 package/qt6/qt6base/qt.conf.in

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index 575b2f826c..bd8fb0ab51 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -10,3 +10,15 @@ QT6_SOURCE_TARBALL_PREFIX = everywhere-src
 QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
 
 include $(sort $(wildcard package/qt6/*/*.mk))
+
+# The file "qt.conf" can be used to override the hard-coded paths that are
+# compiled into the Qt library. We need it to make "qmake" relocatable due
+# to the host/target build and tweak the per-package install pathes
+define QT6_INSTALL_QT_CONF
+	rm -f $(HOST_DIR)/bin/qt.conf
+	sed -e "s|@@HOST_DIR@@|$(HOST_DIR)|" -e "s|@@STAGING_DIR@@|$(STAGING_DIR)|" \
+		$(QT6BASE_PKGDIR)/qt.conf.in > $(HOST_DIR)/bin/qt.conf
+endef
+
+# Variable for other Qt applications to use
+QT6_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++
diff --git a/package/qt6/qt6base/qmake.conf.in b/package/qt6/qt6base/qmake.conf.in
new file mode 100644
index 0000000000..ebb8497d2d
--- /dev/null
+++ b/package/qt6/qt6base/qmake.conf.in
@@ -0,0 +1,36 @@
+# Qt6 has a mechanism to support "device" profiles, so that people can
+# specify the compiler, compiler flags and so on for a specific device.
+
+# We leverage this mechanism in the Buildroot packaging of qt6 to
+# simplify cross-compilation: we have our own "device" definition, which
+# allows us to easily pass the cross-compiler paths and flags from our
+# qt6.mk.
+
+include(../common/linux_device_pre.conf)
+
+# modifications to g++-unix.conf
+QMAKE_CC                = $${CROSS_COMPILE}gcc
+QMAKE_CXX               = $${CROSS_COMPILE}g++
+QMAKE_LINK		= $${CROSS_COMPILE}g++
+
+# modifications to gcc-base.conf
+QMAKE_CFLAGS           += $${BR_COMPILER_CFLAGS}
+QMAKE_CXXFLAGS         += $${BR_COMPILER_CXXFLAGS}
+# Remove all optimisation flags, we really only want our own.
+QMAKE_CFLAGS_OPTIMIZE       =
+QMAKE_CFLAGS_OPTIMIZE_DEBUG =
+QMAKE_CFLAGS_OPTIMIZE_FULL  =
+QMAKE_CFLAGS_OPTIMIZE_SIZE  =
+QMAKE_CFLAGS_DEBUG =
+QMAKE_CXXFLAGS_DEBUG =
+QMAKE_CFLAGS_RELEASE =
+QMAKE_CXXFLAGS_RELEASE =
+CONFIG                 += nostrip
+
+QMAKE_LIBS             += -lrt -lpthread -ldl
+QMAKE_CFLAGS_ISYSTEM   =
+
+@EGLFS_DEVICE@
+
+include(../common/linux_device_post.conf)
+load(qt_config)
diff --git a/package/qt6/qt6base/qplatformdefs.h b/package/qt6/qt6base/qplatformdefs.h
new file mode 100644
index 0000000000..99e9a27923
--- /dev/null
+++ b/package/qt6/qt6base/qplatformdefs.h
@@ -0,0 +1 @@
+#include "../../linux-g++/qplatformdefs.h"
diff --git a/package/qt6/qt6base/qt.conf.in b/package/qt6/qt6base/qt.conf.in
new file mode 100644
index 0000000000..4842bcb462
--- /dev/null
+++ b/package/qt6/qt6base/qt.conf.in
@@ -0,0 +1,7 @@
+[Paths]
+Prefix=/usr
+HostPrefix=@@HOST_DIR@@
+HostData=../target/usr
+Sysroot=@@STAGING_DIR@@
+SysrootifyPrefix=true
+TargetSpec=devices/linux-buildroot-g++
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index b7ee6037f3..9e2f884e94 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -35,6 +35,9 @@ QT6BASE_CONF_OPTS = \
 	-DFEATURE_system_zlib=ON \
 	-DFEATURE_system_libb2=ON
 
+QT6BASE_CFLAGS = $(TARGET_CFLAGS)
+QT6BASE_CXXFLAGS = $(TARGET_CXXFLAGS)
+
 # x86 optimization options. While we have a BR2_X86_CPU_HAS_AVX512, it
 # is not clear yet how it maps to all the avx512* options of Qt, so we
 # for now keeps them disabled.
@@ -215,5 +218,20 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_zstd=OFF
 endif
 
+define QT6BASE_MAKE_BR_SPEC
+	mkdir -p $(@D)/mkspecs/devices/linux-buildroot-g++/
+	sed 's/@EGLFS_DEVICE@/$(QT6BASE_EGLFS_DEVICE)/g' \
+		$(QT6BASE_PKGDIR)/qmake.conf.in > \
+		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
+	$(INSTALL) -m 0644 -D $(QT6BASE_PKGDIR)/qplatformdefs.h \
+		$(@D)/mkspecs/devices/linux-buildroot-g++/qplatformdefs.h
+endef
+
+QT6BASE_CONF_OPTS += -DQT_QMAKE_DEVICE_OPTIONS=CROSS_COMPILE="$(TARGET_CROSS)";BR_COMPILER_CFLAGS="$(QT6BASE_CFLAGS)";BR_COMPILER_CXXFLAGS="$(QT6BASE_CXX_FLAGS)"
+
+QT6BASE_PRE_CONFIGURE_HOOKS += QT6BASE_MAKE_BR_SPEC
+
+QT6BASE_POST_INSTALL_STAGING_HOOKS += QT6_INSTALL_QT_CONF
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
