From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed,  6 Mar 2019 22:28:14 +0100
Subject: [Buildroot] [PATCH 1/2] package/linux-headers: fix support for -rc
 kernels
Message-ID: <20190306212815.19759-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-rc kernels after v3.x are no longer available in the testing
subdirectory. Instead they should be fetched from cgit.

Commit ff4cccbdcf5417a5a8c251ff302791a306023cc1 did this for linux
itself, now we also do it for linux-headers.

When fetched from cgit, .tar.xz can't be used. Adding this to the
existing condition is not so simple, so refactor how _SOURCE is set:
simply set it explicitly in each branch of the condition. While more
verbose (it is repeated 4 times), it's easier to understand and to
maintain.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/linux-headers/linux-headers.mk | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 45e17688c5..4b5ebf8d97 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -27,28 +27,29 @@ LINUX_HEADERS_CUSTOM_TARBALL_LOCATION = $(call qstrip,$(BR2_KERNEL_HEADERS_CUSTO
 LINUX_HEADERS_REPO_URL = $(call qstrip,$(BR2_KERNEL_HEADERS_CUSTOM_REPO_URL))
 endif # BR2_KERNEL_HEADERS_AS_KERNEL
 
-# Configure tarball filenames.
+# Compute LINUX_HEADERS_SOURCE and LINUX_HEADERS_SITE from the configuration
 ifeq ($(LINUX_HEADERS_CUSTOM_TARBALL),y)
 LINUX_HEADERS_SOURCE = $(notdir $(LINUX_HEADERS_CUSTOM_TARBALL_LOCATION))
-else ifeq ($(LINUX_HEADERS_CUSTOM_GIT)$(LINUX_HEADERS_CUSTOM_HG)$(LINUX_HEADERS_CUSTOM_SVN),y)
-LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.gz
-else
-LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.xz
-endif
-
-# Configure the various kernel source locations.
-ifeq ($(LINUX_HEADERS_CUSTOM_TARBALL),y)
 LINUX_HEADERS_SITE = $(patsubst %/,%,$(dir $(LINUX_HEADERS_CUSTOM_TARBALL_LOCATION)))
 else ifeq ($(LINUX_HEADERS_CUSTOM_GIT),y)
+LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.gz
 LINUX_HEADERS_SITE = $(LINUX_HEADERS_REPO_URL)
 LINUX_HEADERS_SITE_METHOD = git
 else ifeq ($(LINUX_HEADERS_CUSTOM_HG),y)
+LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.gz
 LINUX_HEADERS_SITE = $(LINUX_HEADERS_REPO_URL)
 LINUX_HEADERS_SITE_METHOD = hg
 else ifeq ($(LINUX_HEADERS_CUSTOM_SVN),y)
+LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.gz
 LINUX_HEADERS_SITE = $(LINUX_HEADERS_REPO_URL)
 LINUX_HEADERS_SITE_METHOD = svn
+else ifneq ($(findstring -rc,$(LINUX_HEADERS_VERSION)),)
+# Since 4.12-rc1, -rc kernels are generated from cgit. This also works for
+# older -rc kernels.
+LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.gz
+LINUX_HEADERS_SITE = https://git.kernel.org/torvalds/t
 else
+LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.xz
 # In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
 # to use the $(word) function. We support versions such as 4.0, 3.1,
 # 2.6.32, 2.6.32-rc1, 3.0-rc6, etc.
@@ -59,10 +60,6 @@ LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x
 else ifeq ($(findstring x4.,x$(LINUX_HEADERS_VERSION)),x4.)
 LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v4.x
 endif # x2.6
-# release candidates are in testing/ subdir
-ifneq ($(findstring -rc,$(LINUX_HEADERS_VERSION)),)
-LINUX_HEADERS_SITE := $(LINUX_HEADERS_SITE)/testing
-endif # -rc
 endif # LINUX_HEADERS_CUSTOM_TARBALL
 
 # Apply any necessary patches if we are using the headers from a kernel
-- 
2.20.1
