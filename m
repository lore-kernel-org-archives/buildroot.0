From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Jan 2013 00:41:39 +0100
Subject: [Buildroot] [PATCH 5/6] toolchain/kernel-headers: sprinkle with
	some calls to MESSAGE
In-Reply-To: <cover.1358379198.git.yann.morin.1998@free.fr>
References: <cover.1358379198.git.yann.morin.1998@free.fr>
Message-ID: <5747aa962b6e9d53c7cd0dbd75f391c8999dda70.1358379198.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thus, the failing step can be easily extracted by autobuilders,
to ease with post-mortem analysis.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 toolchain/kernel-headers/kernel-headers.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/toolchain/kernel-headers/kernel-headers.mk b/toolchain/kernel-headers/kernel-headers.mk
index 568c192..53c4a58 100644
--- a/toolchain/kernel-headers/kernel-headers.mk
+++ b/toolchain/kernel-headers/kernel-headers.mk
@@ -48,6 +48,7 @@ endif
 LINUX_HEADERS_DEPENDS:=
 
 $(LINUX_HEADERS_UNPACK_DIR)/.unpacked: $(DL_DIR)/$(LINUX_HEADERS_SOURCE)
+	$(Q)$(call MESSAGE,"Extracting kernel headers")
 	rm -rf $(LINUX_HEADERS_DIR)
 	$(INSTALL) -d $(@D)
 	$(LINUX_HEADERS_CAT) $(DL_DIR)/$(LINUX_HEADERS_SOURCE) | \
@@ -55,6 +56,7 @@ $(LINUX_HEADERS_UNPACK_DIR)/.unpacked: $(DL_DIR)/$(LINUX_HEADERS_SOURCE)
 	touch $@
 
 $(LINUX_HEADERS_UNPACK_DIR)/.patched: $(LINUX_HEADERS_UNPACK_DIR)/.unpacked $(LINUX_HEADERS_DEPENDS)
+	$(Q)$(call MESSAGE,"Patching kernel headers")
 	support/scripts/apply-patches.sh $(LINUX_HEADERS_UNPACK_DIR) toolchain/kernel-headers \
 		linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
 ifneq ($(KERNEL_HEADERS_PATCH_DIR),)
@@ -64,6 +66,7 @@ endif
 	touch $@
 
 $(LINUX_HEADERS_DIR)/.configured: $(LINUX_HEADERS_UNPACK_DIR)/.patched
+	$(Q)$(call MESSAGE,"Installing kernel headers")
 	(cd $(LINUX_HEADERS_UNPACK_DIR); \
 	 $(MAKE) ARCH=$(KERNEL_ARCH) \
 		HOSTCC="$(HOSTCC)" HOSTCFLAGS="$(HOSTCFLAGS)" \
-- 
1.7.2.5
