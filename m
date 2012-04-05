From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 5 Apr 2012 19:45:08 +0200
Subject: [Buildroot] [git commit] package: Add protobuf package
Message-ID: <20120405175115.04B3296A13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f526c4d23c14920c1ce2a94fd50b245124d15d8e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes: #4886

[Peter: fix whitespace, C++ dep, optional zlib dep]
Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    3 ++-
 package/Config.in            |    1 +
 package/protobuf/Config.in   |   11 +++++++++++
 package/protobuf/protobuf.mk |   21 +++++++++++++++++++++
 4 files changed, 35 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 44079a5..6ff4004 100644
--- a/CHANGES
+++ b/CHANGES
@@ -27,7 +27,7 @@
 	util-linux, vala, wipe, xdriver_xf86-video-fbdev, zlib,
 
 	New packages: glib-networking, lcdprog, minicom, parted,
-	zeromq
+	protobuf, zeromq
 
 	Deprecated packages: ttcp
 
@@ -36,6 +36,7 @@
 	Issues resolved (http://bugs.uclibc.org):
 
 	#4880: New package lcdproc
+	#4886: New package protobuf
 
 2012.02, Released February 29th, 2012:
 
diff --git a/package/Config.in b/package/Config.in
index e4f7dd2..c895cc1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -392,6 +392,7 @@ source "package/liburcu/Config.in"
 source "package/lttng-libust/Config.in"
 source "package/orc/Config.in"
 source "package/poco/Config.in"
+source "package/protobuf/Config.in"
 source "package/startup-notification/Config.in"
 endmenu
 
diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
new file mode 100644
index 0000000..b044ef0
--- /dev/null
+++ b/package/protobuf/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PROTOBUF
+	bool "protobuf"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Protocol buffers are Google's language-neutral, platform-neutral,
+	  extensible mechanism for serializing structured data.
+
+	  http://code.google.com/p/protobuf/
+
+comment "protobuf requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
new file mode 100644
index 0000000..f18261e
--- /dev/null
+++ b/package/protobuf/protobuf.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# protobuf
+#
+#############################################################
+PROTOBUF_VERSION = 2.4.1
+PROTOBUF_SOURCE = protobuf-$(PROTOBUF_VERSION).tar.gz
+PROTOBUF_SITE = http://protobuf.googlecode.com/files/
+
+# N.B. Need to use host protoc during cross compilation.
+PROTOBUF_DEPENDENCIES = host-protobuf
+PROTOBUF_CONF_OPT = --with-protoc=$(HOST_DIR)/usr/bin/protoc
+
+PROTOBUF_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+PROTOBUF_DEPENDENCIES += zlib
+endif
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
