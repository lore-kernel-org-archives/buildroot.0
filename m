From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Mon, 15 Jun 2020 18:28:20 -0500
Subject: [Buildroot] [PATCH v1 1/1] package/openjdk-bin: use libraries from
 host pkgs
Message-ID: <20200615232820.18254-1-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to remove libfreetype.so as it is created by host-freetype
and other packages fail with the version of libfreetype.so provided
by host-openjdk-bin such as host-xapp_mkfontscale.

Update to add host variant of lksctp-tools, remove libsctp.so, and
add host-lksctp-tools dependency.

Two other libraries are included by host-opensdk-bin that could be
provided by other packages being built from source however they have
issues and have not been included in this update:
* Add host variant of libnet, remove libnet.so,
  and add host-libnet dependency. However, this causes openjdk to
  hang during the build and is not included.
* Remove libzip.so and add host-libzip dependency. However, this
  currently causes host-zip to fail to build and is not included.

Bug tracker - https://bugs.busybox.net/show_bug.cgi?id=13001

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
---
 package/lksctp-tools/lksctp-tools.mk |  1 +
 package/openjdk-bin/openjdk-bin.mk   | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/lksctp-tools/lksctp-tools.mk b/package/lksctp-tools/lksctp-tools.mk
index 5ac794e842..ace11ecc97 100644
--- a/package/lksctp-tools/lksctp-tools.mk
+++ b/package/lksctp-tools/lksctp-tools.mk
@@ -20,3 +20,4 @@ endef
 LKSCTP_TOOLS_POST_INSTALL_TARGET_HOOKS += LKSCTP_TOOLS_CLEANUP_TARGET
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index 31dc4a4666..6660d7ef03 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -11,18 +11,31 @@ HOST_OPENJDK_BIN_SOURCE = OpenJDK14U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VE
 HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk14-binaries/releases/download/jdk-$(HOST_OPENJDK_BIN_VERSION_MAJOR)%2B$(HOST_OPENJDK_BIN_VERSION_MINOR)
 HOST_OPENJDK_BIN_LICENSE = GPL-2.0+ with exception
 HOST_OPENJDK_BIN_LICENSE_FILES = legal/java.prefs/LICENSE legal/java.prefs/ASSEMBLY_EXCEPTION
+HOST_OPENJDK_BIN_DEPENDENCIES = \
+	host-freetype \
+	host-lksctp-tools
 
 # unpack200 has an invalid RPATH and relies on libzlib. When
 # host-libzlib is installed on the system, the error "ERROR: package
 # host-libzlib installs executables without proper RPATH: will occur.
 # Because unpack200 is a deprecated tool, removing it to fix this
 # issue is safe.
+# Dependency on host-freetype creates an up to date libfreetype.so so
+# libfreetype.so is removed from host-openjdk-bin after extract.
+# Dependency on host-lksctp-tools creates an up to date libsctp.so so
+# libsctp.so is removed from host-openjdk-bin after extract.
+define HOST_OPENJDK_BIN_CLEANUP
+	$(RM) -f $(@D)/bin/unpack200
+	$(RM) -f $(@D)/lib/libfreetype.so
+	$(RM) -f $(@D)/lib/libsctp.so
+endef
+HOST_OPENJDK_BIN_POST_EXTRACT_HOOKS += HOST_OPENJDK_BIN_CLEANUP
+
 define HOST_OPENJDK_BIN_INSTALL_CMDS
 	mkdir -p $(HOST_DIR)/bin
 	cp -dpfr $(@D)/bin/* $(HOST_DIR)/bin/
 	mkdir -p $(HOST_DIR)/lib
 	cp -dpfr $(@D)/lib/* $(HOST_DIR)/lib/
-	$(RM) -f $(HOST_DIR)/bin/unpack200
 endef
 
 $(eval $(host-generic-package))
-- 
2.17.1
