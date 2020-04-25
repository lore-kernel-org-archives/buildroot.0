From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 25 Apr 2020 14:48:36 +0200
Subject: [Buildroot] [PATCH v4 3/3] package/environment-setup: add cmake
 alias
In-Reply-To: <20200425124836.122729-1-angelo@amarulasolutions.com>
References: <20200425124836.122729-1-angelo@amarulasolutions.com>
Message-ID: <20200425124836.122729-3-angelo@amarulasolutions.com>
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
index db652fe090..7c3ddda18b 100644
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
index bd74dcb2f4..0f3c954b65 100644
--- a/package/environment-setup/environment-setup.mk
+++ b/package/environment-setup/environment-setup.mk
@@ -23,6 +23,9 @@ define ENVIRONMENT_SETUP_INSTALL_TARGET_CMDS
 		--program-prefix=\"\n" >> $(ENVIRONMENT_SETUP_FILE)
 	printf "alias configure=\"./configure \$${CONFIGURE_FLAGS}\"\n" \
 		>> $(ENVIRONMENT_SETUP_FILE)
+	printf "alias cmake=\"cmake \
+		-DCMAKE_TOOLCHAIN_FILE=$(HOST_DIR)/share/buildroot/toolchainfile.cmake \
+		-DCMAKE_INSTALL_PREFIX=/usr\"\n" >> $(ENVIRONMENT_SETUP_FILE)
 	$(SED) $(ENVIRONMENT_SETUP_HOST_DIR_SED_EXP) $(ENVIRONMENT_SETUP_FILE)
 	printf "PS1=\"\[\e[32m\]buildroot-$(BR2_VERSION)\[\e[m\]:\[\e[34m\]\w\[\e[m\]\$$ \"\n" \
 		>> $(ENVIRONMENT_SETUP_FILE)
-- 
2.25.1
