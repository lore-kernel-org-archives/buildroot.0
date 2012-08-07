From: Sonic Zhang <sonic.adi@gmail.com>
Date: Tue, 7 Aug 2012 17:09:35 +0800
Subject: [Buildroot] [PATCH 3/5] buildroot: patch kernel by kernel version
In-Reply-To: <1344330577-25159-1-git-send-email-sonic.adi@gmail.com>
References: <1344330577-25159-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <1344330577-25159-3-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bob Liu <bob.liu@analog.com>

support patch kernel by kernel version.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 linux/linux.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 2e0671b..48021a1 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -64,6 +64,8 @@ endif
 # going to be installed in the target filesystem.
 LINUX_VERSION_PROBED = $(shell $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_SOURCE_DIR) --no-print-directory -s kernelrelease)
 
+KERNELVERSION=$(shell cat $(LINUX_SOURCE_DIR)/Makefile | awk 'BEGIN { FS = " *= *" }  NF != 2 { next } $$1 == "VERSION" { maj = $$2} $$1 == "PATCHLEVEL" { mid = $$2 } $$1 == "SUBLEVEL" { mic = $$2 } END {print maj "." mid "." mic}')
+
 ifeq ($(BR2_LINUX_KERNEL_USE_INTREE_DTS),y)
 KERNEL_DTS_NAME = $(BR2_LINUX_KERNEL_INTREE_DTS_NAME)
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),y)
@@ -149,7 +151,7 @@ define LINUX_APPLY_PATCHES
 		if echo $$p | grep -q -E "^ftp://|^http://" ; then \
 			support/scripts/apply-patches.sh $(LINUX_SOURCE_DIR) $(DL_DIR) `basename $$p` ; \
 		elif test -d $$p ; then \
-			support/scripts/apply-patches.sh $(LINUX_SOURCE_DIR) $$p linux-\*.patch ; \
+			support/scripts/apply-patches.sh $(LINUX_SOURCE_DIR) $$p linux-$(KERNELVERSION)-\*.patch ; \
 		else \
 			support/scripts/apply-patches.sh $(LINUX_SOURCE_DIR) `dirname $$p` `basename $$p` ; \
 		fi \
-- 
1.7.0.4
