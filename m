From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 24 Apr 2020 19:04:35 +0200
Subject: [Buildroot] [PATCH] package/libiec61850: new package
Message-ID: <20200424170435.22430-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Don't add mbedtls support since it require a bundled and specific
version.

Keep experimental Python binding support disabled for now.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
$ ./utils/test-pkg -c defconfig  -d pkg-test -p libiec61850 -k -a
                             andes-nds32 [ 1/44]: SKIPPED
                             arm-aarch64 [ 2/44]: OK
                        br-aarch64-glibc [ 3/44]: OK
                           br-arcle-hs38 [ 4/44]: OK
                            br-arm-basic [ 5/44]: SKIPPED
                  br-arm-cortex-a9-glibc [ 6/44]: OK
                   br-arm-cortex-a9-musl [ 7/44]: OK
                   br-arm-cortex-m4-full [ 8/44]: SKIPPED
                             br-arm-full [ 9/44]: OK
                    br-arm-full-nothread [10/44]: SKIPPED
                      br-arm-full-static [11/44]: SKIPPED
                   br-i386-pentium4-full [12/44]: OK
                br-i386-pentium-mmx-musl [13/44]: OK
                       br-m68k-5208-full [14/44]: SKIPPED
                      br-m68k-68040-full [15/44]: OK
                    br-microblazeel-full [16/44]: OK
                 br-mips32r6-el-hf-glibc [17/44]: OK
                      br-mips64-n64-full [18/44]: OK
                 br-mips64r6-el-hf-glibc [19/44]: OK
                      br-mipsel-o32-full [20/44]: OK
                          br-nios2-glibc [21/44]: OK
                      br-openrisc-uclibc [22/44]: OK
               br-powerpc-603e-basic-cpp [23/44]: OK
             br-powerpc64le-power8-glibc [24/44]: OK
               br-powerpc64-power7-glibc [25/44]: OK
                  br-powerpc-e500mc-full [26/44]: OK
                              br-riscv32 [27/44]: OK
                              br-riscv64 [28/44]: OK
                             br-sh4-full [29/44]: OK
                        br-sparc64-glibc [30/44]: OK
                         br-sparc-uclibc [31/44]: OK
                    br-x86-64-core2-full [32/44]: OK
                          br-x86-64-musl [33/44]: OK
                          br-xtensa-full [34/44]: OK
                       linaro-aarch64-be [35/44]: OK
                          linaro-aarch64 [36/44]: OK
                              linaro-arm [37/44]: OK
                     sourcery-arm-armv4t [38/44]: OK
                            sourcery-arm [39/44]: OK
                     sourcery-arm-thumb2 [40/44]: OK
                         sourcery-mips64 [41/44]: OK
                           sourcery-mips [42/44]: OK
                          sourcery-nios2 [43/44]: OK
                         sourcery-x86-64 [44/44]: OK
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...001-use-poll.h-instead-of-sys-poll.h.patch | 33 +++++++++++++++++++
 ...linux-Add-missing-include-sys-time.h.patch | 32 ++++++++++++++++++
 package/libiec61850/Config.in                 | 21 ++++++++++++
 package/libiec61850/libiec61850.hash          |  3 ++
 package/libiec61850/libiec61850.mk            | 15 +++++++++
 7 files changed, 106 insertions(+)
 create mode 100644 package/libiec61850/0001-use-poll.h-instead-of-sys-poll.h.patch
 create mode 100644 package/libiec61850/0002-serial_port_linux-Add-missing-include-sys-time.h.patch
 create mode 100644 package/libiec61850/Config.in
 create mode 100644 package/libiec61850/libiec61850.hash
 create mode 100644 package/libiec61850/libiec61850.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c57bc1c5c9..16e985270a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2221,6 +2221,7 @@ F:	package/liblinear/
 F:	package/lensfun/
 F:	package/libclc/
 F:	package/libgta/
+F:	package/libiec61850/
 F:	package/libspatialindex/
 F:	package/linux-syscall-support/
 F:	package/llvm/
diff --git a/package/Config.in b/package/Config.in
index a9c6f6fcbc..da1808ec97 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -474,6 +474,7 @@ endmenu
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
index 0000000000..bd19128ef5
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
+LIBIEC61850_LICENSE = GPL-3.0
+LIBIEC61850_LICENSE_FILES = COPYING
+LIBIEC61850_CONF_OPTS = -DBUILD_EXAMPLES=OFF \
+	-DBUILD_PYTHON_BINDINGS=OFF
+
+$(eval $(cmake-package))
-- 
2.21.1
