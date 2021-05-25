From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 25 May 2021 14:03:41 +0200
Subject: [Buildroot] [PATCH for-next] package/libiec61850: bump to version
 1.5.0
Message-ID: <20210525120341.35774-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove all upstream patches
Remove IGNORE_CVES for CVE-2020-15158

Build tested:
https://gitlab.com/kubu93/buildroot/-/pipelines/309037705

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
test-pkg config:
BR2_PACKAGE_LIBIEC61850=y
---
 ...001-use-poll.h-instead-of-sys-poll.h.patch | 33 -------------------
 ...linux-Add-missing-include-sys-time.h.patch | 32 ------------------
 ...uffer-overflow-when-handling-message.patch | 27 ---------------
 package/libiec61850/libiec61850.hash          |  2 +-
 package/libiec61850/libiec61850.mk            |  5 +--
 5 files changed, 2 insertions(+), 97 deletions(-)
 delete mode 100644 package/libiec61850/0001-use-poll.h-instead-of-sys-poll.h.patch
 delete mode 100644 package/libiec61850/0002-serial_port_linux-Add-missing-include-sys-time.h.patch
 delete mode 100644 package/libiec61850/0003-COTP-fixed-possible-heap-buffer-overflow-when-handling-message.patch

diff --git a/package/libiec61850/0001-use-poll.h-instead-of-sys-poll.h.patch b/package/libiec61850/0001-use-poll.h-instead-of-sys-poll.h.patch
deleted file mode 100644
index a04473d218..0000000000
--- a/package/libiec61850/0001-use-poll.h-instead-of-sys-poll.h.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 4cad505fc98240eb66eaabfae61a9694f8158dda Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Tue, 7 Apr 2020 20:58:37 +0200
-Subject: [PATCH] use <poll.h> instead of <sys/poll.h>
-
-The manpage of poll(2) states that the prototype of poll is defined
-in <poll.h>. Use that header file instead of <sys/poll.h> to allow
-compilation against musl-libc.
-
-Upstream status: Pending
-https://github.com/mz-automation/libiec61850/pull/228
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- hal/ethernet/linux/ethernet_linux.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/hal/ethernet/linux/ethernet_linux.c b/hal/ethernet/linux/ethernet_linux.c
-index c3ab2e2..9aa5c28 100644
---- a/hal/ethernet/linux/ethernet_linux.c
-+++ b/hal/ethernet/linux/ethernet_linux.c
-@@ -23,7 +23,7 @@
- 
- #include <sys/socket.h>
- #include <sys/ioctl.h>
--#include <sys/poll.h>
-+#include <poll.h>
- #include <linux/if_packet.h>
- #include <linux/if_ether.h>
- #include <linux/if_arp.h>
--- 
-2.21.1
-
diff --git a/package/libiec61850/0002-serial_port_linux-Add-missing-include-sys-time.h.patch b/package/libiec61850/0002-serial_port_linux-Add-missing-include-sys-time.h.patch
deleted file mode 100644
index e1b8ca15b3..0000000000
--- a/package/libiec61850/0002-serial_port_linux-Add-missing-include-sys-time.h.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 661405eb6066b67dfe51d5ff9635e29f86bdd238 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Tue, 7 Apr 2020 21:02:54 +0200
-Subject: [PATCH] serial_port_linux: Add missing include sys/time.h
-
-POSIX says `struct timeval` is defined if <sys/time.h> is included.
-
-Adding this header allow to build against musl-libc.
-
-Upstream status: Pending
-https://github.com/mz-automation/libiec61850/pull/228
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- hal/serial/linux/serial_port_linux.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/hal/serial/linux/serial_port_linux.c b/hal/serial/linux/serial_port_linux.c
-index e6308c0..15e5794 100644
---- a/hal/serial/linux/serial_port_linux.c
-+++ b/hal/serial/linux/serial_port_linux.c
-@@ -29,6 +29,7 @@
- #include <termios.h>
- #include <fcntl.h>
- #include <unistd.h>
-+#include <sys/time.h>
- 
- #include "hal_serial.h"
- #include "hal_time.h"
--- 
-2.21.1
-
diff --git a/package/libiec61850/0003-COTP-fixed-possible-heap-buffer-overflow-when-handling-message.patch b/package/libiec61850/0003-COTP-fixed-possible-heap-buffer-overflow-when-handling-message.patch
deleted file mode 100644
index 88048555b7..0000000000
--- a/package/libiec61850/0003-COTP-fixed-possible-heap-buffer-overflow-when-handling-message.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 033ab5b6488250c8c3b838f25a7cbc3e099230bb Mon Sep 17 00:00:00 2001
-From: Michael Zillgith <michael.zillgith@mz-automation.de>
-Date: Wed, 12 Aug 2020 07:25:37 +0200
-Subject: [PATCH] - COTP: fixed possible heap buffer overflow when handling
- message with invalid (zero) value in length field (#250)
-
-[Retrieved from:
-https://github.com/mz-automation/libiec61850/commit/033ab5b6488250c8c3b838f25a7cbc3e099230bb]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/mms/iso_cotp/cotp.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/mms/iso_cotp/cotp.c b/src/mms/iso_cotp/cotp.c
-index cbb34b36..8c37d262 100644
---- a/src/mms/iso_cotp/cotp.c
-+++ b/src/mms/iso_cotp/cotp.c
-@@ -720,6 +720,9 @@ CotpConnection_readToTpktBuffer(CotpConnection* self)
-             goto exit_waiting;
-     }
- 
-+    if (self->packetSize <= bufPos)
-+        goto exit_error;
-+
-     readBytes = readFromSocket(self, buffer + bufPos, self->packetSize - bufPos);
- 
-     if (readBytes < 0)
diff --git a/package/libiec61850/libiec61850.hash b/package/libiec61850/libiec61850.hash
index 5739a5d8c9..3a024be7c6 100644
--- a/package/libiec61850/libiec61850.hash
+++ b/package/libiec61850/libiec61850.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d0630cd5b7ac67a2d286b0ad574ff1c9074c96be33b9d5a300cd69e89429abbe  libiec61850-1.4.2.1.tar.gz
+sha256  7b832c195ae9f42faa1ccfe1b82b9ff187103155ce45aaca08881be98459d164  libiec61850-1.5.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libiec61850/libiec61850.mk b/package/libiec61850/libiec61850.mk
index 4f82451eb8..6da782ad39 100644
--- a/package/libiec61850/libiec61850.mk
+++ b/package/libiec61850/libiec61850.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIEC61850_VERSION = 1.4.2.1
+LIBIEC61850_VERSION = 1.5.0
 LIBIEC61850_SITE = $(call github,mz-automation,libiec61850,v$(LIBIEC61850_VERSION))
 LIBIEC61850_INSTALL_STAGING = YES
 LIBIEC61850_LICENSE = GPL-3.0+
@@ -12,7 +12,4 @@ LIBIEC61850_LICENSE_FILES = COPYING
 LIBIEC61850_CPE_ID_VENDOR = mz-automation
 LIBIEC61850_CONF_OPTS = -DBUILD_PYTHON_BINDINGS=OFF
 
-# 0003-COTP-fixed-possible-heap-buffer-overflow-when-handling-message.patch
-LIBIEC61850_IGNORE_CVES += CVE-2020-15158
-
 $(eval $(cmake-package))
-- 
2.31.1
