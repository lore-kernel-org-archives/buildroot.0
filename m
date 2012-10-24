From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 24 Oct 2012 09:17:06 +0200
Subject: [Buildroot] [PATCHv2 09/10] uClibc: update-all-config shouldn't
	update default uClibc config
In-Reply-To: <1351063027-13800-1-git-send-email-arnout@mind.be>
References: <1351063027-13800-1-git-send-email-arnout@mind.be>
Message-ID: <1351063027-13800-10-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

The new update-all-config target will update the uClibc config file
if BR2_UCLIBC_CONFIG is set, even if it is set to the default value
in toolchain/uClibc/uClibc-xxx.config.

To avoid this, set the default BR2_UCLIBC_CONFIG to empty, and select
a default to use in the .mk file.

Note that uclibc-update-config will still overwrite the default file
in toolchain/uClibc/uClibc-xxx.config - presumably it's intentional.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/uClibc/Config.in |    7 ++-----
 toolchain/uClibc/uclibc.mk |   23 +++++++++++------------
 2 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index f46a415..9cce05d 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -42,15 +42,12 @@ config BR2_UCLIBC_VERSION_STRING
 
 config BR2_UCLIBC_CONFIG
 	string "uClibc configuration file to use?"
-	default "toolchain/uClibc/uClibc-0.9.31.config" if BR2_UCLIBC_VERSION_0_9_31
-	default "toolchain/uClibc/uClibc-0.9.32.config" if BR2_UCLIBC_VERSION_0_9_32
-	default "toolchain/uClibc/uClibc-0.9.33.config" if BR2_UCLIBC_VERSION_0_9_33
-	default "toolchain/uClibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_SNAPSHOT
+	default ""
 	help
 	  Some people may wish to use their own modified uClibc configuration
 	  file and will specify their config file location with this option.
 	  See also docs/README in this package.
-	  If unsure, use the default.
+	  If left empty, a default configuration will be used.
 
 config BR2_PTHREAD_DEBUG
 	bool "Thread library debugging"
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 0faaf18..d032684 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -6,22 +6,21 @@
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 
-# specifying UCLIBC_CONFIG_FILE on the command-line overrides the .config
-# setting.
-ifndef UCLIBC_CONFIG_FILE
-UCLIBC_CONFIG_FILE=$(call qstrip,$(BR2_UCLIBC_CONFIG))
-endif
-
-UCLIBC_VERSION:=$(call qstrip,$(BR2_UCLIBC_VERSION_STRING))
+UCLIBC_VERSION = $(call qstrip,$(BR2_UCLIBC_VERSION_STRING))
 
 ifeq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
-UCLIBC_SITE:=http://www.uclibc.org/downloads/snapshots
-UCLIBC_DIR:=$(TOOLCHAIN_DIR)/uClibc
+UCLIBC_SITE = http://www.uclibc.org/downloads/snapshots
+UCLIBC_DIR  = $(TOOLCHAIN_DIR)/uClibc
+UCLIBC_CONFIG_VERSION = snapshot
 else
-UCLIBC_SITE:=http://www.uclibc.org/downloads
-UCLIBC_DIR:=$(TOOLCHAIN_DIR)/uClibc-$(UCLIBC_VERSION)
+UCLIBC_SITE = http://www.uclibc.org/downloads
+UCLIBC_DIR  = $(TOOLCHAIN_DIR)/uClibc-$(UCLIBC_VERSION)
+UCLIBC_CONFIG_VERSION = $(subst $(space),.,$(wordlist 1,3,$(subst .,$(space),$(UCLIBC_VERSION))))
 endif
 
+UCLIBC_CONFIG = $(call qstrip,$(BR2_UCLIBC_CONFIG))
+UCLIBC_CONFIG_FILE = $(or $(wildcard $(UCLIBC_CONFIG)),toolchain/uClibc/uClibc-$(UCLIBC_CONFIG_VERSION).config)
+
 UCLIBC_PATCH_DIR:=toolchain/uClibc/
 UCLIBC_SOURCE:=uClibc-$(UCLIBC_VERSION).tar.bz2
 
@@ -508,7 +507,7 @@ uclibc-oldconfig: $(UCLIBC_DIR)/.oldconfig
 uclibc-update-config: uclibc-config
 	cp -f $(UCLIBC_DIR)/.config $(UCLIBC_CONFIG_FILE)
 
-ifneq ($(UCLIBC_CONFIG_FILE),)
+ifneq ($(UCLIBC_CONFIG),)
 UPDATE_ALL_CONFIG_TARGETS += uclibc-update-config
 endif
 
-- 
1.7.10.4
