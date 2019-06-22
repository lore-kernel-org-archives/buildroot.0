From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 17:06:29 +0200
Subject: [Buildroot] [git commit] package/qemu: add C-SKY qemu support
Message-ID: <20190622154514.3C1568280A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f816e5b276f1ef15840bec6667f1e8219717ab7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/Config.in.host |  1 +
 package/qemu/qemu.hash      |  3 +++
 package/qemu/qemu.mk        | 12 ++++++++++++
 3 files changed, 16 insertions(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 8a0df38fb8..effe58b211 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -3,6 +3,7 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_arm
 	default y if BR2_armeb
 	default y if BR2_aarch64
+	default y if BR2_csky
 	default y if BR2_i386
 	default y if BR2_m68k
 	default y if BR2_microblazeel
diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index 338d2ae503..41e8e75a80 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -2,3 +2,6 @@
 sha256 6a0508df079a0a33c2487ca936a56c12122f105b8a96a44374704bef6c69abfc  qemu-3.1.0.tar.xz
 sha256 6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256 48ffe9fc7f1d5462dbd19340bc4dd1d8a9e37c61ed535813e614cbe4a5f0d4df  COPYING.LIB
+
+# Locally computed
+sha256 61091767ffd16002e77f005155d096208094e69dee35e6d5ddcaa6c8a13b5e26  qemu-b517e1dc3125a57555d67a8deed9eac7b42288e2.tar.gz
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 025c322b98..73e0778d73 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,9 +4,14 @@
 #
 ################################################################################
 
+ifeq ($(BR2_csky),y)
+QEMU_VERSION = b517e1dc3125a57555d67a8deed9eac7b42288e2
+QEMU_SITE = $(call github,c-sky,qemu,$(QEMU_VERSION))
+else
 QEMU_VERSION = 3.1.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = http://download.qemu.org
+endif
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
 QEMU_LICENSE_FILES = COPYING COPYING.LIB
 # NOTE: there is no top-level license file for non-(L)GPL licenses;
@@ -209,6 +214,13 @@ endif
 ifeq ($(HOST_QEMU_ARCH),sh4aeb)
 HOST_QEMU_ARCH = sh4eb
 endif
+ifeq ($(HOST_QEMU_ARCH),csky)
+ifeq ($(BR2_ck610),y)
+HOST_QEMU_ARCH = cskyv1
+else
+HOST_QEMU_ARCH = cskyv2
+endif
+endif
 HOST_QEMU_SYS_ARCH ?= $(HOST_QEMU_ARCH)
 
 ifeq ($(BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE),y)
