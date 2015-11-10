From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 10 Nov 2015 07:39:32 -0300
Subject: [Buildroot] [PATCH 2/2] configs/qemu: bump to the latest linux
	version
In-Reply-To: <1447151972-12086-1-git-send-email-gustavo@zacarias.com.ar>
References: <1447151972-12086-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1447151972-12086-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ppc-mpc8544ds: switch to custom kernel config since the new 4.3-shipped
mpc85xx_basic_defconfig doesn't work with Qemu.
Incidentally while cleaning it up it now seems to work fine with newer
qemu versions.

sparc64_sun4u: ditch ne2k driver since it's useless, and add the e1000
driver which works fine.

x86: stick to 4.2.x kernels since 4.3 doesn't work right with uclibc
(any variant) based toolchains.

Results table:

Defconfig               Kernel          Qemu    Network Status
--------------------------------------------------------------
aarch64_virt            4.3             2.3.0   YES     OK
arm_nuri                3.10.93         2.3.0   NO(1)   OK(2)
arm_versatile           4.3             2.3.0   YES     OK
arm_vexpress            4.3             2.3.0   YES     OK
microblazebe            4.3             2.3.0   YES     OK
microblazeel            4.3             2.3.0   YES     OK
mips64el_malta          4.3             2.3.0   YES     OK
mips64_malta            4.3             2.3.0   YES     OK
mipsel_malta            4.3             2.3.0   YES     OK
mips_malta              4.3             2.3.0   YES     OK
ppc_g3beige             4.3             2.3.0   YES     OK
ppc_mpc8544ds           4.3             2.3.0   YES     OK
ppc_virtex_ml507        4.3             2.3.0   NO      OK
ppc64_pseries           4.3             2.3.0   YES     OK
sh4                     4.3             2.3.0   YES     OK
sh4eb                   4.3             2.3.0   NO(1)   OK
sparc_ss10              4.3             2.3.0   YES     OK
sparc64_sun4u           4.3             2.3.0   YES     OK
sparc_sun4u             4.3             2.3.0   YES     OK
x86                     4.2.6           2.3.0   YES     OK(3)
x86_64                  4.3             2.3.0   YES     OK
xtensa_lx60             4.3             2.3.0   YES     OK

