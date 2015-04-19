From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 11:03:26 +0200
Subject: [Buildroot] [PATCH v4 1/1] Added linux drivers backports project
In-Reply-To: <1429311670-7831-1-git-send-email-petr.vorel@gmail.com>
References: <1429311670-7831-1-git-send-email-petr.vorel@gmail.com>
Message-ID: <20150419110326.31c34542@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Petr Vorel,

On Sat, 18 Apr 2015 01:01:10 +0200, Petr Vorel wrote:
> https://backports.wiki.kernel.org
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

I wanted to apply your patch, and did a couple of updates to it (see
below). However, there's a more fundamental problem to this package: it
expects the linux package to be extracted/configured *before* the
configuration of linux-backports. Unfortunately, this is not the case:
'linux' is only in LINUX_BACKPORTS_DEPENDENCIES, so it's only
guaranteed to be here when linux-backports gets configured, not before.

So, when you run 'make linux-backports-menuconfig' from a clean
Buildroot tree (i.e without doing a full 'make'), you get:

thomas at skate:~/projets/buildroot (master)$ make linux-backports-menuconfig
yes "" |  /usr/bin/make -j5 -C /home/thomas/projets/buildroot/output/build/linux-backports-3.18.1-1 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm INSTALL_MOD_PATH=/home/thomas/projets/buildroot/output/target CROSS_COMPILE=" /home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-" DEPMOD=/home/thomas/projets/buildroot/output/host/sbin/depmod KLIB_BUILD=/home/thomas/projets/buildroot/output/build/linux-4.0 KLIB=/home/thomas/projets/buildroot/output/target oldconfig
make[1]: Entering directory '/home/thomas/projets/buildroot/output/build/linux-backports-3.18.1-1'
/--------------
| Your kernel headers are incomplete/not installed.
| Please install kernel headers, including a .config
| file or use the KLIB/KLIB_BUILD make variables to
| set the kernel to build against, e.g.
|   make KLIB=/lib/modules/3.1.7/
| to compile/install for the installed kernel 3.1.7
| (that isn't currently running.)
\--
Makefile:40: recipe for target 'oldconfig' failed
make[1]: *** [oldconfig] Error 1
make[1]: Leaving directory '/home/thomas/projets/buildroot/output/build/linux-backports-3.18.1-1'
package/linux-backports/linux-backports.mk:38: recipe for target '/home/thomas/projets/buildroot/output/build/linux-backports-3.18.1-1/.stamp_kconfig_fixup_done' failed
make: *** [/home/thomas/projets/buildroot/output/build/linux-backports-3.18.1-1/.stamp_kconfig_fixup_done] Error 2

This is because output/build/linux-4.0 is currently empty, since the
linux package has not been extracted yet.

I'm not sure yet of the possible solutions to this: add 'linux' to
LINUX_BACKPORT_PATCH_DEPENDENCIES ? Use the linux extension mechanism
as suggested by Arnout ?

As promised, here are the updates I did to your patch, please integrate
them:

diff --git a/package/linux-backports/Config.in b/package/linux-backports/Config.in
index 3e4e383..7853ba6 100644
--- a/package/linux-backports/Config.in
+++ b/package/linux-backports/Config.in
@@ -1,5 +1,8 @@
+comment "linux-backports needs a Linux kernel to be built"
+       depends on !BR2_LINUX_KERNEL
+
 config BR2_PACKAGE_LINUX_BACKPORTS
-       bool "Linux kernel driver backports"
+       bool "linux-backports"
        depends on BR2_LINUX_KERNEL
        help
          The backports package includes many Linux drivers from recent
diff --git a/package/linux-backports/linux-backports.mk b/package/linux-backports/linux-backports.mk
index 47cb206..73179a6 100644
--- a/package/linux-backports/linux-backports.mk
+++ b/package/linux-backports/linux-backports.mk
@@ -1,10 +1,16 @@
-LINUX_BACKPORTS_VERSION  = 3.18.1
-LINUX_BACKPORTS_REVISION = 1
-LINUX_BACKPORTS_SOURCE   = backports-$(LINUX_BACKPORTS_VERSION)-$(LINUX_BACKPORTS_REVISION).tar.xz
-LINUX_BACKPORTS_SITE     = $(BR2_KERNEL_MIRROR)/linux/kernel/projects/backports/stable/v$(LINUX_BACKPORTS_VERSION)
+################################################################################
+#
+# linux-backports
+#
+################################################################################
+
+LINUX_BACKPORTS_VERSION_MAJOR = 3.18.1
+LINUX_BACKPORTS_VERSION = $(LINUX_BACKPORTS_VERSION_MAJOR)-1
+LINUX_BACKPORTS_SOURCE = backports-$(LINUX_BACKPORTS_VERSION).tar.xz
+LINUX_BACKPORTS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/projects/backports/stable/v$(LINUX_BACKPORTS_VERSION_MAJOR)
 LINUX_BACKPORTS_DEPENDENCIES = linux
 
-LINUX_BACKPORTS_MAKE_ENV = \
+LINUX_BACKPORTS_MAKE_OPTS = \
        $(LINUX_MAKE_FLAGS) \
        KLIB_BUILD=$(LINUX_DIR) \
        KLIB=$(TARGET_DIR)
@@ -16,11 +22,11 @@ LINUX_BACKPORTS_KCONFIG_FILE = $(BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE)
 endif
 
 define LINUX_BACKPORTS_BUILD_CMDS
-       $(LINUX_BACKPORTS_MAKE_ENV) $(MAKE) $(LINUX_BACKPORTS_MAKE_OPTS) -C $(@D)
+       $(TARGET_MAKE_ENV) $(MAKE) $(LINUX_BACKPORTS_MAKE_OPTS) -C $(@D)
 endef
 
 define LINUX_BACKPORTS_INSTALL_TARGET_CMDS
-       $(LINUX_BACKPORTS_MAKE_ENV) $(MAKE) $(LINUX_BACKPORTS_MAKE_OPTS) \
+       $(TARGET_MAKE_ENV) $(MAKE) $(LINUX_BACKPORTS_MAKE_OPTS) \
                -C $(LINUX_DIR) M=$(@D) \
                INSTALL_MOD_DIR=backports \
                modules_install
@@ -35,13 +41,13 @@ $(eval $(kconfig-package))
 ifeq ($(filter source,$(MAKECMDGOALS)),)
 ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG),y)
 ifeq ($(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG)),)
-$(error No kernel defconfig name specified, check your BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG setting)
+$(error No linux-backports defconfig name specified, check your BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG setting)
 endif
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG),y)
 ifeq ($(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE)),)
-$(error No kernel configuration file specified, check your BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE setting)
+$(error No linux-backports configuration file specified, check your BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE setting)
 endif
 endif


Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
