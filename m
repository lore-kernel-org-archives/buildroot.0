From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Nov 2020 22:43:33 +0100
Subject: [Buildroot] [git commit] package/environment-setup: add cmake alias
Message-ID: <20201103213047.681448713D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df17721f885d5433b1ea6c3afd75d33d781f1426
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to simplify the usage of a buildroot toolchain within
the buildroot shell, a "cmake" alias is provided to call cmake
with the correct toolchain file and options.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/environment-setup/environment-setup    | 1 +
 package/environment-setup/environment-setup.mk | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/package/environment-setup/environment-setup b/package/environment-setup/environment-setup
index 58701e4c71..813aa01c7a 100644
--- a/package/environment-setup/environment-setup
+++ b/package/environment-setup/environment-setup
@@ -12,6 +12,7 @@ Some tips:
 * Standard autotools variables (CC, LD, CFLAGS) are exported
 * To configure do "./configure $CONFIGURE_FLAGS" or use
   the "configure" alias
+* To build CMake-based projects, use the "cmake" alias
 
 EOF
 SDK_PATH=$(dirname $(realpath "${BASH_SOURCE[0]}"))
diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
index be36cd452b..fb87c6f0b7 100644
--- a/package/environment-setup/environment-setup.mk
+++ b/package/environment-setup/environment-setup.mk
@@ -22,6 +22,9 @@ define HOST_ENVIRONMENT_SETUP_INSTALL_CMDS
 		--program-prefix=\"\n" >> $(ENVIRONMENT_SETUP_FILE)
 	printf "alias configure=\"./configure \$${CONFIGURE_FLAGS}\"\n" \
 		>> $(ENVIRONMENT_SETUP_FILE)
+	printf "alias cmake=\"cmake \
+		-DCMAKE_TOOLCHAIN_FILE=$(HOST_DIR)/share/buildroot/toolchainfile.cmake \
+		-DCMAKE_INSTALL_PREFIX=/usr\"\n" >> $(ENVIRONMENT_SETUP_FILE)
 	$(SED) 's%$(HOST_DIR)%\$$SDK_PATH%g' \
 		-e 's%$(HOST_DIR)/bin/%%g' \
 		-e '/^export "PATH=/c\' \