(1) - Supposed to work but broken, probably Qemu emulation issue
(2) - In like 1/3 runs it fails to start properly
(3) - linux 4.3.0 doesn't like uclibc-based toolchains (net issues)

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../{linux-4.2.config => linux-4.3.config}         |  0
 board/qemu/aarch64-virt/readme.txt                 |  2 +-
 board/qemu/arm-nuri/readme.txt                     |  2 +-
 .../{linux-4.2.config => linux-4.3.config}         |  0
 board/qemu/arm-versatile/readme.txt                |  2 +-
 board/qemu/arm-vexpress/readme.txt                 |  2 +-
 .../{linux-4.2.config => linux-4.3.config}         |  0
 board/qemu/microblazebe-mmu/readme.txt             |  2 +-
 .../{linux-4.2.config => linux-4.3.config}         |  0
 board/qemu/microblazeel-mmu/readme.txt             |  2 +-
 .../{linux-4.2.config => linux-4.3.config}         |  0
 board/qemu/mips-malta/readme.txt                   |  2 +-
 .../{linux-4.2.config => linux-4.3.config}         |  0
 board/qemu/mips64-malta/readme.txt                 |  2 +-
 .../{linux-4.2.config => linux-4.3.config}         |  0
 board/qemu/mips64el-malta/readme.txt               |  2 +-
 .../{linux-4.2.config => linux-4.3.config}         |  0
 board/qemu/mipsel-malta/readme.txt                 |  2 +-
 .../{linux-4.2.config => linux-4.3.config}         |  0
 board/qemu/ppc-g3beige/readme.txt                  |  2 +-
 board/qemu/ppc-mpc8544ds/linux-4.3.config          | 38 ++++++++++++++++++++++
 board/qemu/ppc-mpc8544ds/readme.txt                |  3 +-
 .../{linux-4.2.config => linux-4.3.config}         |  0
 board/qemu/ppc-virtex-ml507/readme.txt             |  2 +-
 board/qemu/ppc64-pseries/readme.txt                |  2 +-
 .../sh4-r2d/{linux-4.2.config => linux-4.3.config} |  0
 board/qemu/sh4-r2d/readme.txt                      |  2 +-
 .../{linux-4.2.config => linux-4.3.config}         |  0
 board/qemu/sh4eb-r2d/readme.txt                    |  2 +-
 .../{linux-4.2.config => linux-4.3.config}         |  0
 board/qemu/sparc-ss10/readme.txt                   |  2 +-
 .../{linux-4.1.config => linux-4.3.config}         |  4 +--
 board/qemu/sparc64-sun4u/readme.txt                |  2 +-
 board/qemu/x86/readme.txt                          |  2 +-
 board/qemu/x86_64/linux-4.3.config                 | 23 +++++++++++++
 ...config~2c313f8e7b5a8f665e56ea1c13b7b44d95a92932 | 23 +++++++++++++
 board/qemu/x86_64/readme.txt                       |  2 +-
 .../{linux-4.2.config => linux-4.3.config}         |  0
 board/qemu/xtensa-lx60/readme.txt                  |  2 +-
 configs/qemu_aarch64_virt_defconfig                | 10 +++---
 configs/qemu_arm_nuri_defconfig                    |  4 +--
 configs/qemu_arm_versatile_defconfig               | 10 +++---
 configs/qemu_arm_vexpress_defconfig                |  8 ++---
 configs/qemu_microblazebe_mmu_defconfig            | 10 +++---
 configs/qemu_microblazeel_mmu_defconfig            | 10 +++---
 configs/qemu_mips64_malta_defconfig                | 10 +++---
 configs/qemu_mips64el_malta_defconfig              | 10 +++---
 configs/qemu_mips_malta_defconfig                  | 10 +++---
 configs/qemu_mipsel_malta_defconfig                | 10 +++---
 configs/qemu_ppc64_pseries_defconfig               |  8 ++---
 configs/qemu_ppc_g3beige_defconfig                 | 10 +++---
 configs/qemu_ppc_mpc8544ds_defconfig               | 11 ++++---
 configs/qemu_ppc_virtex_ml507_defconfig            | 10 +++---
 configs/qemu_sh4_r2d_defconfig                     | 10 +++---
 configs/qemu_sh4eb_r2d_defconfig                   | 10 +++---
 configs/qemu_sparc64_sun4u_defconfig               | 10 +++---
 configs/qemu_sparc_ss10_defconfig                  | 10 +++---
 configs/qemu_x86_64_defconfig                      | 10 +++---
 configs/qemu_x86_defconfig                         |  4 +--
 configs/qemu_xtensa_lx60_defconfig                 | 10 +++---
 60 files changed, 204 insertions(+), 122 deletions(-)
 rename board/qemu/aarch64-virt/{linux-4.2.config => linux-4.3.config} (100%)
 rename board/qemu/arm-versatile/{linux-4.2.config => linux-4.3.config} (100%)
 rename board/qemu/microblazebe-mmu/{linux-4.2.config => linux-4.3.config} (100%)
 rename board/qemu/microblazeel-mmu/{linux-4.2.config => linux-4.3.config} (100%)
 rename board/qemu/mips-malta/{linux-4.2.config => linux-4.3.config} (100%)
 rename board/qemu/mips64-malta/{linux-4.2.config => linux-4.3.config} (100%)
 rename board/qemu/mips64el-malta/{linux-4.2.config => linux-4.3.config} (100%)
 rename board/qemu/mipsel-malta/{linux-4.2.config => linux-4.3.config} (100%)
 rename board/qemu/ppc-g3beige/{linux-4.2.config => linux-4.3.config} (100%)
 create mode 100644 board/qemu/ppc-mpc8544ds/linux-4.3.config
 rename board/qemu/ppc-virtex-ml507/{linux-4.2.config => linux-4.3.config} (100%)
 rename board/qemu/sh4-r2d/{linux-4.2.config => linux-4.3.config} (100%)
 rename board/qemu/sh4eb-r2d/{linux-4.2.config => linux-4.3.config} (100%)
 rename board/qemu/sparc-ss10/{linux-4.2.config => linux-4.3.config} (100%)
 rename board/qemu/sparc64-sun4u/{linux-4.1.config => linux-4.3.config} (86%)
 create mode 100644 board/qemu/x86_64/linux-4.3.config
 create mode 100644 board/qemu/x86_64/linux-4.3.config~2c313f8e7b5a8f665e56ea1c13b7b44d95a92932
 rename board/qemu/xtensa-lx60/{linux-4.2.config => linux-4.3.config} (100%)

