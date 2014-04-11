From: Karoly Kasza <kaszak@gmail.com>
Date: Fri, 11 Apr 2014 13:09:39 +0200
Subject: [Buildroot] [PATCH v2 1/1] openvmtools: new package
In-Reply-To: <1397214579-53882-1-git-send-email-kaszak@gmail.com>
References: <1397214579-53882-1-git-send-email-kaszak@gmail.com>
Message-ID: <1397214579-53882-2-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

New package: openvmtools

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---

Changes v1 -> v2:
  - Moved to section System tools from Hardware handling.
  - Unnecessary comments removed from both openvmtools.mk and Config.in.
  - Select is used in options instead of depends on.
  - $(LINUX_DIR) is used now.
  - Vmblock-fuse comments cleaned up.
  - The package now does not copy the dnet-config script. One less hook.

 package/Config.in                                  |    1 +
 package/openvmtools/Config.in                      |   70 +++++++++++++++
 package/openvmtools/S98vmtoolsd                    |   31 +++++++
 .../openvmtools-01-has_bsd_printf.patch            |   26 ++++++
 package/openvmtools/openvmtools.mk                 |   89 ++++++++++++++++++++
 package/openvmtools/shutdown                       |    7 ++
 6 files changed, 224 insertions(+)
 create mode 100644 package/openvmtools/Config.in
 create mode 100755 package/openvmtools/S98vmtoolsd
 create mode 100644 package/openvmtools/openvmtools-01-has_bsd_printf.patch
 create mode 100644 package/openvmtools/openvmtools.mk
 create mode 100755 package/openvmtools/shutdown

diff --git a/package/Config.in b/package/Config.in
index 6abc7b3..a15bb53 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1087,6 +1087,7 @@ source "package/monit/Config.in"
 source "package/ncdu/Config.in"
 source "package/numactl/Config.in"
 source "package/nut/Config.in"
+source "package/openvmtools/Config.in"
 source "package/polkit/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/procps/Config.in"
diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
new file mode 100644
index 0000000..55cd099
--- /dev/null
+++ b/package/openvmtools/Config.in
@@ -0,0 +1,70 @@
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
+	select BR2_PACKAGE_PROCPS
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
+config BR2_PACKAGE_OPENVMTOOLS_MODULES
+	bool "openvmtools older kernel modules - SEE HELP!"
+	depends on BR2_LINUX_KERNEL
+	help
+	  Compile older Linux kernel modules for openvmtools
+	  This is absolutely NOT NEEDED for recent kernels, as they already
+	  include open-vm-tools modules.
+	  Better to choose this in a current Linux kernel's config, not here.
+	  Only compile this if you are positive that you need it!
+	  Also, this is highly untested, so probably you'll need to hack it.
+
+comment "openvmtools older kernel modules needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
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
diff --git a/package/openvmtools/S98vmtoolsd b/package/openvmtools/S98vmtoolsd
new file mode 100755
index 0000000..4b51e0a
--- /dev/null
+++ b/package/openvmtools/S98vmtoolsd
@@ -0,0 +1,31 @@
+#!/bin/sh
+#
+# Start vmtoolsd
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
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/openvmtools/openvmtools-01-has_bsd_printf.patch b/package/openvmtools/openvmtools-01-has_bsd_printf.patch
new file mode 100644
index 0000000..a33b67b
--- /dev/null
+++ b/package/openvmtools/openvmtools-01-has_bsd_printf.patch
@@ -0,0 +1,26 @@
+lib/misc/msgList.c: missing #ifdef
+
+This macro checks for BSD style printf(), which is not present
+when compiling for uClibc. The linked functions are unnecessary in
+this case, and they break compilation.
+
+Signed-off-by: Karoly Kasza <kaszak@gmail.com>
+
+--- openvmtools-9.4.0-1280544.orig/lib/misc/msgList.c	2013-09-23 17:51:10.000000000 +0200
++++ openvmtools-9.4.0-1280544/lib/misc/msgList.c	2014-04-03 13:42:14.138500061 +0200
+@@ -487,6 +487,7 @@
+    return messages->id;
+ }
+ 
++#ifdef HAS_BSD_PRINTF
+ 
+ /*
+  *----------------------------------------------------------------------
+@@ -566,6 +567,7 @@
+    }
+ }
+ 
++#endif
+ 
+ /*
+  *----------------------------------------------------------------------
diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
new file mode 100644
index 0000000..1d7bcc7
--- /dev/null
+++ b/package/openvmtools/openvmtools.mk
@@ -0,0 +1,89 @@
+################################################################################
+#
+# openvmtools
+#
+################################################################################
+
+OPENVMTOOLS_VERSION = 9.4.0-1280544
+OPENVMTOOLS_SOURCE = open-vm-tools-$(OPENVMTOOLS_VERSION).tar.gz
+OPENVMTOOLS_SITE = http://downloads.sourceforge.net/project/open-vm-tools/open-vm-tools/stable-9.4.x
+
+OPENVMTOOLS_CONF_OPT = \
+        --without-icu \
+        --without-x \
+        --without-gtk2 \
+        --without-gtkmm
+
+#-Wno-deprecated-declarations is a workaround for a bug in open-vm-tools
+#See http://sourceforge.net/p/open-vm-tools/mailman/message/31473171/
+OPENVMTOOLS_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -Wno-deprecated-declarations"
+
+OPENVMTOOLS_DEPENDENCIES += libglib2
+
+# When libfuse is available, openvmtools can build vmblock-fuse, so
+# make sure that libfuse gets built first.
+ifeq ($(BR2_PACKAGE_LIBFUSE),y)
+OPENVMTOOLS_DEPENDENCIES += libfuse
+endif
+
+ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PROCPS),y)
+OPENVMTOOLS_CONF_OPT += --with-procps LDFLAGS="-L$(TARGET_DIR)/lib -L$(TARGET_DIR)/usr/lib"
+OPENVMTOOLS_DEPENDENCIES += procps
+else
+OPENVMTOOLS_CONF_OPT += --without-procps
+endif
+
+ifeq ($(BR2_PACKAGE_OPENVMTOOLS_DNET),y)
+OPENVMTOOLS_CONF_OPT += --with-dnet CUSTOM_DNET_CPPFLAGS=-I$(STAGING_DIR)/usr/include
+OPENVMTOOLS_DEPENDENCIES += libdnet
+else
+OPENVMTOOLS_CONF_OPT += --without-dnet
+endif
+
+ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PAM),y)
+OPENVMTOOLS_CONF_OPT += --with-pam
+#Required to build with PAM
+OPENVMTOOLS_MAKE_OPT += "CFLAGS+=-Wno-unused-local-typedefs"
+OPENVMTOOLS_DEPENDENCIES += linux-pam
+else
+OPENVMTOOLS_CONF_OPT += --without-pam
+endif
+
+#For older kernels only!
+#See http://sourceforge.net/p/open-vm-tools/mailman/message/30113760/ for some clue
+ifeq ($(BR2_PACKAGE_OPENVMTOOLS_MODULES),y)
+OPENVMTOOLS_CONF_OPT += --with-kernel-modules --with-linuxdir=$(LINUX_DIR)
+OPENVMTOOLS_DEPENDENCIES += linux
+OPENVMTOOLS_PRE_CONFIGURE_HOOKS += OPENVMTOOLS_PRE_CONFIGURE_LINUX_FIX
+else
+OPENVMTOOLS_CONF_OPT += --without-kernel-modules
+endif
+
+#create a "build" directory symlink if building kernel modules
+#this is needed because configure looks for an include dir under a build dir in the kernel sources
+define OPENVMTOOLS_PRE_CONFIGURE_LINUX_FIX
+	if [ ! -e $(LINUX_DIR)/build ]; then \
+		ln -s . $(LINUX_DIR)/build; \
+	fi
+endef
+
+define OPENVMTOOLS_POST_INSTALL_TARGET_THINGIES
+#needed by lib/system/systemLinux.c (or will cry in /var/log/messages)
+	if [ ! -e $(TARGET_DIR)/etc/lfs-release ]; then \
+		ln -s os-release $(TARGET_DIR)/etc/lfs-release; \
+	fi
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
+	$(INSTALL) -D -m 755 package/openvmtools/S98vmtoolsd \
+		$(TARGET_DIR)/etc/init.d/S98vmtoolsd
+endef
+
+$(eval $(autotools-package))
diff --git a/package/openvmtools/shutdown b/package/openvmtools/shutdown
new file mode 100755
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
-- 
1.7.10.4
