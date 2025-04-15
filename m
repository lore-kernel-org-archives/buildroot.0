Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C36C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 19:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C12481A47;
	Tue, 15 Apr 2025 19:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ozi8djC3WPgQ; Tue, 15 Apr 2025 19:33:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB15C81F4C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB15C81F4C;
	Tue, 15 Apr 2025 19:33:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DA804108
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCC5F401CE
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:33:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qUO15094SQ10 for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 19:33:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56221419DF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56221419DF
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:33:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41ED8848E6; Tue, 15 Apr 2025 19:33:33 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 15 Apr 2025 21:29:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ae65b1fb5fd0d6f54dcda8d432828c44c14366f
X-Git-Newrev: fd02add21b4d79f1dc7ac03c6a804858de15774b
X-Patchwork-Hint: ignore
Message-Id: <20250415193333.41ED8848E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: fix the build
 for macchiatobin
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8371958210410276173=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8371958210410276173==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fd02add21b4d79f1dc7ac03c6a804858de15774b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When Building arm-trusted-firmware for the Macchiatobin platform
(a80x0_mcbin), which depends on the mv-ddr-marvell package, the build fails
complaining that this package's folder "does not contain valid
mv-ddr-marvell git repository".
This is expected under Buildroot, where we use intermediate archives.

The issue can be reproduced with the commands:

    cat >.config <<EOF
    BR2_aarch64=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
    BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="a80x0_mcbin"
    BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33=y
    BR2_TARGET_BINARIES_MARVELL=y
    BR2_TARGET_EDK2=y
    BR2_TARGET_EDK2_PLATFORM_SOLIDRUN_ARMADA80X0MCBIN=y
    BR2_TARGET_MV_DDR_MARVELL=y
    EOF
    make olddefconfig
    make

The build is failing with the error message:

    plat/marvell/armada/a8k/common/ble/ble.mk:34: *** "'MV_DDR_PATH=/buildroot/output/build/mv-ddr-marvell-d5acc10c287e40cc2feeb28710b92e45c93c702c' was specified, but '/buildroot/output/build/mv-ddr-marvell-d5acc10c287e40cc2feeb28710b92e45c93c702c' does not contain valid mv-ddr-marvell git repository".  Stop.

Add patches to fix the build for this platform, for a few versions of TF-A
(v2.6, v2.7, v2.8, lts-v2.8.20, v2.9, v2.10, lts-v2.10.5, v2.11, v2.12 and
lts-v2.12.1).

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Dick Olsson <hi@senzilla.io>
Cc: Sergey Matyukevich <geomatsi@gmail.com>
[Julien: add commands to reproduce the issue]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...marvell-allow-building-with-non-git-mv-dd.patch | 34 ++++++++++++++++++++++
 ...marvell-allow-building-with-non-git-mv-dd.patch | 34 ++++++++++++++++++++++
 ...marvell-allow-building-with-non-git-mv-dd.patch | 34 ++++++++++++++++++++++
 ...marvell-allow-building-with-non-git-mv-dd.patch | 34 ++++++++++++++++++++++
 ...marvell-allow-building-with-non-git-mv-dd.patch | 34 ++++++++++++++++++++++
 ...marvell-allow-building-with-non-git-mv-dd.patch | 34 ++++++++++++++++++++++
 ...marvell-allow-building-with-non-git-mv-dd.patch | 34 ++++++++++++++++++++++
 ...marvell-allow-building-with-non-git-mv-dd.patch | 34 ++++++++++++++++++++++
 ...marvell-allow-building-with-non-git-mv-dd.patch | 34 ++++++++++++++++++++++
 ...marvell-allow-building-with-non-git-mv-dd.patch | 34 ++++++++++++++++++++++
 10 files changed, 340 insertions(+)

