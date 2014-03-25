From: =?UTF-8?q?Arnaud=20R=C3=A9billout?= <rebillout@syscom.ch>
Date: Tue, 25 Mar 2014 08:59:56 +0100
Subject: [Buildroot] [PATCH 1/1] dbus-triggerd: new package
In-Reply-To: <1395734396-31668-1-git-send-email-rebillout@syscom.ch>
References: <1395734396-31668-1-git-send-email-rebillout@syscom.ch>
Message-ID: <1395734396-31668-2-git-send-email-rebillout@syscom.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dbus-triggerd is a little daemon that can monitor dbus events, match
them against some watch-expressions, then trigger shell-commands.

It can be used in any situation where dbus-interaction is needed, and
shell script is preferred over other languages.

Signed-off-by: Arnaud R?billout <rebillout@syscom.ch>
---
 package/Config.in                                  |  1 +
 package/dbus-triggerd/Config.in                    |  9 ++++++++
 .../dbus-triggerd-01-cross-compil.patch            | 13 ++++++++++++
 package/dbus-triggerd/dbus-triggerd.mk             | 24 ++++++++++++++++++++++
 4 files changed, 47 insertions(+)
 create mode 100644 package/dbus-triggerd/Config.in
 create mode 100644 package/dbus-triggerd/dbus-triggerd-01-cross-compil.patch
 create mode 100644 package/dbus-triggerd/dbus-triggerd.mk

diff --git a/package/Config.in b/package/Config.in
index cfa53d3..fa24b57 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -272,6 +272,7 @@ source "package/dbus/Config.in"
 source "package/dbus-cpp/Config.in"
 source "package/dbus-glib/Config.in"
 source "package/dbus-python/Config.in"
+source "package/dbus-triggerd/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/devmem2/Config.in"
 endif
diff --git a/package/dbus-triggerd/Config.in b/package/dbus-triggerd/Config.in
new file mode 100644
index 0000000..e7f65b8
--- /dev/null
+++ b/package/dbus-triggerd/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_DBUS_TRIGGERD
+	bool "dbus-triggerd"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_DBUS
+	help
+	  dbus-triggerd is a tool to trigger shell-commands upon receiving
+	  a given dbus-signal.
+
+	  http://gareus.org/oss/dbustriggerd/start
diff --git a/package/dbus-triggerd/dbus-triggerd-01-cross-compil.patch b/package/dbus-triggerd/dbus-triggerd-01-cross-compil.patch
new file mode 100644
index 0000000..67a2755
--- /dev/null
+++ b/package/dbus-triggerd/dbus-triggerd-01-cross-compil.patch
@@ -0,0 +1,13 @@
+--- a/Makefile	2014-03-25 07:27:15.761217767 +0100
++++ b/Makefile	2014-03-25 07:31:28.523028955 +0100
+@@ -1,7 +1,8 @@
+ PREFIX=/usr
++PKG_CONFIG?=pkg-config
+ 
+-CFLAGS=`pkg-config --cflags dbus-1` -Wall -O3
+-LDLIBS=`pkg-config --libs dbus-1`
++CFLAGS+=`$(PKG_CONFIG) --cflags dbus-1` -Wall -O3
++LDLIBS+=`$(PKG_CONFIG) --libs dbus-1`
+ 
+ all: dbus-triggerd
+ 
diff --git a/package/dbus-triggerd/dbus-triggerd.mk b/package/dbus-triggerd/dbus-triggerd.mk
new file mode 100644
index 0000000..fa04c06
--- /dev/null
+++ b/package/dbus-triggerd/dbus-triggerd.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# dbus-triggerd
+#
+################################################################################
+
+DBUS_TRIGGERD_VERSION = 749a7a83a79439395ebdc52ff86f2601396b8c72
+DBUS_TRIGGERD_SITE = git://rg42.org/dbustriggerd.git
+DBUS_TRIGGERD_LICENSE = GPLv2+
+DBUS_TRIGGERD_DEPENDENCIES = dbus
+
+define DBUS_TRIGGERD_BUILD_CMDS
+	CC="$(TARGET_CC)" \
+	CFLAGS="$(TARGET_CFLAGS)" \
+	LDFLAGS="$(TARGET_LDFLAGS)" \
+	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+	$(MAKE) -C $(@D) all
+endef
+
+define DBUS_TRIGGERD_INSTALL_TARGET_CMDS
+	$(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
1.9.0
