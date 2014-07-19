From: Karoly Kasza <kaszak@gmail.com>
Date: Sat, 19 Jul 2014 11:54:20 +0200
Subject: [Buildroot] [PATCH v3 1/1] openvmtools: new package
Message-ID: <1405763660-2892-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

New package: openvmtools

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---

Changes v2 -> v3:
  - Bump to version 9.4.6
  - Dropped kernel module compilation, it was for ancient kernels
  - Changed to use procps-ng instead of legacy procps
  - Added systemd startup script
  - Added license information

 package/Config.in                    |    1 +
 package/openvmtools/Config.in        |   56 +++++++++++++++++++++++
 package/openvmtools/S10vmtoolsd      |   33 ++++++++++++++
 package/openvmtools/openvmtools.mk   |   81 ++++++++++++++++++++++++++++++++++
 package/openvmtools/shutdown         |    7 +++
 package/openvmtools/vmtoolsd.service |    8 ++++
 6 files changed, 186 insertions(+)
 create mode 100644 package/openvmtools/Config.in
 create mode 100644 package/openvmtools/S10vmtoolsd
 create mode 100644 package/openvmtools/openvmtools.mk
 create mode 100644 package/openvmtools/shutdown
 create mode 100644 package/openvmtools/vmtoolsd.service

diff --git a/package/Config.in b/package/Config.in
index f9722f6..bb7edd3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1151,6 +1151,7 @@ endif
 	source "package/ncdu/Config.in"
 	source "package/numactl/Config.in"
 	source "package/nut/Config.in"
+	source "package/openvmtools/Config.in"
 	source "package/powerpc-utils/Config.in"
 	source "package/polkit/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
