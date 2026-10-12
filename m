Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1297CCA9EDE
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 10:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C334F80CEC;
	Mon, 12 Oct 2026 10:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5k3ACwNGHGw9; Mon, 12 Oct 2026 10:22:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 67D5280C7A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791800540;
	b=dHtp9ph/lM3okrVc5LKWiKTWS7G1FXvkmcJ9QUx1HMxopc1ZJMe/qjgsshOsRaKNlHUj
	 wEmcPrTng6Op+xFhGJiuJ3/1A3I7qpqesxZpYun2LqMKdbG6/94+G4s6d0+0ym+Llpn3Q
	 fwBAE9nIQ3q0R6k9ses8mSVZSnS5NuShufiIGmnNl4T9vb8GxPTIh2c2onjFJK8C5ZM5W
	 5abF4F6oC496wxLg4E2JkoA1y7RFNpEuaLQe+nCRDd0k4bA7rQnTlOFVwQsWFzicuGSIi
	 TgAhFjP0BJBReviazmCtlv74yFbb5keq0RZQCZ/4NNcCkqgxFJsLTWmJGvzR/h/sQog==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791800540;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=02JzU1GX9OpnBSrYiAj3KGtHkVfjRVQ5jy2PEHBxoJ0=;
	b=VFd+z4wRu4Qotngy864BUs7kmOScQGWSFcUABKfO35Fs9f67JiU7gTcCSHCnSzffO8gN
	 VObADb/SS/5GLC/f1P9vSfnViQdpTB0UPOlpUnoAg77bhU2xXMGzpfupPEmx+3QNpdQaf
	 jwWhuubkervBPXFyGZEMmV1Ts0SQaExmL3xeMs5Evlfy+/mudxQUFOK7M92+pG8ilQAUR
	 IJshJ6qtf/JT6NqeRV7X7JRdcPvm3nOg0DSB1310u6KiLlJzZ/2rGAmMSU5I9izDKjgCd
	 KOSy6hI339q3hpd8URE1jtR5v0qnIguuYjEWm8jkiCLxg5izN6BmiIY1Ekrx2SHJuMA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791800540;
	bh=02JzU1GX9OpnBSrYiAj3KGtHkVfjRVQ5jy2PEHBxoJ0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GovzYYp0Pw1nuDv80jBeKAEftO2aA4N0ZaQPf5W90l7RkvNQCXLro66wuQ+M3Tz0N
	 HhgchgknuEZTUC75FORI2jvykF6vMFMXCBx17ExZLtgy5T+w89HI0yFeuGsdhJ94T1
	 IGh04im7U8MlU8rMi5fFcV1I8Dp7do4tnYah24VW/QiVqGBp6SmSvun23rlpAXR+SN
	 ECHR5IiuU5GAEPPisw6doZmkquObxZQmbfrCIAS8KgD/Q2nGjlbGr+O+pVDtMltiVq
	 5Gd6L7TKXRWLmjueFHBByZ7+8Mft4fjokvfnMtm3OFazFuuzdZiiQyMNeHehQA9yNU
	 O9CIAtfzrktnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67D5280C7A;
	Mon, 12 Oct 2026 10:22:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F4C275
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1533040184
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sjuguDcD5nr0 for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 10:22:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1A090400D0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791800534;
 b=L11JN/lGOJ/wwunvBG2yR5xfPmLGvR/fvLmVZUkWAU+/apPtYDJZG+S9KCOaDQn2g4zN
 BKhXUC0oHjFlbP0FjE25svBe/lCTupEc37GDEaLb91jsdY7/ecpgOyRGNVZ6e4Hz0PX2m
 dnwm1z07zBHOkM/u4gK+ObO1yV+mSvCIUMVWpngMDCde+YuejnIiosUixakVg1C8S3Ftw
 gvp9EETnxX2eJILb/KNTWa0dbRMSBkBB0I3ro59aSHYMS5VW3+QtLAv2WTXs2u+f/r/sB
 L9RcEDHB9kcW3bxUSBn0ZxMa5Q2MvfN/CIVsgd+30vUB4DQZz5b5mi3Ng1P6PAfQClQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791800534;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Ofg6aN9hrhsjjCfTOcdaInITpwPI9Jl11J9/vxqbXmk=;
 b=N/ZIcPtjxfxxRMg8u1l5wBdx+/cz9Fo2cSO7imkGFA65Jy9EQR51UYfR6mcOFsR00ctF
 epl/DSwk3zNS6T2Je8ae6clnXyolsaCuR39oaC2mZi4fJnysjmKChlLR+Pb3ug475i64x
 yb70C6+TSEqEqt09iEJqs7FYDWOJ4qaRBEcscFrdkJKRRB9OJIEGlfYmwYSAixB6I6aF8
 kzaegz/WRsl4wVA4stIjlfMKO+MHecbMX1T1mpUZWVtaUmuJ59rHMv8zNTZgriMOUHy7H
 4nnDbnM+R5LgrDTgbXHJ6LFHyzwuYKVAJikkTp0EcRgspvJuB0/1svO5ootgvQIeNOg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A090400D0
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:22:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03CB19348F; Mon, 12 Oct 2026 10:20:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Oct 2026 10:49:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2142664e94e87a2aa90c70ebe14a932b4e357bc
X-Git-Newrev: 42d7900bbc70051be9843b3b642d21c0dc0e6921
X-Patchwork-Hint: ignore
Message-Id: <20261012102055.03CB19348F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6: add qmake functionality
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/42d7900bbc70051be9843b3b642d21c0dc0e6921
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The qmake functionality had been missing due to the new host/target
build requirement, to get it working the main parts of the qt5 qmake
has been kept, we're still making our own device spec which we use to
run qmake with along with passing some additional device options for our
flags/cross-compiler.

