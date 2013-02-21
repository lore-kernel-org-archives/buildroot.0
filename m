From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu, 21 Feb 2013 11:22:07 +0000
Subject: [Buildroot] [PATCH v2] Add support for extra uClibc patches
Message-ID: <1361445727-8446-1-git-send-email-spdawson@gmail.com>
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
 v2: Rebased on top of next branch

 toolchain/uClibc/Config.in |    6 ++++++
 toolchain/uClibc/uclibc.mk |   11 +++++++++++
 2 files changed, 17 insertions(+)

diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index 57c9933..e883667 100644
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
index 1b49a8d..a640084 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -80,9 +80,20 @@ ifneq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
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
