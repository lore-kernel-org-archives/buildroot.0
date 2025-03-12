Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2826FC28B2F
	for <buildroot@archiver.kernel.org>; Wed, 12 Mar 2025 13:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77856810AA;
	Wed, 12 Mar 2025 13:52:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GFu9Kht40i5H; Wed, 12 Mar 2025 13:52:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B46480EA4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B46480EA4;
	Wed, 12 Mar 2025 13:52:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D24DF1C8
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 13:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE49C607AD
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 13:51:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ALjJABfYScf for <buildroot@buildroot.org>;
 Wed, 12 Mar 2025 13:51:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=richard.genoud@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1F0986064C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F0986064C
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F0986064C
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 13:51:56 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 5F6E75846B5
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 13:38:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D18ED44201;
 Wed, 12 Mar 2025 13:37:58 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ben Hutchings <ben.hutchings@mind.be>,
 Richard Genoud <richard.genoud@bootlin.com>
Date: Wed, 12 Mar 2025 14:37:41 +0100
Message-ID: <20250312133741.1673476-1-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdehvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeftihgthhgrrhguucfivghnohhuugcuoehrihgthhgrrhgurdhgvghnohhuugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdfggeetgeehvdevteegieetffeiudfhvdekgefhgeeifeffleejleffteetudejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdptghonhhfrdhinhenucfkphepvdgrtddumegtsgdutdemleelgehfmegtiedttdemjegtfegumeehvgefieemvgeljeemudekrggtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdutdemleelgehfmegtiedttdemjegtfegumeehvgefieemvgeljeemudekrggtpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehrihgthhgrrhgurdhgvghnohhuugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepjhgvshhsvggvvhhgsehgmhgrihhlrdgtohhmpdhrtghpt
 hhtoheprhhohihkohhllhgvnhhsvhgvnhgushgvnhesghhmrghilhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsvghnrdhhuhhttghhihhnghhssehmihhnugdrsggvpdhrtghpthhtoheprhhitghhrghrugdrghgvnhhouhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: richard.genoud@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1741786679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=6ZLAQiFJT2aBluLGl9sbrOeIv/69nzqE48h9TAjMrA4=;
 b=IiBmTgS72RyP7VBz4R+YAch4lAJXZ4gGUbaOMxN6lODDZPm6ElRt+Kl4CpVKau8vfUQVwL
 itc8UV0lc/3aKU5ilXYh5ozvNkcBg/c/xIaEw6OpHss9bLih4e0sOCSSnl2SKhtcB1Hq3N
 WktRzLz2XTUkjPjOjKGd7egj9D0ymInrIikGOGsOqVuCIwObkW4CgEmYYvkgQ9Wigx5m/9
 Q2+N4CffJmnWXrpGYRHUX/w86m7zqU7ss8lLE1gPjUdIJARsaJaD9J+SbQglViQXONeJSb
 53sJX4YBJ+mwvuXuWSzJY5HXLhXBHlGIglwFFiAntY+IeTTVhCBSdFGiQrRXew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IiBmTgS7
Subject: [Buildroot] [PATCH] package/qt6/qt6base: Make qmake work
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
From: Richard Genoud via buildroot <buildroot@buildroot.org>
Reply-To: Richard Genoud <richard.genoud@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently the qt6base package does not install a working cross-qmake
program, so applications can only be built with CMake.

There's actually a qmake in the staging directory that could be used on
the target (or in a chroot+qemu).
There's the qmake build from the host-qmake package, in the host
directory. This one can build qmake packages for the host.

And the cross-qmake (the one that create a Makfile for
cross-compilation) is missing.

We can't call it host/usr/bin/qmake since it's already taken by the
host-qmake6, but host/usr/bin/tuple-qmake seems to be a good choice,
since it's made for cross-compilation.

This patch is resurrected from:
https://lore.kernel.org/buildroot/20240411145559.1183064-1-ben.hutchings@mind.be/

To ease upgrades from Qt 5, make qmake work as well:

- Create a linux-buildroot-g++ device spec, like we do for Qt 5.

- Generate a target_qt.conf file in the host/usr/bin directory.

- Add a tuple-qmake wrapper script in the host/usr/bin/ directory to set
  the QMAKEPATH environment variable.

