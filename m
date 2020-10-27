From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 27 Oct 2020 09:01:40 -0500
Subject: [Buildroot] [PATCH] package/environment-setup: new package
Message-ID: <20201027140140.47982-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Install an helper script to setup a build environment based on buildroot.
It's useful when a developer wants to use a buildroot generated sdk to
build an external project.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Tested-by: Michael Trimarchi <michael@amarulasolutions.com>
Tested-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Maury Anderson <maury.anderson@collins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---

Reviving a patch from this series.
http://patchwork.ozlabs.org/project/buildroot/patch/1588085161-28104-1-git-send-email-angelo at amarulasolutions.com/

Changes v6 -> new v1
(Maury)
 - Adjusted host tool naming in menuconfig to be prefixed with "host "
---
 docs/manual/using-buildroot-toolchain.txt     |  8 +++++
 package/Config.in.host                        |  1 +
 package/environment-setup/Config.in.host      |  6 ++++
 package/environment-setup/environment-setup   | 16 +++++++++
 .../environment-setup/environment-setup.mk    | 34 +++++++++++++++++++
 5 files changed, 65 insertions(+)
 create mode 100644 package/environment-setup/Config.in.host
 create mode 100644 package/environment-setup/environment-setup
 create mode 100644 package/environment-setup/environment-setup.mk

diff --git a/docs/manual/using-buildroot-toolchain.txt b/docs/manual/using-buildroot-toolchain.txt
index 0c0c35fced..98dae6cdcc 100644
--- a/docs/manual/using-buildroot-toolchain.txt
+++ b/docs/manual/using-buildroot-toolchain.txt
@@ -27,6 +27,14 @@ Upon extracting the SDK tarball, the user must run the script
 +relocate-sdk.sh+ (located at the top directory of the SDK), to make
 sure all paths are updated with the new location.
 
+For your convenience, by selecting the host package
+BR2_PACKAGE_HOST_ENVIRONMENT_SETUP, you can have a +setup-environment+ script
+installed in +output/host/+.
+This script can be sourced with +. your/sdk/path/environment-setup+ to launch
+the buildroot shell. Inside this shell, you will find an environment already
+set up with the correct PATH and the complete list of +target configure
+options+.
+
 Alternatively, if you just want to prepare the SDK without generating
 the tarball (e.g. because you will just be moving the +host+ directory,
 or will be generating the tarball on your own), Buildroot also allows
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
index 0000000000..d3604525a5
--- /dev/null
+++ b/package/environment-setup/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_ENVIRONMENT_SETUP
+	bool "host environment setup"
+	help
+	  Install an helper script to setup a build environment
+	  based on buildroot. It's useful when you export an sdk
+	  and want to use buildroot to build an external project
diff --git a/package/environment-setup/environment-setup b/package/environment-setup/environment-setup
new file mode 100644
index 0000000000..b48f1979d6
--- /dev/null
+++ b/package/environment-setup/environment-setup
@@ -0,0 +1,16 @@
+cat <<'EOF'
+ _           _ _     _                 _
+| |__  _   _(_) | __| |_ __ ___   ___ | |_
+| '_ \| | | | | |/ _` | '__/ _ \ / _ \| __|
+| |_) | |_| | | | (_| | | | (_) | (_) | |_
+|_.__/ \__,_|_|_|\__,_|_|  \___/ \___/ \__| shell
+
+       Making embedded Linux easy!
+
+Some tips:
+* PATH is now pointing to the HOST_DIR path
+* Target configure options are already exported
+* To configure do "./configure $CONFIGURE_FLAGS"
+
+EOF
+SDK_PATH=$(dirname $(realpath "${BASH_SOURCE[0]}"))
diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
new file mode 100644
index 0000000000..6d2396f8f1
--- /dev/null
+++ b/package/environment-setup/environment-setup.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# environment-setup
+#
+################################################################################
+
+ENVIRONMENT_SETUP_FILE = $(HOST_DIR)/environment-setup
+ENVIRONMENT_SETUP_HOST_DIR_SED_EXP = 's+$(HOST_DIR)+\$$SDK_PATH+g'
+ENVIRONMENT_SETUP_HOST_BIN_DIR_SED_EXP = 's+$(HOST_DIR)/bin/++g'
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
+	$(SED) $(ENVIRONMENT_SETUP_HOST_BIN_DIR_SED_EXP) \
+		-e $(ENVIRONMENT_SETUP_HOST_DIR_SED_EXP) \
+		-e '/^export "PATH=/c\' \
+		$(ENVIRONMENT_SETUP_FILE)
+	printf "export \"PATH=\$$SDK_PATH/bin:\$$SDK_PATH/sbin:\$$PATH\"\n" \
+		>> $(ENVIRONMENT_SETUP_FILE)
+
+endef
+
+$(eval $(host-generic-package))
-- 
2.17.1
