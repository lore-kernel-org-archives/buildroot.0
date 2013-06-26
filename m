From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Jun 2013 00:26:12 +0200
Subject: [Buildroot] [RFCv2 17/19] Use the 'host-gcc-final' target instead
	of the 'uclibc' target
In-Reply-To: <1372285574-29423-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1372285574-29423-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1372285574-29423-18-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to be compatible with the Buildroot internal backend, the
Crosstool-NG and external backend were providing 'uclibc' and
'uclibc-source' targets. Now, let's provide 'host-gcc-final' and
'host-gcc-final-source' targets, and remove some conditional in the
main Makefile.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                                         |  5 +----
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk | 14 +++++++-------
 toolchain/toolchain-external/ext-tool.mk         |  6 +++---
 3 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/Makefile b/Makefile
index c0bd66e..823a397 100644
--- a/Makefile
+++ b/Makefile
@@ -223,11 +223,8 @@ ifeq ($(BR2_CCACHE),y)
 BASE_TARGETS += host-ccache
 endif
 
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 BASE_TARGETS += host-gcc-final
-else
-BASE_TARGETS += uclibc
-endif
+
 TARGETS:=
 
 # silent mode requested?
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 59f18c7..d8b3adf 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -22,15 +22,15 @@ PATH=$(HOST_PATH) ct-ng -C $(CTNG_DIR) --no-print-directory $(1)
 endef
 
 #-----------------------------------------------------------------------------
-# 'uclibc' is the target to depend on to get the toolchain and prepare
-# the staging directory and co.
-uclibc: dependencies $(STAMP_DIR)/ct-ng-toolchain-installed
+# 'host-gcc-final' is the target to depend on to get the toolchain and
+# prepare the staging directory and co.
+host-gcc-final: dependencies $(STAMP_DIR)/ct-ng-toolchain-installed
 
-# 'uclibc-source' is the target used by the infra structure to mean
-# "we just want to download the toolchain's sources, not build it"
-# For crosstool-NG, we need it to be configured before we can download;
+# 'host-gcc-final-source' is the target used by the infra structure to mean
+# "we just want to download the toolchain's sources, not build it" For
+# crosstool-NG, we need it to be configured before we can download;
 # then we have to override a config option to just do the download
-uclibc-source: $(CTNG_DIR)/.config
+host-gcc-final-source: $(CTNG_DIR)/.config
 	$(Q)$(call ctng,build CT_ONLY_DOWNLOAD=y)
 
 #-----------------------------------------------------------------------------
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 1d76a66..a7d522e 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -539,10 +539,10 @@ $(HOST_DIR)/usr/bin/ext-toolchain-wrapper: $(TOOLCHAIN_EXTERNAL_INSTALL)
 	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_EXTERNAL_WRAPPER_ARGS) -s -Wl,--hash-style=both \
 		toolchain/toolchain-external/ext-toolchain-wrapper.c -o $@
 
-# 'uclibc' is the target to provide toolchain / staging dir
-uclibc: dependencies $(HOST_DIR)/usr/bin/ext-toolchain-wrapper
+# 'host-gcc-final' is the target to provide toolchain / staging dir
+host-gcc-final: dependencies $(HOST_DIR)/usr/bin/ext-toolchain-wrapper
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
 # download ext toolchain if so configured
-uclibc-source: $(addprefix $(DL_DIR)/,$(TOOLCHAIN_EXTERNAL_SOURCE))
+host-gcc-final-source: $(addprefix $(DL_DIR)/,$(TOOLCHAIN_EXTERNAL_SOURCE))
 endif
-- 
1.8.1.2