Changes from original version:
- Instead of modifying the qmake in the staging directory, we add a
cross-qmake in the host/usr/bin directory.
- The qmake-and-qtpaths-wrapper is modified in order to call the
  cross-qmake also in subprojects, where qmake calls itself.

Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 ...x-qmake-wrappers-for-recursive-qmake.patch | 15 +++++++
 package/qt6/qt6base/qmake.conf.in             | 34 +++++++++++++++
 package/qt6/qt6base/qplatformdefs.h           |  1 +
 package/qt6/qt6base/qt6base.mk                | 42 +++++++++++++++++++
 package/qt6/qt6base/target_qt.conf.in         | 11 +++++
 5 files changed, 103 insertions(+)
 create mode 100644 package/qt6/qt6base/0001-fix-qmake-wrappers-for-recursive-qmake.patch
 create mode 100644 package/qt6/qt6base/qmake.conf.in
 create mode 100644 package/qt6/qt6base/qplatformdefs.h
 create mode 100644 package/qt6/qt6base/target_qt.conf.in

diff --git a/package/qt6/qt6base/0001-fix-qmake-wrappers-for-recursive-qmake.patch b/package/qt6/qt6base/0001-fix-qmake-wrappers-for-recursive-qmake.patch
new file mode 100644
index 000000000000..9d6abee4d2ea
--- /dev/null
+++ b/package/qt6/qt6base/0001-fix-qmake-wrappers-for-recursive-qmake.patch
@@ -0,0 +1,15 @@
+--- qt6base-6.4.3/bin/qmake-and-qtpaths-wrapper.in.old	2025-03-05 09:01:11.723198499 +0100
++++ qt6base-6.4.3/bin/qmake-and-qtpaths-wrapper.in	2025-03-05 09:07:14.618403895 +0100
+@@ -1,7 +1,10 @@
+-#!/bin/sh
++#!/bin/bash
+ 
+ # The directory of this script is the expanded absolute path of the "$qt_prefix/bin" directory.
+ script_dir_path=`dirname $0`
+ script_dir_path=`(cd "$script_dir_path"; /bin/pwd)`
+ 
+-@host_qt_bindir@/@tool_name@@tool_version@ -qtconf "$script_dir_path/target_qt.conf" $*
++# bash exec -a permits to change the $0 argument of the executed program
++# like that, the qmake will think it has been called as this wrapper.
++# The goal is to use also this wrapper when qmake calls itself.
++exec -a $0 @host_qt_bindir@/@tool_name@@tool_version@ -qtconf "$script_dir_path/target_qt.conf" $*
diff --git a/package/qt6/qt6base/qmake.conf.in b/package/qt6/qt6base/qmake.conf.in
new file mode 100644
index 000000000000..b62a671c35a8
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
index 000000000000..99e9a2792329
--- /dev/null
+++ b/package/qt6/qt6base/qplatformdefs.h
@@ -0,0 +1 @@
+#include "../../linux-g++/qplatformdefs.h"
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index a4c56da6018d..af099e398f90 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -78,6 +78,48 @@ QT6BASE_CONF_OPTS += \
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
+# Install the target_qt.conf needed for cross-qmake
+define QT6BASE_INSTALL_TARGET_QT_CONF
+	sed 's%@HOST_DIR@%$(HOST_DIR)%; s%@SYSROOT@%$(STAGING_DIR)%' \
+		< $(QT6BASE_PKGDIR)/target_qt.conf.in \
+		> $(HOST_DIR)/usr/bin/target_qt.conf
+endef
+
+# Create the cross-qmake from the wrapper script in sysroot.
+# This time, we add QMAKEPATH, so that it finds specs and modules
+# installed for the target
+define QT6BASE_INSTALL_CROSS_QMAKE
+	$(INSTALL) -m 0755 $(STAGING_DIR)/usr/bin/qmake \
+		$(TARGET_CROSS)qmake
+	sed -i '1a\
+export QMAKEPATH=$(STAGING_DIR)/usr' \
+		$(TARGET_CROSS)qmake
+endef
+
+QT6BASE_POST_INSTALL_STAGING_HOOKS += \
+	QT6BASE_INSTALL_MKSPEC \
+	QT6BASE_INSTALL_TARGET_QT_CONF \
+	QT6BASE_INSTALL_CROSS_QMAKE
+
 HOST_QT6BASE_DEPENDENCIES = \
 	host-double-conversion \
 	host-libb2 \
diff --git a/package/qt6/qt6base/target_qt.conf.in b/package/qt6/qt6base/target_qt.conf.in
new file mode 100644
index 000000000000..5702970c47f6
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
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
