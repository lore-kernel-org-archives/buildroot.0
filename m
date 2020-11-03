From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Nov 2020 22:28:17 +0100
Subject: [Buildroot] [git commit] package/environment-setup: new package
Message-ID: <20201103211541.C65B682DD8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f56a715e3cc6ac49e3a0b701329419e5acae8532
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install an helper script to setup a build environment based on
Buildroot. It's useful when a developer wants to use a Buildroot
generated SDK to build an external project.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Tested-by: Michael Trimarchi <michael@amarulasolutions.com>
Tested-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Maury Anderson <maury.anderson@collins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/using-buildroot-toolchain.txt      | 13 +++++++++++
 package/Config.in.host                         |  1 +
 package/environment-setup/Config.in.host       |  6 +++++
 package/environment-setup/environment-setup    | 16 +++++++++++++
 package/environment-setup/environment-setup.mk | 31 ++++++++++++++++++++++++++
 5 files changed, 67 insertions(+)

diff --git a/docs/manual/using-buildroot-toolchain.txt b/docs/manual/using-buildroot-toolchain.txt
index 0c0c35fced..7a8b0c4c78 100644
--- a/docs/manual/using-buildroot-toolchain.txt
+++ b/docs/manual/using-buildroot-toolchain.txt
@@ -32,3 +32,16 @@ the tarball (e.g. because you will just be moving the +host+ directory,
 or will be generating the tarball on your own), Buildroot also allows
 you to just prepare the SDK with +make prepare-sdk+ without actually
 generating a tarball.
+
+For your convenience, by selecting the option
++BR2_PACKAGE_HOST_ENVIRONMENT_SETUP+, you can get a
++setup-environment+ script installed in +output/host/+ and therefore
+in your SDK.  This script can be sourced with
++. your/sdk/path/environment-setup+ to export a number of environment
+variables that will help cross-compile your projects using the
+Buildroot SDK: the +PATH+ will contain the SDK binaries, standard
+_autotools_ variables will be defined with the appropriate values, and
++CONFIGURE_FLAGS+ will contain basic +./configure+ options to
+cross-compile _autotools_ projects. Note however that once this script
+is sourced, the environment is setup only for cross-compilation, and
+no longer for native compilation.
diff --git a/package/Config.in.host b/package/Config.in.host
index 546f1c226d..c69c756f3a 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -19,6 +19,7 @@ menu "Host utilities"
 	source "package/dtc/Config.in.host"
 	source "package/e2fsprogs/Config.in.host"
 	source "package/e2tools/Config.in.host"
+	source "package/environment-setup/Config.in.host"
 	source "package/erofs-utils/Config.in.host"
 	source "package/eudev/Config.in.host"
 	source "package/exfatprogs/Config.in.host"
diff --git a/package/environment-setup/Config.in.host b/package/environment-setup/Config.in.host
new file mode 100644
index 0000000000..c67e375732
--- /dev/null
+++ b/package/environment-setup/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_ENVIRONMENT_SETUP
+	bool "host environment-setup"
+	help
+	  Install an helper script to setup a build environment
+	  based on Buildroot. It's useful when you export an sdk
+	  and want to use Buildroot to build an external project.
diff --git a/package/environment-setup/environment-setup b/package/environment-setup/environment-setup
new file mode 100644
index 0000000000..6846361433
--- /dev/null
+++ b/package/environment-setup/environment-setup
@@ -0,0 +1,16 @@
+cat <<'EOF'
+ _           _ _     _                 _
+| |__  _   _(_) | __| |_ __ ___   ___ | |_
+| '_ \| | | | | |/ _` | '__/ _ \ / _ \| __|
+| |_) | |_| | | | (_| | | | (_) | (_) | |_
+|_.__/ \__,_|_|_|\__,_|_|  \___/ \___/ \__|
+
+       Making embedded Linux easy!
+
+Some tips:
+* PATH now contains the SDK utilities
+* Standard autotools variables (CC, LD, CFLAGS) are exported
+* To configure do "./configure $CONFIGURE_FLAGS"
+
+EOF
+SDK_PATH=$(dirname $(realpath "${BASH_SOURCE[0]}"))
diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
new file mode 100644
index 0000000000..98b976acf7
--- /dev/null
+++ b/package/environment-setup/environment-setup.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# environment-setup
+#
+################################################################################
+
+ENVIRONMENT_SETUP_FILE = $(HOST_DIR)/environment-setup
+
+define HOST_ENVIRONMENT_SETUP_INSTALL_CMDS
+	cp package/environment-setup/environment-setup $(ENVIRONMENT_SETUP_FILE)
+	for var in $(TARGET_CONFIGURE_OPTS); do \
+		printf "export \"$$var\"\n" >> $(ENVIRONMENT_SETUP_FILE); \
+	done
+	printf "export \"CROSS_COMPILE=$(TARGET_CROSS)\"\n" >> $(ENVIRONMENT_SETUP_FILE)
+	printf "export \"CONFIGURE_FLAGS=--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--exec-prefix=/usr \
+		--sysconfdir=/etc \
+		--localstatedir=/var \
+		--program-prefix=\"\n" >> $(ENVIRONMENT_SETUP_FILE)
+	$(SED) 's%$(HOST_DIR)%\$$SDK_PATH%g' \
+		-e 's%$(HOST_DIR)/bin/%%g' \
+		-e '/^export "PATH=/c\' \
+		$(ENVIRONMENT_SETUP_FILE)
+	printf "export \"PATH=\$$SDK_PATH/bin:\$$SDK_PATH/sbin:\$$PATH\"\n" \
+		>> $(ENVIRONMENT_SETUP_FILE)
+endef
+
+$(eval $(host-generic-package))
