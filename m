Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312B3C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 16:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C992240340;
	Sun,  9 Jan 2022 16:48:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id btaTchlV3_nm; Sun,  9 Jan 2022 16:48:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFAAB4033B;
	Sun,  9 Jan 2022 16:48:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 58B291BF48B
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 16:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4706E60B12
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 16:48:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i1TO8VqD1Q7j for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 16:48:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtpfb2-g21.free.fr (smtpfb2-g21.free.fr [212.27.42.10])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5F3F608A6
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 16:48:25 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtpfb2-g21.free.fr (Postfix) with ESMTP id 7E892428C44
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 17:48:22 +0100 (CET)
Received: from b52572-12.ea.freescale.net.net (unknown [37.166.89.173])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 5DBC2B0054C;
 Sun,  9 Jan 2022 17:48:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641746897;
 bh=qv3/rgEBIZpweaiLxo/emQlR3tLJ8vhfjCGqJBPWC/M=;
 h=From:To:Cc:Subject:Date:From;
 b=GHWDlBTSUSPEQpbCBg3o+Nd8T3hCZTO7lIwWQPXy3WdtsuGCDr1IWXF4yQSdHEGJg
 plZjuKvP+Zx51AR8WZa8uorWw8435aKNuuOP0BOoB9HFth8oaWEPhDKOShcabjPt/q
 6oeQvHxrAMsv3jokdI9K5TiJFn3vL3b30ekI/d1P4YRKiz2oHyq7X1kZZeefzWSy0Z
 c1fVMUo3oPY3B4X51ZIa5vLdQm9WBjwD5umCPxx0wKeEVhSu6uzzrWbnAzdxaIcC7b
 6NrJWFbceieHcm5eRBFYs50IZOxJ1JLkkW7FbOKZIP40aXvYMldqoqLvTzPxYK9RZo
 Cfoi7FqUVykQQ==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 17:47:55 +0100
Message-Id: <20220109164756.1312023-1-ju.o@free.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/riscv-isa-sim: new package
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Spike, the RISC-V ISA Simulator, implements a functional model of one
or more RISC-V harts.

The host package provides an alternative solution to qemu.

https://github.com/riscv-software-src/riscv-isa-sim

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/Config.in.host                        |  1 +
 ...01-riscv-disable-precompiled-headers.patch | 34 +++++++++++++++++++
 package/riscv-isa-sim/Config.in               | 18 ++++++++++
 package/riscv-isa-sim/Config.in.host          | 13 +++++++
 package/riscv-isa-sim/riscv-isa-sim.hash      |  3 ++
 package/riscv-isa-sim/riscv-isa-sim.mk        | 13 +++++++
 8 files changed, 84 insertions(+)
 create mode 100644 package/riscv-isa-sim/0001-riscv-disable-precompiled-headers.patch
 create mode 100644 package/riscv-isa-sim/Config.in
 create mode 100644 package/riscv-isa-sim/Config.in.host
 create mode 100644 package/riscv-isa-sim/riscv-isa-sim.hash
 create mode 100644 package/riscv-isa-sim/riscv-isa-sim.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ed65c74319..59a8dba2ab 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1588,6 +1588,7 @@ F:	package/fluidsynth/
 F:	package/glslsandbox-player/
 F:	package/ptm2human/
 F:	package/python-pyalsa/
+F:	package/riscv-isa-sim/
 
 N:	Julien Viard de Galbert <julien@vdg.name>
 F:	package/dieharder/
diff --git a/package/Config.in b/package/Config.in
index 85193f7802..b20cf45698 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2126,6 +2126,7 @@ menu "Miscellaneous"
 	source "package/proj/Config.in"
 	source "package/qemu/Config.in"
 	source "package/qpdf/Config.in"
+	source "package/riscv-isa-sim/Config.in"
 	source "package/rtl_433/Config.in"
 	source "package/shared-mime-info/Config.in"
 	source "package/sunwait/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index b3e00bb482..22aafb858a 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -77,6 +77,7 @@ menu "Host utilities"
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
diff --git a/package/riscv-isa-sim/Config.in b/package/riscv-isa-sim/Config.in
new file mode 100644
index 0000000000..1f5c8aad18
--- /dev/null
+++ b/package/riscv-isa-sim/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_RISCV_ISA_SIM
+	bool "riscv-isa-sim"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	help
+	  Spike, the RISC-V ISA Simulator, implements a functional
+	  model of one or more RISC-V harts.
+
+	  https://github.com/riscv-software-src/riscv-isa-sim
+
+comment "riscv-isa-sim needs a toolchain w/ C++11, threads, wchar and dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR || \
+		BR2_STATIC
diff --git a/package/riscv-isa-sim/Config.in.host b/package/riscv-isa-sim/Config.in.host
new file mode 100644
index 0000000000..01a189a075
--- /dev/null
+++ b/package/riscv-isa-sim/Config.in.host
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_HOST_RISCV_ISA_SIM
+	bool "host riscv-isa-sim"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	help
+	  Spike, the RISC-V ISA Simulator, implements a functional
+	  model of one or more RISC-V harts.
+
+	  The host package provides an alternative solution to qemu.
+
+	  https://github.com/riscv-software-src/riscv-isa-sim
+
+comment "host riscv-isa-sim needs a toolchain w/ C++11"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
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
index 0000000000..df5d4db9a2
--- /dev/null
+++ b/package/riscv-isa-sim/riscv-isa-sim.mk
@@ -0,0 +1,13 @@
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
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
