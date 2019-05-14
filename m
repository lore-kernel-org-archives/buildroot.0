From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 14 May 2019 10:53:14 +0200
Subject: [Buildroot] [PATCH v4 2/7] boot/optee-os: install trusted shared
 libraries
In-Reply-To: <20190514085319.9031-1-etienne.carriere@linaro.org>
References: <20190514085319.9031-1-etienne.carriere@linaro.org>
Message-ID: <20190514085319.9031-2-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install generated trusted shared libraries in the target file
system next to the trusted applications.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
Changes v3 -> v4:
- Fix trusted shared libraries install source path
Changes v2 -> v3:
- Install shared trusted libs from OPTEE_OS_LOCAL_SDK (build
  dir) instead of $(OPTEE_OS_SDK) (staging dir) that is
  populated only upon BR2_TARGET_OPTEE_OS_SDK=y.
Changes v1 -> v2:
- Fixes on .ta file install commands move to a specific patch
- Fix BR2_TARGET_OPTEE_OS_SERVICES 1-string description
- Replace conditional commands in .ta files install commands
  with Makefile script level conditionals
---
 boot/optee-os/Config.in   | 14 +++++++-------
 boot/optee-os/optee-os.mk |  3 +++
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index a1f1b910ac..4cb05798e5 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -70,16 +70,16 @@ config BR2_TARGET_OPTEE_OS_SDK
 	  installed in the staging directory /lib/optee.
 
 config BR2_TARGET_OPTEE_OS_SERVICES
-	bool "Build service TAs"
+	bool "Build service TAs and libs"
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
index b22f560ba7..bd415512c7 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -79,6 +79,9 @@ define OPTEE_OS_INSTALL_TARGET_CMDS
 	$(if $(wildcard $(@D)/$(OPTEE_OS_BUILDDIR_OUT)/ta/*/*.ta),
 		$(INSTALL) -D -m 444 -t $(TARGET_DIR)/lib/optee_armtz \
 			$(@D)/$(OPTEE_OS_BUILDDIR_OUT)/ta/*/*.ta)
+	$(if $(wildcard $(@D)/$(OPTEE_OS_LOCAL_SDK)/lib/*.ta),
+		$(INSTALL) -D -m 444 -t $(TARGET_DIR)/lib/optee_armtz \
+			$(@D)/$(OPTEE_OS_LOCAL_SDK)/lib/*.ta)
 endef
 endif # BR2_TARGET_OPTEE_OS_SERVICES
 
-- 
2.17.1
