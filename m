From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 24 May 2017 13:30:29 -0700
Subject: [Buildroot] [PATCH 1/2] package: acpica: Add host buildling support
In-Reply-To: <20170524203030.8187-1-alistair.francis@xilinx.com>
References: <20170524203030.8187-1-alistair.francis@xilinx.com>
Message-ID: <20170524203030.8187-2-alistair.francis@xilinx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support to build the ACPICA package for the host. This is useful for
the iasl command which is required to build some packaged, including Xen
tools

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
 package/acpica/acpica.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index 37e4941a6..96d0dad2b 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -11,6 +11,11 @@ ACPICA_LICENSE = BSD-3-Clause or GPL-2.0
 ACPICA_LICENSE_FILES = source/include/acpi.h
 ACPICA_DEPENDENCIES = host-bison host-flex
 
+define HOST_ACPICA_BUILD_CMDS
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		all
+endef
+
 define ACPICA_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
 		HARDWARE_NAME=$(BR2_ARCH) HOST=_LINUX CC="$(TARGET_CC)" \
@@ -23,4 +28,11 @@ define ACPICA_INSTALL_TARGET_CMDS
 		INSTALLFLAGS=-m755 install
 endef
 
+define HOST_ACPICA_INSTALL_CMDS
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		DESTDIR="$(HOST_DIR)" \
+		INSTALLFLAGS=-m755 install
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.11.0
