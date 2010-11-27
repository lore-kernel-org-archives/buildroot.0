From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sat, 27 Nov 2010 22:36:28 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain/crosstool-NG: reorder
	sed expressions
Message-ID: <20101127214028.D196D8CA80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=499f4cf22d0078209a8ab22fc2b7c503865f7da4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |   20 +++++++++++++++++---
 1 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 9a9f272..4040dcd 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -85,6 +85,15 @@ $(STAMP_DIR)/ct-ng-toolchain-built: $(CTNG_DIR)/.config
 #-----------------------------------------------------------------------------
 # Configuring the toolchain
 
+#--------------
+# We push BR options down to CT-NG, munging the default configuration
+# with sed expressions.
+# - first one for non-path options
+# - second for path options (because they have no prompt, they
+#                            always get set to the default value)
+CTNG_FIX_DOT_CONFIG_SED       :=
+CTNG_FIX_DOT_CONFIG_PATHS_SED :=
+
 # Note: a lot of the following tricks would become unneeded if one day
 # buildroot and crosstool-NG had matching options, especially for the
 # target description: arch name, bitness, endianness...
@@ -151,8 +160,6 @@ endif
 # with BR2 config options.
 # Known missing: arch variant & options, floating point (HW/SW), uClibc/eglibc config...
 #
-
-CTNG_FIX_DOT_CONFIG_SED :=
 CTNG_FIX_DOT_CONFIG_SED += s:^(CT_INSTALL_DIR_RO)=y:\# \1 is not set:;
 CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_ARCH_[BL]E).*:\# \2 is not set:;
 CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_ARCH_$(CTNG_ENDIAN)) is not set:\1=y:;
@@ -173,10 +180,12 @@ endif
 
 #--------------
 # And the specials for paths
-CTNG_FIX_DOT_CONFIG_PATHS_SED :=
 CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_PREFIX_DIR)=.*:\1="$(TOOLCHAIN_DIR)":;
 CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_LOCAL_TARBALLS_DIR)=.*:\1="$(DL_DIR)":;
 CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_SYSROOT_DIR_PREFIX)=.*:\1="":;
+
+#--------------
+# uClibc specific options
 ifeq ($(BR2_TOOLCHAIN_CTNG_uClibc),y)
 CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_LIBC_UCLIBC_CONFIG_FILE)=.*:\1="$(CTNG_UCLIBC_CONFIG_FILE)":;
 endif
@@ -230,9 +239,14 @@ endef
 # Depends on top-level .config because it has options we have to shoe-horn
 # into crosstool-NG's .config
 # Only copy the original .config file if we don't have one already
+# We need to call oldconfig twice in a row to ensure the options
+# are correctly set ( eg. if an option is new, then the initial sed
+# can't do anything about it ) Ideally, this should go in oldconfig
+# itself, but it's much easier to handle here.
 $(CTNG_DIR)/.config: $(CTNG_CONFIG_FILE) $(CTNG_DIR)/ct-ng $(CONFIG_DIR)/.config
 	$(Q)[ -f $@ ] && cp -a $@ $@.timestamp || cp -f $< $@
 	$(call ctng-oldconfig,$@)
+	$(call ctng-oldconfig,$@)
 	$(call ctng-check-config-changed,$@,$@.timestamp)
 	$(Q)rm -f $@.timestamp
 
-- 
1.7.2.2
