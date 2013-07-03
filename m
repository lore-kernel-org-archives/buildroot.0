From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Jul 2013 00:14:10 +0200
Subject: [Buildroot] [git commit] Use more sensible names for the
	external/ctng targets
Message-ID: <20130704095651.E1B9F9A29F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e57e4b96bf33b5a498608204913d6731a6856b5e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of using the 'uclibc' target for all toolchain backends,
introduce more sensible target names for the external toolchain and
Crosstool-NG toolchain backend make targets.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile                                         |    7 +++++--
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |   16 +++++++---------
 toolchain/toolchain-external/ext-tool.mk         |    5 ++---
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/Makefile b/Makefile
index e3e2750..7a4602c 100644
--- a/Makefile
+++ b/Makefile
@@ -225,9 +225,12 @@ endif
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 BASE_TARGETS += toolchain-buildroot
-else
-BASE_TARGETS += uclibc
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
+BASE_TARGETS += toolchain-external
+else ifeq ($(BR2_TOOLCHAIN_CTNG),y)
+BASE_TARGETS += toolchain-crosstool-ng
 endif
+
 TARGETS:=
 
 # silent mode requested?
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 79ad7e1..7130536 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -22,15 +22,13 @@ PATH=$(HOST_PATH) ct-ng -C $(CTNG_DIR) --no-print-directory $(1)
 endef
 
 #-----------------------------------------------------------------------------
-# 'uclibc' is the target to depend on to get the toolchain and prepare
-# the staging directory and co.
-uclibc: dependencies $(STAMP_DIR)/ct-ng-toolchain-installed
-
-# 'uclibc-source' is the target used by the infra structure to mean
-# "we just want to download the toolchain's sources, not build it"
-# For crosstool-NG, we need it to be configured before we can download;
-# then we have to override a config option to just do the download
-uclibc-source: $(CTNG_DIR)/.config
+toolchain-crosstool-ng: dependencies $(STAMP_DIR)/ct-ng-toolchain-installed
+
+# The target used by the infra structure to mean "we just want to
+# download the toolchain's sources, not build it" For crosstool-NG, we
+# need it to be configured before we can download; then we have to
+# override a config option to just do the download
+toolchain-crosstool-ng-source: $(CTNG_DIR)/.config
 	$(Q)$(call ctng,build CT_ONLY_DOWNLOAD=y)
 
 #-----------------------------------------------------------------------------
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 1d76a66..b8d77ad 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -539,10 +539,9 @@ $(HOST_DIR)/usr/bin/ext-toolchain-wrapper: $(TOOLCHAIN_EXTERNAL_INSTALL)
 	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_EXTERNAL_WRAPPER_ARGS) -s -Wl,--hash-style=both \
 		toolchain/toolchain-external/ext-toolchain-wrapper.c -o $@
 
-# 'uclibc' is the target to provide toolchain / staging dir
-uclibc: dependencies $(HOST_DIR)/usr/bin/ext-toolchain-wrapper
+toolchain-external: dependencies $(HOST_DIR)/usr/bin/ext-toolchain-wrapper
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
 # download ext toolchain if so configured
-uclibc-source: $(addprefix $(DL_DIR)/,$(TOOLCHAIN_EXTERNAL_SOURCE))
+toolchain-external-source: $(addprefix $(DL_DIR)/,$(TOOLCHAIN_EXTERNAL_SOURCE))
 endif
