From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 May 2020 22:52:53 +0200
Subject: [Buildroot] [git commit] package/qemu: remove csky fork
Message-ID: <20200525203748.892F991A6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=58af9a70cc0f195116dedb3fd0e2ca5b4fec9e70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We have a qemu fork for csky cpus [1] but since qemu version
bump to 4.2.0 [2] and libssh2/libssh change the csky build is
broken.

The csky fork is based on Qemu 3.0.0 but unlike autotools packages
any unknown option is handled as error.

Since we don't want to support all options from previous qemu
release and the github repository has been removed [3] and the
only remaining archive is located on http://sources.buildroot.net,
remove the qemu csky fork as suggested by [4].

[1] https://git.buildroot.net/buildroot/commit/?id=f816e5b276f1ef15840bec6667f1e8219717ab7d
[2] https://git.buildroot.net/buildroot/commit/?id=0ea17054ce7dfc54efca5634133cef786445e7b1
[3] https://github.com/c-sky/qemu
[4] http://lists.busybox.net/pipermail/buildroot/2020-May/281885.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Guo Ren <ren_guo@c-sky.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
[Peter: move patches out of 4.2.0 subdir]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ser-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch |  0
 ...util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch |  0
 ...arget-arm-arm-semi-fix-SYS_OPEN-to-return-nonzero-f.patch |  0
 package/qemu/Config.in.host                                  |  1 -
 package/qemu/qemu.hash                                       |  3 ---
 package/qemu/qemu.mk                                         | 12 ------------
 6 files changed, 16 deletions(-)

diff --git a/package/qemu/4.2.0/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch b/package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
similarity index 100%
rename from package/qemu/4.2.0/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
rename to package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
diff --git a/package/qemu/4.2.0/0002-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch b/package/qemu/0002-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
similarity index 100%
rename from package/qemu/4.2.0/0002-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
rename to package/qemu/0002-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
diff --git a/package/qemu/4.2.0/0003-target-arm-arm-semi-fix-SYS_OPEN-to-return-nonzero-f.patch b/package/qemu/0003-target-arm-arm-semi-fix-SYS_OPEN-to-return-nonzero-f.patch
similarity index 100%
rename from package/qemu/4.2.0/0003-target-arm-arm-semi-fix-SYS_OPEN-to-return-nonzero-f.patch
rename to package/qemu/0003-target-arm-arm-semi-fix-SYS_OPEN-to-return-nonzero-f.patch
diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 5ed160159a..7ccf768d15 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -3,7 +3,6 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_arm
 	default y if BR2_armeb
 	default y if BR2_aarch64
-	default y if BR2_csky
 	default y if BR2_i386
 	default y if BR2_m68k
 	default y if BR2_microblazeel
diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index dae11cb3fe..322b4fdf16 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -2,6 +2,3 @@
 sha256 d3481d4108ce211a053ef15be69af1bdd9dde1510fda80d92be0f6c3e98768f0  qemu-4.2.0.tar.xz
 sha256 6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-
-# Locally computed
-sha256 61091767ffd16002e77f005155d096208094e69dee35e6d5ddcaa6c8a13b5e26  qemu-b517e1dc3125a57555d67a8deed9eac7b42288e2.tar.gz
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 0bb29f9369..7fe64e3605 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,14 +4,9 @@
 #
 ################################################################################
 
-ifeq ($(BR2_csky),y)
-QEMU_VERSION = b517e1dc3125a57555d67a8deed9eac7b42288e2
-QEMU_SITE = $(call github,c-sky,qemu,$(QEMU_VERSION))
-else
 QEMU_VERSION = 4.2.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = http://download.qemu.org
-endif
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
 QEMU_LICENSE_FILES = COPYING COPYING.LIB
 # NOTE: there is no top-level license file for non-(L)GPL licenses;
@@ -238,13 +233,6 @@ endif
 ifeq ($(HOST_QEMU_ARCH),sh4aeb)
 HOST_QEMU_ARCH = sh4eb
 endif
-ifeq ($(HOST_QEMU_ARCH),csky)
-ifeq ($(BR2_ck610),y)
-HOST_QEMU_ARCH = cskyv1
-else
-HOST_QEMU_ARCH = cskyv2
-endif
-endif
 HOST_QEMU_SYS_ARCH ?= $(HOST_QEMU_ARCH)
 
 HOST_QEMU_CFLAGS = $(HOST_CFLAGS)
