From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 20 Apr 2020 23:52:27 +0200
Subject: [Buildroot] [PATCH v3 2/3] package/environment-setup: add configure
 alias
In-Reply-To: <20200420215228.16175-1-angelo@amarulasolutions.com>
References: <20200420215228.16175-1-angelo@amarulasolutions.com>
Message-ID: <20200420215228.16175-3-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
index 7b2de4bdfa..187ffd472b 100644
--- a/docs/manual/using-buildroot-toolchain.txt
+++ b/docs/manual/using-buildroot-toolchain.txt
@@ -31,8 +31,8 @@ For your convenience, by selecting the package BR2_PACKAGE_ENVIRONMENT_SETUP,
 you can have a +setup-environment+ script installed in +output/host/+.
 This script can be sourced with +. your/sdk/path/environment-setup+ to launch
 the buildroot shell. Inside this shell, you will find an environment already
-set up with the correct PATH and the complete list of +target configure
-options+.
+set up with the correct PATH, the complete list of +target configure
+options+ and some useful commands.
 
 Alternatively, if you just want to prepare the SDK without generating
 the tarball (e.g. because you will just be moving the +host+ directory,
diff --git a/package/environment-setup/environment-setup b/package/environment-setup/environment-setup
index 8819e9f60a..20a6ffb3af 100644
--- a/package/environment-setup/environment-setup
+++ b/package/environment-setup/environment-setup
@@ -11,6 +11,7 @@ Some tips:
 * PATH is now pointing to the HOST_DIR path
 * Target configure options are already exported
 * To configure do "./configure $CONFIGURE_FLAGS"
+* Alternatively use the alias "configure"
 
 EOF
 SDK_PATH=$(dirname "${BASH_SOURCE[0]}")
diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
index fc74594459..bd74dcb2f4 100644
--- a/package/environment-setup/environment-setup.mk
+++ b/package/environment-setup/environment-setup.mk
@@ -21,6 +21,8 @@ define ENVIRONMENT_SETUP_INSTALL_TARGET_CMDS
 		--sysconfdir=/etc \
 		--localstatedir=/var \
 		--program-prefix=\"\n" >> $(ENVIRONMENT_SETUP_FILE)
+	printf "alias configure=\"./configure \$${CONFIGURE_FLAGS}\"\n" \
+		>> $(ENVIRONMENT_SETUP_FILE)
 	$(SED) $(ENVIRONMENT_SETUP_HOST_DIR_SED_EXP) $(ENVIRONMENT_SETUP_FILE)
 	printf "PS1=\"\[\e[32m\]buildroot-$(BR2_VERSION)\[\e[m\]:\[\e[34m\]\w\[\e[m\]\$$ \"\n" \
 		>> $(ENVIRONMENT_SETUP_FILE)
-- 
2.17.1
