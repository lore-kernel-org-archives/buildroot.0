Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEECCA1002
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 20:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F394611F3;
	Mon,  1 Sep 2025 20:32:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fKMAhnSPetc9; Mon,  1 Sep 2025 20:32:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3528661205
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3528661205;
	Mon,  1 Sep 2025 20:32:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F95675B
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 20:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EC5283EA8
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 20:32:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z2XCxPJTD3hV for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 20:32:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 26EC283EA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26EC283EA5
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26EC283EA5
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 20:32:48 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b0428b537e5so230027866b.3
 for <buildroot@buildroot.org>; Mon, 01 Sep 2025 13:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756758766; x=1757363566;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fMxoHruHuDqGH2Xu7O2KgZRGgagE8u1oyjvWnviAFfI=;
 b=cl88MCCyCmsrjsbqWYrqT8q+4zOUXO5T1b3N/NrmuHk48ADbQhdGvqotMNIfue0fAL
 KmpdyeE6td+SYlsn9WEcpZgH43kJWEX3DpTXNr7XIyz7PhoS/IccNQ946GrVvB8xyaYm
 Z+P4AdnJm46wyjDH6QJba/bKZ0O3+Yk16kIKEpXQs+WeQGuF84hVAjRJ3T8bgusXnjBt
 +VBMgIai9g1qr7mokrCD9UEcR2tA2W/OoxKfMc5RQonsIpOQ1vbR3IVYZPXcv9ONVAWu
 Rbmt/pDa12rSlOMrZG5CABFbq9vxyoMU/sTCMExYQfusk7WK9eY2ClXTFBnGsqXuDHqY
 oGIQ==
X-Gm-Message-State: AOJu0Ywp7GZcL6Je3m+1Xhte3VxRxi+Wzds4NARXbgLUGjCSUhF6bFff
 bJx4cIuu38uZDRVc1Dgjk6c/a/U3R4yKV1I3RE7JVdzcry1gcwapxELW0RqSOoHCkdlVQ7pV0ka
 LHA8Z
X-Gm-Gg: ASbGncsbpA6MtiHhXV4mXfFg6+slllXhK7ByCQNKCUGFnCRHO1TE5Zd6eR8TPItxTc7
 DR5eXtrJzmDILpJa//bQi2s0TTlTp9gzVSJmxwfFJBaHykc0H/0BTvzdgpsLypiG2oesvBWlx/1
 eZM0NDxnzXGYlfcMUpY+sdC7p6Gg0AToDUuKoYwoiGrgWUHg+MxZ+avd39i/eWTyADp7fniiqG8
 rh9UMtRR2aWudc5BobMYpAMuYi1SyvnlnXTMHKizCPylS1fHasb8bd/h9SFkAnOKJCEm4Cy2oR1
 Y/OLrkTeTEi/nQfzAVz8IqiFGSpivQBSrQBUs/ipy9YZ3Lin7dOUsD29tRbS2/fHAvqPT4Q5o5+
 cxbyczFp4hmsN9tfojTobiT8hu0yesbdQCEEc+rV6BtPcTtv3XAg+6rOkVWaNLsNzAJsVGJ6D6i
 c+Fdzs9pVcHr0U9+DL5QLtYw==
X-Google-Smtp-Source: AGHT+IHT7UXbOkfY33IRleTdX1qCD0VES+6DXIv1gS71es+gcqQ0S4GH1YOzXQG5vV1vOCdsyHyVxA==
X-Received: by 2002:a17:906:6a02:b0:b01:8fa4:6bb0 with SMTP id
 a640c23a62f3a-b01d976af68mr847131366b.44.1756758765919; 
 Mon, 01 Sep 2025 13:32:45 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.39])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0411bf1b09sm553530166b.79.2025.09.01.13.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 13:32:45 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  1 Sep 2025 22:32:06 +0200
Message-ID: <20250901203210.804061-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250901203210.804061-1-dario.binacchi@amarulasolutions.com>
References: <20250901203210.804061-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1756758766; x=1757363566;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fMxoHruHuDqGH2Xu7O2KgZRGgagE8u1oyjvWnviAFfI=;
 b=fop0KpNtBTAKxdV1qdDvFCdeVsJQvzDsSrqvimr8FBg8/U3CQekvJnydTqHbMqwGCT
 br0DvVlDm6n1hNX4gJwHXKCkOFDiv+IOxzEkfq+3IMJcIZ+bYfWpu3PYGdlmfrkz84uV
 yuHdgYfi/EqsmikjpdrGAc6tHaKXOn+BKKYGs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=fop0KpNt
Subject: [Buildroot] [RFC v4 1/5] package/qt6: Add qmake functionality
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
 Richard Genoud <richard.genoud@bootlin.com>,
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
flags/cross-compiler.

A big thanks to Angelo Compagnucci for the encouragement and testing.

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>
[dario: fix HostData in qt.conf.in and change the commit message]
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes v3 -> v4:
  - Drop QT6_QT_CONF_FIXUP
  - Drop -@EGLFS_DEVICE@
  - Update the commit message

Changes v2 -> v3:
  - Drop package/qt6/qt6base/qt6base.mk.save

 package/qt6/qt6.mk                  | 12 ++++++++++
 package/qt6/qt6base/qmake.conf      | 34 +++++++++++++++++++++++++++++
 package/qt6/qt6base/qplatformdefs.h |  1 +
 package/qt6/qt6base/qt.conf.in      |  7 ++++++
 package/qt6/qt6base/qt6base.mk      | 17 +++++++++++++++
 5 files changed, 71 insertions(+)
 create mode 100644 package/qt6/qt6base/qmake.conf
 create mode 100644 package/qt6/qt6base/qplatformdefs.h
 create mode 100644 package/qt6/qt6base/qt.conf.in

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index 33cbf7551f23..fd6d81ed3d53 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -12,3 +12,15 @@ QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)
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
+# Variable for other Qt applications to use
+QT6_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++
diff --git a/package/qt6/qt6base/qmake.conf b/package/qt6/qt6base/qmake.conf
new file mode 100644
index 000000000000..e0d53d755d41
--- /dev/null
+++ b/package/qt6/qt6base/qmake.conf
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
index 51a4f1b5be7f..7c0cd927129a 100644
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
@@ -431,5 +434,19 @@ define QT6BASE_RM_USR_MKSPECS
 endef
 QT6BASE_TARGET_FINALIZE_HOOKS += QT6BASE_RM_USR_MKSPECS
 
+define QT6BASE_MAKE_BR_SPEC
+	mkdir -p $(@D)/mkspecs/devices/linux-buildroot-g++/
+	$(INSTALL) -m 0644 -D $(QT6BASE_PKGDIR)/qmake.conf \
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