diff --git a/boot/arm-trusted-firmware/lts-v2.10.5/0001-build-plat-marvell-allow-building-with-non-git-mv-dd.patch b/boot/arm-trusted-firmware/lts-v2.10.5/0001-build-plat-marvell-allow-building-with-non-git-mv-dd.patch
new file mode 100644
index 0000000000..80307beae7
--- /dev/null
+++ b/boot/arm-trusted-firmware/lts-v2.10.5/0001-build-plat-marvell-allow-building-with-non-git-mv-dd.patch
@@ -0,0 +1,34 @@
+From 70be9272d8d8b8e205fc60b41704d470a6798e36 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
+Date: Tue, 8 Apr 2025 13:27:53 +0200
+Subject: [PATCH] build(plat/marvell): allow building with non-git
+ mv-ddr-marvell
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When the mv-ddr-marvell folder is not a git tree the build fails
+complaining that it "does not contain valid mv-ddr-marvell git
+repository".
+
+Remove this check to allow building in Buildroot.
+
+Upstream: Not applicable. Buildroot specific.
+Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
+---
+ plat/marvell/armada/a8k/common/ble/ble.mk | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/plat/marvell/armada/a8k/common/ble/ble.mk b/plat/marvell/armada/a8k/common/ble/ble.mk
+index 752ab419d2..78de01686c 100644
+--- a/plat/marvell/armada/a8k/common/ble/ble.mk
++++ b/plat/marvell/armada/a8k/common/ble/ble.mk
+@@ -31,5 +31,4 @@ $(MV_DDR_LIB): FORCE
+ #	Do not remove! Following checks are required to ensure correct TF-A builds, removing these checks leads to broken TF-A builds
+ 	$(if $(value MV_DDR_PATH),,$(error "Platform '$(PLAT)' for BLE requires MV_DDR_PATH. Please set MV_DDR_PATH to point to the right directory"))
+ 	$(if $(wildcard $(value MV_DDR_PATH)/*),,$(error "'MV_DDR_PATH=$(value MV_DDR_PATH)' was specified, but '$(value MV_DDR_PATH)' directory does not exist"))
+-	$(if $(shell git -C $(value MV_DDR_PATH) rev-parse --show-cdup 2>&1),$(error "'MV_DDR_PATH=$(value MV_DDR_PATH)' was specified, but '$(value MV_DDR_PATH)' does not contain valid mv-ddr-marvell git repository"))
+ 	@+make -C $(MV_DDR_PATH) --no-print-directory PLAT_INCLUDES="$(MV_DDR_INCLUDES)" PLATFORM=$(PLAT) ARCH=AARCH64 OBJ_DIR=$(BUILD_PLAT)/ble
+-- 
+2.48.1
+
diff --git a/boot/arm-trusted-firmware/lts-v2.12.1/0001-build-plat-marvell-allow-building-with-non-git-mv-dd.patch b/boot/arm-trusted-firmware/lts-v2.12.1/0001-build-plat-marvell-allow-building-with-non-git-mv-dd.patch
new file mode 100644
index 0000000000..c92852afa7
--- /dev/null
+++ b/boot/arm-trusted-firmware/lts-v2.12.1/0001-build-plat-marvell-allow-building-with-non-git-mv-dd.patch
@@ -0,0 +1,34 @@
+From 83487cb4f74aa25cc3a03cbfa784d7b410cc3d07 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
+Date: Tue, 8 Apr 2025 13:27:53 +0200
+Subject: [PATCH] build(plat/marvell): allow building with non-git
+ mv-ddr-marvell
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When the mv-ddr-marvell folder is not a git tree the build fails
+complaining that it "does not contain valid mv-ddr-marvell git
+repository".
+
+Remove this check to allow building in Buildroot.
+
+Upstream: Not applicable. Buildroot specific.
+Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
+---
+ plat/marvell/armada/a8k/common/ble/ble.mk | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/plat/marvell/armada/a8k/common/ble/ble.mk b/plat/marvell/armada/a8k/common/ble/ble.mk
+index 5ab6123904..654f291732 100644
+--- a/plat/marvell/armada/a8k/common/ble/ble.mk
++++ b/plat/marvell/armada/a8k/common/ble/ble.mk
+@@ -31,5 +31,4 @@ $(MV_DDR_LIB): FORCE
+ #	Do not remove! Following checks are required to ensure correct TF-A builds, removing these checks leads to broken TF-A builds
+ 	$(if $(value MV_DDR_PATH),,$(error "Platform '$(PLAT)' for BLE requires MV_DDR_PATH. Please set MV_DDR_PATH to point to the right directory"))
+ 	$(if $(wildcard $(value MV_DDR_PATH)/*),,$(error "'MV_DDR_PATH=$(value MV_DDR_PATH)' was specified, but '$(value MV_DDR_PATH)' directory does not exist"))
+-	$(if $(shell git -C $(value MV_DDR_PATH) rev-parse --show-cdup 2>&1),$(error "'MV_DDR_PATH=$(value MV_DDR_PATH)' was specified, but '$(value MV_DDR_PATH)' does not contain valid mv-ddr-marvell git repository"))
+ 	$(q)+make -C $(MV_DDR_PATH) --no-print-directory PLAT_INCLUDES="$(MV_DDR_INCLUDES)" PLATFORM=$(PLAT) ARCH=AARCH64 OBJ_DIR=$(BUILD_PLAT)/ble
+-- 
+2.48.1
+
diff --git a/boot/arm-trusted-firmware/lts-v2.8.20/0002-build-plat-marvell-allow-building-with-non-git-mv-dd.patch b/boot/arm-trusted-firmware/lts-v2.8.20/0002-build-plat-marvell-allow-building-with-non-git-mv-dd.patch
new file mode 100644
index 0000000000..09e4270f46
--- /dev/null
+++ b/boot/arm-trusted-firmware/lts-v2.8.20/0002-build-plat-marvell-allow-building-with-non-git-mv-dd.patch
@@ -0,0 +1,34 @@
+From 26073dca5982e86b45d6ff82176418f8624315f5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
+Date: Tue, 8 Apr 2025 13:27:53 +0200
+Subject: [PATCH] build(plat/marvell): allow building with non-git
+ mv-ddr-marvell
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When the mv-ddr-marvell folder is not a git tree the build fails
+complaining that it "does not contain valid mv-ddr-marvell git
+repository".
+
+Remove this check to allow building in Buildroot.
+
+Upstream: Not applicable. Buildroot specific.
+Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
+---
+ plat/marvell/armada/a8k/common/ble/ble.mk | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/plat/marvell/armada/a8k/common/ble/ble.mk b/plat/marvell/armada/a8k/common/ble/ble.mk
+index 160e98f12a..569f5f1552 100644
+--- a/plat/marvell/armada/a8k/common/ble/ble.mk
++++ b/plat/marvell/armada/a8k/common/ble/ble.mk
+@@ -31,5 +31,4 @@ $(MV_DDR_LIB): FORCE
+ #	Do not remove! Following checks are required to ensure correct TF-A builds, removing these checks leads to broken TF-A builds
+ 	$(if $(value MV_DDR_PATH),,$(error "Platform '$(PLAT)' for BLE requires MV_DDR_PATH. Please set MV_DDR_PATH to point to the right directory"))
+ 	$(if $(wildcard $(value MV_DDR_PATH)/*),,$(error "'MV_DDR_PATH=$(value MV_DDR_PATH)' was specified, but '$(value MV_DDR_PATH)' directory does not exist"))
+-	$(if $(shell git -C $(value MV_DDR_PATH) rev-parse --show-cdup 2>&1),$(error "'MV_DDR_PATH=$(value MV_DDR_PATH)' was specified, but '$(value MV_DDR_PATH)' does not contain valid mv-ddr-marvell git repository"))
+ 	@+make -C $(MV_DDR_PATH) --no-print-directory PLAT_INCLUDES="$(MV_DDR_INCLUDES)" PLATFORM=$(PLAT) ARCH=AARCH64 OBJ_DIR=$(BUILD_PLAT)/ble
+-- 
+2.48.1
+
diff --git a/boot/arm-trusted-firmware/v2.10/0001-build-plat-marvell-allow-building-with-non-git-mv-dd.patch b/boot/arm-trusted-firmware/v2.10/0001-build-plat-marvell-allow-building-with-non-git-mv-dd.patch
new file mode 100644
index 0000000000..e3826c0881
--- /dev/null
+++ b/boot/arm-trusted-firmware/v2.10/0001-build-plat-marvell-allow-building-with-non-git-mv-dd.patch
@@ -0,0 +1,34 @@
+From ea879d9dcb7f22b9a0921613bf2f530e2787d0db Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
+Date: Tue, 8 Apr 2025 13:27:53 +0200
+Subject: [PATCH] build(plat/marvell): allow building with non-git
+ mv-ddr-marvell
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When the mv-ddr-marvell folder is not a git tree the build fails
+complaining that it "does not contain valid mv-ddr-marvell git
+repository".
+
+Remove this check to allow building in Buildroot.
+
+Upstream: Not applicable. Buildroot specific.
+Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
+---
+ plat/marvell/armada/a8k/common/ble/ble.mk | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/plat/marvell/armada/a8k/common/ble/ble.mk b/plat/marvell/armada/a8k/common/ble/ble.mk
+index 752ab419d2..78de01686c 100644
+--- a/plat/marvell/armada/a8k/common/ble/ble.mk
++++ b/plat/marvell/armada/a8k/common/ble/ble.mk
+@@ -31,5 +31,4 @@ $(MV_DDR_LIB): FORCE
+ #	Do not remove! Following checks are required to ensure correct TF-A builds, removing these checks leads to broken TF-A builds
+ 	$(if $(value MV_DDR_PATH),,$(error "Platform '$(PLAT)' for BLE requires MV_DDR_PATH. Please set MV_DDR_PATH to point to the right directory"))
+ 	$(if $(wildcard $(value MV_DDR_PATH)/*),,$(error "'MV_DDR_PATH=$(value MV_DDR_PATH)' was specified, but '$(value MV_DDR_PATH)' directory does not exist"))
+-	$(if $(shell git -C $(value MV_DDR_PATH) rev-parse --show-cdup 2>&1),$(error "'MV_DDR_PATH=$(value MV_DDR_PATH)' was specified, but '$(value MV_DDR_PATH)' does not contain valid mv-ddr-marvell git repository"))
+ 	@+make -C $(MV_DDR_PATH) --no-print-directory PLAT_INCLUDES="$(MV_DDR_INCLUDES)" PLATFORM=$(PLAT) ARCH=AARCH64 OBJ_DIR=$(BUILD_PLAT)/ble
+-- 
+2.48.1
+
diff --git a/boot/arm-trusted-firmware/v2.11/0001-build-plat-marvell-allow-building-with-non-git-mv-dd.patch b/boot/arm-trusted-firmware/v2.11/0001-build-plat-marvell-allow-building-with-non-git-mv-dd.patch
new file mode 100644
index 0000000000..35d1d62bf6
--- /dev/null
+++ b/boot/arm-trusted-firmware/v2.11/0001-build-plat-marvell-allow-building-with-non-git-mv-dd.patch
@@ -0,0 +1,34 @@
+From f0f29a693064915f5df7ab9369f93353c6c692cc Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
+Date: Tue, 8 Apr 2025 13:27:53 +0200
+Subject: [PATCH] build(plat/marvell): allow building with non-git
+ mv-ddr-marvell
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When the mv-ddr-marvell folder is not a git tree the build fails
+complaining that it "does not contain valid mv-ddr-marvell git
+repository".
+
+Remove this check to allow building in Buildroot.
+
+Upstream: Not applicable. Buildroot specific.
+Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
+---
+ plat/marvell/armada/a8k/common/ble/ble.mk | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/plat/marvell/armada/a8k/common/ble/ble.mk b/plat/marvell/armada/a8k/common/ble/ble.mk
+index 752ab419d2..78de01686c 100644
+--- a/plat/marvell/armada/a8k/common/ble/ble.mk
++++ b/plat/marvell/armada/a8k/common/ble/ble.mk
+@@ -31,5 +31,4 @@ $(MV_DDR_LIB): FORCE
+ #	Do not remove! Following checks are required to ensure correct TF-A builds, removing these checks leads to broken TF-A builds
+ 	$(if $(value MV_DDR_PATH),,$(error "Platform '$(PLAT)' for BLE requires MV_DDR_PATH. Please set MV_DDR_PATH to point to the right directory"))
+ 	$(if $(wildcard $(value MV_DDR_PATH)/*),,$(error "'MV_DDR_PATH=$(value MV_DDR_PATH)' was specified, but '$(value MV_DDR_PATH)' directory does not exist"))
+-	$(if $(shell git -C $(value MV_DDR_PATH) rev-parse --show-cdup 2>&1),$(error "'MV_DDR_PATH=$(value MV_DDR_PATH)' was specified, but '$(value MV_DDR_PATH)' does not contain valid mv-ddr-marvell git repository"))
+ 	@+make -C $(MV_DDR_PATH) --no-print-directory PLAT_INCLUDES="$(MV_DDR_INCLUDES)" PLATFORM=$(PLAT) ARCH=AARCH64 OBJ_DIR=$(BUILD_PLAT)/ble
+-- 
+2.48.1
+
diff --git a/boot/arm-trusted-firmware/v2.12/0001-build-plat-marvell-allow-building-with-non-git-mv-dd.patch b/boot/arm-trusted-firmware/v2.12/0001-build-plat-marvell-allow-building-with-non-git-mv-dd.patch
new file mode 100644
index 0000000000..c428168168
--- /dev/null
+++ b/boot/arm-trusted-firmware/v2.12/0001-build-plat-marvell-allow-building-with-non-git-mv-dd.patch
@@ -0,0 +1,34 @@
+From afa038938b5bc54703a10f9103e6b85e07fd562f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
+Date: Tue, 8 Apr 2025 13:27:53 +0200
+Subject: [PATCH] build(plat/marvell): allow building with non-git
+ mv-ddr-marvell
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When the mv-ddr-marvell folder is not a git tree the build fails
+complaining that it "does not contain valid mv-ddr-marvell git
+repository".
+
+Remove this check to allow building in Buildroot.
+
+Upstream: Not applicable. Buildroot specific.
+Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
+---
+ plat/marvell/armada/a8k/common/ble/ble.mk | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/plat/marvell/armada/a8k/common/ble/ble.mk b/plat/marvell/armada/a8k/common/ble/ble.mk
+index 5ab6123904..654f291732 100644
+--- a/plat/marvell/armada/a8k/common/ble/ble.mk
++++ b/plat/marvell/armada/a8k/common/ble/ble.mk
+@@ -31,5 +31,4 @@ $(MV_DDR_LIB): FORCE
+ #	Do not remove! Following checks are required to ensure correct TF-A builds, removing these checks leads to broken TF-A builds
+ 	$(if $(value MV_DDR_PATH),,$(error "Platform '$(PLAT)' for BLE requires MV_DDR_PATH. Please set MV_DDR_PATH to point to the right directory"))
+ 	$(if $(wildcard $(value MV_DDR_PATH)/*),,$(error "'MV_DDR_PATH=$(value MV_DDR_PATH)' was specified, but '$(value MV_DDR_PATH)' directory does not exist"))
+-	$(if $(shell git -C $(value MV_DDR_PATH) rev-parse --show-cdup 2>&1),$(error "'MV_DDR_PATH=$(value MV_DDR_PATH)' was specified, but '$(value MV_DDR_PATH)' does not contain valid mv-ddr-marvell git repository"))
+ 	$(q)+make -C $(MV_DDR_PATH) --no-print-directory PLAT_INCLUDES="$(MV_DDR_INCLUDES)" PLATFORM=$(PLAT) ARCH=AARCH64 OBJ_DIR=$(BUILD_PLAT)/ble
+-- 
+2.48.1
+
diff --git a/boot/arm-trusted-firmware/v2.6/0002-build-plat-marvell-allow-building-with-non-git-mv-dd.patch b/boot/arm-trusted-firmware/v2.6/0002-build-plat-marvell-allow-building-with-non-git-mv-dd.patch
new file mode 100644
index 0000000000..77c6edb446
--- /dev/null
+++ b/boot/arm-trusted-firmware/v2.6/0002-build-plat-marvell-allow-building-with-non-git-mv-dd.patch
@@ -0,0 +1,34 @@
+From e94c6513bad0a2cdb2a2266129c06e5a55826d74 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
+Date: Tue, 8 Apr 2025 13:27:53 +0200
+Subject: [PATCH] build(plat/marvell): allow building with non-git
+ mv-ddr-marvell
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When the mv-ddr-marvell folder is not a git tree the build fails
+complaining that it "does not contain valid mv-ddr-marvell git
+repository".
+
+Remove this check to allow building in Buildroot.
+
+Upstream: Not applicable. Buildroot specific.
+Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
+---
+ plat/marvell/armada/a8k/common/ble/ble.mk | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/plat/marvell/armada/a8k/common/ble/ble.mk b/plat/marvell/armada/a8k/common/ble/ble.mk
+index 160e98f12a..569f5f1552 100644
+--- a/plat/marvell/armada/a8k/common/ble/ble.mk
++++ b/plat/marvell/armada/a8k/common/ble/ble.mk
+@@ -31,5 +31,4 @@ $(MV_DDR_LIB): FORCE
+ #	Do not remove! Following checks are required to ensure correct TF-A builds, removing these checks leads to broken TF-A builds
+ 	$(if $(value MV_DDR_PATH),,$(error "Platform '$(PLAT)' for BLE requires MV_DDR_PATH. Please set MV_DDR_PATH to point to the right directory"))
+ 	$(if $(wildcard $(value MV_DDR_PATH)/*),,$(error "'MV_DDR_PATH=$(value MV_DDR_PATH)' was specified, but '$(value MV_DDR_PATH)' directory does not exist"))
+-	$(if $(shell git -C $(value MV_DDR_PATH) rev-parse --show-cdup 2>&1),$(error "'MV_DDR_PATH=$(value MV_DDR_PATH)' was specified, but '$(value MV_DDR_PATH)' does not contain valid mv-ddr-marvell git repository"))
+ 	@+make -C $(MV_DDR_PATH) --no-print-directory PLAT_INCLUDES="$(MV_DDR_INCLUDES)" PLATFORM=$(PLAT) ARCH=AARCH64 OBJ_DIR=$(BUILD_PLAT)/ble
+-- 
+2.48.1
+
diff --git a/boot/arm-trusted-firmware/v2.7/0002-build-plat-marvell-allow-building-with-non-git-mv-dd.patch b/boot/arm-trusted-firmware/v2.7/0002-build-plat-marvell-allow-building-with-non-git-mv-dd.patch
new file mode 100644
index 0000000000..725745bc9d
--- /dev/null
+++ b/boot/arm-trusted-firmware/v2.7/0002-build-plat-marvell-allow-building-with-non-git-mv-dd.patch
@@ -0,0 +1,34 @@
+From bbb06a551951a96b738f1aac70f8c2fc44b39e50 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
+Date: Tue, 8 Apr 2025 13:27:53 +0200
+Subject: [PATCH] build(plat/marvell): allow building with non-git
+ mv-ddr-marvell
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When the mv-ddr-marvell folder is not a git tree the build fails
+complaining that it "does not contain valid mv-ddr-marvell git
+repository".
+
+Remove this check to allow building in Buildroot.
+
+Upstream: Not applicable. Buildroot specific.
+Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
+---
+ plat/marvell/armada/a8k/common/ble/ble.mk | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/plat/marvell/armada/a8k/common/ble/ble.mk b/plat/marvell/armada/a8k/common/ble/ble.mk
+index 160e98f12a..569f5f1552 100644
+--- a/plat/marvell/armada/a8k/common/ble/ble.mk
++++ b/plat/marvell/armada/a8k/common/ble/ble.mk
+@@ -31,5 +31,4 @@ $(MV_DDR_LIB): FORCE
+ #	Do not remove! Following checks are required to ensure correct TF-A builds, removing these checks leads to broken TF-A builds
+ 	$(if $(value MV_DDR_PATH),,$(error "Platform '$(PLAT)' for BLE requires MV_DDR_PATH. Please set MV_DDR_PATH to point to the right directory"))
+ 	$(if $(wildcard $(value MV_DDR_PATH)/*),,$(error "'MV_DDR_PATH=$(value MV_DDR_PATH)' was specified, but '$(value MV_DDR_PATH)' directory does not exist"))
+-	$(if $(shell git -C $(value MV_DDR_PATH) rev-parse --show-cdup 2>&1),$(error "'MV_DDR_PATH=$(value MV_DDR_PATH)' was specified, but '$(value MV_DDR_PATH)' does not contain valid mv-ddr-marvell git repository"))
+ 	@+make -C $(MV_DDR_PATH) --no-print-directory PLAT_INCLUDES="$(MV_DDR_INCLUDES)" PLATFORM=$(PLAT) ARCH=AARCH64 OBJ_DIR=$(BUILD_PLAT)/ble
+-- 
+2.48.1
+
diff --git a/boot/arm-trusted-firmware/v2.8/0003-build-plat-marvell-allow-building-with-non-git-mv-dd.patch b/boot/arm-trusted-firmware/v2.8/0003-build-plat-marvell-allow-building-with-non-git-mv-dd.patch
new file mode 100644
index 0000000000..3d59640ec4
--- /dev/null
+++ b/boot/arm-trusted-firmware/v2.8/0003-build-plat-marvell-allow-building-with-non-git-mv-dd.patch
@@ -0,0 +1,34 @@
+From e349eb61b8b5f058ad9d54fc063b66ca26cf5a5b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
+Date: Tue, 8 Apr 2025 13:27:53 +0200
+Subject: [PATCH] build(plat/marvell): allow building with non-git
+ mv-ddr-marvell
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When the mv-ddr-marvell folder is not a git tree the build fails
+complaining that it "does not contain valid mv-ddr-marvell git
+repository".
+
+Remove this check to allow building in Buildroot.
+
+Upstream: Not applicable. Buildroot specific.
+Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
+---
+ plat/marvell/armada/a8k/common/ble/ble.mk | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/plat/marvell/armada/a8k/common/ble/ble.mk b/plat/marvell/armada/a8k/common/ble/ble.mk
+index 160e98f12a..569f5f1552 100644
+--- a/plat/marvell/armada/a8k/common/ble/ble.mk
++++ b/plat/marvell/armada/a8k/common/ble/ble.mk
+@@ -31,5 +31,4 @@ $(MV_DDR_LIB): FORCE
+ #	Do not remove! Following checks are required to ensure correct TF-A builds, removing these checks leads to broken TF-A builds
+ 	$(if $(value MV_DDR_PATH),,$(error "Platform '$(PLAT)' for BLE requires MV_DDR_PATH. Please set MV_DDR_PATH to point to the right directory"))
+ 	$(if $(wildcard $(value MV_DDR_PATH)/*),,$(error "'MV_DDR_PATH=$(value MV_DDR_PATH)' was specified, but '$(value MV_DDR_PATH)' directory does not exist"))
+-	$(if $(shell git -C $(value MV_DDR_PATH) rev-parse --show-cdup 2>&1),$(error "'MV_DDR_PATH=$(value MV_DDR_PATH)' was specified, but '$(value MV_DDR_PATH)' does not contain valid mv-ddr-marvell git repository"))
+ 	@+make -C $(MV_DDR_PATH) --no-print-directory PLAT_INCLUDES="$(MV_DDR_INCLUDES)" PLATFORM=$(PLAT) ARCH=AARCH64 OBJ_DIR=$(BUILD_PLAT)/ble
+-- 
+2.48.1
+
diff --git a/boot/arm-trusted-firmware/v2.9/0002-build-plat-marvell-allow-building-with-non-git-mv-dd.patch b/boot/arm-trusted-firmware/v2.9/0002-build-plat-marvell-allow-building-with-non-git-mv-dd.patch
new file mode 100644
index 0000000000..4813464559
--- /dev/null
+++ b/boot/arm-trusted-firmware/v2.9/0002-build-plat-marvell-allow-building-with-non-git-mv-dd.patch
@@ -0,0 +1,34 @@
+From 51d35780d42b53c5215019c9d6ffe28ce768e886 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
+Date: Tue, 8 Apr 2025 13:27:53 +0200
+Subject: [PATCH] build(plat/marvell): allow building with non-git
+ mv-ddr-marvell
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When the mv-ddr-marvell folder is not a git tree the build fails
+complaining that it "does not contain valid mv-ddr-marvell git
+repository".
+
+Remove this check to allow building in Buildroot.
+
+Upstream: Not applicable. Buildroot specific.
+Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
+---
+ plat/marvell/armada/a8k/common/ble/ble.mk | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/plat/marvell/armada/a8k/common/ble/ble.mk b/plat/marvell/armada/a8k/common/ble/ble.mk
+index 752ab419d2..78de01686c 100644
+--- a/plat/marvell/armada/a8k/common/ble/ble.mk
++++ b/plat/marvell/armada/a8k/common/ble/ble.mk
+@@ -31,5 +31,4 @@ $(MV_DDR_LIB): FORCE
+ #	Do not remove! Following checks are required to ensure correct TF-A builds, removing these checks leads to broken TF-A builds
+ 	$(if $(value MV_DDR_PATH),,$(error "Platform '$(PLAT)' for BLE requires MV_DDR_PATH. Please set MV_DDR_PATH to point to the right directory"))
+ 	$(if $(wildcard $(value MV_DDR_PATH)/*),,$(error "'MV_DDR_PATH=$(value MV_DDR_PATH)' was specified, but '$(value MV_DDR_PATH)' directory does not exist"))
+-	$(if $(shell git -C $(value MV_DDR_PATH) rev-parse --show-cdup 2>&1),$(error "'MV_DDR_PATH=$(value MV_DDR_PATH)' was specified, but '$(value MV_DDR_PATH)' does not contain valid mv-ddr-marvell git repository"))
+ 	@+make -C $(MV_DDR_PATH) --no-print-directory PLAT_INCLUDES="$(MV_DDR_INCLUDES)" PLATFORM=$(PLAT) ARCH=AARCH64 OBJ_DIR=$(BUILD_PLAT)/ble
+-- 
+2.48.1
+

--===============8371958210410276173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8371958210410276173==--
