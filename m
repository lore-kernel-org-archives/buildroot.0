From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  1 Dec 2014 22:55:13 +0100
Subject: [Buildroot] [PATCHv2 12/12] Add option for paranoid unsafe path
	checking
In-Reply-To: <1417470913-1280-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417470913-1280-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417470913-1280-13-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a Config.in option to the "Build options" submenu to
enable paranoid checking of unsafe paths. This mechanism is added as
an option so that when we'll enable it in the autobuilders, people
trying to reproduce the build failures will be able to do so by just
downloading the configuration file. If instead we were leaving this
feature as an environment variable, everyone would have to remember to
pass this environment variable to reproduce build issues. And certain
build issues triggered by paranoid unsafe patch checking may not be
visible in the build output, for example when they happen during the
execution of configure scripts.

Since this option is fairly advanced, a new submenu inside "Build
options" is created, for Advanced options.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Config.in           | 20 ++++++++++++++++++++
 package/Makefile.in |  4 ++++
 2 files changed, 24 insertions(+)

diff --git a/Config.in b/Config.in
index 1aa1080..3374e0f 100644
--- a/Config.in
+++ b/Config.in
@@ -569,6 +569,26 @@ config BR2_GLOBAL_PATCH_DIR
 	  Otherwise, if the directory <global-patch-dir>/<packagename> exists,
 	  then all *.patch files in the directory will be applied.
 
+menu "Advanced"
+
+config BR2_COMPILER_PARANOID_UNSAFE_PATH
+	bool "paranoid check of library/header paths"
+	help
+	  By default, when this option is disabled, when the Buildroot
+	  cross-compiler will encounter an unsafe library or header
+	  path (such as /usr/include, or /usr/lib), the compiler will
+	  display a warning.
+
+	  By enabling this option, this warning is turned into an
+	  error, which will completely abort the build when such
+	  unsafe paths are encountered.
+
+	  Note that this mechanism is available for both the internal
+	  toolchain (through gcc and binutils patches) and external
+	  toolchain backends (through the external toolchain wrapper).
+
+endmenu
+
 endmenu
 
 source "toolchain/Config.in"
diff --git a/package/Makefile.in b/package/Makefile.in
index 36ecf0b..f60b08d 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -398,6 +398,10 @@ else
 SHARED_STATIC_LIBS_OPTS = --enable-static --enable-shared
 endif
 
+ifeq ($(BR2_COMPILER_PARANOID_UNSAFE_PATH),y)
+export BR_COMPILER_PARANOID_UNSAFE_PATH=enabled
+endif
+
 include package/pkg-download.mk
 include package/pkg-autotools.mk
 include package/pkg-cmake.mk
-- 
2.1.0
