From: Kamel Bouhara <kamel.bouhara@bootlin.com>
Date: Mon,  6 Jul 2020 17:30:35 +0200
Subject: [Buildroot] [PATCH v3 2/7] support/dependencies: check that host
 have gcc plugin headers
In-Reply-To: <20200706153040.427457-1-kamel.bouhara@bootlin.com>
References: <20200706153040.427457-1-kamel.bouhara@bootlin.com>
Message-ID: <20200706153040.427457-3-kamel.bouhara@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages requires host gcc headers to build gcc plugins. This
checks they are indeed installed.

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>

Config.in: add BR2_NEEDS_HOST_GCC_PLUGIN_SUPPORT

In preparation to the addition of new dependencies in the odb package,
add the BR2_NEEDS_HOST_GCC_PLUGIN_SUPPORT symbol.

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
 Config.in                            |  5 +++++
 support/dependencies/dependencies.sh | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/Config.in b/Config.in
index 48fd36ff98..e056498bd5 100644
--- a/Config.in
+++ b/Config.in
@@ -80,6 +80,11 @@ config BR2_HOSTARCH_NEEDS_IA32_COMPILER
 config BR2_NEEDS_HOST_UTF8_LOCALE
 	bool
 
+# Hidden boolean selected by packages that need the host for building
+# gcc plugins
+config BR2_NEEDS_HOST_GCC_PLUGIN_SUPPORT
+	bool
+
 source "arch/Config.in"
 
 menu "Build options"
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 98469bd70c..0debdc8f4e 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -240,6 +240,16 @@ if grep -q ^BR2_HOSTARCH_NEEDS_IA32_COMPILER=y $BR2_CONFIG ; then
 	fi
 fi
 
+if grep ^BR2_NEEDS_HOST_GCC_PLUGIN_SUPPORT=y $BR2_CONFIG ; then
+	if ! echo "#include <gcc-plugin.h>" | $HOSTCXX_NOCCACHE -I$($HOSTCXX_NOCCACHE -print-file-name=plugin)/include -x c++ -c - -o /dev/null ; then
+		echo
+		echo "Your Buildroot configuration needs a compiler capable of building gcc plugins."
+		echo "If you're running a Debian/Ubuntu distribution, install gcc-X-plugin-dev package."
+		echo "For other distributions, refer to their documentation."
+		exit 1 ;
+	fi
+fi
+
 # Check that the Perl installation is complete enough for Buildroot.
 required_perl_modules="Data::Dumper" # Needed to build host-autoconf
 required_perl_modules="$required_perl_modules ExtUtils::MakeMaker" # Used by host-libxml-parser-perl
-- 
2.26.2
