From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sat, 27 Nov 2010 22:36:28 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain/crosstool-NG: use a
	copy of the uClibc .config
Message-ID: <20101127214029.09A198CA80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6aec5c2c1970df68b847455261b2ca92b8b16929
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Before we can munge the uClibc .config file, we have to use a copy.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |   16 ++++++++++++++--
 1 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 4040dcd..b92aed0 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -76,6 +76,8 @@ $(STAMP_DIR)/ct-ng-toolchain-installed: $(STAMP_DIR)/ct-ng-toolchain-built
 
 #-----------------------------------------------------------------------------
 # Building the toolchain
+# Note: $(STAMP_DIR)/ct-ng-toolchain-built can have more dependencies,
+#       depending on the selected C library. Those deps are added later
 
 $(STAMP_DIR)/ct-ng-toolchain-built: $(CTNG_DIR)/.config
 	$(Q)$(call ctng,build.$(BR2_JLEVEL))
@@ -187,8 +189,18 @@ CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_SYSROOT_DIR_PREFIX)=.*:\1="":;
 #--------------
 # uClibc specific options
 ifeq ($(BR2_TOOLCHAIN_CTNG_uClibc),y)
-CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_LIBC_UCLIBC_CONFIG_FILE)=.*:\1="$(CTNG_UCLIBC_CONFIG_FILE)":;
-endif
+
+# Instruct CT-NG's .config where to find the uClibc's .config
+CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_LIBC_UCLIBC_CONFIG_FILE)=.*:\1="$(CTNG_DIR)/libc.config":;
+
+# And add this to the toolchain build dependency
+$(STAMP_DIR)/ct-ng-toolchain-built: $(CTNG_DIR)/libc.config
+
+# And here is how we get this uClibc's .config
+$(CTNG_DIR)/libc.config: $(CTNG_UCLIBC_CONFIG_FILE)
+	$(Q)cp -f $< $@
+
+endif # LIBC is uClibc
 
 #--------------
 # Small functions to shoe-horn the above into crosstool-NG's .config
-- 
1.7.2.2
