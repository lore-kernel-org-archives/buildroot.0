From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Oct 2014 18:12:17 +0200
Subject: [Buildroot] [git commit] package/canfestival: new package
Message-ID: <20141006161827.10D0BB0BF7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=23c52855e212aa34d67fd8d791f82aae635a9306
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Note: the patch adding the pkgconfig module has been sent upstream [1].

[1] http://sourceforge.net/p/canfestival/mailman/message/32876320/

[Thomas:
 - license seems to be only LGPLv2.1+. At least, the specific files
   pointed to be GPLv2 carry a LGPLv2.1+ header.
 - added thread dependency
 - minor rewording here and there.]

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Eric Jarrige <eric.jarrige@armadeus.org>
Cc: Julien Boibessot <julien.boibessot@armadeus.com>
Cc: Davide Viti <zinosat@tiscali.it>
Cc: Claudio Laurita <claudio.laurita@integrazionetotale.it>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/canfestival/Config.in                      |   86 ++++++++++++++++++++
 ...-install-pkgconfig-module-for-canfestival.patch |   74 +++++++++++++++++
 package/canfestival/canfestival.mk                 |   53 ++++++++++++
 4 files changed, 214 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index de10d4f..aad968c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -761,6 +761,7 @@ endmenu
 menu "Networking"
 	source "package/agentpp/Config.in"
 	source "package/c-ares/Config.in"
+	source "package/canfestival/Config.in"
 	source "package/cppzmq/Config.in"
 	source "package/czmq/Config.in"
 	source "package/filemq/Config.in"
