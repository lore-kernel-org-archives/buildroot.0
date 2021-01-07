From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Jan 2021 23:32:35 +0100
Subject: [Buildroot] [git commit] package/libiec61850: new package
Message-ID: <20210107221435.3856886877@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66f10a26a19f4b45cdc5732c8953b3f560c17c6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't add mbedtls support since it require a bundled and specific
version.

Keep experimental Python binding support disabled for now.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-use-poll.h-instead-of-sys-poll.h.patch    | 33 ++++++++++++++++++++++
 ...port_linux-Add-missing-include-sys-time.h.patch | 32 +++++++++++++++++++++
 package/libiec61850/Config.in                      | 21 ++++++++++++++
 package/libiec61850/libiec61850.hash               |  3 ++
 package/libiec61850/libiec61850.mk                 | 15 ++++++++++
 7 files changed, 106 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ad2bc8ff19..dc606b4c5d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2268,6 +2268,7 @@ F:	package/liblinear/
 F:	package/lensfun/
 F:	package/libclc/
 F:	package/libgta/
+F:	package/libiec61850/
 F:	package/libspatialindex/
 F:	package/linux-syscall-support/
 F:	package/llvm/
diff --git a/package/Config.in b/package/Config.in
index 2132f1609b..056d419ac2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -483,6 +483,7 @@ endmenu
 	source "package/iucode-tool/Config.in"
 	source "package/kbd/Config.in"
 	source "package/lcdproc/Config.in"
+	source "package/libiec61850/Config.in"
 	source "package/libubootenv/Config.in"
 	source "package/libuio/Config.in"
 	source "package/linux-backports/Config.in"
diff --git a/package/libiec61850/0001-use-poll.h-instead-of-sys-poll.h.patch b/package/libiec61850/0001-use-poll.h-instead-of-sys-poll.h.patch
new file mode 100644
index 0000000000..a04473d218
--- /dev/null
+++ b/package/libiec61850/0001-use-poll.h-instead-of-sys-poll.h.patch
@@ -0,0 +1,33 @@
+From 4cad505fc98240eb66eaabfae61a9694f8158dda Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Tue, 7 Apr 2020 20:58:37 +0200
+Subject: [PATCH] use <poll.h> instead of <sys/poll.h>
+
+The manpage of poll(2) states that the prototype of poll is defined
+in <poll.h>. Use that header file instead of <sys/poll.h> to allow
+compilation against musl-libc.
+
+Upstream status: Pending
+https://github.com/mz-automation/libiec61850/pull/228
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ hal/ethernet/linux/ethernet_linux.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hal/ethernet/linux/ethernet_linux.c b/hal/ethernet/linux/ethernet_linux.c
+index c3ab2e2..9aa5c28 100644
+--- a/hal/ethernet/linux/ethernet_linux.c
++++ b/hal/ethernet/linux/ethernet_linux.c
+@@ -23,7 +23,7 @@
+ 
+ #include <sys/socket.h>
+ #include <sys/ioctl.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <linux/if_packet.h>
+ #include <linux/if_ether.h>
+ #include <linux/if_arp.h>
+-- 
+2.21.1
+
diff --git a/package/libiec61850/0002-serial_port_linux-Add-missing-include-sys-time.h.patch b/package/libiec61850/0002-serial_port_linux-Add-missing-include-sys-time.h.patch
new file mode 100644
index 0000000000..e1b8ca15b3
--- /dev/null
+++ b/package/libiec61850/0002-serial_port_linux-Add-missing-include-sys-time.h.patch
@@ -0,0 +1,32 @@
+From 661405eb6066b67dfe51d5ff9635e29f86bdd238 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Tue, 7 Apr 2020 21:02:54 +0200
+Subject: [PATCH] serial_port_linux: Add missing include sys/time.h
+
+POSIX says `struct timeval` is defined if <sys/time.h> is included.
+
+Adding this header allow to build against musl-libc.
+
+Upstream status: Pending
+https://github.com/mz-automation/libiec61850/pull/228
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ hal/serial/linux/serial_port_linux.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/hal/serial/linux/serial_port_linux.c b/hal/serial/linux/serial_port_linux.c
+index e6308c0..15e5794 100644
+--- a/hal/serial/linux/serial_port_linux.c
++++ b/hal/serial/linux/serial_port_linux.c
+@@ -29,6 +29,7 @@
+ #include <termios.h>
+ #include <fcntl.h>
+ #include <unistd.h>
++#include <sys/time.h>
+ 
+ #include "hal_serial.h"
+ #include "hal_time.h"
+-- 
+2.21.1
+
diff --git a/package/libiec61850/Config.in b/package/libiec61850/Config.in
new file mode 100644
index 0000000000..0badc9ba62
--- /dev/null
+++ b/package/libiec61850/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_LIBIEC61850
+	bool "libiec61850"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	help
+	  IEC 61850 is an international standard for
+	  communication systems in Substation Automation Systems
+	  (SAS) and management of Decentralized Energy Resources
+	  (DER). It is seen as one of the communication standards
+	  of the emerging Smart Grid.
+
+	  The project libIEC61850 provides a server and client
+	  library for the IEC 61850/MMS, IEC 61850/GOOSE and IEC
+	  61850-9-2/Sampled Values communication protocols
+	  written in C. It is available under the GPLv3 license.
+
+	  http://libiec61850.com
+
+comment "libiec61850 needs a toolchain w/ C++, threads, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libiec61850/libiec61850.hash b/package/libiec61850/libiec61850.hash
new file mode 100644
index 0000000000..5739a5d8c9
--- /dev/null
+++ b/package/libiec61850/libiec61850.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  d0630cd5b7ac67a2d286b0ad574ff1c9074c96be33b9d5a300cd69e89429abbe  libiec61850-1.4.2.1.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libiec61850/libiec61850.mk b/package/libiec61850/libiec61850.mk
new file mode 100644
index 0000000000..9d527f5831
--- /dev/null
+++ b/package/libiec61850/libiec61850.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libiec61850
+#
+################################################################################
+
+LIBIEC61850_VERSION = 1.4.2.1
+LIBIEC61850_SITE = $(call github,mz-automation,libiec61850,v$(LIBIEC61850_VERSION))
+LIBIEC61850_INSTALL_STAGING = YES
+LIBIEC61850_LICENSE = GPL-3.0+
+LIBIEC61850_LICENSE_FILES = COPYING
+LIBIEC61850_CONF_OPTS = -DBUILD_EXAMPLES=OFF \
+	-DBUILD_PYTHON_BINDINGS=OFF
+
+$(eval $(cmake-package))