diff --git a/board/qemu/aarch64-virt/linux-4.2.config b/board/qemu/aarch64-virt/linux-4.3.config
similarity index 100%
rename from board/qemu/aarch64-virt/linux-4.2.config
rename to board/qemu/aarch64-virt/linux-4.3.config
diff --git a/board/qemu/aarch64-virt/readme.txt b/board/qemu/aarch64-virt/readme.txt
index 097760c..d43fe09 100644
--- a/board/qemu/aarch64-virt/readme.txt
+++ b/board/qemu/aarch64-virt/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.2.1
+Tested with QEMU 2.3.0
diff --git a/board/qemu/arm-nuri/readme.txt b/board/qemu/arm-nuri/readme.txt
index d7a6428..df07a5c 100644
--- a/board/qemu/arm-nuri/readme.txt
+++ b/board/qemu/arm-nuri/readme.txt
@@ -8,4 +8,4 @@ graphical window is the framebuffer.
 Startup time is slow because of the SMP CPU emulation so be patient.
 This emulation is known to be flaky.
 
-Tested with QEMU 2.2.1
+Tested with QEMU 2.3.0
diff --git a/board/qemu/arm-versatile/linux-4.2.config b/board/qemu/arm-versatile/linux-4.3.config
similarity index 100%
rename from board/qemu/arm-versatile/linux-4.2.config
rename to board/qemu/arm-versatile/linux-4.3.config
diff --git a/board/qemu/arm-versatile/readme.txt b/board/qemu/arm-versatile/readme.txt
index af65d05..1812994 100644
--- a/board/qemu/arm-versatile/readme.txt
+++ b/board/qemu/arm-versatile/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 2.2.1
+Tested with QEMU 2.3.0
diff --git a/board/qemu/arm-vexpress/readme.txt b/board/qemu/arm-vexpress/readme.txt
index c8f24be..a3dc6e4 100644
--- a/board/qemu/arm-vexpress/readme.txt
+++ b/board/qemu/arm-vexpress/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 2.2.1
+Tested with QEMU 2.3.0
diff --git a/board/qemu/microblazebe-mmu/linux-4.2.config b/board/qemu/microblazebe-mmu/linux-4.3.config
similarity index 100%
rename from board/qemu/microblazebe-mmu/linux-4.2.config
rename to board/qemu/microblazebe-mmu/linux-4.3.config
diff --git a/board/qemu/microblazebe-mmu/readme.txt b/board/qemu/microblazebe-mmu/readme.txt
index 9f93ab5..9ade6fb 100644
--- a/board/qemu/microblazebe-mmu/readme.txt
+++ b/board/qemu/microblazebe-mmu/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.2.1
+Tested with QEMU 2.3.0
diff --git a/board/qemu/microblazeel-mmu/linux-4.2.config b/board/qemu/microblazeel-mmu/linux-4.3.config
similarity index 100%
rename from board/qemu/microblazeel-mmu/linux-4.2.config
rename to board/qemu/microblazeel-mmu/linux-4.3.config
diff --git a/board/qemu/microblazeel-mmu/readme.txt b/board/qemu/microblazeel-mmu/readme.txt
index 230527d..005ea63 100644
--- a/board/qemu/microblazeel-mmu/readme.txt
+++ b/board/qemu/microblazeel-mmu/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.2.1
+Tested with QEMU 2.3.0
diff --git a/board/qemu/mips-malta/linux-4.2.config b/board/qemu/mips-malta/linux-4.3.config
similarity index 100%
rename from board/qemu/mips-malta/linux-4.2.config
rename to board/qemu/mips-malta/linux-4.3.config
diff --git a/board/qemu/mips-malta/readme.txt b/board/qemu/mips-malta/readme.txt
index 2c96059..96c952c 100644
--- a/board/qemu/mips-malta/readme.txt
+++ b/board/qemu/mips-malta/readme.txt
@@ -6,4 +6,4 @@ The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
 
