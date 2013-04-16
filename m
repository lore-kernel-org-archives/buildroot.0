From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue, 16 Apr 2013 08:20:04 +0100
Subject: [Buildroot] [PATCH] libserial: new package
Message-ID: <1366096804-2032-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/Config.in                                  |    1 +
 package/libserial/Config.in                        |   11 ++++
 .../libserial-0000-missing-includes.patch          |   54 ++++++++++++++++++++
 package/libserial/libserial.mk                     |   13 +++++
 4 files changed, 79 insertions(+)
 create mode 100644 package/libserial/Config.in
 create mode 100644 package/libserial/libserial-0000-missing-includes.patch
 create mode 100644 package/libserial/libserial.mk

diff --git a/package/Config.in b/package/Config.in
index f28cedd..6f87a6d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -463,6 +463,7 @@ source "package/libhid/Config.in"
 source "package/libiqrf/Config.in"
 source "package/libnfc/Config.in"
 source "package/libnfc-llcp/Config.in"
+source "package/libserial/Config.in"
 source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
 source "package/libv4l/Config.in"
diff --git a/package/libserial/Config.in b/package/libserial/Config.in
new file mode 100644
index 0000000..f098e28
--- /dev/null
+++ b/package/libserial/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBSERIAL
+	bool "libserial"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Simplified serial port programming in C++ under POSIX operating
+	  systems.
+
+	  http://libserial.sourceforge.net/
+
+comment "libserial requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libserial/libserial-0000-missing-includes.patch b/package/libserial/libserial-0000-missing-includes.patch
new file mode 100644
index 0000000..ddff4c4
--- /dev/null
+++ b/package/libserial/libserial-0000-missing-includes.patch
@@ -0,0 +1,54 @@
+Add missing header includes.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+
+diff -Nurp a/examples/read_port.cpp b/examples/read_port.cpp
+--- a/examples/read_port.cpp	2005-09-27 05:34:18.000000000 +0100
++++ b/examples/read_port.cpp	2013-04-16 08:02:55.408457114 +0100
+@@ -1,3 +1,4 @@
++#include <cstdlib>
+ #include <iostream>
+ #include <SerialStream.h>
+ 
+diff -Nurp a/examples/write_port.cpp b/examples/write_port.cpp
+--- a/examples/write_port.cpp	2005-09-27 05:44:36.000000000 +0100
++++ b/examples/write_port.cpp	2013-04-16 08:03:34.088439743 +0100
+@@ -1,3 +1,4 @@
++#include <cstdlib>
+ #include <iostream>
+ #include <fstream>
+ #include <SerialStream.h>
+diff -Nurp a/src/PosixSignalDispatcher.cpp b/src/PosixSignalDispatcher.cpp
+--- a/src/PosixSignalDispatcher.cpp	2005-10-09 10:06:54.000000000 +0100
++++ b/src/PosixSignalDispatcher.cpp	2013-04-16 07:58:16.784610979 +0100
+@@ -12,6 +12,7 @@
+ #include "PosixSignalDispatcher.h"
+ #include "PosixSignalHandler.h"
+ #include <map>
++#include <cstring>
+ #include <errno.h>
+ #include <signal.h>
+ 
+diff -Nurp a/src/SerialPort.cpp b/src/SerialPort.cpp
+--- a/src/SerialPort.cpp	2005-09-19 08:11:46.000000000 +0100
++++ b/src/SerialPort.cpp	2013-04-16 07:59:28.596606012 +0100
+@@ -25,6 +25,8 @@
+ #include <map>
+ #include <cerrno>
+ #include <cassert>
++#include <cstdlib>
++#include <cstring>
+ #include <termios.h>
+ #include <fcntl.h>
+ #include <sys/ioctl.h>
+diff -Nurp a/src/SerialStreamBuf.cc b/src/SerialStreamBuf.cc
+--- a/src/SerialStreamBuf.cc	2005-10-17 01:12:52.000000000 +0100
++++ b/src/SerialStreamBuf.cc	2013-04-16 08:01:13.680519020 +0100
+@@ -6,6 +6,7 @@
+ #include <cassert>
+ #include <fstream>
+ #include <limits.h>
++#include <strings.h>
+ #include "SerialStreamBuf.h"
+ 
+ using namespace std ;
diff --git a/package/libserial/libserial.mk b/package/libserial/libserial.mk
new file mode 100644
index 0000000..5f6ec72
--- /dev/null
+++ b/package/libserial/libserial.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# libserial
+#
+#############################################################
+
+LIBSERIAL_VERSION = 0.5.2
+LIBSERIAL_SITE = http://prdownloads.sourceforge.net/libserial
+LIBSERIAL_INSTALL_STAGING = YES
+LIBSERIAL_LICENSE = GPLv2+
+LIBSERIAL_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.7.10.4
