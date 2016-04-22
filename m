From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 22 Apr 2016 22:50:16 +0200
Subject: [Buildroot] [PATCH v9 04/11] core: sanitize HOST_DIR at the very
	end of the build
In-Reply-To: <1461358223-18312-1-git-send-email-s.martin49@gmail.com>
References: <1461358223-18312-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1461358223-18312-5-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds host-patchelf to the list of package to build, and use
it in the SANITIZE_RPATH_HOST helper.

This SANITIZE_RPATH_HOST helper is executed in the world target, which
ensure:
- to be built after the target-post-image target (because of the
  dependency);
- to always be built since it is the only dependency of the all (and
  default) target.

The SANITIZE_RPATH_HOST helper fixes the ELF files' RPATH from the
HOST_DIR location (excluding the sysroot).

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
changes v8->v9:
- remove irrelevant comment (ThomasP)
- move the helper call to the world target instead of as a
  target-finalize hooks (ThomasP)

changes v7->v8:
- none

changes v6->v7:
- remove the DEBUG env. var. specific handling in Makefile, now just
  place the variable in the Buildroot environment, to enable debug logs.
  This is documented in a follow-up patch of this series.

changes v5->v6:
- update for the new script version
- add debug mode support

changes v4->v5:
- add verbose support

changes v3->v4:
- add host-patchelf to PACKAGES instead of target-finalize (Baruch)
- add comment

changes v2->v3:
- move hook in Makefile (Baruch)
---
 Makefile | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Makefile b/Makefile
index a05b9e1..0c9bb98 100644
--- a/Makefile
+++ b/Makefile
@@ -526,7 +526,20 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
+# RPATH fixing
+# - The host hook sets RPATH in host ELF binaries, using relative paths to the
+#   library locations.
+PACKAGES += host-patchelf
+
+define SANITIZE_RPATH_HOST
+	PATCHELF=$(HOST_DIR)/usr/bin/patchelf \
+	READELF=readelf \
+	$(TOPDIR)/support/scripts/fix-rpath host $(HOST_DIR)
+endef
+
 world: target-post-image
+	@$(call MESSAGE,"Rendering the SDK relocatable")
+	$(SANITIZE_RPATH_HOST)
 
 .PHONY: all world toolchain dirs clean distclean source outputmakefile \
 	legal-info legal-info-prepare legal-info-clean printvars help \
-- 
2.8.0
