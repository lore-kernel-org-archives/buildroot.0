From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 13 Jul 2015 10:18:45 +0200
Subject: [Buildroot] [PATCH v2 2/4] package/patchelf: add
	HOST_FIX_RPATH_HOOK to TARGET_FINALIZE_HOOKS
In-Reply-To: <1436775527-2484-1-git-send-email-s.martin49@gmail.com>
References: <1436775527-2484-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1436775527-2484-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds host-patchelf as a target-finalize dependency, and
introduces the HOST_FIX_RPATH_HOOK hook fixing the ELF files' RPATH of
the host tree (excluding the sysroot).

After running this hook, the RPATH from any host ELF files is relative to
the binary location itself.

Note that, we avoid to fix RPATH in the sysroot, and in the external
toolcahin installation location.

As a first step toward a fully relocatable SDK, this change allows to get
the toolchain relocatable, but not yet the whole SDK.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/patchelf/patchelf.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/patchelf/patchelf.mk b/package/patchelf/patchelf.mk
index 043224d..c831fcd 100644
--- a/package/patchelf/patchelf.mk
+++ b/package/patchelf/patchelf.mk
@@ -10,3 +10,15 @@ PATCHELF_LICENSE = GPLv3+
 PATCHELF_LICENSE_FILES = COPYING
 
 $(eval $(host-autotools-package))
+
+target-finalize: host-patchelf
+
+define HOST_FIX_RPATH_HOOK
+	$(TOPDIR)/support/scripts/fix_rpaths \
+		set $(HOST_DIR) \
+		--patchelf-program $(HOST_DIR)/usr/bin/patchelf \
+		--libdirs $(HOST_DIR)/usr/lib \
+		--exclude-dirs sysroot opt/ext-toolchain
+endef
+
+TARGET_FINALIZE_HOOKS += HOST_FIX_RPATH_HOOK
-- 
2.4.5
