From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:37 -0000
Subject: [Buildroot] [git commit branch/next] cpio: new package
Message-ID: <20150808105637.53F3880414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=03d3df31f82019e8f7de732f0e0c3a633c5d4918
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Adding the cpio archive utility for the target and host. Patches have
been pulled from ArchLinux and Gentoo to fix CVE issues and compile
issues.

[Thomas: remove host variant of the package, as discussed during the
review of earlier version.]

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in      |    1 +
 package/cpio/Config.in |    8 ++++++++
 package/cpio/cpio.hash |    9 +++++++++
 package/cpio/cpio.mk   |   25 +++++++++++++++++++++++++
 4 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 86a53c8..5974855 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -150,6 +150,7 @@ endmenu
 menu "Filesystem and flash utilities"
 	source "package/btrfs-progs/Config.in"
 	source "package/cifs-utils/Config.in"
+	source "package/cpio/Config.in"
 	source "package/cramfs/Config.in"
 	source "package/curlftpfs/Config.in"
 	source "package/dosfstools/Config.in"
diff --git a/package/cpio/Config.in b/package/cpio/Config.in
new file mode 100644
index 0000000..1787f39
--- /dev/null
+++ b/package/cpio/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_CPIO
+	bool "cpio"
+	# Need argp.h support
+	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
+	help
+	  cpio archive utility for creation and extraction.
+
+	  https://www.gnu.org/software/cpio/
diff --git a/package/cpio/cpio.hash b/package/cpio/cpio.hash
new file mode 100644
index 0000000..c52e86a
--- /dev/null
+++ b/package/cpio/cpio.hash
@@ -0,0 +1,9 @@
+# Locally calculated after checking pgp signature
+sha256	601b1d774cd6e4cd39416203c91ec59dbd65dd27d79d75e1a9b89497ea643978	cpio-2.11.tar.gz
+
+# Locally calculated
+sha256 903fb87e00813daf257be5d1680ad93770d320c707ab2ec345486958b2e8a21f cpio-2.11-stdio.in.patch
+sha256 6b6505a97dda75d24627d9ba461b45ab9ea4764e1a2788d6986eb2978434f25d cpio-2.11-CVE-2014-9112.patch
+sha256 0cf7c9749f1c1610aaf46e17eacd6614c5ef8c2114236bcdd08d53e929020ae5 cpio-2.11-testsuite-CVE-2014-9112.patch
+sha256 f1f587f70a38363691cbd4dfe89f962c8c57266277f0fbc781910c6a7065be7e cpio-2.11-check_for_symlinks-CVE-2015-1197.patch
+sha256 b3d317e3c5705d7f9e503f56540baf3cb6dd1d0e9be0261151a5b08378c2d98c cpio-2.11-stat.patch
diff --git a/package/cpio/cpio.mk b/package/cpio/cpio.mk
new file mode 100644
index 0000000..aa9dace
--- /dev/null
+++ b/package/cpio/cpio.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# cpio
+#
+################################################################################
+
+CPIO_VERSION = 2.11
+CPIO_SITE = http://ftp.gnu.org/gnu/cpio
+CPIO_LICENSE = GPLv3+
+CPIO_LICENSE_FILES = COPYING
+CPIO_PATCH = \
+	https://projects.archlinux.org/svntogit/packages.git/plain/cpio/trunk/cpio-2.11-stdio.in.patch \
+	https://projects.archlinux.org/svntogit/packages.git/plain/cpio/trunk/cpio-2.11-CVE-2014-9112.patch \
+	https://projects.archlinux.org/svntogit/packages.git/plain/cpio/trunk/cpio-2.11-testsuite-CVE-2014-9112.patch \
+	https://projects.archlinux.org/svntogit/packages.git/plain/cpio/trunk/cpio-2.11-check_for_symlinks-CVE-2015-1197.patch \
+	https://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/app-arch/cpio/files/cpio-2.11-stat.patch
+
+# cpio uses argp.h which is not provided by uclibc by default.
+# Use the argp-standalone package to provide this but make sure
+# the host package does not try to use the host version.
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+CPIO_DEPENDENCIES += argp-standalone
+endif
+
+$(eval $(autotools-package))
