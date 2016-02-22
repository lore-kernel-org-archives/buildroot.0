From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 22 Feb 2016 08:40:44 -0300
Subject: [Buildroot] [PATCH] linux: don't add to toolchain dependency
Message-ID: <1456141244-624-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In 63abfb72 the option was added to use the same linux headers
source/version as the kernel.
If the kernel isn't removed from toolchain dependencies then it gets
added at two points resulting in a circular dependency, example:

$ make qemu_aarch64_virt_defconfig && make source
...
mpfr-3.1.3.tar.xz: OK (sha256:
6835a08bd992c8257641791e9a6a2b35b02336c8de26d0a8577953747e514a16)
WARNING: no hash file for linux-4.4.1.tar.xz
kmod-22.tar.xz: OK (sha256:
ba3b1ddea33228b473189fcb05b809024a3b86e9a7cf37d420cae06beb749f82)
pkgconf-0.9.12.tar.bz2: OK (sha256:
7ec8b516e655e247f4ba976837cee808134785819ab8f538f652fe919cc6c09f)
make: Circular toolchain-all-source <- toolchain-buildroot-all-source
dependency dropped.
busybox-1.24.1.tar.bz2: OK (md5: be98a40cadf84ce2d6b05fa41a275c6a)
...

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 linux/linux.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7e20255..dc1c79e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -8,6 +8,9 @@ LINUX_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 LINUX_LICENSE = GPLv2
 LINUX_LICENSE_FILES = COPYING
 
+# Used when BR2_KERNEL_HEADERS_AS_KERNEL=y
+LINUX_ADD_TOOLCHAIN_DEPENDENCY = NO
+
 # Compute LINUX_SOURCE and LINUX_SITE from the configuration
 ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
 LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
-- 
2.4.10
