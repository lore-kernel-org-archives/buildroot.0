Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4680BC4345F
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 14:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6252605C3;
	Thu, 11 Apr 2024 14:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PaKM2ZOHWgRq; Thu, 11 Apr 2024 14:56:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A05AD606BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A05AD606BD;
	Thu, 11 Apr 2024 14:56:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D0F531BF370
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 14:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDAD040201
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 14:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EXdboSAydG4G for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 14:56:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=ben.hutchings@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A41D040196
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A41D040196
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A41D040196
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 14:56:18 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d717603aa5so92228531fa.0
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 07:56:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712847376; x=1713452176;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u5bnm6DScLyRYMTcYAaAXSVem3eBW/UxS2vWxL/ajl0=;
 b=fXqUBIbOjF5D1UjC5ygOvWokIlNWe26fxeeFlsnMpNPA3cYa0gTFyE+JSC+9/GErsl
 YOfYFpoxiXwvKzypQFJkRTVvd+tzCeLzzbNOrAb65/0eGVbPan8Ildyc7+T6gkSThaR8
 HtZGUN32HGxjJR2V1X+ZlCvYvbKCdPkiqhvG05DLcbJMuaJQgCuGh9aJEu5rh74KCNtz
 aars9eOCEA6dQnTCBOT3Vzx4TGBaNc51XJurMBQ0b89VBLse0HFTp3+chWi+Qzt432l4
 vsGalbZX1QcLm5kgdz82J2cDWRMmAU0XG0c0Tmy2b2h3CtjSaMBiKnCczeJKgCg1Qnwa
 8aRw==
X-Gm-Message-State: AOJu0YywklYyQrDJ9R3AzPjKR2g2gTfGu7BX85IkPVqLNQqopPswBflD
 cOnzt1nF/k7KJIQToOFWUBL1yTuMgHH2aBj5fu1BGk1juBLlM/09Lm/nR2d5EQ8kIGMPcYvsib3
 +63w=
X-Google-Smtp-Source: AGHT+IGIUB7v5KbAJNqZxlhicvpTB7DhD9XZhE6DgjMEuX8W7r8cba2ILfSvRlG1jLdNkPmEhAfSQA==
X-Received: by 2002:a2e:98c7:0:b0:2d8:dd28:8748 with SMTP id
 s7-20020a2e98c7000000b002d8dd288748mr3228786ljj.1.1712847375892; 
 Thu, 11 Apr 2024 07:56:15 -0700 (PDT)
Received: from cephalopod.i.decadent.org.uk
 (213.219.156.63.adsl.dyn.edpnet.net. [213.219.156.63])
 by smtp.gmail.com with ESMTPSA id
 n39-20020a05600c502700b00417e3695371sm1318335wmr.33.2024.04.11.07.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 07:56:15 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 16:55:58 +0200
Message-Id: <20240411145559.1183064-1-ben.hutchings@mind.be>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712847376; x=1713452176; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u5bnm6DScLyRYMTcYAaAXSVem3eBW/UxS2vWxL/ajl0=;
 b=HYFNTwMn9RhQdANBxPbCfvgNLoOr7cXdN29AOYmXcY0FD8759BsyAj6RovPtwmOOFN
 kpcI3KScBGS7d0SiJt9oKXO4bczDUOW9BYsSowrXvZU0/8hoNzg4yB42TWCSdqac9j8/
 gcVSFBJpjlg/j4+f1I+qOLSeoB8lOHAf4aJaO/0G2ixP2Pbw+H+mN+gsgILJ/+Ncperc
 q/mLExoob+JuQGaPTKlzbxgDusm2KsQEa/vhjFvCNpekHBvUHiKGwEgOYu+avOtuMnks
 4G6ohMpqy+LkchNbE6AJ7Bm97Lq/tQogYIoW94Zo+uJf08HfZT0NdZcbRgNQUl0qV42u
 tDuw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HYFNTwMn
Subject: [Buildroot] [PATCH] package/qt6/qt6base: Make qmake work
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
From: Ben Hutchings via buildroot <buildroot@buildroot.org>
Reply-To: Ben Hutchings <ben.hutchings@mind.be>
Cc: Ben Hutchings <ben.hutchings@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently the qt6base package does not install a working qmake
program, so applications can only be built with CMake.

To ease upgrades from Qt 5, make qmake work as well:

- Create a linux-buildroot-g++ device spec, like we do for Qt 5.

- Fix the generated target_qt.conf file.  The Qt build system
  currently generates this with the sysroot directory wrongly added in
  various places.

