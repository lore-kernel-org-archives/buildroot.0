From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Jan 2014 23:56:10 +0100
Subject: [Buildroot] [git commit] apitrace: new package
Message-ID: <20140110225653.CAA029C43F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=65ef7afc72a311e32311c88d3dd35a1885926c59
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Trace and replay OpenGL and OpenGL ES APIs calls to/from a file.

http://apitrace.github.io/

[Peter: fix Config.in, depend on glibc, use github helper]
Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in            |    1 +
 package/apitrace/Config.in   |   16 ++++++++++++++++
 package/apitrace/apitrace.mk |   17 +++++++++++++++++
 3 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 38db5de..a0fb704 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -215,6 +215,7 @@ source "package/x11r7/Config.in"
 
 comment "X applications"
 source "package/alsamixergui/Config.in"
+source "package/apitrace/Config.in"
 source "package/docker/Config.in"
 source "package/feh/Config.in"
 source "package/freerdp/Config.in"
diff --git a/package/apitrace/Config.in b/package/apitrace/Config.in
new file mode 100644
index 0000000..6491463
--- /dev/null
+++ b/package/apitrace/Config.in
@@ -0,0 +1,16 @@
+comment "apitrace needs a (e)glibc toolchain w/ C++"
+	depends on BR2_PACKAGE_XORG7
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC
+
+config BR2_PACKAGE_APITRACE
+	bool "apitrace"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_USES_GLIBC # uses glibc specific __libc_dlsym
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  Trace and replay OpenGL and OpenGL ES APIs calls to/from a
+	  file. You may install apitrace GUI from your distribution to
+	  inspect generated traces.
+
+	  http://apitrace.github.io/
diff --git a/package/apitrace/apitrace.mk b/package/apitrace/apitrace.mk
new file mode 100644
index 0000000..a07ae7d
--- /dev/null
+++ b/package/apitrace/apitrace.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# apitrace
+#
+################################################################################
+
+APITRACE_VERSION = c181b7fbf4b1c3912424761fec8ac7124640543a
+APITRACE_SITE = $(call github,apitrace,apitrace,$(APITRACE_VERSION))
+APITRACE_LICENSE = MIT
+APITRACE_LICENSE_FILES = LICENSE
+
+APITRACE_DEPENDENCIES = xlib_libX11 host-python
+
+# Gui was never tested, so we prefer to explicitly disable it
+APITRACE_CONF_OPT += -DENABLE_GUI=false
+
+$(eval $(cmake-package))
