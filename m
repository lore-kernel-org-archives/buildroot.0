From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 20 Jul 2017 16:35:18 +0200
Subject: [Buildroot] [PATCH v8 07/10] core: sanitize RPATH in staging tree
	to make a relocatable SDK
In-Reply-To: <1500561321-6623-1-git-send-email-wg@grandegger.com>
References: <1500561321-6623-1-git-send-email-wg@grandegger.com>
Message-ID: <1500561321-6623-8-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When calling "make sdk" we also sanitize the staging tree. Therefore
"sdk" must depend on all packages.

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

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 3019081..c54c420 100644
--- a/Makefile
+++ b/Makefile
@@ -553,9 +553,11 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 world: target-post-image
 
 .PHONY: sdk
-sdk: toolchain
+sdk: toolchain $(PACKAGES)
 	@$(call MESSAGE,"Rendering the SDK relocatable")
 	$(TOPDIR)/support/scripts/fix-rpath host
+	@$(call MESSAGE,"Sanitizing RPATH in staging tree")
+	$(TOPDIR)/support/scripts/fix-rpath staging
 
 # Compatibility symlink in case a post-build script still uses $(HOST_DIR)/usr
 $(HOST_DIR)/usr: $(HOST_DIR)
-- 
2.7.4