qt6 has its own cross-compiling qmake wrapper script. However, that
hardcodes the paths to different places than where we have them.

QT6_INSTALL_QT_CONF will be used by the qmake-package infrastructure
later so it is put in qt6.mk, even though currently it's only used by
qt6base.

A big thanks to Angelo Compagnucci for the encouragement and testing.

[dario: fix HostData and add the target install dirs in qt.conf.in,
quote QT_QMAKE_DEVICE_OPTIONS, use TARGET_CFLAGS/TARGET_CXXFLAGS,
change the commit message]

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Tested-by: Richard GENOUD <richard.genoud@bootlin.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/qt6/qt6.mk                  | 12 ++++++++++++
 package/qt6/qt6base/qmake.conf      | 34 ++++++++++++++++++++++++++++++++++
 package/qt6/qt6base/qplatformdefs.h |  1 +
 package/qt6/qt6base/qt.conf.in      | 11 +++++++++++
 package/qt6/qt6base/qt6base.mk      | 14 ++++++++++++++
 5 files changed, 72 insertions(+)

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index cff9f5fbc7..13482c33cc 100644
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
index 0000000000..8d9987470d
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
+QMAKE_LINK              = $${CROSS_COMPILE}g++
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
index 0000000000..d1d2d9490f
--- /dev/null
+++ b/package/qt6/qt6base/qt.conf.in
@@ -0,0 +1,11 @@
+[Paths]
+Prefix=/usr
+HostPrefix=@@HOST_DIR@@
+HostData=@@STAGING_DIR@@/usr
+Sysroot=@@STAGING_DIR@@
+SysrootifyPrefix=true
+TargetSpec=devices/linux-buildroot-g++
+ArchData=/usr/lib/qt6
+LibraryExecutables=/usr/lib/qt6/libexec
+Plugins=/usr/lib/qt6/plugins
+QmlImports=/usr/lib/qt6/qml
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 01661b7f01..0329474172 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -436,5 +436,19 @@ define QT6BASE_RM_SBOMS
 endef
 QT6BASE_TARGET_FINALIZE_HOOKS += QT6BASE_RM_SBOMS
 
+define QT6BASE_MAKE_BR_SPEC
+	$(INSTALL) -m 0644 -D $(QT6BASE_PKGDIR)/qmake.conf \
+		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
+	$(INSTALL) -m 0644 -D $(QT6BASE_PKGDIR)/qplatformdefs.h \
+		$(@D)/mkspecs/devices/linux-buildroot-g++/qplatformdefs.h
+endef
+
+QT6BASE_CONF_OPTS += \
+	-DQT_QMAKE_DEVICE_OPTIONS="CROSS_COMPILE=$(TARGET_CROSS);BR_COMPILER_CFLAGS=$(TARGET_CFLAGS);BR_COMPILER_CXXFLAGS=$(TARGET_CXXFLAGS)"
+
+QT6BASE_PRE_CONFIGURE_HOOKS += QT6BASE_MAKE_BR_SPEC
+
+QT6BASE_POST_INSTALL_STAGING_HOOKS += QT6_INSTALL_QT_CONF
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
