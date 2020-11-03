From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Nov 2020 22:40:53 +0100
Subject: [Buildroot] [git commit] package/environment-setup: add configure
 alias
Message-ID: <20201103213047.58FC58713D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=26cb4e72e18a41bf24030cce64b281c740847426
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to simplify the usage of a buildroot toolchain within
the buildroot shell, a "configure" alias is provided to call
./configure with the correct flags.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/using-buildroot-toolchain.txt      | 7 ++++---
 package/environment-setup/environment-setup    | 3 ++-
 package/environment-setup/environment-setup.mk | 2 ++
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/docs/manual/using-buildroot-toolchain.txt b/docs/manual/using-buildroot-toolchain.txt
index 7a8b0c4c78..110be5939f 100644
--- a/docs/manual/using-buildroot-toolchain.txt
+++ b/docs/manual/using-buildroot-toolchain.txt
@@ -42,6 +42,7 @@ variables that will help cross-compile your projects using the
 Buildroot SDK: the +PATH+ will contain the SDK binaries, standard
 _autotools_ variables will be defined with the appropriate values, and
 +CONFIGURE_FLAGS+ will contain basic +./configure+ options to
-cross-compile _autotools_ projects. Note however that once this script
-is sourced, the environment is setup only for cross-compilation, and
-no longer for native compilation.
+cross-compile _autotools_ projects. It also provides some useful
+commands. Note however that once this script is sourced, the
+environment is setup only for cross-compilation, and no longer for
+native compilation.
diff --git a/package/environment-setup/environment-setup b/package/environment-setup/environment-setup
index 6846361433..58701e4c71 100644
--- a/package/environment-setup/environment-setup
+++ b/package/environment-setup/environment-setup
@@ -10,7 +10,8 @@ cat <<'EOF'
 Some tips:
 * PATH now contains the SDK utilities
 * Standard autotools variables (CC, LD, CFLAGS) are exported
-* To configure do "./configure $CONFIGURE_FLAGS"
+* To configure do "./configure $CONFIGURE_FLAGS" or use
+  the "configure" alias
 
 EOF
 SDK_PATH=$(dirname $(realpath "${BASH_SOURCE[0]}"))
diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
index 98b976acf7..be36cd452b 100644
--- a/package/environment-setup/environment-setup.mk
+++ b/package/environment-setup/environment-setup.mk
@@ -20,6 +20,8 @@ define HOST_ENVIRONMENT_SETUP_INSTALL_CMDS
 		--sysconfdir=/etc \
 		--localstatedir=/var \
 		--program-prefix=\"\n" >> $(ENVIRONMENT_SETUP_FILE)
+	printf "alias configure=\"./configure \$${CONFIGURE_FLAGS}\"\n" \
+		>> $(ENVIRONMENT_SETUP_FILE)
 	$(SED) 's%$(HOST_DIR)%\$$SDK_PATH%g' \
 		-e 's%$(HOST_DIR)/bin/%%g' \
 		-e '/^export "PATH=/c\' \
