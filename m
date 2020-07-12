From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 11:20:27 +0200
Subject: [Buildroot] [git commit] support/dependencies: add
 BR2_NEEDS_HOST_GCC_PLUGIN_SUPPORT
Message-ID: <20200712091654.DBAA08010B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e068f33700d63c4a89329fe3f168ae249544877c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages requires support on the build machine to create gcc
plugins. This commit adds a blind option,
BR2_NEEDS_HOST_GCC_PLUGIN_SUPPORT, which such packages can
select. When this option is enabled, the logic in support/dependencies
verifies that everything needed on the build machine to build gcc
plugins is available.

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in                            |  5 +++++
 support/dependencies/dependencies.sh | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/Config.in b/Config.in
index 48fd36ff98..0104d1319e 100644
--- a/Config.in
+++ b/Config.in
@@ -80,6 +80,11 @@ config BR2_HOSTARCH_NEEDS_IA32_COMPILER
 config BR2_NEEDS_HOST_UTF8_LOCALE
 	bool
 
+# Hidden boolean selected by packages that need the host to have
+# support for building gcc plugins
+config BR2_NEEDS_HOST_GCC_PLUGIN_SUPPORT
+	bool
+
 source "arch/Config.in"
 
 menu "Build options"
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 98469bd70c..c1bd614edf 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -240,6 +240,16 @@ if grep -q ^BR2_HOSTARCH_NEEDS_IA32_COMPILER=y $BR2_CONFIG ; then
 	fi
 fi
 
+if grep ^BR2_NEEDS_HOST_GCC_PLUGIN_SUPPORT=y $BR2_CONFIG ; then
+	if ! echo "#include <gcc-plugin.h>" | $HOSTCXX_NOCCACHE -I$($HOSTCXX_NOCCACHE -print-file-name=plugin)/include -x c++ -c - -o /dev/null ; then
+		echo
+		echo "Your Buildroot configuration needs a host compiler capable of building gcc plugins."
+		echo "If you're running a Debian/Ubuntu distribution, install gcc-X-plugin-dev package."
+		echo "For other distributions, refer to their documentation."
+		exit 1 ;
+	fi
+fi
+
 # Check that the Perl installation is complete enough for Buildroot.
 required_perl_modules="Data::Dumper" # Needed to build host-autoconf
 required_perl_modules="$required_perl_modules ExtUtils::MakeMaker" # Used by host-libxml-parser-perl
