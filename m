From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu, 10 Jan 2013 09:35:19 +0000
Subject: [Buildroot] [PATCH] Add support for extra uClibc patches
Message-ID: <1357810519-13630-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

This patch adds a very simple mechanism for applying a set of "extra" patches
to uClibc, on top of the patch set provided by Buildroot.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 toolchain/uClibc/Config.in |    6 ++++++
 toolchain/uClibc/uclibc.mk |   11 +++++++++++
 2 files changed, 17 insertions(+)

diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index e47bc9b..12e6da0 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -53,6 +53,12 @@ config BR2_UCLIBC_CONFIG
 	  See also docs/README in this package.
 	  If unsure, use the default.
 
+config BR2_UCLIBC_EXTRA_PATCH_DIR
+	string "extra uClibc patch directory"
+	help
+	  You may specify a directory containing extra patches for uClibc.
+	  Note that extra patches will be applied AFTER the Buildroot patch set.
+
 config BR2_PTHREAD_DEBUG
 	bool "Thread library debugging"
 	depends on BR2_PTHREADS || BR2_PTHREADS_OLD || BR2_PTHREADS_NATIVE
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 055267c..d83dcdb 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -77,9 +77,20 @@ ifneq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
 	support/scripts/apply-patches.sh $(UCLIBC_DIR) $(UCLIBC_PATCH_DIR) \
 		uClibc-$(UCLIBC_VERSION)-\*.patch \
 		uClibc-$(UCLIBC_VERSION)-\*.patch.$(ARCH)
+ifneq ($(BR2_UCLIBC_EXTRA_PATCH_DIR),"")
+	support/scripts/apply-patches.sh $(UCLIBC_DIR) \
+		$(call qstrip,$(BR2_UCLIBC_EXTRA_PATCH_DIR)) \
+		uClibc-$(UCLIBC_VERSION)-\*.patch \
+		uClibc-$(UCLIBC_VERSION)-\*.patch.$(ARCH)
+endif
 else
 	support/scripts/apply-patches.sh $(UCLIBC_DIR) $(UCLIBC_PATCH_DIR) \
 		uClibc.\*.patch uClibc.\*.patch.$(ARCH)
+ifneq ($(BR2_UCLIBC_EXTRA_PATCH_DIR),"")
+	support/scripts/apply-patches.sh $(UCLIBC_DIR) \
+		$(call qstrip,$(BR2_UCLIBC_EXTRA_PATCH_DIR)) \
+		uClibc.\*.patch uClibc.\*.patch.$(ARCH)
+endif
 endif
 	touch $@
 
-- 
1.7.10.4
