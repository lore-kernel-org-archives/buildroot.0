From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 18 Apr 2020 12:31:08 +0200
Subject: [Buildroot] [PATCH] package/environment-setup: new package
Message-ID: <20200418103108.1877-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install an helper script to setup a build environment
based on buildroot. It's useful when you export an sdk
and want to use buildroot to build an external project.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 docs/manual/using-buildroot-toolchain.txt     |  7 +++++
 package/Config.in                             |  1 +
 package/environment-setup/Config.in           |  6 ++++
 .../environment-setup/environment-setup.mk    | 28 +++++++++++++++++++
 4 files changed, 42 insertions(+)
 create mode 100644 package/environment-setup/Config.in
 create mode 100644 package/environment-setup/environment-setup.mk

diff --git a/docs/manual/using-buildroot-toolchain.txt b/docs/manual/using-buildroot-toolchain.txt
index 0c0c35fced..15096cfec8 100644
--- a/docs/manual/using-buildroot-toolchain.txt
+++ b/docs/manual/using-buildroot-toolchain.txt
@@ -27,6 +27,13 @@ Upon extracting the SDK tarball, the user must run the script
 +relocate-sdk.sh+ (located at the top directory of the SDK), to make
 sure all paths are updated with the new location.
 
+For your convenience, by selecting the package BR2_PACKAGE_ENVIRONMENT_SETUP,
+you can have a +setup-environment.sh+ script installed in +output/host/+.
+This script can be sourced with +. environment-setup.sh+ to launch
+the buildroot shell. Inside this shell, you will find an environment already
+set up with the correct PATH, the complete list of +target configure+
+variables and some useful commands like the +configure+ alias.
+
 Alternatively, if you just want to prepare the SDK without generating
 the tarball (e.g. because you will just be moving the +host+ directory,
 or will be generating the tarball on your own), Buildroot also allows
diff --git a/package/Config.in b/package/Config.in
index ccf54f2417..eff51d7451 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1949,6 +1949,7 @@ menu "Miscellaneous"
 	source "package/collectl/Config.in"
 	source "package/domoticz/Config.in"
 	source "package/empty/Config.in"
+	source "package/environment-setup/Config.in"
 	source "package/gnuradio/Config.in"
 	source "package/googlefontdirectory/Config.in"
 	source "package/gqrx/Config.in"
diff --git a/package/environment-setup/Config.in b/package/environment-setup/Config.in
new file mode 100644
index 0000000000..f0fcc7d0f8
--- /dev/null
+++ b/package/environment-setup/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_ENVIRONMENT_SETUP
+	bool "Environment setup"
+	help
+	  Install an helper script to setup a build environment
+	  based on buildroot. It's useful when you export an sdk
+	  and want to use buildroot to build an external project
diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
new file mode 100644
index 0000000000..840ee2a1a0
--- /dev/null
+++ b/package/environment-setup/environment-setup.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# environment-setup
+#
+################################################################################
+
+ENVIRONMENT_SETUP_FILE = $(HOST_DIR)/environment-setup.sh
+ENVIRONMENT_SETUP_SED_EXP = --expression='s+$(HOST_DIR)+\$$SDK_PATH+g'
+
+define ENVIRONMENT_SETUP_INSTALL_TARGET_CMDS
+	cp package/environment-setup/environment-setup.sh $(ENVIRONMENT_SETUP_FILE)
+	for var in $(TARGET_CONFIGURE_OPTS); do \
+		echo export \"$$var\" | sed $(ENVIRONMENT_SETUP_SED_EXP) >> $(ENVIRONMENT_SETUP_FILE); \
+	done
+	echo export \"CROSS_COMPILE=$(TARGET_CROSS)\" | sed $(ENVIRONMENT_SETUP_SED_EXP) >> $(ENVIRONMENT_SETUP_FILE)
+	echo export \"CONFIGURE_FLAGS=--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--exec-prefix=/usr \
+		--sysconfdir=/etc \
+		--localstatedir=/var \
+		--program-prefix=\" >> $(ENVIRONMENT_SETUP_FILE)
+	echo "PS1=\"\[\e[32m\]buildroot-$(BR2_VERSION)\[\e[m\]:\[\e[34m\]\w\[\e[m\]\$$ \"" >> $(ENVIRONMENT_SETUP_FILE)
+	echo alias "configure=\"./configure \$${CONFIGURE_FLAGS}\"" >> $(ENVIRONMENT_SETUP_FILE)
+endef
+
+$(eval $(generic-package))
-- 
2.17.1
