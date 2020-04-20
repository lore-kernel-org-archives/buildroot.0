From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 20 Apr 2020 23:52:26 +0200
Subject: [Buildroot] [PATCH v3 1/3] package/environment-setup: new package
In-Reply-To: <20200420215228.16175-1-angelo@amarulasolutions.com>
References: <20200420215228.16175-1-angelo@amarulasolutions.com>
Message-ID: <20200420215228.16175-2-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install an helper script to setup a build environment based on buildroot.
It's useful when a developer wants to use a buildroot generated sdk to
build an external project.
Due to the nature of the intrusiveness of this script, a new PS1 is
installed to let the user understand that the current running shell is
not a normal shell.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 docs/manual/using-buildroot-toolchain.txt     |  7 +++++
 package/Config.in                             |  1 +
 package/environment-setup/Config.in           |  6 ++++
 package/environment-setup/environment-setup   | 16 ++++++++++
 .../environment-setup/environment-setup.mk    | 29 +++++++++++++++++++
 5 files changed, 59 insertions(+)
 create mode 100644 package/environment-setup/Config.in
 create mode 100644 package/environment-setup/environment-setup
 create mode 100644 package/environment-setup/environment-setup.mk

diff --git a/docs/manual/using-buildroot-toolchain.txt b/docs/manual/using-buildroot-toolchain.txt
index 0c0c35fced..7b2de4bdfa 100644
--- a/docs/manual/using-buildroot-toolchain.txt
+++ b/docs/manual/using-buildroot-toolchain.txt
@@ -27,6 +27,13 @@ Upon extracting the SDK tarball, the user must run the script
 +relocate-sdk.sh+ (located at the top directory of the SDK), to make
 sure all paths are updated with the new location.
 
+For your convenience, by selecting the package BR2_PACKAGE_ENVIRONMENT_SETUP,
+you can have a +setup-environment+ script installed in +output/host/+.
+This script can be sourced with +. your/sdk/path/environment-setup+ to launch
+the buildroot shell. Inside this shell, you will find an environment already
+set up with the correct PATH and the complete list of +target configure
+options+.
+
 Alternatively, if you just want to prepare the SDK without generating
 the tarball (e.g. because you will just be moving the +host+ directory,
 or will be generating the tarball on your own), Buildroot also allows
diff --git a/package/Config.in b/package/Config.in
index a9c6f6fcbc..b4bcb16ffb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1952,6 +1952,7 @@ menu "Miscellaneous"
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
diff --git a/package/environment-setup/environment-setup b/package/environment-setup/environment-setup
new file mode 100644
index 0000000000..8819e9f60a
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
+SDK_PATH=$(dirname "${BASH_SOURCE[0]}")
diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
new file mode 100644
index 0000000000..fc74594459
--- /dev/null
+++ b/package/environment-setup/environment-setup.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# environment-setup
+#
+################################################################################
+
+ENVIRONMENT_SETUP_FILE = $(HOST_DIR)/environment-setup
+ENVIRONMENT_SETUP_HOST_DIR_SED_EXP = 's+$(HOST_DIR)+\$$SDK_PATH+g'
+
+define ENVIRONMENT_SETUP_INSTALL_TARGET_CMDS
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
+	$(SED) $(ENVIRONMENT_SETUP_HOST_DIR_SED_EXP) $(ENVIRONMENT_SETUP_FILE)
+	printf "PS1=\"\[\e[32m\]buildroot-$(BR2_VERSION)\[\e[m\]:\[\e[34m\]\w\[\e[m\]\$$ \"\n" \
+		>> $(ENVIRONMENT_SETUP_FILE)
+endef
+
+$(eval $(generic-package))
-- 
2.17.1
