From: Matthew Urry <matthew.j.urry@gmail.com>
Date: Mon, 23 Dec 2013 11:30:50 +0000
Subject: [Buildroot] [PATCH 1/1] chdkptp CLI added
In-Reply-To: <1387798250-2437-1-git-send-email-matthew.j.urry@gmail.com>
References: <1387798250-2437-1-git-send-email-matthew.j.urry@gmail.com>
Message-ID: <1387798250-2437-2-git-send-email-matthew.j.urry@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Matthew Urry <matthew.j.urry@gmail.com>
---
 package/Config.in                                  |    1 +
 package/chdkptp/Config.in                          |   15 +++++++++++
 .../chdkptp-01-add_lm_flag_to_makefile.patch       |   15 +++++++++++
 ...ptp-02-create_sh_script_to_launch_chdkptp.patch |   22 ++++++++++++++++
 package/chdkptp/chdkptp.mk                         |   27 ++++++++++++++++++++
 5 files changed, 80 insertions(+)
 create mode 100644 package/chdkptp/Config.in
 create mode 100644 package/chdkptp/chdkptp-01-add_lm_flag_to_makefile.patch
 create mode 100644 package/chdkptp/chdkptp-02-create_sh_script_to_launch_chdkptp.patch
 create mode 100644 package/chdkptp/chdkptp.mk

diff --git a/package/Config.in b/package/Config.in
index 3685807..369d361 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -259,6 +259,7 @@ endmenu
 source "package/a10disp/Config.in"
 source "package/acpid/Config.in"
 source "package/cdrkit/Config.in"
+source "package/chdkptp/Config.in"
 source "package/cryptsetup/Config.in"
 source "package/dbus/Config.in"
 source "package/dbus-glib/Config.in"
diff --git a/package/chdkptp/Config.in b/package/chdkptp/Config.in
new file mode 100644
index 0000000..cfd2de9
--- /dev/null
+++ b/package/chdkptp/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_CHDKPTP
+	bool "chdkptp"
+	select BR2_PACKAGE_LUA 
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	depends on BR2_LARGEFILE
+	depends on BR2_USE_WCHAR
+	help
+	  chdkptp is a client application for interacting with
+	  the chdk ptp extension. This will complie the CLI only.
+	  
+	  http://chdk.wikia.com/wiki/CHDK
+	  https://www.assembla.com/spaces/chdkptp/wiki
+comment "chdkptp needs a toolchain w/ largefile and wchar"
+	depends on (!BR2_LARGEFILE || !BR2_USE_WCHAR)
diff --git a/package/chdkptp/chdkptp-01-add_lm_flag_to_makefile.patch b/package/chdkptp/chdkptp-01-add_lm_flag_to_makefile.patch
new file mode 100644
index 0000000..82aeedd
--- /dev/null
+++ b/package/chdkptp/chdkptp-01-add_lm_flag_to_makefile.patch
@@ -0,0 +1,15 @@
+Makefile: add -lm to linker flags
+
+Signed-off-by: Matthew Urry <matthew.j.urry@gmail.com>
+
+diff -purN chdkptp-461.orig/Makefile chdkptp-461/Makefile
+--- chdkptp-461.orig/Makefile	2013-12-08 12:10:18.469855434 +0000
++++ chdkptp-461/Makefile	2013-12-08 12:11:16.164098345 +0000
+@@ -88,6 +88,7 @@ INC_PATHS+=-I$(CHDK_SRC_DIR)
+ CFLAGS+=$(INC_PATHS) -DCHDKPTP_BUILD_NUM=$(SVNREV) -DCHDKPTP_REL_DESC="\"alpha\""
+ 
+ LDFLAGS+=$(LIB_PATHS) $(patsubst %,-l%,$(LINK_LIBS) $(SYS_LIBS)) 
++LDFLAGS+=-lm
+ 
+ SUBDIRS=lfs
+ 
diff --git a/package/chdkptp/chdkptp-02-create_sh_script_to_launch_chdkptp.patch b/package/chdkptp/chdkptp-02-create_sh_script_to_launch_chdkptp.patch
new file mode 100644
index 0000000..aadd6c7
--- /dev/null
+++ b/package/chdkptp/chdkptp-02-create_sh_script_to_launch_chdkptp.patch
@@ -0,0 +1,22 @@
+diff -purN chdkptp/chdkptp-sample.sh chdkptp-patched/chdkptp-sample.sh
+--- chdkptp/chdkptp-sample.sh	2013-12-23 09:06:03.772637062 +0000
++++ chdkptp-patched/chdkptp-sample.sh	1970-01-01 01:00:00.000000000 +0100
+@@ -1,7 +0,0 @@
+-#!/bin/sh
+-# adjust the following to your configuration
+-CHDKPTP_DIR=/path/to/chdkptp
+-# only need if you have compiled IUP support and have NOT installed the libraries to system directories 
+-#export LD_LIBRARY_PATH=/path/to/iup:/path/to/cd
+-export LUA_PATH="$CHDKPTP_DIR/lua/?.lua"
+-"$CHDKPTP_DIR/chdkptp" "$@"
+diff -purN chdkptp/chdkptp.sh chdkptp-patched/chdkptp.sh
+--- chdkptp/chdkptp.sh	1970-01-01 01:00:00.000000000 +0100
++++ chdkptp-patched/chdkptp.sh	2013-12-23 09:08:51.868642764 +0000
+@@ -0,0 +1,7 @@
++#!/bin/sh
++# adjust the following to your configuration
++CHDKPTP_DIR=/usr/share/chdkptp
++# only need if you have compiled IUP support and have NOT installed the libraries to system directories 
++#export LD_LIBRARY_PATH=/path/to/iup:/path/to/cd
++export LUA_PATH="$CHDKPTP_DIR/lua/?.lua"
++"$CHDKPTP_DIR/chdkptp" "$@"
diff --git a/package/chdkptp/chdkptp.mk b/package/chdkptp/chdkptp.mk
new file mode 100644
index 0000000..80b6a60
--- /dev/null
+++ b/package/chdkptp/chdkptp.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# chdkptp
+#
+################################################################################
+
+CHDKPTP_VERSION = 461
+CHDKPTP_SITE = http://subversion.assembla.com/svn/chdkptp/trunk
+CHDKPTP_SITE_METHOD = svn
+CHDKPTP_DEPENDENCIES = libusb-compat lua
+CHDKPTP_LICENSE = GPLv2
+
+define CHDKPTP_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) 
+endef
+
+define CHDKPTP_INSTALL_TARGET_CMDS
+        $(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/chdkptp
+        $(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/chdkptp/lua
+        $(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/chdkptp/lua/extras
+    	$(INSTALL) -m 0755 $(@D)/chdkptp $(TARGET_DIR)/usr/share/chdkptp
+        $(INSTALL) -m 0755 $(@D)/lua/*.lua $(TARGET_DIR)/usr/share/chdkptp/lua
+        $(INSTALL) -m 0755 $(@D)/lua/extras/*.lua $(TARGET_DIR)/usr/share/chdkptp/lua/extras
+        $(INSTALL) -m 0755 $(@D)/chdkptp.sh $(TARGET_DIR)/usr/bin/chdkptp
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4
