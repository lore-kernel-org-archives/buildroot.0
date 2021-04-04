From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Apr 2021 13:59:11 +0200
Subject: [Buildroot] [git commit] package/sane-backends: add patch to fix
 compile for toolchains without thread support
Message-ID: <20210404113358.D5F908B911@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b025ab55aeeb339508f80825294e479ecdb28eb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  - http://autobuild.buildroot.net/results/c9b0e41d66211bcab231b5db78c6eebe4b1d78ba

  genesys/scanner_interface_usb.cpp: In member function ???virtual void genesys::ScannerInterfaceUsb::sleep_us(unsigned int)???:
  genesys/scanner_interface_usb.cpp:484:10: error: ???std::this_thread??? has not been declared
    484 |     std::this_thread::sleep_for(std::chrono::microseconds{microseconds});
        |          ^~~~

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-usleep-instead-of-std-this_thread-sleep_.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/sane-backends/0003-genesys-use-usleep-instead-of-std-this_thread-sleep_.patch b/package/sane-backends/0003-genesys-use-usleep-instead-of-std-this_thread-sleep_.patch
new file mode 100644
index 0000000000..348b73e3fb
--- /dev/null
+++ b/package/sane-backends/0003-genesys-use-usleep-instead-of-std-this_thread-sleep_.patch
@@ -0,0 +1,46 @@
+From b6e21e3cd0825e7ec2b3b7e6401d25b901deeed2 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Wed, 31 Mar 2021 22:51:03 +0200
+Subject: [PATCH] genesys: use usleep instead of std::this_thread::sleep_for to
+ re-enable thread less compile
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+  genesys/scanner_interface_usb.cpp: In member function ???virtual void genesys::ScannerInterfaceUsb::sleep_us(unsigned int)???:
+  genesys/scanner_interface_usb.cpp:484:10: error: ???std::this_thread??? has not been declared
+    484 |     std::this_thread::sleep_for(std::chrono::microseconds{microseconds});
+        |          ^~~~~~~~~~~
+
+[Upstream: https://gitlab.com/sane-project/backends/-/merge_requests/619]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ backend/genesys/scanner_interface_usb.cpp | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/backend/genesys/scanner_interface_usb.cpp b/backend/genesys/scanner_interface_usb.cpp
+index 117297c..2ca78ab 100644
+--- a/backend/genesys/scanner_interface_usb.cpp
++++ b/backend/genesys/scanner_interface_usb.cpp
+@@ -43,7 +43,6 @@
+ 
+ #include "scanner_interface_usb.h"
+ #include "low.h"
+-#include <thread>
+ 
+ namespace genesys {
+ 
+@@ -481,7 +480,7 @@ void ScannerInterfaceUsb::sleep_us(unsigned microseconds)
+     if (sanei_usb_is_replay_mode_enabled()) {
+         return;
+     }
+-    std::this_thread::sleep_for(std::chrono::microseconds{microseconds});
++    usleep(microseconds);
+ }
+ 
+ void ScannerInterfaceUsb::record_progress_message(const char* msg)
+-- 
+2.30.2
+
