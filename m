From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2020 18:12:55 +0100
Subject: [Buildroot] [git commit] package/doxygen: needs host gcc >= 4.9
Message-ID: <20200213170142.9AB888DF6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88bb278d5ac790bee0c3a438464da82ee7625cff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-doxygen use std::make_unique which is a C++14 feature and so not
available with host gcc 4.8 so add a Config.in.host for doxygen and add
host gcc 4.9 dependency to host-doxygen and sigrok C++ option

Fixes:
 - http://autobuild.buildroot.org/results/3ac78c5d4728287bafdfeb3a54f50eb193934b63

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in.host         |  1 +
 package/doxygen/Config.in.host | 12 ++++++++++++
 package/libsigrok/Config.in    |  7 +++++--
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/package/Config.in.host b/package/Config.in.host
index 62e860d7c3..dfea478868 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -14,6 +14,7 @@ menu "Host utilities"
 	source "package/dfu-util/Config.in.host"
 	source "package/dos2unix/Config.in.host"
 	source "package/dosfstools/Config.in.host"
+	source "package/doxygen/Config.in.host"
 	source "package/dtc/Config.in.host"
 	source "package/e2fsprogs/Config.in.host"
 	source "package/e2tools/Config.in.host"
diff --git a/package/doxygen/Config.in.host b/package/doxygen/Config.in.host
new file mode 100644
index 0000000000..3a06199c93
--- /dev/null
+++ b/package/doxygen/Config.in.host
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_HOST_DOXYGEN
+	bool "host doxygen"
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # C++14
+	help
+	  Doxygen is the de facto standard tool for generating
+	  documentation from annotated C++ sources, but it also
+	  supports other popular programming languages such as C,
+	  Objective-C, C#, PHP, Java, Python, IDL (Corba, Microsoft,
+	  and UNO/OpenOffice flavors), Fortran, VHDL, Tcl, and to some
+	  extent D.
+
+	  http://www.doxygen.nl/
diff --git a/package/libsigrok/Config.in b/package/libsigrok/Config.in
index a4b9f66566..69531e621c 100644
--- a/package/libsigrok/Config.in
+++ b/package/libsigrok/Config.in
@@ -26,13 +26,16 @@ config BR2_PACKAGE_LIBSIGROKCXX
 	bool "build C++ bindings"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # glibmm
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-doxygen
 	select BR2_PACKAGE_GLIBMM
+	select BR2_PACKAGE_HOST_DOXYGEN
 	help
 	  Build libsigrok C++ bindings as well.
 
-comment "C++ bindings need a toolchain w/ C++, gcc >= 4.9"
+comment "C++ bindings need a toolchain w/ C++, gcc >= 4.9, host gcc >= 4.9"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_4_9
 
 endif
 
