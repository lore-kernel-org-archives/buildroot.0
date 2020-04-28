From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 28 Apr 2020 16:46:00 +0200
Subject: [Buildroot] [PATCH v6 3/4] package/environment-setup: add cmake
 alias
In-Reply-To: <1588085161-28104-1-git-send-email-angelo@amarulasolutions.com>
References: <1588085161-28104-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <1588085161-28104-3-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Angelo Compagnucci <angelo.compagnucci@gmail.com>

In order to simplify the usage of a buildroot toolchain within
the buildroot shell, a "cmake" alias is provided to call cmake
with the correct toolchain file and options.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/environment-setup/environment-setup    | 1 +
 package/environment-setup/environment-setup.mk | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/package/environment-setup/environment-setup b/package/environment-setup/environment-setup
index db652fe..7c3ddda 100644
--- a/package/environment-setup/environment-setup
+++ b/package/environment-setup/environment-setup
@@ -12,6 +12,7 @@ Some tips:
 * Target configure options are already exported
 * To configure do "./configure $CONFIGURE_FLAGS"
 * Alternatively use the alias "configure"
+* A "cmake" alias is available
 
 EOF
 SDK_PATH=$(dirname $(realpath "${BASH_SOURCE[0]}"))
diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
index 138710c..ba85691 100644
--- a/package/environment-setup/environment-setup.mk
+++ b/package/environment-setup/environment-setup.mk
@@ -24,6 +24,9 @@ define HOST_ENVIRONMENT_SETUP_INSTALL_CMDS
 		--program-prefix=\"\n" >> $(ENVIRONMENT_SETUP_FILE)
 	printf "alias configure=\"./configure \$${CONFIGURE_FLAGS}\"\n" \
 		>> $(ENVIRONMENT_SETUP_FILE)
+	printf "alias cmake=\"cmake \
+		-DCMAKE_TOOLCHAIN_FILE=$(HOST_DIR)/share/buildroot/toolchainfile.cmake \
+		-DCMAKE_INSTALL_PREFIX=/usr\"\n" >> $(ENVIRONMENT_SETUP_FILE)
 	$(SED) $(ENVIRONMENT_SETUP_HOST_BIN_DIR_SED_EXP) \
 		-e $(ENVIRONMENT_SETUP_HOST_DIR_SED_EXP) \
 		-e '/^export "PATH=/c\' \
-- 
2.7.4
