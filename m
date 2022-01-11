Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5072AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 22:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D05916FB4A;
	Tue, 11 Jan 2022 22:06:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XHRhSfmJza5l; Tue, 11 Jan 2022 22:06:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62E8E6FB5C;
	Tue, 11 Jan 2022 22:06:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 82F981BF32E
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 22:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8010C41627
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 22:06:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LgwfAI_jwNIy for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 22:06:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D40B441626
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 22:06:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EA83A83478; Tue, 11 Jan 2022 22:00:20 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 22:55:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c60df47735e2bfc91f7dbaf5642fc82744feeb86
X-Git-Newrev: ea033cecf990ed3f86619647523a9ad2ccb09adb
X-Patchwork-Hint: ignore
Message-Id: <20220111220020.EA83A83478@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/riscv-isa-sim: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ea033cecf990ed3f86619647523a9ad2ccb09adb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Spike, the RISC-V ISA Simulator, implements a functional model of one
or more RISC-V harts.

The host package provides an alternative solution to qemu.

https://github.com/riscv-software-src/riscv-isa-sim

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in.host                             |  1 +
 .../0001-riscv-disable-precompiled-headers.patch   | 34 ++++++++++++++++++++++
 package/riscv-isa-sim/Config.in.host               | 13 +++++++++
 package/riscv-isa-sim/riscv-isa-sim.hash           |  3 ++
 package/riscv-isa-sim/riscv-isa-sim.mk             | 12 ++++++++
 6 files changed, 64 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c8242df8a6..13464178c0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1599,6 +1599,7 @@ F:	package/glslsandbox-player/
 F:	package/ptm2human/
 F:	package/python-distro/
 F:	package/python-pyalsa/
+F:	package/riscv-isa-sim/
 
 N:	Julien Viard de Galbert <julien@vdg.name>
 F:	package/dieharder/
diff --git a/package/Config.in.host b/package/Config.in.host
index 6e027d96c2..c390ae3e7d 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -78,6 +78,7 @@ menu "Host utilities"
 	source "package/qoriq-rcw/Config.in.host"
 	source "package/raspberrypi-usbboot/Config.in.host"
 	source "package/rauc/Config.in.host"
+	source "package/riscv-isa-sim/Config.in.host"
 	source "package/rustc/Config.in.host"
 	source "package/s6-rc/Config.in.host"
 	source "package/sam-ba/Config.in.host"
diff --git a/package/riscv-isa-sim/0001-riscv-disable-precompiled-headers.patch b/package/riscv-isa-sim/0001-riscv-disable-precompiled-headers.patch
new file mode 100644
index 0000000000..461f34e3a1
--- /dev/null
+++ b/package/riscv-isa-sim/0001-riscv-disable-precompiled-headers.patch
@@ -0,0 +1,34 @@
+From 980d5143089bf32ef8a6dfdf1bb9e9fe92fa7bf5 Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Sun, 9 Jan 2022 13:38:48 +0100
+Subject: [PATCH] riscv: disable precompiled headers
+
+While precompiling header, some toolchains fail with the message:
+
+    /path/to/toolchain/bin/ld: /path/to/sysroot/usr/lib/Scrt1.o: in function `_start':
+    (.text+0x54): undefined reference to `main'
+
+The patch totally disable precompiled headers.
+
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ riscv/riscv.mk.in | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/riscv/riscv.mk.in b/riscv/riscv.mk.in
+index 2347ce6..4f56eaf 100644
+--- a/riscv/riscv.mk.in
++++ b/riscv/riscv.mk.in
+@@ -35,9 +35,6 @@ riscv_hdrs = \
+ 
+ riscv_install_hdrs = mmio_plugin.h
+ 
+-riscv_precompiled_hdrs = \
+-	insn_template.h \
+-
+ riscv_srcs = \
+ 	processor.cc \
+ 	execute.cc \
+-- 
+2.34.1
+
diff --git a/package/riscv-isa-sim/Config.in.host b/package/riscv-isa-sim/Config.in.host
new file mode 100644
index 0000000000..35e404caf0
--- /dev/null
+++ b/package/riscv-isa-sim/Config.in.host
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_HOST_RISCV_ISA_SIM
+	bool "host riscv-isa-sim"
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # C++1
+	help
+	  Spike, the RISC-V ISA Simulator, implements a functional
+	  model of one or more RISC-V harts.
+
+	  The host package provides an alternative solution to qemu.
+
+	  https://github.com/riscv-software-src/riscv-isa-sim
+
+comment "host riscv-isa-sim needs host gcc >= 4.9"
+	depends on !BR2_HOST_GCC_AT_LEAST_4_9
diff --git a/package/riscv-isa-sim/riscv-isa-sim.hash b/package/riscv-isa-sim/riscv-isa-sim.hash
new file mode 100644
index 0000000000..d787a03e4c
--- /dev/null
+++ b/package/riscv-isa-sim/riscv-isa-sim.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  9b29c220fed1e867e3bea4b5c565f2629237d525a4d9fe1668699c4406003a1f  riscv-isa-sim-1.1.0.tar.gz
+sha256  c65e436d18972c9c4bd192494fe4870bd2e158179474975b80a3559f27631632  LICENSE
diff --git a/package/riscv-isa-sim/riscv-isa-sim.mk b/package/riscv-isa-sim/riscv-isa-sim.mk
new file mode 100644
index 0000000000..e10dd4c662
--- /dev/null
+++ b/package/riscv-isa-sim/riscv-isa-sim.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# riscv-isa-sim
+#
+################################################################################
+
+RISCV_ISA_SIM_VERSION = 1.1.0
+RISCV_ISA_SIM_SITE = $(call github,riscv-software-src,riscv-isa-sim,v$(RISCV_ISA_SIM_VERSION))
+RISCV_ISA_SIM_LICENSE = BSD-3-Clause
+RISCV_ISA_SIM_LICENSE_FILES = LICENSE
+
+$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
