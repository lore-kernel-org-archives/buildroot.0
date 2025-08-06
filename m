Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5FCC87FD1
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 11:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 717828421D;
	Wed,  6 Aug 2025 11:53:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HZFAHvJN5kNr; Wed,  6 Aug 2025 11:53:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 254DC845BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 254DC845BC;
	Wed,  6 Aug 2025 11:53:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DBB531
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 11:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04BAE60B8F
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 11:53:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nYshgsXAd1e9 for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 11:53:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 79635608A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79635608A9
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 79635608A9
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 11:53:19 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3b783ea502eso585259f8f.1
 for <buildroot@buildroot.org>; Wed, 06 Aug 2025 04:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754481197; x=1755085997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zz+b4daQ3kcyezTHGq11ULARpf1wrO0Pm6Sv30m815Y=;
 b=YXaeG70Tk5yE7CkNNTqvZXLOJUj9rSypqisG+YuyYSZdtT+s/AS81u8czaCbWwZxcD
 Ltm47PvSxI1EJarJ5Z/QnLUg54zNdU3uOeZ+UPugsQp2v/MQV8gSwaw37rnJFY0ZP+6Z
 Wi3nTCEoQ75HqSTMVBCv9n06qUjq30z2/eiVShmPkm5Rr3uRRes2hhRKoCNrEMUIvfKl
 W7mX59Cs8+LWXihKdXuskxWdHrs6ChB/yeWarFbrkIH/dEjGAF4XjyGSJlkVu4+yN6cK
 Bn72lp407204fEugaFbLzXDsHmjwUpPGqOgEWzUTdyd6sDN47+Gwezbt1Et7rD5kb5aY
 FISw==
X-Gm-Message-State: AOJu0YyzvzyxBLh7C4limCAwyYNIZsdFf28Hwqpw5lMRNjYquEShFwFV
 zIEuZsp0VQyDJyCfMZs74bXCDLCmpB9Sv8RFRGamWAhiYQSByOtxi3BGkePhTS4A4eFjz0lC1e9
 Jr8QW
X-Gm-Gg: ASbGncvl6aG54/gPtmkwffYIxiZDAhBGVwfEGfReeb8wZ8jrGXrcXAC0x1O07XArydn
 fvVH5PfD8ONJgQdjElTHSY3nfYzFMI7YlzVsgM4iWGHPBYZpx9qrN7/e+0S0um1FYNXOKvMbvi5
 ys/436biTEjKl9HFqq81yuqIJL9VeEJAjtBcvoJnPMLNSsuIJZLpe4lySr/7hL3KfBBcj3FbQ2t
 8FrqTDRbwzGHdZwBVSh7QsldYpfYun4nH2dg1HdxDPkSu28yfz8Mex5bNzhn6xSreL7o7iCi6z3
 MsqMwckDWW95Hlt80DVWbLZy/5ZENd88XUyRhQGVPhUdcbBd0tAtyHsWK2w/Z3n8hpiUk0dG0bG
 0D4hV0A69O2ss6WYzwCuW7baEkRL8Dd4HjUOxAUIriI53fRhU7oy7vHb9O49Gw4c7uePFWmC/0j
 YIPjEh9Zbrv4y7h9If+Q==
X-Google-Smtp-Source: AGHT+IHo0Y3RDyHO2N09zXMnfJ6WFeFiy2Rv9ZXIlmz5NPd2wRTCcFQBxQpAaV3JXl/7UXkruxH3Jg==
X-Received: by 2002:a05:6000:25c3:b0:3b7:8ed8:1c80 with SMTP id
 ffacd0b85a97d-3b8f430f0a7mr1886781f8f.3.1754481197244; 
 Wed, 06 Aug 2025 04:53:17 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2001:b07:6474:ebbf:3f96:8759:f916:8982])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459c58ed07fsm142606555e9.22.2025.08.06.04.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 04:53:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  6 Aug 2025 13:52:16 +0200
Message-ID: <20250806115219.3307438-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250806115219.3307438-1-dario.binacchi@amarulasolutions.com>
References: <20250806115219.3307438-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1754481197; x=1755085997;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zz+b4daQ3kcyezTHGq11ULARpf1wrO0Pm6Sv30m815Y=;
 b=QIVjFqFhEKl5GXbFB9dGTQzXQ0BrpLaAMxKjljebJT3xtsrbXod2hN68aZAAHpdlSB
 bEDLExdQxz8AdSzzEMUunVyZmgiDYeDOBp2Vj8hYYl7dff8ZPlcj7eVvGVxfd6FoZavg
 tpjp0Ecy26ihgE5N5wC7OmGysx+eBNN2H7op0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=QIVjFqFh
