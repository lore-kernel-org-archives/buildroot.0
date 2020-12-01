From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 1 Dec 2020 21:52:46 +0100
Subject: [Buildroot] [git commit] package/environment-setup: add better
 kernel handling
Message-ID: <20201203092228.11383821E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a8a87345589adc1477e552c5b26c03988826ac0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Exporting ARCH and KERNELDIR makes easier to compile an external kernel
or out of tree kernel modules.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/environment-setup/environment-setup    | 1 +
 package/environment-setup/environment-setup.mk | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/package/environment-setup/environment-setup b/package/environment-setup/environment-setup
index 813aa01c7a..e9bc36fdd0 100644
--- a/package/environment-setup/environment-setup
+++ b/package/environment-setup/environment-setup
@@ -10,6 +10,7 @@ cat <<'EOF'
 Some tips:
 * PATH now contains the SDK utilities
 * Standard autotools variables (CC, LD, CFLAGS) are exported
+* Kernel compilation variables (ARCH, CROSS_COMPILE, KERNELDIR) are exported
 * To configure do "./configure $CONFIGURE_FLAGS" or use
   the "configure" alias
 * To build CMake-based projects, use the "cmake" alias
diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
index fb87c6f0b7..fcad013f0d 100644
--- a/package/environment-setup/environment-setup.mk
+++ b/package/environment-setup/environment-setup.mk
@@ -11,6 +11,7 @@ define HOST_ENVIRONMENT_SETUP_INSTALL_CMDS
 	for var in $(TARGET_CONFIGURE_OPTS); do \
 		printf "export \"$$var\"\n" >> $(ENVIRONMENT_SETUP_FILE); \
 	done
+	printf "export \"ARCH=$(KERNEL_ARCH)\"\n" >> $(ENVIRONMENT_SETUP_FILE)
 	printf "export \"CROSS_COMPILE=$(TARGET_CROSS)\"\n" >> $(ENVIRONMENT_SETUP_FILE)
 	printf "export \"CONFIGURE_FLAGS=--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
@@ -31,6 +32,10 @@ define HOST_ENVIRONMENT_SETUP_INSTALL_CMDS
 		$(ENVIRONMENT_SETUP_FILE)
 	printf "export \"PATH=\$$SDK_PATH/bin:\$$SDK_PATH/sbin:\$$PATH\"\n" \
 		>> $(ENVIRONMENT_SETUP_FILE)
+
+	$(if $(BR2_LINUX_KERNEL),\
+		printf "export \"KERNELDIR=$(LINUX_BUILDDIR)\"\n" \
+			>> $(ENVIRONMENT_SETUP_FILE),)
 endef
 
 $(eval $(host-generic-package))
