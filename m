From: Romain Perier <romain.perier@free-electrons.com>
Date: Tue, 23 Aug 2016 14:19:50 +0200
Subject: [Buildroot] [PATCH v5 7/7] package/amd-catalyst: Add support for
	OpenCL
In-Reply-To: <20160823121950.16826-1-romain.perier@free-electrons.com>
References: <20160823121950.16826-1-romain.perier@free-electrons.com>
Message-ID: <20160823121950.16826-8-romain.perier@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The AMD Catalyst Linux driver includes OpenCL libraries for GPGPU
computing. This commits adds support to install the binary blobs and ICD
profiles.

Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
---

Changes in v5:
 - Don't install libraries in /usr/lib32 or /usr/lib64, these symlinks
   don't exist. We prefer install these libs into /usr/lib directly
 - Changed the corresponding code to install libs to these paths
 - Use absolute file name for 'clinfo'

 package/amd-catalyst/Config.in       |  6 ++++++
 package/amd-catalyst/amd-catalyst.mk | 24 ++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/package/amd-catalyst/Config.in b/package/amd-catalyst/Config.in
index e325bc0..8b884f6 100644
--- a/package/amd-catalyst/Config.in
+++ b/package/amd-catalyst/Config.in
@@ -70,4 +70,10 @@ config BR2_PACKAGE_AMD_CATALYST_MODULE
 	help
 	  Builds and install the fglrx kernel module
 
+config BR2_PACKAGE_AMD_CATALYST_OPENCL
+	bool "OpenCL support"
+	help
+	  Installs the OpenCL binary blobs and the ICD profile
+	  for GPGPU computing.
+
 endif # BR2_PACKAGE_AMD_CATALYST
diff --git a/package/amd-catalyst/amd-catalyst.mk b/package/amd-catalyst/amd-catalyst.mk
index 2226b70..6f7c9ce 100644
--- a/package/amd-catalyst/amd-catalyst.mk
+++ b/package/amd-catalyst/amd-catalyst.mk
@@ -39,6 +39,29 @@ endef
 $(eval $(kernel-module))
 endif
 
+ifeq ($(BR2_PACKAGE_AMD_CATALYST_OPENCL),y)
+
+AMD_CATALYST_OCL_SUFFIX = $(if $(BR2_x86_64),64,32)
+AMD_CATALYST_OPENCL_FILES = \
+	libOpenCL.so.1 \
+	libaticalcl.so \
+	libamdocl$(AMD_CATALYST_OCL_SUFFIX).so \
+	libamdocl12cl$(AMD_CATALYST_OCL_SUFFIX).so
+
+define AMD_CATALYST_INSTALL_OPENCL
+	$(foreach f,$(AMD_CATALYST_OPENCL_FILES), \
+		$(INSTALL) -D -m 0755 $(AMD_CATALYST_ARCH_DIR)/usr/lib$(AMD_CATALYST_LIB_SUFFIX)/$(f) $(TARGET_DIR)/usr/lib/$(f)
+	)
+	ln -sf libOpenCL.so.1 \
+		$(TARGET_DIR)/usr/lib/libOpenCL.so
+	$(INSTALL) -m 0755 $(AMD_CATALYST_ARCH_DIR)/usr/bin/clinfo \
+		$(TARGET_DIR)/usr/bin/clinfo
+	$(INSTALL) -D -m 0644 $(AMD_CATALYST_ARCH_DIR)/etc/OpenCL/vendors/amdocl$(AMD_CATALYST_OCL_SUFFIX).icd \
+		$(TARGET_DIR)/etc/OpenCL/vendors/amdocl$(AMD_CATALYST_OCL_SUFFIX).icd
+endef
+
+endif
+
 ifeq ($(BR2_PACKAGE_AMD_CATALYST_XORG), y)
 
 # GL headers are needed by any package that wants to use libgl, so they need to
@@ -147,6 +170,7 @@ define AMD_CATALYST_INSTALL_TARGET_CMDS
 	$(call AMD_CATALYST_INSTALL_XORG)
 	$(call AMD_CATALYST_INSTALL_CMDLINE_TOOLS)
 	$(call AMD_CATALYST_INSTALL_CCCLE)
+	$(call AMD_CATALYST_INSTALL_OPENCL)
 endef
 
 $(eval $(generic-package))
-- 
2.9.3
