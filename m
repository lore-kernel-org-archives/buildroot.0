From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 25 Apr 2020 14:48:34 +0200
Subject: [Buildroot] [PATCH v4 1/3] package/environment-setup: new package
Message-ID: <20200425124836.122729-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Install an helper script to setup a build environment based on buildroot.
It's useful when a developer wants to use a buildroot generated sdk to
build an external project.
Due to the nature of the intrusiveness of this script, a new PS1 is
installed to let the user understand that the current running shell is
not a normal shell.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
Changelog:
v1->v2:
 * Moved from echo to printf (Yann)
 * removed sh extension (Yann)
 * Adding missing script
v2->v3:
 * Split the patch
v3->v4:
 * Better handling of SDK_PATH dir (Mircea Gliga)

Some of the reason I kept several things the way I originally planned:

 * I kept it being a package because it doesn't fit in any other tool:
   indeed this script changes your curent PATH and exports some variables
   that can be used for anything. Think of qmake or cmake or a package
   that doesn't have any build system at all. It has some features geared
   also towards autotools software but I keep planning others.
 * I kept the script being installed in host root: other build system does that
   and I want this script to mimic other build systems.
 * I kept looping in TARGET_CONFIGURE_OPTS, indeed it produces a more clean
   environment script at the end. For the problem arised by Yann: variables in
   TARGET_CONFIGURE_OPTS _are_ properly escaped, indeed if not they were a
   big source of problems on each ./configure invocation due to the fact they
are
   injected on the ./configure commandline invocation.
 * I kept the PS1: this script heavily mess with the path, it is expected by the
   user running it, but it can be very confusing being on a shell that
   doesn't behaves like your normal shell. So having a different PS1 helps
   remembering you are running into the buildroot shell and not into an ordinary
   one (other build systems does the same).
 * I kept the manual entry: I think that the most documentation the better.

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
index 9a6461277e..81f45bfaaf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1953,6 +1953,7 @@ menu "Miscellaneous"
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
2.25.1
