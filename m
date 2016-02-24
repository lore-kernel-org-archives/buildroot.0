From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Feb 2016 15:04:09 +0100
Subject: [Buildroot] [PATCH] linux: don't add to toolchain dependency
In-Reply-To: <56CDA9DE.4000900@zacarias.com.ar>
References: <1456141244-624-1-git-send-email-gustavo@zacarias.com.ar>
 <20160222131901.3baa956e@free-electrons.com>
 <56CCF17D.2030508@mind.be> <56CDA9DE.4000900@zacarias.com.ar>
Message-ID: <20160224150409.0113e34c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 24 Feb 2016 10:02:22 -0300, Gustavo Zacarias wrote:

> It's not only -source, any dependency-using routines are affected, 
> legal-info, graph-depends as well as long as you build a kernel.
> In fact graph-depends is broken:
> 
> $ make graph-depends
> Getting targets
> Getting dependencies for ['toolchain-buildroot', 'toolchain', 'busybox', 
> 'glibc', 'initscripts', 'linux-headers', 'skeleton', 'linux', 
> 'host-fakeroot', 'host-makedevs', 'rootfs-cpio', 'rootfs-initramfs']
> Getting dependencies for ['host-kmod', 'host-gcc-final', 
> 'host-gcc-initial', 'host-gawk']
> Getting dependencies for ['host-gmp', 'host-binutils', 'host-pkgconf', 
> 'host-mpfr', 'host-mpc']
> Getting dependencies for ['host-m4']
> 
> Recursion detected for  : toolchain
> which is a dependency of: linux
> which is a dependency of: linux-headers
> which is a dependency of: glibc
> which is a dependency of: host-gcc-final
> which is a dependency of: toolchain-buildroot
> which is a dependency of: toolchain
> Makefile:721: recipe for target 'graph-depends' failed
> make: *** [graph-depends] Error 1
> 
> So it's not as innocent as you think.

I agree. In the end, I believe the mistake is to have linux-headers
depends on linux.

I continue to believe that it's much easier to duplicate in
linux-headers the 10-20 lines of linux.mk logic that infer the
_SOURCE/_SITE/_VERSION from the BR2_LINUX_KERNEL_* variables.

Yes, it means we will extract the kernel sources twice, but when you're
building an internal toolchain, this is really negligible.

And this way, we break the dependency from linux-headers on linux, and
the problem is solved.

Something along the lines of (quickly tested) of the following patch.
Yes, we duplicate logic, but we don't change this logic every day, so
maybe it's acceptable.

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 6339280..ad31e55 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -9,14 +9,63 @@
 
 ifeq ($(BR2_KERNEL_HEADERS_AS_KERNEL),y)
 
-LINUX_HEADERS_VERSION = none
-LINUX_HEADERS_SOURCE =
+LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
+
+# Compute LINUX_SOURCE and LINUX_SITE from the configuration
+ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
+LINUX_HEADERS_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
+LINUX_HEADERS_SITE = $(patsubst %/,%,$(dir $(LINUX_HEADERS_TARBALL)))
+LINUX_HEADERS_SOURCE = $(notdir $(LINUX_HEADERS_TARBALL))
+BR_NO_CHECK_HASH_FOR += $(LINUX_HEADERS_SOURCE)
+else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_LOCAL),y)
+LINUX_HEADERS_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH))
+LINUX_HEADERS_SITE_METHOD = local
+else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
+LINUX_HEADERS_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
+LINUX_HEADERS_SITE_METHOD = git
+else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_HG),y)
+LINUX_HEADERS_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
+LINUX_HEADERS_SITE_METHOD = hg
+else
+LINUX_HEADERS_SOURCE = linux-$(LINUX_VERSION).tar.xz
+ifeq ($(BR2_LINUX_KERNEL_CUSTOM_VERSION),y)
+BR_NO_CHECK_HASH_FOR += $(LINUX_HEADERS_SOURCE)
+endif
+# In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
+# to use the $(word) function. We support versions such as 4.0, 3.1,
+# 2.6.32, 2.6.32-rc1, 3.0-rc6, etc.
+ifeq ($(findstring x2.6.,x$(LINUX_HEADERS_VERSION)),x2.6.)
+LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6
+else ifeq ($(findstring x3.,x$(LINUX_HEADERS_VERSION)),x3.)
+LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x
+else ifeq ($(findstring x4.,x$(LINUX_HEADERS_VERSION)),x4.)
+LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v4.x
+endif
+# release candidates are in testing/ subdir
+ifneq ($(findstring -rc,$(LINUX_HEADERS_VERSION)),)
+LINUX_HEADERS_SITE := $(LINUX_HEADERS_SITE)/testing
+endif # -rc
+endif
 
