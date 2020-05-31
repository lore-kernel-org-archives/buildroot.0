From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 May 2020 22:51:20 +0200
Subject: [Buildroot] [git commit] package/linux-headers: add support for CIP
 kernel versions with same-as-kernel
Message-ID: <20200531205245.DBC1285F0D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d25a5724c02a79049b9cf17a24c5f5c0ff010b2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the linux-headers are configured to use the same source as the
kernel (BR2_KERNEL_HEADERS_AS_KERNEL), and the kernel is configured
to be one of the two CIP versions (BR2_LINUX_KERNEL_LATEST_CIP_VERSION
or BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION), the build fails if the
kernel sources are not already downloaded:

    $ cat defconfig
    BR2_LINUX_KERNEL=y
    BR2_LINUX_KERNEL_LATEST_CIP_VERSION=y
    $ make defconfig BR2_DEFCONFIG=$pwd)/defconfig
    $ make linux-headers-source

    >>> linux-headers 4.19.118-cip25 Downloading
    --2020-05-13 19:28:44--  https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.19.118-cip25.tar.xz
    Resolving cdn.kernel.org (cdn.kernel.org)... 2a04:4e42:1d::432, 151.101.121.176
    Connecting to cdn.kernel.org (cdn.kernel.org)|2a04:4e42:1d::432|:443... connected.
    HTTP request sent, awaiting response... 404 Not Found
    2020-05-13 19:28:45 ERROR 404: Not Found.

    make[1]: *** [package/pkg-generic.mk:171: /home/ymorin/dev/buildroot/O/build/linux-headers-4.19.118-cip25/.stamp_downloaded] Error 1
    make: *** [Makefile:23: _all] Error 2

We fix that by adding yet another duplication of information out of
the linux.mk, to use the CIP-specific git tree where to get the
archives as snapshots.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-headers/linux-headers.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 80a077537b..4c3cb716b3 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -17,6 +17,7 @@ LINUX_HEADERS_CUSTOM_SVN = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_SVN))
 LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 LINUX_HEADERS_CUSTOM_TARBALL_LOCATION = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
 LINUX_HEADERS_REPO_URL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
+LINUX_HEADERS_CIP = $(BR2_LINUX_KERNEL_LATEST_CIP_VERSION)$(BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION)
 else # ! BR2_KERNEL_HEADERS_AS_KERNEL
 LINUX_HEADERS_CUSTOM_TARBALL = $(call qstrip,$(BR2_KERNEL_HEADERS_CUSTOM_TARBALL))
 LINUX_HEADERS_CUSTOM_GIT = $(call qstrip,$(BR2_KERNEL_HEADERS_CUSTOM_GIT))
@@ -25,6 +26,7 @@ LINUX_HEADERS_CUSTOM_SVN =
 LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))
 LINUX_HEADERS_CUSTOM_TARBALL_LOCATION = $(call qstrip,$(BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION))
 LINUX_HEADERS_REPO_URL = $(call qstrip,$(BR2_KERNEL_HEADERS_CUSTOM_REPO_URL))
+LINUX_HEADERS_CIP =
 endif # BR2_KERNEL_HEADERS_AS_KERNEL
 
 # Compute LINUX_HEADERS_SOURCE and LINUX_HEADERS_SITE from the configuration
@@ -43,6 +45,9 @@ else ifeq ($(LINUX_HEADERS_CUSTOM_SVN),y)
 LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.gz
 LINUX_HEADERS_SITE = $(LINUX_HEADERS_REPO_URL)
 LINUX_HEADERS_SITE_METHOD = svn
+else ifeq ($(LINUX_HEADERS_CIP),y)
+LINUX_HEADERS_SOURCE = linux-cip-$(LINUX_HEADERS_VERSION).tar.gz
+LINUX_HEADERS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git/snapshot
 else ifneq ($(findstring -rc,$(LINUX_HEADERS_VERSION)),)
 # Since 4.12-rc1, -rc kernels are generated from cgit. This also works for
 # older -rc kernels.
