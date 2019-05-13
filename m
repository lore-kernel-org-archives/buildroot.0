From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Mon, 13 May 2019 22:15:57 +0200
Subject: [Buildroot] [PATCH 1/6] boot/optee-os: install trusted shared
 libraries
Message-ID: <20190513201602.2549-1-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install generated trusted shared libraries in the target file
system next to the trusted applications.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 boot/optee-os/Config.in   | 14 +++++++-------
 boot/optee-os/optee-os.mk |  8 ++++++--
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index a1f1b910ac..2f129bcc59 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -70,16 +70,16 @@ config BR2_TARGET_OPTEE_OS_SDK
 	  installed in the staging directory /lib/optee.
 
 config BR2_TARGET_OPTEE_OS_SERVICES
-	bool "Build service TAs"
+	bool "Service trusted application and shared libraries"
 	default y
 	select BR2_TARGET_OPTEE_OS_CORE
 	help
-	  This option installs the service trusted applications built
-	  from OP-TEE OS source tree. These are installed in the target
-	  /lib/optee_armtz directory as other trusted applications.
-	  At runtime OP-TEE OS can load trusted applications from this
-	  non-secure filesystem/directory into the secure world for
-	  execution.
+	  This option installs the service trusted applications and
+	  trusted shared libraries built from OP-TEE OS source tree.
+	  These are installed in target /lib/optee_armtz directory
+	  as other trusted applications. At runtime OP-TEE OS can
+	  load these from this non-secure filesystem/directory into
+	  the secure world for execution.
 
 config BR2_TARGET_OPTEE_OS_PLATFORM
 	string "Target platform (mandatory)"
diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index 6da20a9f3e..811bbbc6ea 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -77,8 +77,12 @@ endif # BR2_TARGET_OPTEE_OS_CORE
 ifeq ($(BR2_TARGET_OPTEE_OS_SERVICES),y)
 define OPTEE_OS_INSTALL_IMAGES_SERVICES
 	mkdir -p $(TARGET_DIR)/lib/optee_armtz
-	$(INSTALL) -D -m 444 -t $(TARGET_DIR)/lib/optee_armtz \
-		$(@D)/$(OPTEE_OS_BUILDDIR_OUT)/ta/*/*.ta
+	[ -z "$(wildcard $(@D)/$(OPTEE_OS_BUILDDIR_OUT)/ta/*/*.ta)" ] || \
+		$(INSTALL) -D -m 444 -t $(TARGET_DIR)/lib/optee_armtz \
+			$(@D)/$(OPTEE_OS_BUILDDIR_OUT)/ta/*/*.ta
+	[ -z "$(wildcard $(OPTEE_OS_SDK)/lib/*.ta)" ] || \
+		$(INSTALL) -D -m 444 -t $(TARGET_DIR)/lib/optee_armtz \
+			$(OPTEE_OS_SDK)/lib/*.ta
 endef
 endif # BR2_TARGET_OPTEE_OS_SERVICES
 
-- 
2.17.1