Subject: [Buildroot] [RFC PATCH 1/4] package/qt6: Add qmake functionality
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, linux-amarula@amarulasolutions.com,
 Giuseppe D'Angelo <giuseppe.dangelo@kdab.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Jesse Van Gavere <jesseevg@gmail.com>

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
Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>
[dario: fix HostData in qt.conf.in]
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/qt6/qt6.mk                  |  18 ++
 package/qt6/qt6base/qmake.conf.in   |  36 +++
 package/qt6/qt6base/qplatformdefs.h |   1 +
 package/qt6/qt6base/qt.conf.in      |   7 +
 package/qt6/qt6base/qt6base.mk      |  18 ++
 package/qt6/qt6base/qt6base.mk.save | 455 ++++++++++++++++++++++++++++
 6 files changed, 535 insertions(+)
 create mode 100644 package/qt6/qt6base/qmake.conf.in
 create mode 100644 package/qt6/qt6base/qplatformdefs.h
 create mode 100644 package/qt6/qt6base/qt.conf.in
 create mode 100644 package/qt6/qt6base/qt6base.mk.save

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index 33cbf7551f23..2d51c69269ac 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -12,3 +12,21 @@ QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)
 QT6_GIT = git://code.qt.io
 
 include $(sort $(wildcard package/qt6/*/*.mk))
+
+# The file "qt.conf" can be used to override the hard-coded paths that are
+# compiled into the Qt library. We need it to make "qmake" relocatable and
+# tweak the per-package install paths
+define QT6_INSTALL_QT_CONF
+	rm -f $(HOST_DIR)/bin/qt.conf
+	sed -e "s|@@HOST_DIR@@|$(HOST_DIR)|" -e "s|@@STAGING_DIR@@|$(STAGING_DIR)|" \
+		$(QT6BASE_PKGDIR)/qt.conf.in > $(HOST_DIR)/bin/qt.conf
+endef
+
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+define QT6_QT_CONF_FIXUP
+	$(QT6_INSTALL_QT_CONF)
+endef
+endif
+
+# Variable for other Qt applications to use
+QT6_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++
diff --git a/package/qt6/qt6base/qmake.conf.in b/package/qt6/qt6base/qmake.conf.in
new file mode 100644
index 000000000000..ebb8497d2df5
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
index 000000000000..99e9a2792329
--- /dev/null
+++ b/package/qt6/qt6base/qplatformdefs.h
@@ -0,0 +1 @@
+#include "../../linux-g++/qplatformdefs.h"
diff --git a/package/qt6/qt6base/qt.conf.in b/package/qt6/qt6base/qt.conf.in
new file mode 100644
index 000000000000..fee209f38c00
--- /dev/null
+++ b/package/qt6/qt6base/qt.conf.in
@@ -0,0 +1,7 @@
+[Paths]
+Prefix=/usr
+HostPrefix=@@HOST_DIR@@
+HostData=@@STAGING_DIR@@/usr
+Sysroot=@@STAGING_DIR@@
+SysrootifyPrefix=true
+TargetSpec=devices/linux-buildroot-g++
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 51a4f1b5be7f..697d1a96a920 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -55,6 +55,9 @@ QT6BASE_CONF_OPTS = \
 	-DFEATURE_system_zlib=ON \
 	-DFEATURE_system_libb2=ON
 
+QT6BASE_CFLAGS = $(TARGET_CFLAGS)
+QT6BASE_CXXFLAGS = $(TARGET_CXXFLAGS)
+
 # x86 optimization options. While we have a BR2_X86_CPU_HAS_AVX512, it
 # is not clear yet how it maps to all the avx512* options of Qt, so we
 # for now keeps them disabled.
@@ -431,5 +434,20 @@ define QT6BASE_RM_USR_MKSPECS
 endef
 QT6BASE_TARGET_FINALIZE_HOOKS += QT6BASE_RM_USR_MKSPECS
 
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
diff --git a/package/qt6/qt6base/qt6base.mk.save b/package/qt6/qt6base/qt6base.mk.save
new file mode 100644
index 000000000000..7c5acfbd9805
--- /dev/null
+++ b/package/qt6/qt6base/qt6base.mk.save
@@ -0,0 +1,455 @@
+################################################################################
+#
+# qt6base
+#
+################################################################################
+
+QT6BASE_VERSION = $(QT6_VERSION)
+QT6BASE_SITE = $(QT6_SITE)
+QT6BASE_SOURCE = qtbase-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6BASE_VERSION).tar.xz
+QT6BASE_CPE_ID_VENDOR = qt
+QT6BASE_CPE_ID_PRODUCT = qt
+
+QT6BASE_CMAKE_BACKEND = ninja
+
+QT6BASE_LICENSE = \
+	GPL-2.0+ or LGPL-3.0, \
+	GPL-3.0 with exception (tools), \
+	GFDL-1.3 (docs), \
+	Apache-2.0, \
+	BSD-3-Clause, \
+	BSL-1.0, \
+	MIT
+
+QT6BASE_LICENSE_FILES = \
+	LICENSES/Apache-2.0.txt \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/BSL-1.0.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/MIT.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt
+
+QT6BASE_DEPENDENCIES = \
+	host-qt6base \
+	double-conversion \
+	libb2 \
+	pcre2 \
+	zlib
+QT6BASE_INSTALL_STAGING = YES
+
+QT6BASE_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DINSTALL_ARCHDATADIR=lib/qt6 \
+	-DFEATURE_xml=OFF \
+	-DFEATURE_sql=OFF \
+	-DFEATURE_testlib=OFF \
+	-DFEATURE_network=OFF \
+	-DFEATURE_dbus=OFF \
+	-DFEATURE_icu=OFF \
+	-DFEATURE_glib=OFF \
+	-DFEATURE_system_doubleconversion=ON \
+	-DFEATURE_system_pcre2=ON \
+	-DFEATURE_system_zlib=ON \
+	-DFEATURE_system_libb2=ON
+
+QT6BASE_CFLAGS = $(TARGET_CFLAGS)
+QT6BASE_CXXFLAGS = $(TARGET_CXXFLAGS)
+
+# x86 optimization options. While we have a BR2_X86_CPU_HAS_AVX512, it
+# is not clear yet how it maps to all the avx512* options of Qt, so we
+# for now keeps them disabled.
+QT6BASE_CONF_OPTS += \
+	-DFEATURE_sse2=$(if $(BR2_X86_CPU_HAS_SSE2),ON,OFF) \
+	-DFEATURE_sse3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF) \
+	-DFEATURE_sse4_1=$(if $(BR2_X86_CPU_HAS_SSE4),ON,OFF) \
+	-DFEATURE_sse4_2=$(if $(BR2_X86_CPU_HAS_SSE42),ON,OFF) \
+	-DFEATURE_ssse3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF) \
+	-DFEATURE_avx=$(if $(BR2_X86_CPU_HAS_AVX),ON,OFF) \
+	-DFEATURE_avx2=$(if $(BR2_X86_CPU_HAS_AVX2),ON,OFF) \
+	-DFEATURE_avx512bw=OFF \
+	-DFEATURE_avx512cd=OFF \
+	-DFEATURE_avx512dq=OFF \
+	-DFEATURE_avx512er=OFF \
+	-DFEATURE_avx512f=OFF \
+	-DFEATURE_avx512ifma=OFF \
+	-DFEATURE_avx512pf=OFF \
+	-DFEATURE_avx512vbmi=OFF \
+	-DFEATURE_avx512vbmi2=OFF \
+	-DFEATURE_avx512vl=OFF \
+	-DFEATURE_vaes=OFF
+
+HOST_QT6BASE_DEPENDENCIES = \
+	host-double-conversion \
+	host-libb2 \
+	host-pcre2 \
+	host-zlib
+
+HOST_QT6BASE_CONF_OPTS = \
+	-DFEATURE_xml=ON \
+	-DFEATURE_dbus=OFF \
+	-DFEATURE_icu=OFF \
+	-DFEATURE_glib=OFF \
+	-DFEATURE_sql=OFF \
+	-DFEATURE_system_doubleconversion=ON \
+	-DFEATURE_system_libb2=ON \
+	-DFEATURE_system_pcre2=ON \
+	-DFEATURE_system_zlib=ON
+
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_CONCURRENT),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_concurrent=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_concurrent=OFF
+endif
+
+# We need host-qt6base with Gui support when building host-qt6shadertools,
+# otherwise the build is skipped and no qsb host tool is generated.
+# qt6shadertools fail to build if qsb is not available.
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_GUI),y)
+HOST_QT6BASE_CONF_OPTS += \
+	-DFEATURE_gui=ON \
+	-DFEATURE_freetype=OFF \
+	-DFEATURE_vulkan=OFF \
+	-DFEATURE_linuxfb=ON \
+	-DFEATURE_xcb=OFF \
+	-DFEATURE_opengl=OFF -DINPUT_opengl=no \
+	-DFEATURE_harfbuzz=OFF \
+	-DFEATURE_png=OFF \
+	-DFEATURE_gif=OFF \
+	-DFEATURE_jpeg=OFF \
+	-DFEATURE_printsupport=OFF \
+	-DFEATURE_kms=OFF \
+	-DFEATURE_fontconfig=OFF \
+	-DFEATURE_libinput=OFF \
+	-DFEATURE_tslib=OFF \
+	-DFEATURE_eglfs=OFF
+
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_WIDGETS),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_widgets=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_widgets=OFF
+endif
+
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
+endif
+
+# The Network module is explicitly required by qt6tools.
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_NETWORK),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
+endif
+
+# We need host-qt6base with Testlib support when building host-qt6declarative
+# with QuickTest support. QuickTest support is further required for building the
+# qmltestrunner host tool. qt6declarative will fail to build if qmltestrunner is
+# not available.
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_TEST),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_testlib=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_testlib=OFF
+endif
+
+# Conditional blocks below are ordered by alphabetic ordering of the
+# BR2_PACKAGE_* option.
+
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+QT6BASE_CONF_OPTS += -DFEATURE_libudev=ON
+QT6BASE_DEPENDENCIES += udev
+else
+QT6BASE_CONF_OPTS += -DFEATURE_libudev=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_ICU),y)
+QT6BASE_CONF_OPTS += -DFEATURE_icu=ON
+QT6BASE_DEPENDENCIES += icu
+else
+QT6BASE_CONF_OPTS += -DFEATURE_icu=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+QT6BASE_CONF_OPTS += -DFEATURE_glib=ON
+QT6BASE_DEPENDENCIES += libglib2
+else
+QT6BASE_CONF_OPTS += -DFEATURE_glib=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_GUI),y)
+QT6BASE_CONF_OPTS += \
+	-DFEATURE_gui=ON \
+	-DFEATURE_freetype=ON \
+	-DFEATURE_vulkan=OFF
+QT6BASE_DEPENDENCIES += freetype
+
+ifeq ($(BR2_PACKAGE_QT6BASE_VULKAN),y)
+QT6BASE_DEPENDENCIES   += vulkan-headers vulkan-loader
+QT6BASE_CONFIGURE_OPTS += -DFEATURE_vulkan=ON
+else
+QT6BASE_CONFIGURE_OPTS += -DFEATURE_vulkan=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_LINUXFB),y)
+QT6BASE_CONF_OPTS += -DFEATURE_linuxfb=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_linuxfb=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_XCB),y)
+QT6BASE_CONF_OPTS += \
+	-DFEATURE_xcb=ON \
+	-DFEATURE_xcb_xlib=ON \
+	-DFEATURE_xkbcommon=ON \
+	-DFEATURE_xkbcommon_x11=ON
+QT6BASE_DEPENDENCIES += \
+	libxcb \
+	libxkbcommon \
+	xcb-util-cursor \
+	xcb-util-wm \
+	xcb-util-image \
+	xcb-util-keysyms \
+	xcb-util-renderutil \
+	xlib_libX11
+else
+QT6BASE_CONF_OPTS += -DFEATURE_xcb=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_HARFBUZZ),y)
+QT6BASE_CONF_OPTS += -DFEATURE_harfbuzz=ON
+ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_4),y)
+# system harfbuzz in case __sync for 4 bytes is supported
+QT6BASE_CONF_OPTS += -DQT_USE_BUNDLED_BundledHarfbuzz=OFF
+QT6BASE_DEPENDENCIES += harfbuzz
+else #BR2_TOOLCHAIN_HAS_SYNC_4
+# qt harfbuzz otherwise (using QAtomic instead)
+QT6BASE_CONF_OPTS += -DQT_USE_BUNDLED_BundledHarfbuzz=ON
+QT6BASE_LICENSE += , MIT (harfbuzz)
+QT6BASE_LICENSE_FILES += src/3rdparty/harfbuzz-ng/COPYING
+endif
+else
+QT6BASE_CONF_OPTS += -DFEATURE_harfbuzz=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_PNG),y)
+QT6BASE_CONF_OPTS += -DFEATURE_png=ON -DFEATURE_system_png=ON
+QT6BASE_DEPENDENCIES += libpng
+else
+QT6BASE_CONF_OPTS += -DFEATURE_png=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_GIF),y)
+QT6BASE_CONF_OPTS += -DFEATURE_gif=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_gif=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_JPEG),y)
+QT6BASE_CONF_OPTS += -DFEATURE_jpeg=ON
+QT6BASE_DEPENDENCIES += jpeg
+else
+QT6BASE_CONF_OPTS += -DFEATURE_jpeg=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_PRINTSUPPORT),y)
+QT6BASE_CONF_OPTS += -DFEATURE_printsupport=ON
+ifeq ($(BR2_PACKAGE_CUPS),y)
+QT6BASE_CONF_OPTS += -DFEATURE_cups=ON
+QT6BASE_DEPENDENCIES += cups
+else
+QT6BASE_CONF_OPTS += -DFEATURE_cups=OFF
+endif
+else
+QT6BASE_CONF_OPTS += -DFEATURE_printsupport=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+QT6BASE_CONF_OPTS += -DFEATURE_kms=ON
+QT6BASE_DEPENDENCIES += libdrm
+else
+QT6BASE_CONF_OPTS += -DFEATURE_kms=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_FONTCONFIG),y)
+QT6BASE_CONF_OPTS += -DFEATURE_fontconfig=ON
+QT6BASE_DEPENDENCIES += fontconfig
+else
+QT6BASE_CONF_OPTS += -DFEATURE_fontconfig=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_WIDGETS),y)
+QT6BASE_CONF_OPTS += -DFEATURE_widgets=ON
+
+# only enable gtk support if libgtk3 X11 backend is enabled
+ifeq ($(BR2_PACKAGE_LIBGTK3)$(BR2_PACKAGE_LIBGTK3_X11),yy)
+QT6BASE_CONF_OPTS += -DFEATURE_gtk3=ON
+QT6BASE_DEPENDENCIES += libgtk3
+else
+QT6BASE_CONF_OPTS += -DFEATURE_gtk3=OFF
+endif
+
+else
+QT6BASE_CONF_OPTS += -DFEATURE_widgets=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBINPUT),y)
+QT6BASE_CONF_OPTS += -DFEATURE_libinput=ON
+QT6BASE_DEPENDENCIES += libinput
+else
+QT6BASE_CONF_OPTS += -DFEATURE_libinput=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_TSLIB),y)
+QT6BASE_CONF_OPTS += -DFEATURE_tslib=ON
+QT6BASE_DEPENDENCIES += tslib
+else
+QT6BASE_CONF_OPTS += -DFEATURE_tslib=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_EGLFS),y)
+QT6BASE_CONF_OPTS += -DFEATURE_egl=ON -DFEATURE_eglfs=ON
+QT6BASE_DEPENDENCIES += libegl libgbm
+else
+QT6BASE_CONF_OPTS += -DFEATURE_eglfs=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_OPENGL_DESKTOP),y)
+QT6BASE_CONF_OPTS += \
+	-DFEATURE_opengl=ON \
+	-DFEATURE_opengl_desktop=ON
+QT6BASE_DEPENDENCIES += libgl
+else ifeq ($(BR2_PACKAGE_QT6BASE_OPENGL_ES2),y)
+QT6BASE_CONF_OPTS += \
+	-DFEATURE_opengl=ON \
+	-DFEATURE_opengles2=ON \
+	-DFEATURE_opengl_desktop=OFF
+QT6BASE_DEPENDENCIES += libgles
+else
+QT6BASE_CONF_OPTS += -DFEATURE_opengl=OFF -DINPUT_opengl=no
+endif
+
+else
+QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
+endif
+
+QT6BASE_DEFAULT_QPA = $(call qstrip,$(BR2_PACKAGE_QT6BASE_DEFAULT_QPA))
+QT6BASE_CONF_OPTS += $(if $(QT6BASE_DEFAULT_QPA),-DQT_QPA_DEFAULT_PLATFORM=$(QT6BASE_DEFAULT_QPA))
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+QT6BASE_CONF_OPTS += -DINPUT_openssl=yes
+QT6BASE_DEPENDENCIES += openssl
+else
+QT6BASE_CONF_OPTS += -DINPUT_openssl=no
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_CONCURRENT),y)
+QT6BASE_CONF_OPTS += -DFEATURE_concurrent=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_concurrent=OFF
+endif
+
+# We need host-qt6base with D-Bus support, otherwise: "the tool
+# "Qt6::qdbuscpp2xml" was not found in the Qt6DBusTools package."
+ifeq ($(BR2_PACKAGE_QT6BASE_DBUS),y)
+QT6BASE_CONF_OPTS += -DFEATURE_dbus=ON -DINPUT_dbus=linked
+QT6BASE_DEPENDENCIES += dbus
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_dbus=ON
+HOST_QT6BASE_DEPENDENCIES += host-dbus
+else
+QT6BASE_CONF_OPTS += -DFEATURE_dbus=OFF
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_dbus=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_NETWORK),y)
+QT6BASE_CONF_OPTS += -DFEATURE_network=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
+endif
+
+# Qt6 SQL Plugins
+ifeq ($(BR2_PACKAGE_QT6BASE_SQL),y)
+QT6BASE_CONF_OPTS += -DFEATURE_sql=ON
+QT6BASE_CONF_OPTS += -DFEATURE_sql_db2=OFF -DFEATURE_sql_ibase=OFF -DFEATURE_sql_oci=OFF -DFEATURE_sql_odbc=OFF
+
+ifeq ($(BR2_PACKAGE_QT6BASE_MYSQL),y)
+QT6BASE_CONF_OPTS += -DFEATURE_sql_mysql=ON
+QT6BASE_DEPENDENCIES += mariadb
+else
+QT6BASE_CONF_OPTS += -DFEATURE_sql_mysql=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_PSQL),y)
+QT6BASE_CONF_OPTS += -DFEATURE_sql_psql=ON
+QT6BASE_DEPENDENCIES += postgresql
+else
+QT6BASE_CONF_OPTS += -DFEATURE_sql_psql=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_SQLITE),y)
+QT6BASE_CONF_OPTS += -DFEATURE_sql_sqlite=ON -DFEATURE_system_sqlite=ON
+QT6BASE_DEPENDENCIES += sqlite
+else
+QT6BASE_CONF_OPTS += -DFEATURE_sql_sqlite=OFF
+endif
+
+else
+QT6BASE_CONF_OPTS += -DFEATURE_sql=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_SYSLOG),y)
+QT6BASE_CONF_OPTS += -DFEATURE_syslog=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_syslog=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+QT6BASE_CONF_OPTS += -DFEATURE_journald=ON
+QT6BASE_DEPENDENCIES += systemd
+else
+QT6BASE_CONF_OPTS += -DFEATURE_journald=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_TEST),y)
+QT6BASE_CONF_OPTS += -DFEATURE_testlib=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_testlib=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_XML),y)
+QT6BASE_CONF_OPTS += -DFEATURE_xml=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_xml=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+QT6BASE_CONF_OPTS += -DFEATURE_zstd=ON
+QT6BASE_DEPENDENCIES += zstd
+else
+QT6BASE_CONF_OPTS += -DFEATURE_zstd=OFF
+endif
+
+define QT6BASE_RM_USR_MKSPECS
+	$(Q)rm -rf $(TARGET_DIR)/usr/mkspecs
+endef
+QT6BASE_TARGET_FINALIZE_HOOKS += QT6BASE_RM_USR_MKSPECS
+
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
+HOST_QT6BASE_PRE_CONFIGURE_HOOKS += QT6BASE_MAKE_BR_SPEC
+
+QT6BASE_PRE_CONFIGURE_HOOKS += QT6BASE_MAKE_BR_SPEC
+
+QT6BASE_POST_INSTALL_STAGING_HOOKS += QT6_INSTALL_QT_CONF
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
