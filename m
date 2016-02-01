From: Samuel Martin <s.martin49@gmail.com>
Date: Mon,  1 Feb 2016 16:53:36 +0100
Subject: [Buildroot] [PATCH v6 08/13] core: add HOST_SANITIZE_RPATH_HOOK to
	TARGET_FINALIZE_HOOKS
In-Reply-To: <1454342021-22960-1-git-send-email-s.martin49@gmail.com>
References: <1454342021-22960-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1454342021-22960-9-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds host-patchelf as a target-finalize dependency, and
introduces the HOST_SANITIZE_RPATH_HOOK hook to fix the ELF files'
RPATH from the HOST_DIR location (excluding the sysroot).

After running this hook, the RPATH from any host ELF files is relative to
the binary location itself.

Notes:
- we avoid to fix RPATH in the sysroot.
- we do not try to fix RPATH in the external toolchain installation
  location as they may have been built in a way, this is already correct;
  furthermore, fixing RPATH in those programs may result in breaking them.
- the whole host directory is processed because a number of
  host-package install programs that could be useful in places
  different from $(HOST_DIR)/{bin,sbin,usr/bin,usr/sbin}.
- the shared libraries are also processed in case they have a 'main'
  function.

As a step toward a fully relocatable SDK, this change allows to get the
toolchain relocatable, but not yet the whole SDK.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
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
 Makefile | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Makefile b/Makefile
index 7c87177..b1f4fcf 100644
--- a/Makefile
+++ b/Makefile
@@ -616,6 +616,31 @@ endef
 TARGET_FINALIZE_HOOKS += PURGE_LOCALES
 endif
 
+# RPATH fixing
+# - The host hook sets RPATH in host ELF binaries, using relative paths to the
+#   library locations.
+# - The target hook sanitizes RPATH in target ELF binaries, removing paths
+#   pointing to package's build directories or the sysroot's libdirs.
+PACKAGES += host-patchelf
+
+ifeq ($(BR2_DEBUG_RPATH),)
+BR2_DEBUG_RPATH = 0
+endif
+ifeq ($(BR2_DEBUG_RPATH),0)
+DEBUG_RPATH = 0
+else
+DEBUG_RPATH = $(shell echo $$(($(BR2_DEBUG_RPATH)+1)))
+endif
+
+define HOST_SANITIZE_RPATH_HOOK
+	DEBUG=$(DEBUG_RPATH) \
+	PATCHELF=$(HOST_DIR)/usr/bin/patchelf \
+	READELF=readelf \
+		$(TOPDIR)/support/scripts/fix-rpath host $(HOST_DIR)
+endef
+
+TARGET_FINALIZE_HOOKS += HOST_SANITIZE_RPATH_HOOK
+
 $(TARGETS_ROOTFS): target-finalize
 
 target-finalize: $(PACKAGES)
-- 
2.7.0
