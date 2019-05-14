From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 May 2019 17:46:44 +0200
Subject: [Buildroot] [git commit] boot/optee-os: install trusted shared
 libraries
Message-ID: <20190514154132.8E2598A3DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b978a2a1e7a8a5e0514ea71f2243e339850f47e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install generated trusted shared libraries in the target file
system next to the trusted applications.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
