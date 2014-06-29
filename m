From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 12:27:03 +0200
Subject: [Buildroot] [git commit] google-breakpad: new package
Message-ID: <20140629102911.AC41F9D106@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2bdc3d6113dd87108dd0d73e3f2689c001fba13f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - Introduce a BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS Config.in
   symbol to be able to easily propagate the architecture
   dependencies.
 - Wrap the help text, add some more details as suggested by Arnout.
 - Propagate the architecture dependencies to the comment, as
   suggested by Arnout.
 - Remove the dependency of google-breakpad on host-google-breakpad,
   since it's not needed.
 - Add <pkg>_TARGET = NO, because google-breakpad only installs a
   static library, so installation to staging is sufficient.
 - Reorder autotools-package/host-autotools-package invocations, as
   suggested by Arnout.]

Signed-off-by: Pascal Huerst <pascal.huerst@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |    1 +
 package/google-breakpad/Config.in          |   34 ++++++++++++++++++++++++++++
 package/google-breakpad/google-breakpad.mk |   18 ++++++++++++++
 3 files changed, 53 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 169a9b5..d7e1acc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -54,6 +54,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/duma/Config.in"
 	source "package/fio/Config.in"
 	source "package/gdb/Config.in"
+	source "package/google-breakpad/Config.in"
 	source "package/iozone/Config.in"
 	source "package/kexec/Config.in"
 	source "package/ktap/Config.in"
diff --git a/package/google-breakpad/Config.in b/package/google-breakpad/Config.in
new file mode 100644
index 0000000..0ef10c5
--- /dev/null
+++ b/package/google-breakpad/Config.in
@@ -0,0 +1,34 @@
+config BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
+	bool
+	default y if BR2_i386 || BR2_x86_64 || BR2_arm || BR2_aarch64 || \
+		BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+
+config BR2_PACKAGE_GOOGLE_BREAKPAD
+	bool "google-breakpad"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
+	help
+	  Google-Breakpad is a library and tool suite that allows you
+	  to distribute an application to users with compiler-provided
+	  debugging information removed, record crashes in compact
+	  "minidump" files, send them back to your server, and produce
+	  C and C++ stack traces from these minidumps.  Breakpad can
+	  also write minidumps on request for programs that have not
+	  crashed.
+
+	  You may want to set BR2_ENABLE_DEBUG, in order to get useful
+	  results.
+
+	  This target package installs a static library named
+	  libbreakpad_client.a which should be linked into programs
+	  willing to use Google Breakpad. A host variant of this
+	  package is also available, and provides the different tools
+	  needed to extract the debugging symbols from target
+	  binaries.
+
+	  http://code.google.com/p/google-breakpad/
+
+comment "google-breakpad requires an (e)glibc toolchain w/ C++ enabled"
+	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/google-breakpad/google-breakpad.mk b/package/google-breakpad/google-breakpad.mk
new file mode 100644
index 0000000..bf857ba
--- /dev/null
+++ b/package/google-breakpad/google-breakpad.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# google-breakpad
+#
+################################################################################
+
+GOOGLE_BREAKPAD_VERSION = 1320
+GOOGLE_BREAKPAD_SITE = http://google-breakpad.googlecode.com/svn/trunk
+GOOGLE_BREAKPAD_SITE_METHOD = svn
+GOOGLE_BREAKPAD_CONF_OPT = --disable-processor --disable-tools
+# Only a static library is installed
+GOOGLE_BREAKPAD_INSTALL_TARGET = NO
+GOOGLE_BREAKPAD_INSTALL_STAGING = YES
+GOOGLE_BREAKPAD_LICENSE = BSD-3c
+GOOGLE_BREAKPAD_LICENSE_FILES = LICENSE
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
