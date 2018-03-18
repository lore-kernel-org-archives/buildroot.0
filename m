From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 18 Mar 2018 15:01:28 -0400
Subject: [Buildroot] [PATCH v5 2/5] qemu: add qemu_user_opts
In-Reply-To: <20180318190131.21404-1-aduskett@gmail.com>
References: <20180318190131.21404-1-aduskett@gmail.com>
Message-ID: <20180318190131.21404-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a new variable in qemu.mk: QEMU_USER_OPTS. When qemu-$(ARCH) is
called, some architectures require a -cpu flag to be passed, or else a
segfault may occure when building introspection files.
For PowerPC, many of these cpu's need a specific CPU flag to be passed
via the command line.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v4:
  - Add patch to series.

Changes v4 -> v5:
 - Change HOST_QEMU_CPU_TUNE to QEMU_USER_OPTS. (Yann)
 - Add $(QEMU_USER_OPTS) to end of QEMU_USER (Yann)

 package/qemu/qemu.mk | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 345ef52668..6a0fcabbce 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -70,6 +70,37 @@ endif
 ifeq ($(HOST_QEMU_ARCH),sh4aeb)
 HOST_QEMU_ARCH = sh4eb
 endif
+
+# Add cpu specific callouts for qemu.
+# In some cases (e.g. ppc) simply being arch specific (apparently) isn't good
+# enough and a PACKAGE_ARCH specific -cpu option is needed 
+# For others (e.g. arm) a -cpu option is not necessary, since the
+# qemu-arm default CPU supports all required architecture levels.
+ifeq ($(BR2_x86_64),y)
+QEMU_USER_OPTS = -cpu Nehalem,check=false
+endif
+
+# PowerPC architecture. Currently, the 620, 630, and 970 are not supported.
+ifeq ($(BR2_powerpc_e5500),y)
+QEMU_USER_OPTS = -cpu e5500
+endif
+
+ifeq ($(BR2_powerpc_e6500),y)
+QEMU_USER_OPTS = -cpu e6500
+endif
+
+ifeq ($(BR2_powerpc_power7),y)
+QEMU_USER_OPTS = -cpu 7400
+endif
+
+ifeq ($(BR2_powerpc64)$(BR2_powerpc_e5500),yy)
+QEMU_USER_OPTS = -cpu e500mc
+endif
+
+ifeq ($(BR2_powerpc64)$(BR2_powerpc_e6500),yy)
+QEMU_USER_OPTS = -cpu e500mc
+endif
+
 HOST_QEMU_SYS_ARCH ?= $(HOST_QEMU_ARCH)
 
 ifeq ($(BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE),y)
@@ -147,7 +178,7 @@ endef
 $(eval $(host-generic-package))
 
 # variable used by other packages
-QEMU_USER = $(HOST_DIR)/bin/qemu-$(HOST_QEMU_ARCH)
+QEMU_USER = $(HOST_DIR)/bin/qemu-$(HOST_QEMU_ARCH) $(QEMU_USER_OPTS)
 
 #-------------------------------------------------------------
 # Target-qemu
-- 
2.14.3
