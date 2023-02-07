Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD6D3C636D3
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B429813C6;
	Tue,  7 Feb 2023 17:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B429813C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CHu7_s0kIiFw; Tue,  7 Feb 2023 17:20:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6942881398;
	Tue,  7 Feb 2023 17:20:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6942881398
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5DE9A1BF5F6
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4545040A68
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:17:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4545040A68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2lZi866LFVFz for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:17:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14C0640120
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14C0640120
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:17:45 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id o18so14281893wrj.3
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 09:17:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L5k4t9f++6/O23kLPEe7tge1fl2Dc83BXnN8AhQEtDI=;
 b=KCYMUtZFwyiWcj9s2chQvxf7R/MT7U14+fYaAmM2DyfbBXOmOU7UtYAVYMpdTjHOi7
 HcunAn6M3SmLZvfuQ1L1xq1OSZglys0YTtCeWmACcHV70jJzgf7pEmeBh2bz9z3k0hXh
 p95/YQ9fWOMN+pAWZfWME/gWjaW5jopdVQ1HvrQLz7ug4R4Z2BFhDhCPG6CYGelt8Cst
 ULFyv+axA97lIt1Z7s9JYhfQw1GVwPwAkONkrWpl66ZBrtiRTDtZdcOO6AGwp6qMZNOT
 rzf1xDvy+HoscInG5MGSj8il2fGWHHlDpkrWpBpPf+uOe9cXc0SEzvoCee6tJrkuHVBV
 fgAw==
X-Gm-Message-State: AO0yUKWGUrhpCsxOB6rXuk3yXwAjuPiXNXc71+mgMXHWTfPJFRa3IKiF
 tdesAktSyJYf62gjC3nXQx7LvbDWNUkADKL1Ow5e8Q==
X-Google-Smtp-Source: AK7set/JGv5ygVCnOoaPM6uT+kcfQq5P/5m2W2kuCSqX2Y+ak0HulIDrpf+yQhspF0zx7TaBG2krhQ==
X-Received: by 2002:adf:d081:0:b0:2c3:e4f5:18a with SMTP id
 y1-20020adfd081000000b002c3e4f5018amr3570429wrh.33.1675790263073; 
 Tue, 07 Feb 2023 09:17:43 -0800 (PST)
Received: from angeloc.wifiguest.local (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 q16-20020adff950000000b002bff574a250sm11708801wrr.2.2023.02.07.09.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 09:17:42 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 18:17:21 +0100
Message-Id: <20230207171721.2973997-14-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207171721.2973997-1-angelo@amarulasolutions.com>
References: <20230207171721.2973997-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L5k4t9f++6/O23kLPEe7tge1fl2Dc83BXnN8AhQEtDI=;
 b=GIpSYYgtwWnA1YOv0i+kWp3fiyy8lHNY9zDIPx+PF0K3ubXclZngzG3+KKWES39RxW
 lxHZSie/y+N9Y5J7QTixaSvITyuKNpOBTulGO5DtxD/h0aa1K8yVlMbz8Qf+TWaxzneq
 m9UpHNbIWJCpxe2VIZWCws/t31a7N3euCkpEc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=GIpSYYgt
Subject: [Buildroot] [PATCH v6 13/13] package/qt6: Add qmake functionality
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
Cc: jesseevg@gmail.com, Angelo Compagnucci <angelo@amarulasolutions.com>
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

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
v6:
* Removing EGLFS_DEVICE mangling because is not working right now
  and should be added later.

 package/qt6/qt6.mk                  | 12 ++++++++++
 package/qt6/qt6base/qmake.conf.in   | 34 +++++++++++++++++++++++++++++
 package/qt6/qt6base/qplatformdefs.h |  1 +
 package/qt6/qt6base/qt.conf.in      |  7 ++++++
 package/qt6/qt6base/qt6base.mk      | 16 ++++++++++++++
 5 files changed, 70 insertions(+)
 create mode 100644 package/qt6/qt6base/qmake.conf.in
 create mode 100644 package/qt6/qt6base/qplatformdefs.h
 create mode 100644 package/qt6/qt6base/qt.conf.in

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index 431bb8c9d3..847286a3fc 100644
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
index 0000000000..e0d53d755d
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
index ec1c65f827..f37b2bafce 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -54,6 +54,9 @@ QT6BASE_CONF_OPTS = \
 	-DFEATURE_system_zlib=ON \
 	-DFEATURE_system_libb2=ON
 
+QT6BASE_CFLAGS = $(TARGET_CFLAGS)
+QT6BASE_CXXFLAGS = $(TARGET_CXXFLAGS)
+
 # x86 optimization options. While we have a BR2_X86_CPU_HAS_AVX512, it
 # is not clear yet how it maps to all the avx512* options of Qt, so we
 # for now keeps them disabled.
@@ -384,5 +387,18 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_zstd=OFF
 endif
 
+define QT6BASE_MAKE_BR_SPEC
+	$(INSTALL) -m 0644 -D $(QT6BASE_PKGDIR)/qmake.conf.in \
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
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
