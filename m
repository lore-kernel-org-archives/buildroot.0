From: Wolfgang Grandegger <wg@grandegger.com>
Date: Fri,  3 Mar 2017 15:18:47 +0100
Subject: [Buildroot] [RFC PATCH 3/9] core: sanitize HOST_DIR at the very end
	of the build
In-Reply-To: <1488550733-3956-1-git-send-email-wg@grandegger.com>
References: <1488550733-3956-1-git-send-email-wg@grandegger.com>
Message-ID: <1488550733-3956-4-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel Martin <s.martin49@gmail.com>

This patch adds host-patchelf to the list of package to build, and use
it in the SANITIZE_RPATH_HOST helper.

This SANITIZE_RPATH_HOST helper is executed in the world target, which
ensure:
- to be built after the target-post-image target (because of the
  dependency);
- to always be built since it is the only dependency of the all (and
  default) target.

The SANITIZE_RPATH_HOST helper calls patchelf to fix the ELF files'
RPATH from the HOST_DIR location (excluding the sysroot).

After running this helper is run, the RPATH from any host ELF files is
relative to the binary location itself.

Notes:
- we avoid to fix RPATH in the sysroot.
- we do not try to fix RPATH in the external toolchain installation
  location as they may have been built in a way, this is already
  correct; furthermore, attempting to fix RPATH in those programs may
  result in breaking them.
- the whole host directory is processed because a number of
  host-package install programs that could be useful in places
  different from $(HOST_DIR)/{bin,sbin,usr/bin,usr/sbin}.
- the shared libraries are also processed in case they have a 'main'
  function.

As a step toward a fully relocatable SDK, this change allows to get the
toolchain relocatable, but not yet the whole SDK.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 Makefile | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Makefile b/Makefile
index 0308f9b..54c815b 100644
--- a/Makefile
+++ b/Makefile
@@ -543,7 +543,19 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
+# RPATH fixing
+# - The host hook sets RPATH in host ELF binaries, using relative paths to the
+#   library locations.
+PACKAGES += host-patchelf
+
+define SANITIZE_RPATH_HOST
+	PATCHELF=$(HOST_DIR)/usr/bin/patchelf \
+	$(TOPDIR)/support/scripts/fix-rpath host $(HOST_DIR)
+endef
+
 world: target-post-image
+	@$(call MESSAGE,"Rendering the SDK relocatable")
+	$(SANITIZE_RPATH_HOST)
 
 .PHONY: all world toolchain dirs clean distclean source outputmakefile \
 	legal-info legal-info-prepare legal-info-clean printvars help \
-- 
1.9.1