diff --git a/package/canfestival/Config.in b/package/canfestival/Config.in
new file mode 100644
index 0000000..dd0db3e
--- /dev/null
+++ b/package/canfestival/Config.in
@@ -0,0 +1,86 @@
+config BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS
+	bool
+	default y if BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm
+
+comment "canfestival needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_CANFESTIVAL
+	bool "canfestival"
+	depends on BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  CanFestival is an OpenSource CANOpen framework, licensed under
+	  LGPLv2.1 and GPLv2 for some drivers (virtual_kernel, lincan and
+	  copcican_comedi).
+
+	  http://www.canfestival.org
+
+if BR2_PACKAGE_CANFESTIVAL
+
+choice
+	prompt "driver"
+	default BR2_PACKAGE_CANFESTIVAL_SOCKET
+
+# - The AnaGate CAN(duo) [1], PeakSystem CAN [2] and CO-PCICAN [3]
+#   drivers are not available (not packaged in Buildroot), so their
+#   support are disabled.
+# - The virtual_kernel driver is disabled because it uses very old
+#   kernel APIs, that have been renamed, or marked as deprecated or
+#   removed for a long while. The question has been raised on the
+#   canfestival mailing list [4].
+#
+# [1] http://www.anagate.de/en/index.html
+# [2] http://www.peak-system.com/linux/
+# [3] http://www.cosateq.com/
+# [4] http://sourceforge.net/p/canfestival/mailman/message/32519648/
+
+config BR2_PACKAGE_CANFESTIVAL_VIRTUAL
+	bool "virtual"
+	help
+	  Unix pipe based virtual CAN driver.
+
+config BR2_PACKAGE_CANFESTIVAL_SOCKET
+	bool "socket"
+	help
+	  SocketCAN (the standard mainline CAN bus interface).
+
+	  http://developer.berlios.de/projects/socketcan/
+
+config BR2_PACKAGE_CANFESTIVAL_LINCAN
+	bool "lincan"
+	help
+	  Lincan driver.
+
+	  http://www.ocera.org/download/components/WP7/lincan-0.3.3.html
+
+config BR2_PACKAGE_CANFESTIVAL_CAN4LINUX
+	bool "can4linux"
+	help
+	  Can4linux driver.
+
+	  http://www.port.de/engl/canprod/hw_can4linux.html
+
+endchoice
+
+config BR2_PACKAGE_CANFESTIVAL_DRIVER
+	string
+	default "virtual"	  if BR2_PACKAGE_CANFESTIVAL_VIRTUAL
+	default "socket"	  if BR2_PACKAGE_CANFESTIVAL_SOCKET
+	default "lincan"	  if BR2_PACKAGE_CANFESTIVAL_LINCAN
+	default "can4linux"	  if BR2_PACKAGE_CANFESTIVAL_CAN4LINUX
+
+config BR2_PACKAGE_CANFESTIVAL_ADDITIONAL_OPTIONS
+	string "additional configure options"
+	help
+	  Additional options can be passed directly to the configure script
+	  (e.g.: --MAX_CAN_BUS_ID=..., --SDO_MAX_LENGTH_TRANSFER=...,
+	  --SDO_BLOCK_SIZE=...).
+
+config BR2_PACKAGE_CANFESTIVAL_INSTALL_EXAMPLES
+	bool "install examples"
+	help
+	  Install binary application examples.
+
+endif
diff --git a/package/canfestival/canfestival-0001-install-pkgconfig-module-for-canfestival.patch b/package/canfestival/canfestival-0001-install-pkgconfig-module-for-canfestival.patch
new file mode 100644
index 0000000..23f3d89
--- /dev/null
+++ b/package/canfestival/canfestival-0001-install-pkgconfig-module-for-canfestival.patch
@@ -0,0 +1,74 @@
+From s.martin49 at gmail.com Sun Sep 28 14:59:53 2014
+Content-Type: text/plain; charset="us-ascii"
+MIME-Version: 1.0
+Content-Transfer-Encoding: 7bit
+Subject: [PATCH] Install pkgconfig module for canfestival
+X-Mercurial-Node: c408fdc77aa18fcda81db4f0d038e8a69ba84bb2
+X-Mercurial-Series-Index: 1
+X-Mercurial-Series-Total: 1
+Message-Id: <c408fdc77aa18fcda81d.1411909193@bobook>
+X-Mercurial-Series-Id: <c408fdc77aa18fcda81d.1411909193@bobook>
+User-Agent: Mercurial-patchbomb/3.1.1
+Date: Sun, 28 Sep 2014 14:59:53 +0200
+From: Samuel Martin <s.martin49@gmail.com>
+To: canfestival-devel at lists.sourceforge.net
+Cc: Samuel Martin <s.martin49@gmail.com>
+
+# HG changeset patch
+# User "Samuel Martin" <s.martin49@gmail.com>
+# Date 1411906817 -7200
+#      Sun Sep 28 14:20:17 2014 +0200
+# Node ID c408fdc77aa18fcda81db4f0d038e8a69ba84bb2
+# Parent  7740ac6fdedc23e1ed6908d3d7db54833c88572b
+Install pkgconfig module for canfestival.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+Cc: Cluadio Laurita <claudio.laurita@integrazionetotale.it>
+
+diff -r 7740ac6fdedc -r c408fdc77aa1 canfestival.pc.in
+--- /dev/null	Thu Jan 01 00:00:00 1970 +0000
++++ b/canfestival.pc.in	Sun Sep 28 14:20:17 2014 +0200
+@@ -0,0 +1,12 @@
++PREFIX = SUB_PREFIX
++TARGET = SUB_TARGET
++
++prefix=${PREFIX}
++libdir=${prefix}/lib
++includedir=${prefix}/include/canfestival
++
++Name: Canfestival
++Description: Canfestival CANOpen library
++Version: 1
++Libs: -L${libdir} -lcanfestival -lcanfestival_${TARGET} -lrt -ldl -lpthread
++Cflags: -I${includedir}
+diff -r 7740ac6fdedc -r c408fdc77aa1 configure
+--- a/configure	Thu Jun 12 14:07:16 2014 +0200
++++ b/configure	Sun Sep 28 14:20:17 2014 +0200
+@@ -813,6 +813,10 @@
+     MAKEFILES=$MAKEFILES\ drivers/$SUB_TARGET/Makefile.in
+ fi
+ 
++if [ "$SUB_TARGET" = "unix" ]; then
++    MAKEFILES=$MAKEFILES\ canfestival.pc.in
++fi
++
+ if [ "$SUB_TARGET" = "unix" -a "$SUB_TIMERS_DRIVER" = "kernel" ]; then
+ 	MAKEFILES=$MAKEFILES\
+ \	examples/kerneltest/Makefile.in\
+diff -r 7740ac6fdedc -r c408fdc77aa1 src/Makefile.in
+--- a/src/Makefile.in	Thu Jun 12 14:07:16 2014 +0200
++++ b/src/Makefile.in	Sun Sep 28 14:20:17 2014 +0200
+@@ -132,9 +132,10 @@
+ 	$(CC) $(CFLAGS) $(PROG_CFLAGS) ${PROGDEFINES} $(INCLUDES) -o $@ -c $<
+ 
+ install: libcanfestival.a
+-	mkdir -p $(DESTDIR)$(PREFIX)/lib/
++	mkdir -p $(DESTDIR)$(PREFIX)/lib/pkgconfig
+ 	mkdir -p $(DESTDIR)$(PREFIX)/include/canfestival
+ 	cp libcanfestival.a $(DESTDIR)$(PREFIX)/lib/
++	cp ../canfestival.pc $(DESTDIR)$(PREFIX)/lib/pkgconfig/
+ 	cp ../include/*.h $(DESTDIR)$(PREFIX)/include/canfestival
+ 
+ uninstall:
+
+
diff --git a/package/canfestival/canfestival.mk b/package/canfestival/canfestival.mk
new file mode 100644
index 0000000..fb1787e
--- /dev/null
+++ b/package/canfestival/canfestival.mk
@@ -0,0 +1,53 @@
+################################################################################
+#
+# canfestival
+#
+################################################################################
+
+# Revision 791:
+CANFESTIVAL_VERSION = 7740ac6fdedc
+CANFESTIVAL_SOURCE = $(CANFESTIVAL_VERSION).tar.bz2
+CANFESTIVAL_SITE = http://dev.automforge.net/CanFestival-3/archive
+CANFESTIVAL_LICENSE = LGPLv2.1+
+CANFESTIVAL_LICENSE_FILES = COPYING LICENCE
+CANFESTIVAL_INSTALL_STAGING = YES
+CANFESTIVAL_INSTALLED-y = src drivers
+CANFESTIVAL_INSTALLED-$(BR2_PACKAGE_CANFESTIVAL_INSTALL_EXAMPLES) += examples
+
+# canfestival uses its own hand-written build-system. Though there is
+# a configure script, it does not use the autotools, so, we use the
+# generic-package infrastructure.
+define CANFESTIVAL_CONFIGURE_CMDS
+	cd $(@D) && \
+		$(TARGET_CONFIGURE_OPTS) ./configure \
+		--target=unix \
+		--arch=$(BR2_ARCH) \
+		--timers=unix \
+		--binutils=$(TARGET_CROSS) \
+		--cc="$(TARGET_CC)" \
+		--cxx="$(TARGET_CC)" \
+		--ld="$(TARGET_CC)" \
+		--prefix=/usr \
+		--can=$(BR2_PACKAGE_CANFESTIVAL_DRIVER) \
+		$(call qstrip,$(BR2_PACKAGE_CANFESTIVAL_ADDITIONAL_OPTIONS))
+endef
+
+define CANFESTIVAL_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) all
+endef
+
+define CANFESTIVAL_INSTALL_TARGET_CMDS
+	for d in $(CANFESTIVAL_INSTALLED-y) ; do \
+		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$$d install \
+			 DESTDIR=$(TARGET_DIR) || exit 1 ; \
+	done
+endef
+
+define CANFESTIVAL_INSTALL_STAGING_CMDS
+	for d in $(CANFESTIVAL_INSTALLED-y) ; do \
+		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$$d install \
+			DESTDIR=$(STAGING_DIR) || exit 1 ; \
+	done
+endef
+
+$(eval $(generic-package))
