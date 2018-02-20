From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Tue, 20 Feb 2018 17:15:57 +0100
Subject: [Buildroot] [PATCH 1/1] linux-headers: Resynchronize same-as-kernel
 source selection.
Message-ID: <20180220161557.14766-1-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The source selection done by linux.mk need to be duplicated to
linux-headers.mk for the BR2_KERNEL_HEADERS_AS_KERNEL option to work.

This duplicates these linux.mk changes to linux-headers.mk:
- Add custom Subversion repository support for the package (986fa44)
- Add CIP SLTS selection option (31d4fa7)
- Fix URL for release candidate versions (ff4cccb)

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/linux-headers/linux-headers.mk | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index f1e3790608..7bc22d3e2a 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -26,6 +26,21 @@ LINUX_HEADERS_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 LINUX_HEADERS_SITE_METHOD = hg
 # use same hg tarball as linux kernel
 LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.gz
+else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_SVN),y)
+LINUX_HEADERS_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
+LINUX_HEADERS_SITE_METHOD = svn
+# use same hg tarball as linux kernel
+LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.gz
+else ifeq ($(BR2_LINUX_KERNEL_LATEST_CIP_VERSION),y)
+LINUX_HEADERS_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/bwh/linux-cip.git
+# use same hg tarball as linux kernel
+LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.gz
+else ifneq ($(findstring -rc,$(call qstrip,$(BR2_LINUX_KERNEL_VERSION))),)
+# Since 4.12-rc1, -rc kernels are generated from cgit. This also works for
+# older -rc kernels.
+LINUX_HEADERS_SITE = https://git.kernel.org/torvalds/t
+# use same hg tarball as linux kernel
+LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.gz
 else
 LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.xz
 # In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
@@ -38,10 +53,6 @@ LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x
 else ifeq ($(findstring x4.,x$(LINUX_HEADERS_VERSION)),x4.)
 LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v4.x
 endif
-# release candidates are in testing/ subdir
-ifneq ($(findstring -rc,$(LINUX_HEADERS_VERSION)),)
-LINUX_HEADERS_SITE := $(LINUX_HEADERS_SITE)/testing
-endif # -rc
 endif
 
 LINUX_HEADERS_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
-- 
2.15.1
