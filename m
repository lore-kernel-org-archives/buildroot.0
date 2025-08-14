Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FD3CA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 15:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2071160BB4;
	Thu, 14 Aug 2025 15:33:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uXMC86rX88Gv; Thu, 14 Aug 2025 15:33:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F0AA60BB5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F0AA60BB5;
	Thu, 14 Aug 2025 15:33:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 409AE1BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 15:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26FAB40F4F
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 15:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QTiJYGNhDhp3 for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 15:33:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F161B407B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F161B407B3
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F161B407B3
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 15:33:22 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-afcb7a2befdso167244766b.2
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 08:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755185601; x=1755790401;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/UVV26tK45QFSOx6uuH60vDni796S+uZz8/iozC+1c8=;
 b=KwVI8VwDgoqVnE3A9AWRjO4fUxZOJYFtRalDSKD/S7op6w/PqHwycAdYQzZH1Zi1/t
 UdU8uXalrSBlD88hMstB+Z53JL6GSLyFcfw1geIrvsTGQbzuaN5u64MQAYDrEnr6BvgZ
 BbvkwH5t6U+ilgnc5we/9iviEZF5VE4nemy7gXdjvBrEs3QhqcAArzdIcv1IjmELLLDu
 tJphKGL7Ua6RgLbKWzNu/6LWcMyTPbTRwgAnhyInRfrtSgqPjPgAkaFy3F/7IR0Qpmiq
 Nnz1OfCo8FETA8yzFqlmomrQR20nTQmv1kSFxAMG0EkLoiyYofFzOhlVO8ModHYIrSYR
 edFA==
X-Gm-Message-State: AOJu0YyFTjRtHtwIJeee8HLYyj/9J+tJlS7wLiIBA6H6zkQKqx/ofY3b
 JR1id6ogo4Ifu1YatOA2/aOJTtWs/jkFEtyyrgCiwGmiuB5gGXxtjQ8h+wj8W59yXoinucCn2Fm
 wjECAlvY=
X-Gm-Gg: ASbGncvhoAF1wk2H0PFIOadYYBw8uJj8HXBwx7Lqcsqeib7lEPGmty4QVhitP6GiYoU
 RDzshY4cmScrKe/vBGpY/ke6ki+K89bA34d8QTD9Gz/gyY9d5tZG+OistgO6NZeVyMeWb7Hh2kC
 eFpysqpS2xA6q4xHfJ19m+qdiEDVlHRlv0NBuFEAvrt1eqZaQYusMTntvpDGEjmuVdCLu9rVXFF
 P2aHQdP4VmuJXCE69VEWZ2SFnAJzQWvFI0pq/3RIMpsvzmN+naxIHLWuPaW8PJ3i+nL/vuUxdQQ
 L6I7fQWRJ5pH0Qj0u6bR57hgB5kC09b0MWVxg1d8pofYX4Ja9N9NzoglAgqypBQNYw28HKpFi+W
 1oKHyMxNO0pyd8F+Fua/0vgsCJvZwUBYlJwdUuJrU//WWmwBWYqgx/8IfMaM+8qwotZt5RXhepR
 5f
X-Google-Smtp-Source: AGHT+IF3lPPCXN/xYJlX5X0ndY+C/cePCdPRiWaBkmJOyshx5BaA4FmszKqWo6f5BdIi9yvYHlSLAA==
X-Received: by 2002:a17:907:72c4:b0:ae3:7255:ba53 with SMTP id
 a640c23a62f3a-afcb9926c82mr357431766b.53.1755185600696; 
 Thu, 14 Aug 2025 08:33:20 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.fritz.box
 ([2001:871:248:acda:9b30:e43:d6cd:c58f])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21c022sm2561928966b.101.2025.08.14.08.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 08:33:20 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 17:32:55 +0200
Message-ID: <20250814153259.6822-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814153259.6822-1-dario.binacchi@amarulasolutions.com>
References: <20250814153259.6822-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1755185601; x=1755790401;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/UVV26tK45QFSOx6uuH60vDni796S+uZz8/iozC+1c8=;
 b=Qxc95QMsAMlc5fEka6azCBAfKdP2BIa44W0zTEyZ3Th2qIhGqFyyrs0S+/wC+WqpPD
 OG2rS7VkUYD89AQ5xbFYHtD9AXEU5ESPIR1jCGBpvnBMcHI1pbHOf/iW2cwV4AkJyGli
 w/7pdwLSZ5uI5nSl+CWRipzBe0foPyNtm7tFg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Qxc95QMs
Subject: [Buildroot] [RFC v3 1/5] package/qt6: Add qmake functionality
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
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
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

Changes v2 -> v3:
  - Drop package/qt6/qt6base/qt6base.mk.save

 package/qt6/qt6.mk                  | 18 +++++++++++++++
 package/qt6/qt6base/qmake.conf.in   | 36 +++++++++++++++++++++++++++++
 package/qt6/qt6base/qplatformdefs.h |  1 +
 package/qt6/qt6base/qt.conf.in      |  7 ++++++
 package/qt6/qt6base/qt6base.mk      | 18 +++++++++++++++
 5 files changed, 80 insertions(+)
 create mode 100644 package/qt6/qt6base/qmake.conf.in
 create mode 100644 package/qt6/qt6base/qplatformdefs.h
 create mode 100644 package/qt6/qt6base/qt.conf.in

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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
