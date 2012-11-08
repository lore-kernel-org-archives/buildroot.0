From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu,  8 Nov 2012 09:36:09 +0100
Subject: [Buildroot] [PATCH v3 03/10] ctng: add ctng-update-config target
In-Reply-To: <1352363776-23638-1-git-send-email-arnout@mind.be>
References: <1352363776-23638-1-git-send-email-arnout@mind.be>
Message-ID: <1352363776-23638-3-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Analogous to linux-update-config and friends.

Also update documentation.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 docs/manual/customize-store.txt                  |   11 ++++++-----
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    3 +++
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/docs/manual/customize-store.txt b/docs/manual/customize-store.txt
index aa57660..3eb76ef 100644
--- a/docs/manual/customize-store.txt
+++ b/docs/manual/customize-store.txt
@@ -59,12 +59,13 @@ configuration files easier.
   path specified by +BR2_PACKAGE_BUSYBOX_CONFIG+.
 * +make uclibc-update-config+ saves the uClibc configuration to the
   path specified by +BR2_UCLIBC_CONFIG+.
+* +make ctng-update-config+ saves the crosstool-NG configuration to the
+  patch specified by +BR2_TOOLCHAIN_CTNG_CONFIG+.
 * +make barebox-update-defconfig+ saves the barebox configuration to the
   path specified by +BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE+.
-* For crosstool-NG and at91bootstrap3 and no helper exists so you
-  have to copy the config file manually to +BR2_TOOLCHAIN_CTNG_CONFIG+,
-  resp. +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE+.
-
+* For at91bootstrap3, no helper exists so you
+  have to copy the config file manually to
+  +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE+.
 
 Creating your own board support
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -127,7 +128,7 @@ you can skip the steps that are not relevant for your use case.
 1. Write the configuration files:
    * +make linux-update-defconfig+
    * +make busybox-update-config+
-   * +cp <output>/build/build-toolchain/.config board/<manufacturer>/<boardname>/ctng.config+
+   * +make ctng-update-config+
    * +make uclibc-update-config+
    * +cp <output>/build/at91bootstrap3-*/.config board/<manufacturer>/<boardname>/at91bootstrap3.config+
    * +make barebox-update-defconfig+
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 5f9119d..85ca71e 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -397,3 +397,6 @@ ctng-menuconfig: $(CTNG_DIR)/.config
 	$(call ctng-oldconfig,$<)
 	$(call ctng-check-config-changed,$<,$<.timestamp)
 	$(Q)rm -f $<.timestamp
+
+ctng-update-config: $(CTNG_DIR)/.config
+	cp -f $< $(CTNG_CONFIG_FILE)
-- 
1.7.10.4