-Tested with QEMU 2.2.1
+Tested with QEMU 2.3.0
diff --git a/board/qemu/mips64-malta/linux-4.2.config b/board/qemu/mips64-malta/linux-4.3.config
similarity index 100%
rename from board/qemu/mips64-malta/linux-4.2.config
rename to board/qemu/mips64-malta/linux-4.3.config
diff --git a/board/qemu/mips64-malta/readme.txt b/board/qemu/mips64-malta/readme.txt
index 80c9310..9aa7aa1 100644
--- a/board/qemu/mips64-malta/readme.txt
+++ b/board/qemu/mips64-malta/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 2.2.1
+Tested with QEMU 2.3.0
diff --git a/board/qemu/mips64el-malta/linux-4.2.config b/board/qemu/mips64el-malta/linux-4.3.config
similarity index 100%
rename from board/qemu/mips64el-malta/linux-4.2.config
rename to board/qemu/mips64el-malta/linux-4.3.config
diff --git a/board/qemu/mips64el-malta/readme.txt b/board/qemu/mips64el-malta/readme.txt
index 82ab883..d6da29b 100644
--- a/board/qemu/mips64el-malta/readme.txt
+++ b/board/qemu/mips64el-malta/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 2.2.1
+Tested with QEMU 2.3.0
diff --git a/board/qemu/mipsel-malta/linux-4.2.config b/board/qemu/mipsel-malta/linux-4.3.config
similarity index 100%
rename from board/qemu/mipsel-malta/linux-4.2.config
rename to board/qemu/mipsel-malta/linux-4.3.config
diff --git a/board/qemu/mipsel-malta/readme.txt b/board/qemu/mipsel-malta/readme.txt
index a77eb88..7dbb50b 100644
--- a/board/qemu/mipsel-malta/readme.txt
+++ b/board/qemu/mipsel-malta/readme.txt
@@ -6,4 +6,4 @@ The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
 
