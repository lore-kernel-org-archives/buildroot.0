From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 19:16:18 +0200
Subject: [Buildroot] [git commit] package/amd-catalyst: Add support for
	OpenCL
Message-ID: <20160902142939.908977FB67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ceb02c00ff88624f900fa4203745d5ce535b87b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The AMD Catalyst Linux driver includes OpenCL libraries for GPGPU
computing. This commits adds support to install the binary blobs and ICD
profiles.

Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/amd-catalyst/Config.in       |  6 ++++++
 package/amd-catalyst/amd-catalyst.mk | 24 ++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/package/amd-catalyst/Config.in b/package/amd-catalyst/Config.in
index 55099ac..96e7f06 100644
--- a/package/amd-catalyst/Config.in
+++ b/package/amd-catalyst/Config.in
@@ -73,4 +73,10 @@ config BR2_PACKAGE_AMD_CATALYST_MODULE
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
index 07eb0fa..3097353 100644
--- a/package/amd-catalyst/amd-catalyst.mk
+++ b/package/amd-catalyst/amd-catalyst.mk
@@ -41,6 +41,29 @@ AMD_CATALYST_POST_PATCH_HOOKS += AMD_CATALYST_PREPARE_MODULE
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
@@ -145,6 +168,7 @@ define AMD_CATALYST_INSTALL_TARGET_CMDS
 	$(call AMD_CATALYST_INSTALL_XORG)
 	$(call AMD_CATALYST_INSTALL_CMDLINE_TOOLS)
 	$(call AMD_CATALYST_INSTALL_CCCLE)
+	$(call AMD_CATALYST_INSTALL_OPENCL)
 endef
 
 $(eval $(generic-package))
