From: Kamel Bouhara <kamel.bouhara@bootlin.com>
Date: Tue, 19 May 2020 09:28:44 +0200
Subject: [Buildroot] [PATCH 2/8] support/dependencies: check that host have
 gcc plugin headers
In-Reply-To: <20200519072850.898877-1-kamel.bouhara@bootlin.com>
References: <20200519072850.898877-1-kamel.bouhara@bootlin.com>
Message-ID: <20200519072850.898877-3-kamel.bouhara@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages requires host gcc headers to build gcc plugins. This
checks they are indeed installed.

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
 support/dependencies/dependencies.sh | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 98469bd70c..fcf52818f1 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -240,6 +240,16 @@ if grep -q ^BR2_HOSTARCH_NEEDS_IA32_COMPILER=y $BR2_CONFIG ; then
 	fi
 fi
 
+if grep ^BR2_NEEDS_HOST_GCC_PLUGIN_SUPPORT=y $BR2_CONFIG ; then
+	if ! echo "#include <gcc-plugin.h>" | g++ -I$(g++ -print-file-name=plugin)/include -x c++ -c - -o /dev/null ; then
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
2.25.0