- Fix the qmake wrapper script in the sysroot to set the QMAKEPATH
  environment variable.

Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
---
 package/qt6/qt6base/qmake.conf.in     | 34 +++++++++++++++++++++++
 package/qt6/qt6base/qplatformdefs.h   |  1 +
 package/qt6/qt6base/qt6base.mk        | 39 +++++++++++++++++++++++++++
 package/qt6/qt6base/target_qt.conf.in | 11 ++++++++
 4 files changed, 85 insertions(+)
 create mode 100644 package/qt6/qt6base/qmake.conf.in
 create mode 100644 package/qt6/qt6base/qplatformdefs.h
 create mode 100644 package/qt6/qt6base/target_qt.conf.in

diff --git a/package/qt6/qt6base/qmake.conf.in b/package/qt6/qt6base/qmake.conf.in
new file mode 100644
index 0000000000..b62a671c35
--- /dev/null
+++ b/package/qt6/qt6base/qmake.conf.in
@@ -0,0 +1,34 @@
+# Qt6 has a mechanism to support "device" profiles, so that people can
+# specify the compiler, compiler flags and so on for a specific device.
+
+# We leverage this mechanism in the Buildroot packaging of qt6 to
+# simplify cross-compilation: we have our own "device" definition, which
+# allows us to easily pass the cross-compiler paths and flags from our
+# qt6.mk.
+
+CROSS_COMPILE = @CROSS_COMPILE@
+
+include(../common/linux_device_pre.conf)
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
+# Architecture specific configuration
+include(arch.conf)
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
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 6857725ef5..049d73a84f 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -78,6 +78,45 @@ QT6BASE_CONF_OPTS += \
 	-DFEATURE_avx512vl=OFF \
 	-DFEATURE_vaes=OFF
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+define QT6BASE_MKSPEC_ARCH_CONFIG
+# Qt 6 needs atomics, which on various architectures are in -latomic
+	printf '!host_build { \n LIBS += -latomic\n }' > \
+		$(STAGING_DIR)/usr/mkspecs/devices/linux-buildroot-g++/arch.conf
+endef
+endif
+
+define QT6BASE_INSTALL_MKSPEC
+	mkdir -p $(STAGING_DIR)/usr/mkspecs/devices/linux-buildroot-g++
+	$(INSTALL) -m 0644 $(QT6BASE_PKGDIR)/qplatformdefs.h \
+		$(STAGING_DIR)/usr/mkspecs/devices/linux-buildroot-g++/
+	sed 's%@CROSS_COMPILE@%$(TARGET_CROSS)%' \
+		< $(QT6BASE_PKGDIR)/qmake.conf.in \
+		> $(STAGING_DIR)/usr/mkspecs/devices/linux-buildroot-g++/qmake.conf
+	touch $(STAGING_DIR)/usr/mkspecs/devices/linux-buildroot-g++/arch.conf
+	$(QT6BASE_MKSPEC_ARCH_CONFIG)
+endef
+
+# The generated broken target_qt.conf is broken, so replace it
+define QT6BASE_INSTALL_TARGET_QT_CONF
+	sed 's%@HOST_DIR@%$(HOST_DIR)%; s%@SYSROOT@%$(STAGING_DIR)%' \
+		< $(QT6BASE_PKGDIR)/target_qt.conf.in \
+		> $(STAGING_DIR)/usr/bin/target_qt.conf
+endef
+
+# The qmake wrapper script doesn't set QMAKEPATH, so qmake doesn't
+# find specs and modules installed for the target
+define QT6BASE_FIX_QMAKE_SCRIPT
+	sed -i '1a\
+export QMAKEPATH=$(STAGING_DIR)/usr' \
+		$(STAGING_DIR)/usr/bin/qmake
+endef
+
+QT6BASE_POST_INSTALL_STAGING_HOOKS += \
+	QT6BASE_INSTALL_MKSPEC \
+	QT6BASE_INSTALL_TARGET_QT_CONF \
+	QT6BASE_FIX_QMAKE_SCRIPT
+
 HOST_QT6BASE_DEPENDENCIES = \
 	host-double-conversion \
 	host-libb2 \
diff --git a/package/qt6/qt6base/target_qt.conf.in b/package/qt6/qt6base/target_qt.conf.in
new file mode 100644
index 0000000000..5702970c47
--- /dev/null
+++ b/package/qt6/qt6base/target_qt.conf.in
@@ -0,0 +1,11 @@
+[Paths]
+Prefix=/usr
+HostPrefix=@HOST_DIR@
+HostBinaries=bin
+HostLibraries=lib
+HostLibraryExecutables=libexec
+HostData=.
+Sysroot=@SYSROOT@
+SysrootifyPrefix=true
+TargetSpec=devices/linux-buildroot-g++
+HostSpec=
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
