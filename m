From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Dec 2012 17:14:49 +0100
Subject: [Buildroot] [PATCH 2/4] Infrastructure to warn the user about
	missing 32 bits libraries
In-Reply-To: <cover.1356797653.git.thomas.petazzoni@free-electrons.com>
References: <cover.1356797653.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1fabfe7c83a700bce7a8f77e19a304ace407a96b.1356797653.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Many users trying to use external toolchains on x86-64 machines get a
very confusing message:

  "Can't execute cross-compiler"

They get this message because they forgot to install the 32 bits
compatibility libraries that are needed to run binaries compiled for
x86 on x86-64 machines.

Since this is the case for both external toolchains and certain
binary-only tools like SAM-BA, we add a new Kconfig option
BR2_HOSTARCH_NEEDS_IA32_LIBS, that packages must select if they need
the 32 bits compatibility libraries. When this option is enabled,
dependencies.sh checks that the 32 bits dynamic library loader is
present on the system, and if not, it stops and shows an error.

The path and name of the 32 bits dynamic loader is hardcoded because
it is very unlikely to change, as it would break the ABI for all
binaries.

Also, it is worth noting that the check will be done even if we're
running on a 32 bits machine. This is harmless, as 32 bits machines
necessarily have the 32 bits dynamic loader installed, so the error
will never show up in this case.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                            |    6 ++++++
 support/dependencies/dependencies.sh |   11 +++++++++++
 2 files changed, 17 insertions(+)

diff --git a/Config.in b/Config.in
index b319ac7..af77a83 100644
--- a/Config.in
+++ b/Config.in
@@ -14,6 +14,12 @@ config BR2_HOSTARCH
 	string
 	option env="HOSTARCH"
 
+# Hidden boolean selected by pre-built packages for x86, when they
+# need to run on x86-64 machines (example: pre-built external
+# toolchains, binary tools like SAM-BA, etc.).
+config BR2_HOSTARCH_NEEDS_IA32_LIBS
+	bool
+
 source "arch/Config.in"
 
 menu "Build options"
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 7a02512..03e2742 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -166,3 +166,14 @@ if grep -q ^BR2_PACKAGE_CLASSPATH=y $CONFIG_FILE ; then
 	fi
     done
 fi
+if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $CONFIG_FILE ; then
+    if test ! -f /lib/ld-linux.so.2 ; then
+	/bin/echo -e "\nYour Buildroot configuration uses some pre-built tools for the x86 architecture,"
+	/bin/echo -e "but your build machine uses the x86-64 architecture without the 32 bits compatibility"
+	/bin/echo -e "library."
+	/bin/echo -e "If you're running a Debian/Ubuntu distribution, install the libc:i386 package."
+	/bin/echo -e "For other distributions, refer to the documentation on how to install the 32 bits"
+	/bin/echo -e "compatibility libraries."
+	exit 1
+    fi
+fi
-- 
1.7.9.5
