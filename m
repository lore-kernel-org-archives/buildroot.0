From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  7 Dec 2018 16:38:56 +0100
Subject: [Buildroot] [PATCH 1/1] openzwave: fix restrict error with gcc 8
Message-ID: <20181207153856.1091-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/2a8d2c67bcd1a7c228e9196d3bdb7f608c44c856

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ation-error-in-regards-to-Werror-restrict.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/openzwave/0004-Fix-compilation-error-in-regards-to-Werror-restrict.patch

diff --git a/package/openzwave/0004-Fix-compilation-error-in-regards-to-Werror-restrict.patch b/package/openzwave/0004-Fix-compilation-error-in-regards-to-Werror-restrict.patch
new file mode 100644
index 0000000000..b3dbd8f88e
--- /dev/null
+++ b/package/openzwave/0004-Fix-compilation-error-in-regards-to-Werror-restrict.patch
@@ -0,0 +1,39 @@
+From 14164e9920ce3482747483fc16654c82d3ce445f Mon Sep 17 00:00:00 2001
+From: pipiche38 <pipiche38@users.noreply.github.com>
+Date: Fri, 8 Jun 2018 15:13:39 +0200
+Subject: [PATCH] Fix compilation error in regards to -Werror=restrict
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+/usr/share/domoticz/open-zwave/cpp/src/command_classes/DoorLockLogging.cpp: In member function ?virtual bool OpenZWave::DoorLockLogging::HandleMsg(const uint8*, uint32, uint32)?:
+/usr/share/domoticz/open-zwave/cpp/src/command_classes/DoorLockLogging.cpp:312:15: error: passing argument 1 to restrict-qualified parameter aliases with argument 4 [-Werror=restrict]
+      snprintf(usercode, sizeof(usercode), "%s %d", usercode, (int)_data[12+i]);
+               ^~~~~~~~                             ~~~~~~~~
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/OpenZWave/open-zwave/commit/14164e9920ce3482747483fc16654c82d3ce445f]
+---
+ cpp/src/command_classes/DoorLockLogging.cpp | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/cpp/src/command_classes/DoorLockLogging.cpp b/cpp/src/command_classes/DoorLockLogging.cpp
+index c235a8497..418f61b7d 100644
+--- a/cpp/src/command_classes/DoorLockLogging.cpp
++++ b/cpp/src/command_classes/DoorLockLogging.cpp
+@@ -304,12 +304,13 @@ bool DoorLockLogging::HandleMsg
+ 			}
+ 			uint8 userid = (_data[10]);
+ 			uint8 usercodelength = (_data[11]);
+-			char usercode[254];
++			char usercode[254], tmpusercode[254];
+ 			snprintf(usercode, sizeof(usercode), "UserCode:");
+ 			if (usercodelength > 0)
+ 				for (int i = 0; i < usercodelength; i++ )
+ 				{
+-					snprintf(usercode, sizeof(usercode), "%s %d", usercode, (int)_data[12+i]);
++					strncpy(tmpusercode, usercode, sizeof(tmpusercode));
++                                        snprintf(usercode, sizeof(usercode), "%s %d", tmpusercode, (int)_data[12+i]);
+ 				}
+ 
+ 			if (valid) {
-- 
2.14.1