-Tested with QEMU 2.2.1
+Tested with QEMU 2.3.0
diff --git a/board/qemu/ppc-g3beige/linux-4.2.config b/board/qemu/ppc-g3beige/linux-4.3.config
similarity index 100%
rename from board/qemu/ppc-g3beige/linux-4.2.config
rename to board/qemu/ppc-g3beige/linux-4.3.config
diff --git a/board/qemu/ppc-g3beige/readme.txt b/board/qemu/ppc-g3beige/readme.txt
index cd358b3..fd19b68 100644
--- a/board/qemu/ppc-g3beige/readme.txt
+++ b/board/qemu/ppc-g3beige/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 2.2.1
+Tested with QEMU 2.3.0
diff --git a/board/qemu/ppc-mpc8544ds/linux-4.3.config b/board/qemu/ppc-mpc8544ds/linux-4.3.config
new file mode 100644
index 0000000..b36847c
--- /dev/null
+++ b/board/qemu/ppc-mpc8544ds/linux-4.3.config
@@ -0,0 +1,38 @@
+CONFIG_PPC_85xx=y
+CONFIG_PHYS_64BIT=y
+CONFIG_SYSVIPC=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE="${BR_BINARIES_DIR}/rootfs.cpio"
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MPC8540_ADS=y
+CONFIG_MPC85xx_DS=y
+CONFIG_HIGHMEM=y
+CONFIG_MATH_EMULATION=y
+CONFIG_PCI=y
+CONFIG_PCIEPORTBUS=y
+CONFIG_PCI_MSI=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_NETDEVICES=y
+CONFIG_E1000=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=6
+CONFIG_SERIAL_8250_RUNTIME_UARTS=6
+CONFIG_SERIAL_8250_MANY_PORTS=y
+CONFIG_SERIAL_8250_DETECT_IRQ=y
+CONFIG_SERIAL_8250_RSA=y
+CONFIG_USB=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_FSL=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_TMPFS=y
diff --git a/board/qemu/ppc-mpc8544ds/readme.txt b/board/qemu/ppc-mpc8544ds/readme.txt
index 8a3374f..0ade52c 100644
--- a/board/qemu/ppc-mpc8544ds/readme.txt
+++ b/board/qemu/ppc-mpc8544ds/readme.txt
@@ -4,5 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.0.2
-QEMU 2.1.x and 2.2.x are known broken.
+Tested with QEMU 2.3.0
diff --git a/board/qemu/ppc-virtex-ml507/linux-4.2.config b/board/qemu/ppc-virtex-ml507/linux-4.3.config
similarity index 100%
rename from board/qemu/ppc-virtex-ml507/linux-4.2.config
rename to board/qemu/ppc-virtex-ml507/linux-4.3.config
diff --git a/board/qemu/ppc-virtex-ml507/readme.txt b/board/qemu/ppc-virtex-ml507/readme.txt
index 0cf1f9d..a25ed48 100644
--- a/board/qemu/ppc-virtex-ml507/readme.txt
+++ b/board/qemu/ppc-virtex-ml507/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.2.1
+Tested with QEMU 2.3.0
diff --git a/board/qemu/ppc64-pseries/readme.txt b/board/qemu/ppc64-pseries/readme.txt
index 718da6f..0dd1682 100644
--- a/board/qemu/ppc64-pseries/readme.txt
+++ b/board/qemu/ppc64-pseries/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.2.1
+Tested with QEMU 2.3.0
diff --git a/board/qemu/sh4-r2d/linux-4.2.config b/board/qemu/sh4-r2d/linux-4.3.config
similarity index 100%
rename from board/qemu/sh4-r2d/linux-4.2.config
rename to board/qemu/sh4-r2d/linux-4.3.config
diff --git a/board/qemu/sh4-r2d/readme.txt b/board/qemu/sh4-r2d/readme.txt
index b7476b9..d877bbf 100644
--- a/board/qemu/sh4-r2d/readme.txt
+++ b/board/qemu/sh4-r2d/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
 
-Tested with QEMU 2.2.1
+Tested with QEMU 2.3.0
diff --git a/board/qemu/sh4eb-r2d/linux-4.2.config b/board/qemu/sh4eb-r2d/linux-4.3.config
similarity index 100%
rename from board/qemu/sh4eb-r2d/linux-4.2.config
rename to board/qemu/sh4eb-r2d/linux-4.3.config
diff --git a/board/qemu/sh4eb-r2d/readme.txt b/board/qemu/sh4eb-r2d/readme.txt
index 23198ba..7f5eec4 100644
--- a/board/qemu/sh4eb-r2d/readme.txt
+++ b/board/qemu/sh4eb-r2d/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
 
