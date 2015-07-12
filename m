From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 12 Jul 2015 18:26:33 +0200
Subject: [Buildroot] [PATCH 4/6] package/pkg-utils: add a
	POST_HOST_INSTALL_FIX_RPATH helper
In-Reply-To: <1436718395-10536-1-git-send-email-s.martin49@gmail.com>
References: <1436718395-10536-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1436718395-10536-5-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This helper iterates on all ELF files from the HOST_DIR to fix the
RPATH.
This helper will be used as a post install hook for host packages in
the generic infrastructure in a follow-up patch.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/pkg-utils.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index e38485d..ead6756 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -76,6 +76,11 @@ get_rpaths = $(eval __rp :=) \
 fix_rpaths = $(HOST_DIR)/usr/bin/patchelf 2>/dev/null --set-rpath \
 	$(subst XORIGIN,\$$ORIGIN,$(call get_rpaths,$(1),$(2),$(3))) $(2) ;
 
+define POST_HOST_INSTALL_FIX_RPATH
+    $(foreach p,$(shell find $(HOST_DIR) -type f -executable -a ! -path '*/sysroot/*'),$(call \
+		fix_rpaths,$(HOST_DIR),$(p),$(HOST_DIR)/usr/lib))
+endef
+
 #
 # Manipulation of .config files based on the Kconfig
 # infrastructure. Used by the BusyBox package, the Linux kernel
-- 
2.4.5
