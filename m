From: Wolfgang Grandegger <wg@grandegger.com>
Date: Fri, 21 Jul 2017 15:14:11 +0200
Subject: [Buildroot] [PATCH v9 1/3] core: introduce "sdk" target to make a
	relocatable SDK
In-Reply-To: <1500642853-5565-1-git-send-email-wg@grandegger.com>
References: <1500642853-5565-1-git-send-email-wg@grandegger.com>
Message-ID: <1500642853-5565-2-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We use a separate make target to build a relocatable SDK. We first
sanitize the RPATH in host tree. Next we also sanitize the
staging tree. Therefore "sdk" must depend world.

Sanitizing staging is not really needed, in the sense that any rpath
in there is simply not going to be used. We want to sanitize staging
for the following reasons:

- To avoid leaking references to the original output directory. This
  way, we can validate that the SDK is relocatable by running a simple
  "grep -r ${BASE_DIR} ${HOST_DIR}". Obviously RPATH sanitization is
  not sufficient (e.g. also the references to source files have to be
  stripped), but it's a step in the right direction. This reason is
  obviously only relevant for the SDK.

- To make sure that when an executable is copied to target that it
  actually executes correctly. Since within Buildroot we never copy
  stuff from staging to target, this is clearly only relevant for
  the SDK.

Finally we install the script "relocate-sdk.sh" into the top directory
of the SDK (HOST_DIR) and the SDK location path is stored in the file
"HOST_DIR/share/buildroot/sdk-location"-

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Makefile b/Makefile
index d4faa02..4e432dd 100644
--- a/Makefile
+++ b/Makefile
@@ -552,6 +552,14 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 .PHONY: world
 world: target-post-image
 
+.PHONY: sdk
+sdk: world
+	@$(call MESSAGE,"Rendering the SDK relocatable")
+	$(TOPDIR)/support/scripts/fix-rpath host
+	$(TOPDIR)/support/scripts/fix-rpath staging
+	install $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)
+	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
+
 # Compatibility symlink in case a post-build script still uses $(HOST_DIR)/usr
 $(HOST_DIR)/usr: $(HOST_DIR)
 	@ln -snf . $@
@@ -1001,6 +1009,7 @@ help:
 	@echo 'Build:'
 	@echo '  all                    - make world'
 	@echo '  toolchain              - build toolchain'
+	@echo '  sdk                    - build relocatable SDK'
 	@echo
 	@echo 'Configuration:'
 	@echo '  menuconfig             - interactive curses-based configurator'
-- 
2.7.4
