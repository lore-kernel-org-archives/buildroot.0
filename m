From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 20 Jul 2017 16:35:17 +0200
Subject: [Buildroot] [PATCH v8 06/10] core: introduce "sdk" target to make a
	relocatable SDK
In-Reply-To: <1500561321-6623-1-git-send-email-wg@grandegger.com>
References: <1500561321-6623-1-git-send-email-wg@grandegger.com>
Message-ID: <1500561321-6623-7-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We use a separate make target to build a relocatable SDK.
We first sanitize the RPATH in host tree depending on
the toolchain.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index d4faa02..3019081 100644
--- a/Makefile
+++ b/Makefile
@@ -552,6 +552,11 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 .PHONY: world
 world: target-post-image
 
+.PHONY: sdk
+sdk: toolchain
+	@$(call MESSAGE,"Rendering the SDK relocatable")
+	$(TOPDIR)/support/scripts/fix-rpath host
+
 # Compatibility symlink in case a post-build script still uses $(HOST_DIR)/usr
 $(HOST_DIR)/usr: $(HOST_DIR)
 	@ln -snf . $@
@@ -1001,6 +1006,7 @@ help:
 	@echo 'Build:'
 	@echo '  all                    - make world'
 	@echo '  toolchain              - build toolchain'
+	@echo '  sdk                    - build relocatable SDK'
 	@echo
 	@echo 'Configuration:'
 	@echo '  menuconfig             - interactive curses-based configurator'
-- 
2.7.4