new file mode 100644
index 0000000..b1ede00
--- /dev/null
+++ b/package/openvmtools/Config.in
@@ -0,0 +1,56 @@
+config BR2_PACKAGE_OPENVMTOOLS
+	bool "openvmtools"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_USE_MMU
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on BR2_LARGEFILE
+	depends on BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  Open Virtual Machine Tools for VMware guest OS
+
+	  http://open-vm-tools.sourceforge.net/
+
+	  ICU locales and X11 tools are currently not supported.
+
+	  NOTE: Support for vmblock-fuse will be enabled in openvmtools if the
+	        libfuse package is selected.
+
+if BR2_PACKAGE_OPENVMTOOLS
+
+menu "openvmtools options"
+
+config BR2_PACKAGE_OPENVMTOOLS_PROCPS
+	bool "openvmtools procps support"
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_PROCPS_NG
+	help
+	  Enable support for procps / meminfo
+
+config BR2_PACKAGE_OPENVMTOOLS_DNET
+	bool "openvmtools dnet support"
+	depends on BR2_INET_IPV6
+	select BR2_PACKAGE_LIBDNET
+	help
+	  Enable support for libdnet / nicinfo
+
+comment "openvmtools dnet support needs a toolchain w/ IPv6"
+	depends on !BR2_INET_IPV6
+
+config BR2_PACKAGE_OPENVMTOOLS_PAM
+	bool "openvmtools PAM support"
+	select BR2_PACKAGE_LINUX_PAM
+	help
+	  Support for PAM in openvmtools
+
+endmenu
+
+endif
+
+comment "openvmtools needs a toolchain w/ wchar, threads, RPC, largefile, locale"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR ||!BR2_TOOLCHAIN_HAS_THREADS || \
+	!BR2_TOOLCHAIN_HAS_NATIVE_RPC || !BR2_LARGEFILE || !BR2_ENABLE_LOCALE
diff --git a/package/openvmtools/S10vmtoolsd b/package/openvmtools/S10vmtoolsd
new file mode 100644
index 0000000..3ab351e
--- /dev/null
+++ b/package/openvmtools/S10vmtoolsd
@@ -0,0 +1,33 @@
+#!/bin/sh
+#
+# Starts vmtoolsd for openvmtools
+#
+
+PID=/var/run/vmtoolsd.pid
+
+case "$1" in
+  start)
+	echo -n "Starting vmtoolsd: "
+	/usr/bin/vmtoolsd -b $PID
+	if [ $? != 0 ]; then
+		echo "FAILED"
+		exit 1
+	else
+		echo "OK"
+	fi
+	;;
+  stop)
+	echo -n "Stopping vmtoolsd: "
+	kill `cat $PID`
+	echo "OK"
+	;;
+  restart|reload)
+	$0 stop
+	$0 start
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
new file mode 100644
index 0000000..9771a1e
--- /dev/null
+++ b/package/openvmtools/openvmtools.mk
@@ -0,0 +1,81 @@
+################################################################################
+#
+# openvmtools
+#
+################################################################################
+
+OPENVMTOOLS_VERSION = 9.4.6-1770165
+OPENVMTOOLS_SOURCE = open-vm-tools-$(OPENVMTOOLS_VERSION).tar.gz
+OPENVMTOOLS_SITE = http://downloads.sourceforge.net/project/open-vm-tools/open-vm-tools/stable-9.4.x
+OPENVMTOOLS_LICENSE = LGPLv2.1
+OPENVMTOOLS_LICENSE_FILES = COPYING
+OPENVMTOOLS_AUTORECONF = YES
+OPENVMTOOLS_CONF_OPT = \
+        --without-icu \
+        --without-x \
+        --without-gtk2 \
+        --without-gtkmm \
+        --without-kernel-modules
+
+#-Wno-deprecated-declarations is a workaround for a bug in open-vm-tools
+#See http://sourceforge.net/p/open-vm-tools/mailman/message/31473171/
+OPENVMTOOLS_CONF_ENV = CFLAGS+="-Wno-deprecated-declarations"
+
+OPENVMTOOLS_DEPENDENCIES = libglib2
+
+# When libfuse is available, openvmtools can build vmblock-fuse, so
+# make sure that libfuse gets built first.
+ifeq ($(BR2_PACKAGE_LIBFUSE),y)
+OPENVMTOOLS_DEPENDENCIES += libfuse
+endif
+
+ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PROCPS),y)
+OPENVMTOOLS_CONF_ENV += CUSTOM_PROCPS_NAME=procps LDFLAGS="-L$(TARGET_DIR)/usr/lib"
+OPENVMTOOLS_CONF_OPT += --with-procps
+OPENVMTOOLS_DEPENDENCIES += procps-ng
+else
+OPENVMTOOLS_CONF_OPT += --without-procps
+endif
+
+ifeq ($(BR2_PACKAGE_OPENVMTOOLS_DNET),y)
+OPENVMTOOLS_CONF_ENV += CUSTOM_DNET_CPPFLAGS="-I$(STAGING_DIR)/usr/include"
+OPENVMTOOLS_CONF_OPT += --with-dnet
+OPENVMTOOLS_DEPENDENCIES += libdnet
+else
+OPENVMTOOLS_CONF_OPT += --without-dnet
+endif
+
+ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PAM),y)
+OPENVMTOOLS_CONF_OPT += --with-pam
+OPENVMTOOLS_MAKE_OPT += CFLAGS+="-Wno-unused-local-typedefs"
+OPENVMTOOLS_DEPENDENCIES += linux-pam
+else
+OPENVMTOOLS_CONF_OPT += --without-pam
+endif
+
+define OPENVMTOOLS_POST_INSTALL_TARGET_THINGIES
+#needed by lib/system/systemLinux.c (or will cry in /var/log/messages)
+	ln -fs os-release $(TARGET_DIR)/etc/lfs-release \
+#for Guest OS restart/shutdown
+	if [ ! -e $(TARGET_DIR)/sbin/shutdown ]; then \
+		$(INSTALL) -D -m 755 package/openvmtools/shutdown \
+			$(TARGET_DIR)/sbin/shutdown; \
+	fi
+endef
+
+OPENVMTOOLS_POST_INSTALL_TARGET_HOOKS += OPENVMTOOLS_POST_INSTALL_TARGET_THINGIES
+
+define OPENVMTOOLS_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/openvmtools/S10vmtoolsd \
+		$(TARGET_DIR)/etc/init.d/S10vmtoolsd
+endef
+
+define OPENVMTOOLS_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/openvmtools/vmtoolsd.service \
+		$(TARGET_DIR)/etc/systemd/system/vmtoolsd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../vmtoolsd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/vmtoolsd.service
+endef
+
+$(eval $(autotools-package))
diff --git a/package/openvmtools/shutdown b/package/openvmtools/shutdown
new file mode 100644
index 0000000..bca9765
--- /dev/null
+++ b/package/openvmtools/shutdown
@@ -0,0 +1,7 @@
+#!/bin/sh
+#compatibility script for openvmtools
+if [ "$1" == "-r" ]; then
+/sbin/reboot
+else
+/sbin/poweroff
+fi
diff --git a/package/openvmtools/vmtoolsd.service b/package/openvmtools/vmtoolsd.service
new file mode 100644
index 0000000..b099ba3
--- /dev/null
+++ b/package/openvmtools/vmtoolsd.service
@@ -0,0 +1,8 @@
+[Unit]
+Description=vmtoolsd for openvmtools
+
+[Service]
+ExecStart=/usr/bin/vmtoolsd -b /var/run/vmtoolsd.pid
+
+[Install]
+WantedBy=multi-user.target
-- 
1.7.10.4
