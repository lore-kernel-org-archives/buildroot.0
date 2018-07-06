From: Celso Varella <celso.neto.cwi@datacom.com.br>
Date: Fri,  6 Jul 2018 11:36:13 -0300
Subject: [Buildroot] [PATCH 2/3] gnu-efi: add host variant
In-Reply-To: <1530887774-19479-1-git-send-email-celso.neto.cwi@datacom.com.br>
References: <1530887774-19479-1-git-send-email-celso.neto.cwi@datacom.com.br>
Message-ID: <1530887774-19479-3-git-send-email-celso.neto.cwi@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It will be required by host-sbsigntools (forthcoming package).

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/gnu-efi/gnu-efi.mk | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index d55e027..b106010 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -26,6 +26,12 @@ else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
 GNU_EFI_PLATFORM = aarch64
 endif
 
+ifeq ($(HOSTARCH),x86)
+HOST_GNU_EFI_PLATFORM = ia32
+else
+HOST_GNU_EFI_PLATFORM = $(HOSTARCH)
+endif
+
 define GNU_EFI_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		$(TARGET_CONFIGURE_OPTS) \
@@ -39,4 +45,18 @@ define GNU_EFI_INSTALL_STAGING_CMDS
 		PREFIX=/usr ARCH=$(GNU_EFI_PLATFORM) install
 endef
 
+define HOST_GNU_EFI_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(HOST_CONFIGURE_OPTS) \
+		ARCH=$(HOST_GNU_EFI_PLATFORM)
+endef
+
+define HOST_GNU_EFI_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(HOST_CONFIGURE_OPTS) \
+		INSTALLROOT=$(HOST_DIR) \
+		PREFIX= ARCH=$(HOST_GNU_EFI_PLATFORM) install
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.7.4
