From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 21 Oct 2012 01:45:24 +0200
Subject: [Buildroot] [PATCH 03/10] ctng: add ctng-update-config target
In-Reply-To: <1350776731-8467-1-git-send-email-arnout@mind.be>
References: <1350776731-8467-1-git-send-email-arnout@mind.be>
Message-ID: <1350776731-8467-4-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Analogous to linux-update-config and friends.

Also update documentation.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/customize-store.txt                  |    8 ++++----
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    3 +++
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/docs/manual/customize-store.txt b/docs/manual/customize-store.txt
index bc1751e..c7ef00c 100644
--- a/docs/manual/customize-store.txt
+++ b/docs/manual/customize-store.txt
@@ -58,8 +58,8 @@ configuration files easier.
   path specified by +BR2_PACKAGE_BUSYBOX_CONFIG+.
 * +make uclibc-update-config+ saves the uClibc configuration to the
   path specified by +BR2_UCLIBC_CONFIG+.
-* For crosstool-NG, no helper exists so you have to copy the config
-  file manually to +BR2_TOOLCHAIN_CTNG_CONFIG+.
+* +make ctng-update-config+ saves the crosstool-NG configuration to the
+  patch specified by +BR2_TOOLCHAIN_CTNG_CONFIG+.
 
 
 Creating your own board support
@@ -122,7 +122,7 @@ you can skip the steps that are not relevant for your use case.
 1. Write the configuration files:
    * +make linux-update-defconfig+
    * +make busybox-update-config+
-   * +cp <output>/build/build-toolchain/.config board/<manufacturer>/<boardname>/ctng.config+
+   * +make ctng-update-config+
    * +make uclibc-update-config+
    * +cp <output>/build/at91bootstrap3-*/.config board/<manufacturer>/<boardname>/at91bootstrap3.config+
 1. Create +board/<manufacturer>/<boardname>/fs-overlay+ and fill it
@@ -163,7 +163,7 @@ the buildroot tree).
 1. Write the configuration files:
    * +make linux-update-defconfig+
    * +make busybox-update-config+
-   * +cp <output>/build/build-toolchain/.config <path-to-board-directory>/ctng.config+
+   * +make ctng-update-config+
    * +make uclibc-update-config+
    * +cp <output>/build/at91bootstrap3-*/.config <path-to-board-directory>/at91bootstrap3.config+
 1. Create +<path-to-board-directory>/fs-overlay+ and fill it
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index e46bb20..fb6da0f 100644
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
