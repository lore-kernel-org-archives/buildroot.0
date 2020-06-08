From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  8 Jun 2020 21:56:41 +0200
Subject: [Buildroot] [PATCHv2 1/3] package/glibc: prepare glibc version
 choice
Message-ID: <20200608195643.2330204-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Glibc version choice was removed by b1ca91c59db667fdd5e59f1a0c8ac11dc0a19816
but experience has proven that glibc can take some time after its release to
get stable or for softwares requiring changes to get an upstream patch (or
new release). This stabilization time can take more than our 3 months
development cycle, so let's re-introduce a version choice for glibc package
to avoid releasing Buildroot with unfixed packages.

Unlike gcc, binutils and gdb, when a new version is introduced we use it as
the default as soon as we are reasonably confident that most build issues
have been sorted out. Also we only support two versions, the latest release
and the previous release.

Since we follow the upstream stable branch of glibc, we need to clarify that
this is not the version from the initial release archive. Make it explicit
from the menuconfig by using "2.30-x (stable branch)".

http://lists.busybox.net/pipermail/buildroot/2020-April/279015.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/glibc/Config.in | 16 ++++++++++++++++
 package/glibc/glibc.mk  |  5 +----
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 5ecd058145..9534563c5a 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -10,10 +10,26 @@ config BR2_PACKAGE_GLIBC
 	help
 	  https://www.gnu.org/software/libc/
 
+choice
+	prompt "glibc version"
+	default BR2_GLIBC_VERSION_2_30_X
+
+config BR2_GLIBC_VERSION_2_30_X
+	bool "2.30-x (stable branch)"
+
+endchoice
+
 config BR2_PACKAGE_GLIBC_UTILS
 	bool "Install glibc utilities"
 	help
 	  Enabling this option will compile and install the getconf,
 	  ldconfig, ldd and locale glibc utilities for the target.
 
+# Generate version string using:
+#   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
+# When updating the version, please also update localedef
+config BR2_GLIBC_VERSION_STRING
+	string
+	default "2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427" if BR2_GLIBC_VERSION_2_30_X
+
 endif # BR2_TOOLCHAIN_BUILDROOT_GLIBC
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index f1c846b727..b9fe8428b7 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -14,10 +14,7 @@ else ifeq ($(BR2_csky),y)
 GLIBC_VERSION = 7630ed2fa60caea98f500e4a7a51b88f9bf1e176
 GLIBC_SITE = $(call github,c-sky,glibc,$(GLIBC_VERSION))
 else
-# Generate version string using:
-#   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-# When updating the version, please also update localedef
-GLIBC_VERSION = 2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427
+GLIBC_VERSION = $(call qstrip,$(BR2_GLIBC_VERSION_STRING))
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
-- 
2.25.4
