From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sat, 27 Nov 2010 21:50:45 +0100
Subject: [Buildroot] [PATCH 05/10] toolchain/crosstool-NG: add C library
	config munging
In-Reply-To: <1290891050-18122-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1290891050-18122-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1290891050-18122-6-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some C libraries, it can be necessary to push the BR settings
down to the libc configuration file. Prepare the infrastructure.

(Note: it will apply only to uClibc for now, and although eglibc
can also be configured, it is not currently supported)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 48116af..25e12d2 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -93,8 +93,10 @@ $(STAMP_DIR)/ct-ng-toolchain-built: $(CTNG_DIR)/.config
 # - first one for non-path options
 # - second for path options (because they have no prompt, they
 #                            always get set to the default value)
+# - third for C library .config (if it has one, eg. uClibc)
 CTNG_FIX_DOT_CONFIG_SED       :=
 CTNG_FIX_DOT_CONFIG_PATHS_SED :=
+CTNG_FIX_DOT_CONFIG_LIBC_SED  :=
 
 #--------------
 # A few generic functions
@@ -228,8 +230,12 @@ CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_LIBC_UCLIBC_CONFIG_FILE)=.*:\1="$(CTNG_D
 $(STAMP_DIR)/ct-ng-toolchain-built: $(CTNG_DIR)/libc.config
 
 # And here is how we get this uClibc's .config
-$(CTNG_DIR)/libc.config: $(CTNG_UCLIBC_CONFIG_FILE)
+$(CTNG_DIR)/libc.config: $(CTNG_UCLIBC_CONFIG_FILE) $(CONFIG_DIR)/.config
+	-$(Q)cp -a $@ $@.timestamp
 	$(Q)cp -f $< $@
+	$(call ctng-fix-dot-config,$@,$(CTNG_FIX_DOT_CONFIG_LIBC_SED))
+	$(call ctng-check-config-changed,$@,$@.timestamp)
+	$(Q)rm -f $@.timestamp
 
 endif # LIBC is uClibc
 
-- 
1.7.1