-Tested with QEMU 2.4.0.1
+Tested with QEMU 2.3.0
diff --git a/board/qemu/sparc-ss10/linux-4.2.config b/board/qemu/sparc-ss10/linux-4.3.config
similarity index 100%
rename from board/qemu/sparc-ss10/linux-4.2.config
rename to board/qemu/sparc-ss10/linux-4.3.config
diff --git a/board/qemu/sparc-ss10/readme.txt b/board/qemu/sparc-ss10/readme.txt
index 1972a11..1e27380 100644
--- a/board/qemu/sparc-ss10/readme.txt
+++ b/board/qemu/sparc-ss10/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.2.1
+Tested with QEMU 2.3.0
diff --git a/board/qemu/sparc64-sun4u/linux-4.1.config b/board/qemu/sparc64-sun4u/linux-4.3.config
similarity index 86%
rename from board/qemu/sparc64-sun4u/linux-4.1.config
rename to board/qemu/sparc64-sun4u/linux-4.3.config
index 2b282f9..7eda705 100644
--- a/board/qemu/sparc64-sun4u/linux-4.1.config
+++ b/board/qemu/sparc64-sun4u/linux-4.3.config
@@ -1,4 +1,3 @@
-# CONFIG_SWAP is not set
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 CONFIG_NO_HZ_IDLE=y
@@ -16,11 +15,10 @@ CONFIG_BLK_DEV_SD=y
 CONFIG_ATA=y
 CONFIG_PATA_CMD64X=y
 CONFIG_NETDEVICES=y
-CONFIG_NE2K_PCI=y
+CONFIG_E1000_PCI=y
 CONFIG_SERIAL_SUNSU=y
 CONFIG_SERIAL_SUNSU_CONSOLE=y
 CONFIG_EXT4_FS=y
-CONFIG_EXT4_USE_FOR_EXT23=y 
 CONFIG_TMPFS=y
 CONFIG_NLS=y
 CONFIG_NLS_DEFAULT="utf-8"
diff --git a/board/qemu/sparc64-sun4u/readme.txt b/board/qemu/sparc64-sun4u/readme.txt
index 90d1edc..9b37394 100644
--- a/board/qemu/sparc64-sun4u/readme.txt
+++ b/board/qemu/sparc64-sun4u/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-sparc64 -M sun4u -kernel output/images/vmlinux -append "root=/dev/sda console=ttyS0,115200" -serial stdio output/images/rootfs.ext2
+  qemu-system-sparc64 -M sun4u -kernel output/images/vmlinux -append "root=/dev/sda console=ttyS0,115200" -serial stdio output/images/rootfs.ext2 -net nic,model=e1000 -net user
 
 The login prompt will appear in the terminal that started Qemu.
 
diff --git a/board/qemu/x86/readme.txt b/board/qemu/x86/readme.txt
index 85d5c60..daf62f4 100644
--- a/board/qemu/x86/readme.txt
+++ b/board/qemu/x86/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the graphical window.
 
-Tested with QEMU 2.2.1
+Tested with QEMU 2.3.0
diff --git a/board/qemu/x86_64/linux-4.3.config b/board/qemu/x86_64/linux-4.3.config
new file mode 100644
index 0000000..20726c3
--- /dev/null
+++ b/board/qemu/x86_64/linux-4.3.config
@@ -0,0 +1,23 @@
+CONFIG_SYSVIPC=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
+CONFIG_NETDEVICES=y
+CONFIG_NE2K_PCI=y
+CONFIG_8139CP=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_HDA_INTEL=y
+CONFIG_SND_HDA_GENERIC=y
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_DRM=y
+CONFIG_DRM_QXL=y
diff --git a/board/qemu/x86_64/linux-4.3.config~2c313f8e7b5a8f665e56ea1c13b7b44d95a92932 b/board/qemu/x86_64/linux-4.3.config~2c313f8e7b5a8f665e56ea1c13b7b44d95a92932
new file mode 100644
index 0000000..20726c3
--- /dev/null
+++ b/board/qemu/x86_64/linux-4.3.config~2c313f8e7b5a8f665e56ea1c13b7b44d95a92932
@@ -0,0 +1,23 @@
+CONFIG_SYSVIPC=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
+CONFIG_NETDEVICES=y
+CONFIG_NE2K_PCI=y
+CONFIG_8139CP=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_HDA_INTEL=y
+CONFIG_SND_HDA_GENERIC=y
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_DRM=y
+CONFIG_DRM_QXL=y
diff --git a/board/qemu/x86_64/readme.txt b/board/qemu/x86_64/readme.txt
index d397a79..cfd52ee 100644
--- a/board/qemu/x86_64/readme.txt
+++ b/board/qemu/x86_64/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the graphical window.
 
