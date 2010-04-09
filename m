From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Apr 2010 11:06:46 +0200
Subject: [Buildroot] [PATCH 08/44] cdrkit: new package
In-Reply-To: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1ef21e7bd454e531286d33c720e9f49ace3ecc6a.1270803901.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Supported both for the target and the host. Will be used by the root
filesystem generation code, thanks to genisoimage.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in        |    1 +
 package/cdrkit/Config.in |   11 ++++++++
 package/cdrkit/cdrkit.mk |   63 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 75 insertions(+), 0 deletions(-)
 create mode 100644 package/cdrkit/Config.in
 create mode 100644 package/cdrkit/cdrkit.mk

diff --git a/package/Config.in b/package/Config.in
index f3f4213..0dac949 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -146,6 +146,7 @@ endmenu
 
 menu "Hardware handling"
 source "package/acpid/Config.in"
+source "package/cdrkit/Config.in"
 source "package/cramfs/Config.in"
 source "package/dbus/Config.in"
 source "package/dbus-glib/Config.in"
diff --git a/package/cdrkit/Config.in b/package/cdrkit/Config.in
new file mode 100644
index 0000000..2e25581
--- /dev/null
+++ b/package/cdrkit/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_CDRKIT
+       # Needed for libbz
+       select BR2_PACKAGE_BZIP2
+       select BR2_PACKAGE_LIBCAP
+       bool "cdrkit"
+       help
+         cdrkit is a suite of programs for recording CDs and DVDs,
+         blanking CD-RW media, creating ISO-9660 filesystem images,
+         extracting audio CD data, and more.
+
+	 http://www.cdrkit.org/
diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
new file mode 100644
index 0000000..a6a2e80
--- /dev/null
+++ b/package/cdrkit/cdrkit.mk
@@ -0,0 +1,63 @@
+CDRKIT_VERSION=1.1.10
+CDRKIT_SOURCE=cdrkit-$(CDRKIT_VERSION).tar.gz
+CDRKIT_SITE=http://www.cdrkit.org/releases/
+
+CDRKIT_DEPENDENCIES=libcap bzip2 host-cmake
+HOST_CDRKIT_DEPENDENCIES=host-libcap host-cmake host-bzip2
+
+ifeq ($(BR2_ENDIAN),"BIG")
+CMAKE_ENDIAN_OPT=-DBITFIELDS_HTOL=1
+else
+CMAKE_ENDIAN_OPT=-DBITFIELDS_HTOL=0
+endif
+
+define CDRKIT_CONFIGURE_CMDS
+ -mkdir $(@D)/build
+ (cd $(@D)/build ; \
+	$(HOST_DIR)/usr/bin/cmake .. \
+		-Wno-dev \
+		-DCMAKE_SYSTEM_NAME:STRING="Linux" \
+		-DCMAKE_C_COMPILER:FILEPATH="$(TARGET_CC)" \
+		-DCMAKE_CXX_COMPILER:FILEPATH="$(TARGET_CXX)" \
+		-DCMAKE_C_FLAGS:STRING="$(TARGET_CFLAGS)" \
+		-DCMAKE_EXE_LINKER_FLAGS:STRING="$(TARGET_LDFLAGS)" \
+		-DCMAKE_MODULE_LINKER_FLAGS:STRING="$(TARGET_LDFLAGS)" \
+		-DCMAKE_SHARED_LINKER_FLAGS:STRING="$(TARGET_LDFLAGS)" \
+		-DCMAKE_FIND_ROOT_PATH:PATH="$(STAGING_DIR)" \
+		-DCMAKE_INSTALL_PREFIX:PATH="$(TARGET_DIR)/usr" \
+		$(CMAKE_ENDIAN_OPT) \
+ )
+endef
+
+define CDRKIT_BUILD_CMDS
+ $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/build
+endef
+
+define CDRKIT_INSTALL_TARGET_CMDS
+ $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/build install
+endef
+
+define HOST_CDRKIT_CONFIGURE_CMDS
+ -mkdir $(@D)/build
+ (cd $(@D)/build ; \
+	$(HOST_DIR)/usr/bin/cmake .. \
+		-Wno-dev \
+		-DCMAKE_C_FLAGS="$(HOST_CFLAGS)" \
+		-DCMAKE_EXE_LINKER_FLAGS:STRING="$(HOST_LDFLAGS)" \
+		-DCMAKE_MODULE_LINKER_FLAGS:STRING="$(HOST_LDFLAGS)" \
+		-DCMAKE_SHARED_LINKER_FLAGS:STRING="$(HOST_LDFLAGS)" \
+		-DCMAKE_INSTALL_PREFIX:STRING="$(HOST_DIR)/usr" \
+ )
+endef
+
+define HOST_CDRKIT_BUILD_CMDS
+ $(HOST_MAKE_ENV) $(MAKE) -C $(@D)/build
+endef
+
+define HOST_CDRKIT_INSTALL_CMDS
+ $(HOST_MAKE_ENV) $(MAKE) -C $(@D)/build  install
+endef
+
+$(eval $(call GENTARGETS,package,cdrkit))
+$(eval $(call GENTARGETS,package,cdrkit,host))
+
-- 
1.6.3.3
