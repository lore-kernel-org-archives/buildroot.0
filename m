From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 28 Apr 2020 16:45:59 +0200
Subject: [Buildroot] [PATCH v6 2/4] package/environment-setup: add configure
 alias
In-Reply-To: <1588085161-28104-1-git-send-email-angelo@amarulasolutions.com>
References: <1588085161-28104-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <1588085161-28104-2-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Angelo Compagnucci <angelo.compagnucci@gmail.com>

In order to simplify the usage of a buildroot toolchain within
the buildroot shell, a "configure" alias is provided to call
./configure with the correct flags.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 docs/manual/using-buildroot-toolchain.txt      | 4 ++--
 package/environment-setup/environment-setup    | 1 +
 package/environment-setup/environment-setup.mk | 2 ++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/docs/manual/using-buildroot-toolchain.txt b/docs/manual/using-buildroot-toolchain.txt
index 98dae6c..fbe25a9 100644
--- a/docs/manual/using-buildroot-toolchain.txt
+++ b/docs/manual/using-buildroot-toolchain.txt
@@ -32,8 +32,8 @@ BR2_PACKAGE_HOST_ENVIRONMENT_SETUP, you can have a +setup-environment+ script
 installed in +output/host/+.
 This script can be sourced with +. your/sdk/path/environment-setup+ to launch
 the buildroot shell. Inside this shell, you will find an environment already
-set up with the correct PATH and the complete list of +target configure
-options+.
+set up with the correct PATH, the complete list of +target configure
+options+ and some useful commands.
 
 Alternatively, if you just want to prepare the SDK without generating
 the tarball (e.g. because you will just be moving the +host+ directory,
diff --git a/package/environment-setup/environment-setup b/package/environment-setup/environment-setup
index b48f197..db652fe 100644
--- a/package/environment-setup/environment-setup
+++ b/package/environment-setup/environment-setup
@@ -11,6 +11,7 @@ Some tips:
 * PATH is now pointing to the HOST_DIR path
 * Target configure options are already exported
 * To configure do "./configure $CONFIGURE_FLAGS"
+* Alternatively use the alias "configure"
 
 EOF
 SDK_PATH=$(dirname $(realpath "${BASH_SOURCE[0]}"))
diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
index 6d2396f..138710c 100644
--- a/package/environment-setup/environment-setup.mk
+++ b/package/environment-setup/environment-setup.mk
@@ -22,6 +22,8 @@ define HOST_ENVIRONMENT_SETUP_INSTALL_CMDS
 		--sysconfdir=/etc \
 		--localstatedir=/var \
 		--program-prefix=\"\n" >> $(ENVIRONMENT_SETUP_FILE)
+	printf "alias configure=\"./configure \$${CONFIGURE_FLAGS}\"\n" \
+		>> $(ENVIRONMENT_SETUP_FILE)
 	$(SED) $(ENVIRONMENT_SETUP_HOST_BIN_DIR_SED_EXP) \
 		-e $(ENVIRONMENT_SETUP_HOST_DIR_SED_EXP) \
 		-e '/^export "PATH=/c\' \
-- 
2.7.4