-Tested with QEMU 2.2.1
+Tested with QEMU 2.3.0
diff --git a/board/qemu/xtensa-lx60/linux-4.2.config b/board/qemu/xtensa-lx60/linux-4.3.config
similarity index 100%
rename from board/qemu/xtensa-lx60/linux-4.2.config
rename to board/qemu/xtensa-lx60/linux-4.3.config
diff --git a/board/qemu/xtensa-lx60/readme.txt b/board/qemu/xtensa-lx60/readme.txt
index 2dad34a..04393ea 100644
--- a/board/qemu/xtensa-lx60/readme.txt
+++ b/board/qemu/xtensa-lx60/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.2.1
+Tested with QEMU 2.3.0
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index 23bd9b2..c39fd81 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -8,14 +8,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 4.2 headers to avoid breaking with newer kernels
+# Lock to 4.3 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.2"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
+BR2_DEFAULT_KERNEL_VERSION="4.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-4.2.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-4.3.config"
diff --git a/configs/qemu_arm_nuri_defconfig b/configs/qemu_arm_nuri_defconfig
index dad8638..d2e522f 100644
--- a/configs/qemu_arm_nuri_defconfig
+++ b/configs/qemu_arm_nuri_defconfig
@@ -16,12 +16,12 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 # Lock to 3.10 headers to avoid breaking with newer kernels
 # Stuck at 3.10.x because there's no Nuri DTS
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.87"
+BR2_DEFAULT_KERNEL_VERSION="3.10.92"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.87"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.92"
 BR2_LINUX_KERNEL_DEFCONFIG="exynos4"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 9a69c49..1ce55d0 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -10,15 +10,15 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.2 headers to avoid breaking with newer kernels
+# Lock to 4.3 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.2"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
+BR2_DEFAULT_KERNEL_VERSION="4.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.2.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.3.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index 135812a..b036c6b 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -13,15 +13,15 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.2 headers to avoid breaking with newer kernels
+# Lock to 4.3 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.2"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
+BR2_DEFAULT_KERNEL_VERSION="4.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index f623f6c..5730e4c 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -9,16 +9,16 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 4.2 headers to avoid breaking with newer kernels
+# Lock to 4.3 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.2"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
+BR2_DEFAULT_KERNEL_VERSION="4.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-4.2.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-4.3.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazebe-mmu/xilinx-xemaclite.patch"
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 151e2f1..8f95c82 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -9,16 +9,16 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 4.2 headers to avoid breaking with newer kernels
+# Lock to 4.3 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.2"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
+BR2_DEFAULT_KERNEL_VERSION="4.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-4.2.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-4.3.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazeel-mmu/xilinx-xemaclite.patch"
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index 2a2e576..94dfb54 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -6,17 +6,17 @@ BR2_MIPS_NABI64=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.2 headers to avoid breaking with newer kernels
+# Lock to 4.3 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.2"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
+BR2_DEFAULT_KERNEL_VERSION="4.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-4.2.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-4.3.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index d5f9cc9..88828fe 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -6,17 +6,17 @@ BR2_MIPS_NABI64=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.2 headers to avoid breaking with newer kernels
+# Lock to 4.3 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.2"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
+BR2_DEFAULT_KERNEL_VERSION="4.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux-4.2.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux-4.3.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
index ffd2cbc..e6f6a95 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_malta_defconfig
@@ -6,17 +6,17 @@ BR2_mips_32r2=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.2 headers to avoid breaking with newer kernels
+# Lock to 4.3 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.2"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
+BR2_DEFAULT_KERNEL_VERSION="4.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-4.2.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-4.3.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index fb6af73..b14e70c 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -6,17 +6,17 @@ BR2_mips_32r2=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.2 headers to avoid breaking with newer kernels
+# Lock to 4.3 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.2"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
+BR2_DEFAULT_KERNEL_VERSION="4.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-4.2.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-4.3.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
index b337b48..97e53b4 100644
--- a/configs/qemu_ppc64_pseries_defconfig
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.2 headers to avoid breaking with newer kernels
+# Lock to 4.3 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.2"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
+BR2_DEFAULT_KERNEL_VERSION="4.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index 538decb..ae2ddcc 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -6,17 +6,17 @@ BR2_powerpc_750=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.2 headers to avoid breaking with newer kernels
+# Lock to 4.3 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.2"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
+BR2_DEFAULT_KERNEL_VERSION="4.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux-4.2.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux-4.3.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index d6b8786..198f5cd 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -6,16 +6,17 @@ BR2_powerpc_8548=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 4.2 headers to avoid breaking with newer kernels
+# Lock to 4.3 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.2"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
+BR2_DEFAULT_KERNEL_VERSION="4.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
-BR2_LINUX_KERNEL_DEFCONFIG="mpc85xx"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux-4.3.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index d82c2dd..71f1492 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -6,10 +6,10 @@ BR2_powerpc_440=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 4.2 headers to avoid breaking with newer kernels
+# Lock to 4.3 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.2"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
+BR2_DEFAULT_KERNEL_VERSION="4.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Use soft float
 BR2_SOFT_FLOAT=y
