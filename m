From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Dec 2020 10:36:41 +0100
Subject: [Buildroot] [git commit] package/qemu: bump to version 5.2.0
Message-ID: <20201213092153.B95E2807D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5351d8b7f8805bed918dd2e0bc0aa1e0fe3fcd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From [1]:
"The build system is now partly based on Meson. However, building is
still done with configure and make as in previous versions of QEMU."

Qemu requires meson >= 0.55.3, Buildroot use the latest version 0.56.0.
In order to add host-meson dependency we have to remove --python option
since it requires to use the meson bundled into Qemu sources [2].

Even without --python, python3 is used. See config-host.mak:
PYTHON=output/host/bin/python3 -B

See config-host.mak to check if meson and ninja from HOST_DIR are used:
MESON=output/host/bin/meson
NINJA=output/host/bin/ninja

Since the switch to meson is partial and still requires using the
configure script, keep using generic-package infra.

Disable new options introduced in Qemu 5.2.0:
--disable-virtiofsd
--disable-vhost-user-blk-server

Runtime tested on gitlab [3]

[1] https://wiki.qemu.org/ChangeLog/5.2#Build_Information
[2] https://git.qemu.org/?p=qemu.git;a=blob;f=configure;h=18c26e0389741643748c70ac7788a996ef006834;hb=553032db17440f8de011390e5a1cfddd13751b0b#l1895
[3] https://gitlab.com/kubu93/buildroot/-/pipelines/228214205

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-fix-usage-of-mcontext-structure-on-ARM-uCl.patch |  4 ++--
 package/qemu/qemu.hash                               |  6 +++---
 package/qemu/qemu.mk                                 | 20 +++++++++++++++-----
 3 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch b/package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
index 548ec3e765..841708995e 100644
--- a/package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
+++ b/package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
@@ -18,10 +18,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
-index 4be78eb9b3..0a690bec55 100644
+index 4ebe25461a..0496674fbd 100644
 --- a/accel/tcg/user-exec.c
 +++ b/accel/tcg/user-exec.c
-@@ -508,7 +508,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
+@@ -536,7 +536,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
  
  #if defined(__NetBSD__)
      pc = uc->uc_mcontext.__gregs[_REG_R15];
diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index 317c0b1a4e..7d9936adb4 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256 c9174eb5933d9eb5e61f541cd6d1184cd3118dfe4c5c4955bc1bdc4d390fa4e5  qemu-5.1.0.tar.xz
-sha256 6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
-sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
+sha256  cb18d889b628fbe637672b0326789d9b0e3b8027e0445b936537c78549df17bc  qemu-5.2.0.tar.xz
+sha256  6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 2bac96bd66..ecb02e7f48 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QEMU_VERSION = 5.1.0
+QEMU_VERSION = 5.2.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = http://download.qemu.org
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
@@ -14,8 +14,12 @@ QEMU_LICENSE_FILES = COPYING COPYING.LIB
 #       individual source files.
 
 #-------------------------------------------------------------
+
+# The build system is now partly based on Meson.
+# However, building is still done with configure and make as in previous versions of QEMU.
+
 # Target-qemu
-QEMU_DEPENDENCIES = host-pkgconf libglib2 zlib pixman host-python3
+QEMU_DEPENDENCIES = host-meson host-pkgconf libglib2 zlib pixman host-python3
 
 # Need the LIBS variable because librt and libm are
 # not automatically pulled. :-(
@@ -163,7 +167,8 @@ define QEMU_CONFIGURE_CMDS
 			--prefix=/usr \
 			--cross-prefix=$(TARGET_CROSS) \
 			--audio-drv-list= \
-			--python=$(HOST_DIR)/bin/python3 \
+			--meson=$(HOST_DIR)/bin/meson \
+			--ninja=$(HOST_DIR)/bin/ninja \
 			--enable-kvm \
 			--enable-attr \
 			--enable-vhost-net \
@@ -194,6 +199,8 @@ define QEMU_CONFIGURE_CMDS
 			--disable-capstone \
 			--disable-git-update \
 			--disable-opengl \
+			--disable-vhost-user-blk-server \
+			--disable-virtiofsd \
 			$(QEMU_OPTS)
 endef
 
@@ -212,7 +219,7 @@ $(eval $(generic-package))
 #-------------------------------------------------------------
 # Host-qemu
 
-HOST_QEMU_DEPENDENCIES = host-pkgconf host-zlib host-libglib2 host-pixman host-python3
+HOST_QEMU_DEPENDENCIES = host-meson host-pkgconf host-zlib host-libglib2 host-pixman host-python3
 
 #       BR ARCH         qemu
 #       -------         ----
@@ -327,13 +334,16 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--host-cc="$(HOSTCC)" \
 		--extra-cflags="$(HOST_QEMU_CFLAGS)" \
 		--extra-ldflags="$(HOST_LDFLAGS)" \
-		--python=$(HOST_DIR)/bin/python3 \
+		--meson=$(HOST_DIR)/bin/meson \
+		--ninja=$(HOST_DIR)/bin/ninja \
 		--disable-bzip2 \
 		--disable-containers \
 		--disable-curl \
 		--disable-libssh \
 		--disable-linux-io-uring \
 		--disable-sdl \
+		--disable-vhost-user-blk-server \
+		--disable-virtiofsd \
 		--disable-vnc-jpeg \
 		--disable-vnc-png \
 		--disable-vnc-sasl \
