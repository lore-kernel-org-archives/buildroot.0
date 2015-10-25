From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 22:30:09 +0100
Subject: [Buildroot] [git commit] x265: new package
Message-ID: <20151025213049.17FF27FACD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b261a01323352f6b6b19dffff5ee336be581de86
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

x265 is a H.265 / HEVC video encoder application library, designed to encode
video or images into an H.265 / HEVC encoded bitstream.

http://x265.org

[Peter: use positive logic for CLI option]
Signed-off-by: Thijs Vermeir <thijsvermeir@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in      |    1 +
 package/x265/Config.in |   23 +++++++++++++++++++++++
 package/x265/x265.hash |    2 ++
 package/x265/x265.mk   |   31 +++++++++++++++++++++++++++++++
 4 files changed, 57 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2f74439..10ff94e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -978,6 +978,7 @@ menu "Multimedia"
 	source "package/live555/Config.in"
 	source "package/mediastreamer/Config.in"
 	source "package/x264/Config.in"
+	source "package/x265/Config.in"
 endmenu
 
 menu "Networking"
diff --git a/package/x265/Config.in b/package/x265/Config.in
new file mode 100644
index 0000000..4d202a9
--- /dev/null
+++ b/package/x265/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_X265
+	bool "x265"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  x265 is an open source free software and library for encoding video
+	  using the High Efficiency Video Coding (HEVC/H.265) standard. x265 is
+	  offered under either the GNU General Public License (GPL) 2 license or
+	  a commercial license, similar to the x264 project.
+
+	  http://x265.org
+
+if BR2_PACKAGE_X265
+
+config BR2_PACKAGE_X265_CLI
+	bool "CLI"
+	help
+	  Command-line tool to encode video streams into the
+	  H.265/HEVC compression format.
+
+endif
+
+comment "x265 needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/x265/x265.hash b/package/x265/x265.hash
new file mode 100644
index 0000000..714ec2a
--- /dev/null
+++ b/package/x265/x265.hash
@@ -0,0 +1,2 @@
+# Locally generated
+sha256 760e6280c688f1ea90c492d19fc6d4084ca1c4b0ea9b2e3c736d32565c30d857 x265_1.8.tar.gz
diff --git a/package/x265/x265.mk b/package/x265/x265.mk
new file mode 100644
index 0000000..aa61066
--- /dev/null
+++ b/package/x265/x265.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# x265
+#
+################################################################################
+
+X265_VERSION = 1.8
+X265_SOURCE = x265_$(X265_VERSION).tar.gz
+X265_SITE = https://bitbucket.org/multicoreware/x265/downloads
+X265_LICENSE = GPLv2+
+X265_LICENSE_FILES = COPYING
+X265_SUBDIR = source
+X265_INSTALL_STAGING = YES
+
+ifeq ($(BR2_i386)$(BR2_x86_64),y)
+X265_DEPENDENCIES += host-yasm
+endif
+
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+X265_CONF_OPTS += -DENABLE_SHARED=true -DENABLE_PIC=true
+else
+X265_CONF_OPTS += -DENABLE_SHARED=false
+endif
+
+ifeq ($(BR2_PACKAGE_X265_CLI),y)
+X265_CONF_OPTS += -DENABLE_CLI=true
+else
+X265_CONF_OPTS += -DENABLE_CLI=else
+endif
+
+$(eval $(cmake-package))