@@ -17,9 +17,9 @@ BR2_SOFT_FLOAT=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-virtex-ml507/linux-4.2.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-virtex-ml507/linux-4.3.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="virtex440-ml507"
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index 951a9a7..0666ed4 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -10,15 +10,15 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.2 headers to avoid breaking with newer kernels
+# Lock to 4.3 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.2"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
+BR2_DEFAULT_KERNEL_VERSION="4.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-4.2.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-4.3.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
index 4e6ea97..6680ee3 100644
--- a/configs/qemu_sh4eb_r2d_defconfig
+++ b/configs/qemu_sh4eb_r2d_defconfig
@@ -10,15 +10,15 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.2 headers to avoid breaking with newer kernels
+# Lock to 4.3 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.2.3"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
+BR2_DEFAULT_KERNEL_VERSION="4.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux-4.2.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux-4.3.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
index 0bb4b3e..828b437 100644
--- a/configs/qemu_sparc64_sun4u_defconfig
+++ b/configs/qemu_sparc64_sun4u_defconfig
@@ -6,14 +6,14 @@ BR2_sparc_v9=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.1 headers to avoid breaking with newer kernels
+# Lock to 4.3 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.1"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_DEFAULT_KERNEL_VERSION="4.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux-4.1.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux-4.3.config"
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index aa063ca..3e6d7b1 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -8,15 +8,15 @@ BR2_GLOBAL_PATCH_DIR="board/qemu/sparc-ss10"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.2 headers to avoid breaking with newer kernels
+# Lock to 4.3 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.2"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
+BR2_DEFAULT_KERNEL_VERSION="4.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux-4.2.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux-4.3.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index cf877ae..daf32cd 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -9,14 +9,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.2 headers to avoid breaking with newer kernels
+# Lock to 4.3 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.2"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
+BR2_DEFAULT_KERNEL_VERSION="4.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.2.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.3.config"
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 4491672..f2e2022 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -12,12 +12,12 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 4.2 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.2"
+BR2_DEFAULT_KERNEL_VERSION="4.2.6"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-4.2.config"
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index 5c803da..526a111 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -14,17 +14,17 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 4.2 headers to avoid breaking with newer kernels
+# Lock to 4.3 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.2"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
+BR2_DEFAULT_KERNEL_VERSION="4.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.2.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.3.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_NAME="Image.elf"
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
-- 
2.4.10