-LINUX_HEADERS_LICENSE = $(LINUX_LICENSE)
-LINUX_HEADERS_LICENSE_FILES = $(LINUX_LICENSE_FILES)
+LINUX_HEADERS_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
+
+# We rely on the generic package infrastructure to download and apply
+# remote patches (downloaded from ftp, http or https). For local
+# patches, we can't rely on that infrastructure, because there might
+# be directories in the patch list (unlike for other packages).
+LINUX_HEADERS_PATCH = $(filter ftp://% http://% https://%,$(LINUX_HEADERS_PATCHES))
+
+define LINUX_HEADERS_APPLY_LOCAL_PATCHES
+	for p in $(filter-out ftp://% http://% https://%,$(LINUX_HEADERS_PATCHES)) ; do \
+		if test -d $$p ; then \
+			$(APPLY_PATCHES) $(@D) $$p \*.patch || exit 1 ; \
+		else \
+			$(APPLY_PATCHES) $(@D) `dirname $$p` `basename $$p` || exit 1; \
+		fi \
+	done
+endef
 
-LINUX_HEADERS_PATCH_DEPENDENCIES = linux
-LINUX_HEADERS_REAL_DIR = $(LINUX_DIR)
+LINUX_HEADERS_POST_PATCH_HOOKS += LINUX_HEADERS_APPLY_LOCAL_PATCHES
 
 else # ! BR2_KERNEL_HEADERS_AS_KERNEL
 
@@ -30,13 +79,11 @@ LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v4.x
 endif
 LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.xz
 
+endif # ! BR2_KERNEL_HEADERS_AS_KERNEL
+
 LINUX_HEADERS_LICENSE = GPLv2
 LINUX_HEADERS_LICENSE_FILES = COPYING
 
-LINUX_HEADERS_REAL_DIR = $(@D)
-
-endif # ! BR2_KERNEL_HEADERS_AS_KERNEL
-
 LINUX_HEADERS_INSTALL_STAGING = YES
 
 # linux-headers is part of the toolchain so disable the toolchain dependency
@@ -53,7 +100,7 @@ LINUX_HEADERS_ADD_TOOLCHAIN_DEPENDENCY = NO
 # uClibc building. This way uClibc doesn't modify linux headers on installation
 # of "its" headers
 define LINUX_HEADERS_CONFIGURE_CMDS
-	(cd $(LINUX_HEADERS_REAL_DIR); \
+	(cd $(@D); \
 		$(TARGET_MAKE_ENV) $(MAKE) \
 			ARCH=$(KERNEL_ARCH) \
 			HOSTCC="$(HOSTCC)" \
@@ -64,7 +111,7 @@ define LINUX_HEADERS_CONFIGURE_CMDS
 endef
 
 define LINUX_HEADERS_INSTALL_STAGING_CMDS
-	(cd $(LINUX_HEADERS_REAL_DIR); \
+	(cd $(@D); \
 		$(TARGET_MAKE_ENV) $(MAKE) \
 			ARCH=$(KERNEL_ARCH) \
 			HOSTCC="$(HOSTCC)" \


Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
