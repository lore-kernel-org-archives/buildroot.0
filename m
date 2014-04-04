From: Karoly Kasza <kaszak@gmail.com>
Date: Fri,  4 Apr 2014 10:12:13 +0200
Subject: [Buildroot] [PATCH 1/1] openvmtools: new package
Message-ID: <1396599134-2411-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this patch adds the latest stable open-vm-tools to buildroot.
(http://open-vm-tools.sourceforge.net/)
It should be compatible with all 3 libc implementations.
Also Contains a small patch for the source, a SysV init script and
a small shutdown script to make the VM power options usable from
the host OS.
Addresses Bugzilla bug 3991.

BR
Karoly

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 package/Config.in                                  |    1 +
 package/openvmtools/Config.in                      |   92 +++++++++++++++++++
 package/openvmtools/S98vmtoolsd                    |   31 +++++++
 .../openvmtools-01-has_bsd_printf.patch            |   26 ++++++
 package/openvmtools/openvmtools.mk                 |   93 ++++++++++++++++++++
 package/openvmtools/shutdown                       |    7 ++
 6 files changed, 250 insertions(+)
 create mode 100644 package/openvmtools/Config.in
 create mode 100755 package/openvmtools/S98vmtoolsd
 create mode 100644 package/openvmtools/openvmtools-01-has_bsd_printf.patch
 create mode 100644 package/openvmtools/openvmtools.mk
 create mode 100755 package/openvmtools/shutdown

diff --git a/package/Config.in b/package/Config.in
index e816603..907cb23 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -328,6 +328,7 @@ source "package/on2-8170-modules/Config.in"
 source "package/open2300/Config.in"
 source "package/openocd/Config.in"
 source "package/openpowerlink/Config.in"
+source "package/openvmtools/Config.in"
 source "package/owl-linux/Config.in"
 source "package/parted/Config.in"
 source "package/pciutils/Config.in"
diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
new file mode 100644
index 0000000..fd9486b
--- /dev/null
+++ b/package/openvmtools/Config.in
@@ -0,0 +1,92 @@
+config BR2_PACKAGE_OPENVMTOOLS
+	bool "openvmtools"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_USE_MMU #libglib2
+	depends on BR2_USE_WCHAR #libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS #libglib2
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC #needed by an include in lib/include/vmxrpc.h
+	depends on BR2_LARGEFILE #needed by an include in lib/include/vmxrpc.h
+	depends on BR2_ENABLE_LOCALE #needed by __locale_t in lib/misc/codesetOld.c
+	select BR2_PACKAGE_LIBGLIB2 #always needed
+	help
+	  Open Virtual Machine Tools for VMware guest OS
+
+	  http://open-vm-tools.sourceforge.net/
+
+if BR2_PACKAGE_OPENVMTOOLS
+
+menu "openvmtools options"
+
+#This can't be disabled by configure, will compile itself if libfuse is found,
+#so we warn the user
+comment "openvmtools vmblock-fuse is disabled because these is no libfuse!"
+	depends on !BR2_PACKAGE_LIBFUSE
+
+comment "openvmtools vmblock-fuse is enabled because libfuse is found!"
+	depends on BR2_PACKAGE_LIBFUSE
+
+config BR2_PACKAGE_OPENVMTOOLS_PROCPS
+	bool "openvmtools procps support"
+	depends on BR2_PACKAGE_PROCPS
+	help
+	  Enable support for procps / meminfo
+
+comment "openvmtools procps support needs procps"
+	depends on !BR2_PACKAGE_PROCPS
+
+config BR2_PACKAGE_OPENVMTOOLS_DNET
+	bool "openvmtools dnet support"
+	depends on BR2_INET_IPV6 #needed by services/plugins/guestInfo/getlib/guestInfoPosix.c
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
+comment "openvmtools ICU locales are not supported"
+
+#Does not compile, also needs some hacks in configure...
+#config BR2_PACKAGE_OPENVMTOOLS_ICU
+#	bool "openvmtools icu locales suport"
+#	depends on BR2_INSTALL_LIBSTDCPP #needed by icu
+#	select BR2_PACKAGE_ICU
+#	help
+#	  Use icu for openvmtools locales
+#	  I would only recommend to use this only if you already has icu,
+#	  as it is large and requires a C++ compiler
+
+#comment "openvmtools icu locales support needs a toolchain w/ C++"
+#	depends on !BR2_INSTALL_LIBSTDCPP
+
+comment "openvmtools X11 tools are not supported"
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
index 0000000..1278dae
--- /dev/null
+++ b/package/openvmtools/openvmtools.mk
@@ -0,0 +1,93 @@
+#############################################################
+#
+# openvmtools
+#
+#############################################################
+OPENVMTOOLS_VERSION = 9.4.0-1280544
+OPENVMTOOLS_SOURCE = open-vm-tools-$(OPENVMTOOLS_VERSION).tar.gz
+OPENVMTOOLS_SITE = http://downloads.sourceforge.net/project/open-vm-tools/open-vm-tools/stable-9.4.x
+
+OPENVMTOOLS_CONF_OPT += --disable-docs
+OPENVMTOOLS_MAKE_OPT += "CFLAGS+=-Wno-unused-local-typedefs"
+OPENVMTOOLS_DEPENDENCIES += libglib2
+OPENVMTOOLS_POST_INSTALL_TARGET_HOOKS += OPENVMTOOLS_POST_INSTALL_TARGET_THINGIES
+
+#If libfuse is found, vmblock-fuse is always compiled, we just set a sequence
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
+OPENVMTOOLS_CONF_OPT += --with-dnet CUSTOM_DNET_CPPFLAGS=-I$(TARGET_DIR)/usr/include
+OPENVMTOOLS_DEPENDENCIES += libdnet
+OPENVMTOOLS_PRE_CONFIGURE_HOOKS += OPENVMTOOLS_PRE_CONFIGURE_DNET_FIX
+else
+OPENVMTOOLS_CONF_OPT += --without-dnet
+endif
+
+ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PAM),y)
+OPENVMTOOLS_CONF_OPT += --with-pam
+OPENVMTOOLS_DEPENDENCIES += linux-pam
+else
+OPENVMTOOLS_CONF_OPT += --without-pam
+endif
+
+#For older kernels only!
+#See http://sourceforge.net/p/open-vm-tools/mailman/message/30113760/ for some clue
+ifeq ($(BR2_PACKAGE_OPENVMTOOLS_MODULES),y)
+OPENVMTOOLS_CONF_OPT += --with-kernel-modules --with-linuxdir=$(BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)
+OPENVMTOOLS_DEPENDENCIES += linux
+OPENVMTOOLS_PRE_CONFIGURE_HOOKS += OPENVMTOOLS_PRE_CONFIGURE_LINUX_FIX
+else
+OPENVMTOOLS_CONF_OPT += --without-kernel-modules
+endif
+
+#Does not configure or compile, needs hacks, also not really needed...
+#ifeq ($(BR2_PACKAGE_OPENVMTOOLS_ICU),y)
+#OPENVMTOOLS_CONF_OPT += --with-icu
+#OPENVMTOOLS_DEPENDENCIES = icu
+#else
+OPENVMTOOLS_CONF_OPT += --without-icu
+#endif
+
+#No X11 suport (yet)
+OPENVMTOOLS_CONF_OPT += --without-x
+OPENVMTOOLS_CONF_OPT += --without-gtk2
+OPENVMTOOLS_CONF_OPT += --without-gtkmm
+
+#create a "build" directory symlink if building kernel modules
+define OPENVMTOOLS_PRE_CONFIGURE_LINUX_FIX
+	if [ ! -e $(BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)/build ]; then \
+		ln -s . $(BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)/build; \
+	fi
+endef
+
+define OPENVMTOOLS_PRE_CONFIGURE_DNET_FIX
+	cp -f $(BUILD_DIR)/libdnet-$(LIBDNET_VERSION)/dnet-config $(TARGET_DIR)/usr/bin
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
