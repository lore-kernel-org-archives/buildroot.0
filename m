From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 24 Oct 2012 09:17:05 +0200
Subject: [Buildroot] [PATCHv2 08/10] crosstool-ng: update-all-config
	shouldn't update default crosstool-ng config
In-Reply-To: <1351063027-13800-1-git-send-email-arnout@mind.be>
References: <1351063027-13800-1-git-send-email-arnout@mind.be>
Message-ID: <1351063027-13800-9-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

The new update-all-config target will update the ctng config file
if BR2_TOOLCHAIN_CTNG_CONFIG is set, even if it is set to the
default value in toolchain/toolchain-crosstool-ng/crosstool-ng.config-xxx

To avoid this, set the default BR2_TOOLCHAIN_CTNG_CONFIG to empty,
and select a default to use in the .mk file.

Note that ctng-update-config will still overwrite the default
file in toolchain/toolchain-crosstool-ng/crosstool-ng.config-xxx -
presumably it's intentional.

Also factored out the often-qstripped BR2_TOOLCHAIN_CTNG_LIBC (thereby
adding a few missing qstrips).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2: fix copy-paste error in commit message (Samuel Martin)
---
 toolchain/toolchain-crosstool-ng/Config.in       |    6 ++----
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |   16 +++++++++-------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
index 35ea2b1..e5d373e 100644
--- a/toolchain/toolchain-crosstool-ng/Config.in
+++ b/toolchain/toolchain-crosstool-ng/Config.in
@@ -36,15 +36,13 @@ config BR2_TOOLCHAIN_CTNG_LIBC
 
 config BR2_TOOLCHAIN_CTNG_CONFIG
 	string "crosstool-NG configuration file to use"
-	default "toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc" if BR2_TOOLCHAIN_CTNG_uClibc
-	default "toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc" if BR2_TOOLCHAIN_CTNG_eglibc
-	default "toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc"  if BR2_TOOLCHAIN_CTNG_glibc
+	default ""
 	help
 	  Enter here the crosstool-NG's .config file to use.
 	  To fine-tune your toolchain, you can also call:
 	    make ctng-menuconfig
 
-	  If unsure, keep the default value.
+	  If left empty, a default configuration file is used.
 
 if BR2_TOOLCHAIN_CTNG_uClibc
 
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 37398bd..c99c8d8 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -9,9 +9,11 @@
 # Internal variables
 
 CTNG_DIR := $(BUILD_DIR)/build-toolchain
+CTNG_LIBC = $(call qstrip,$(BR2_TOOLCHAIN_CTNG_LIBC))
 
 CTNG_UCLIBC_CONFIG_FILE := $(TOPDIR)/toolchain/uClibc/uClibc-0.9.33.config
-CTNG_CONFIG_FILE:=$(call qstrip,$(BR2_TOOLCHAIN_CTNG_CONFIG))
+CTNG_CONFIG = $(call qstrip,$(BR2_TOOLCHAIN_CTNG_CONFIG))
+CTNG_CONFIG_FILE = $(or $(wildcard $(CTNG_CONFIG)),toolchain/toolchain-crosstool-ng/crosstool-ng.config-$(CTNG_LIBC))
 
 # Hack! ct-ng is in fact a Makefile script. As such, it accepts all
 # make options, such as -C, which makes it uneeded to chdir prior
@@ -50,7 +52,7 @@ CTNG_LIBS_eglibc := $(CTNG_LIBS_glibc)
 
 #--------------
 # All that we need in /lib
-CTNG_LIBS_LIB += $(CTNG_LIBS_$(call qstrip,$(BR2_TOOLCHAIN_CTNG_LIBC)))
+CTNG_LIBS_LIB += $(CTNG_LIBS_$(CTNG_LIBC))
 
 #--------------
 # All that we need in /usr/lib
@@ -348,7 +350,7 @@ define ctng-oldconfig
 	$(call ctng,CT_IS_A_BACKEND=y                           \
 	            CT_BACKEND_ARCH=$(CTNG_ARCH)                \
 	            CT_BACKEND_KERNEL=linux                     \
-	            CT_BACKEND_LIBC=$(BR2_TOOLCHAIN_CTNG_LIBC)  \
+	            CT_BACKEND_LIBC=$(CTNG_LIBC)                \
 	            oldconfig                                   )
 	$(call ctng-fix-dot-config,$(1),$(CTNG_FIX_DOT_CONFIG_PATHS_SED))
 endef
@@ -372,9 +374,9 @@ $(CTNG_DIR)/.config: $(CTNG_CONFIG_FILE) $(CONFIG_DIR)/.config
 	$(Q)if [ ! -f $@ ]; then                                                        \
 	        mkdir -p "$(CTNG_DIR)";                                                 \
 	        libc="$$(awk -F '"' '$$1=="CT_LIBC=" { print $$2; }' "$<")";            \
-	        if [ "$${libc}" != "$(BR2_TOOLCHAIN_CTNG_LIBC)" ]; then                 \
+	        if [ "$${libc}" != "$(CTNG_LIBC)" ]; then                               \
 	            echo "* Inconsistency in crosstool-NG config file '$<'";            \
-	            echo "* - buildroot configured for '$(BR2_TOOLCHAIN_CTNG_LIBC)'";   \
+	            echo "* - buildroot configured for '$(CTNG_LIBC)'";                 \
 	            echo "* - given config file for '$${libc}'";                        \
 	            exit 1;                                                             \
 	        fi;                                                                     \
@@ -392,7 +394,7 @@ ctng-menuconfig: $(CTNG_DIR)/.config
 	$(Q)$(call ctng,CT_IS_A_BACKEND=y                           \
 	                CT_BACKEND_ARCH=$(CTNG_ARCH)                \
 	                CT_BACKEND_KERNEL=linux                     \
-	                CT_BACKEND_LIBC=$(BR2_TOOLCHAIN_CTNG_LIBC)  \
+	                CT_BACKEND_LIBC=$(CTNG_LIBC)                \
 	                menuconfig                                  )
 	$(call ctng-oldconfig,$<)
 	$(call ctng-check-config-changed,$<,$<.timestamp)
@@ -401,6 +403,6 @@ ctng-menuconfig: $(CTNG_DIR)/.config
 ctng-update-config: $(CTNG_DIR)/.config
 	cp -f $< $(CTNG_CONFIG_FILE)
 
-ifneq ($(CTNG_CONFIG_FILE),)
+ifneq ($(CTNG_CONFIG),)
 UPDATE_ALL_CONFIG_TARGETS += ctng-update-config
 endif
-- 
1.7.10.4
