From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Aug 2015 14:27:43 +0200
Subject: [Buildroot] [PATCH 3/3] packages: ensure linux supports modules
	even when not using kernel-module
In-Reply-To: <cover.1440418870.git.yann.morin.1998@free.fr>
References: <cover.1440418870.git.yann.morin.1998@free.fr>
Message-ID: <2af986ecd146d1dc6e7603bd93fac5420c459e41.1440418870.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages build kernel modules without using the kernel-module infra
(because they use custom build systems); they do not automatically get
the kernel to support modules which is ensured when using the infra.

It must be done manually for all those packages.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: No? Rubinstein <nrubinstein@aldebaran.com>
Cc: Jan Viktorin <viktorin@rehivetech.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-fusion/linux-fusion.mk     | 9 ++++++---
 package/nvidia-driver/nvidia-driver.mk   | 4 ++++
 package/racehound/racehound.mk           | 4 ++++
 package/rtai/rtai.mk                     | 4 ++++
 package/ti-gfx/ti-gfx.mk                 | 5 +++++
 package/xtables-addons/xtables-addons.mk | 4 ++++
 6 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index 001388c..142f1d6 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -11,17 +11,20 @@ LINUX_FUSION_DEPENDENCIES = linux
 LINUX_FUSION_LICENSE = GPLv2+
 LINUX_FUSION_LICENSE_FILES = debian/copyright
 
-LINUX_FOR_FUSION = $(LINUX_VERSION_PROBED)
 LINUX_FUSION_ETC_DIR = $(TARGET_DIR)/etc/udev/rules.d
 
-LINUX_FUSION_MAKE_OPTS = KERNEL_VERSION=$(LINUX_FOR_FUSION)
+# We're building a kernel module without using the kernel-module infra,
+# so we need to tell we want module support in the kernel:
+LINUX_NEEDS_MODULES = y
+
+LINUX_FUSION_MAKE_OPTS = KERNEL_VERSION=$(LINUX_VERSION_PROBED)
 LINUX_FUSION_MAKE_OPTS += KERNEL_BUILD=$(LINUX_DIR)
 LINUX_FUSION_MAKE_OPTS += KERNEL_SOURCE=$(LINUX_DIR)
 
 LINUX_FUSION_MAKE_OPTS += SYSROOT=$(TARGET_DIR)
 LINUX_FUSION_MAKE_OPTS += ARCH=$(KERNEL_ARCH)
 LINUX_FUSION_MAKE_OPTS += CROSS_COMPILE=$(TARGET_CROSS)
-LINUX_FUSION_MAKE_OPTS += KERNEL_MODLIB=/lib/modules/$(LINUX_FOR_FUSION)/kernel
+LINUX_FUSION_MAKE_OPTS += KERNEL_MODLIB=/lib/modules/$(LINUX_VERSION_PROBED)/kernel
 
 define LINUX_FUSION_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(LINUX_FUSION_MAKE_OPTS) -C $(@D)
diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index 71babfb..373794a 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -91,6 +91,10 @@ ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_MODULE),y)
 
 NVIDIA_DRIVER_DEPENDENCIES += linux
 
+# We're building a kernel module without using the kernel-module infra,
+# so we need to tell we want module support in the kernel:
+LINUX_NEEDS_MODULES = y
+
 # NVidia uses the legacy naming scheme for the x86 architecture, when i386
 # and x86_64 were still considered two separate architectures in the Linux
 # kernel.
diff --git a/package/racehound/racehound.mk b/package/racehound/racehound.mk
index 7d8d1e3..982096d 100644
--- a/package/racehound/racehound.mk
+++ b/package/racehound/racehound.mk
@@ -12,6 +12,10 @@ RACEHOUND_SUPPORTS_IN_SOURCE_BUILD = NO
 
 RACEHOUND_DEPENDENCIES = elfutils linux
 
+# We're building a kernel module without using the kernel-module infra,
+# so we need to tell we want module support in the kernel:
+LINUX_NEEDS_MODULES = y
+
 # override auto detection (uses host parameters, not cross compile
 # ready)
 RACEHOUND_CONF_OPTS += \
diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
index dfd8e0c..5a96aea 100644
--- a/package/rtai/rtai.mk
+++ b/package/rtai/rtai.mk
@@ -18,6 +18,10 @@ RTAI_POST_INSTALL_STAGING_HOOKS += RTAI_POST_PATCH_FIXUP
 
 RTAI_DEPENDENCIES = linux
 
+# We're building a kernel module without using the kernel-module infra,
+# so we need to tell we want module support in the kernel:
+LINUX_NEEDS_MODULES = y
+
 RTAI_CONF_OPTS = \
 	--includedir=/usr/include/rtai \
 	--with-linux-dir=$(LINUX_DIR) 	\
diff --git a/package/ti-gfx/ti-gfx.mk b/package/ti-gfx/ti-gfx.mk
index 5339387..0abc824 100644
--- a/package/ti-gfx/ti-gfx.mk
+++ b/package/ti-gfx/ti-gfx.mk
@@ -21,6 +21,11 @@ TI_GFX_LICENSE_FILES = TSPA.txt
 TI_GFX_INSTALL_STAGING = YES
 
 TI_GFX_DEPENDENCIES = linux
+
+# We're building a kernel module without using the kernel-module infra,
+# so we need to tell we want module support in the kernel:
+LINUX_NEEDS_MODULES = y
+
 TI_GFX_PROVIDES = libegl libgles powervr
 
 ifeq ($(BR2_PACKAGE_TI_GFX_ES3),y)
diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index 75e2a5a..e3b7535 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -16,6 +16,10 @@ XTABLES_ADDONS_CONF_OPTS = \
 	--with-xtables="$(STAGING_DIR)/usr" \
 	--with-xtlibdir="/usr/lib/xtables"
 
+# We're building a kernel module without using the kernel-module infra,
+# so we need to tell we want module support in the kernel:
+LINUX_NEEDS_MODULES = y
+
 # geoip helpers need perl with modules and unzip so disable
 define XTABLES_DISABLE_GEOIP_HELPERS
 	$(SED) 's/ geoip//' $(@D)/Makefile.in
-- 
1.9.1
