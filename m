From: Peter Seiderer <ps.report@gmx.net>
Date: Sat,  3 Feb 2018 23:11:41 +0100
Subject: [Buildroot] [PATCH v1] libv4l: fix EVIOCSCLOCKID related compile
 failure
Message-ID: <20180203221141.15490-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1]:

  keytable.c: In function 'test_event':
  keytable.c:1351:12: error: 'EVIOCSCLOCKID' undeclared (first use in this function)
    ioctl(fd, EVIOCSCLOCKID, &mode);

[1] http://autobuild.buildroot.net/results/8ba380471423bd2491e40103d7b1a45de1bd12ed

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...fix-EVIOCSCLOCKID-related-compile-failure.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/libv4l/0002-keytable-fix-EVIOCSCLOCKID-related-compile-failure.patch

diff --git a/package/libv4l/0002-keytable-fix-EVIOCSCLOCKID-related-compile-failure.patch b/package/libv4l/0002-keytable-fix-EVIOCSCLOCKID-related-compile-failure.patch
new file mode 100644
index 0000000000..656008b708
--- /dev/null
+++ b/package/libv4l/0002-keytable-fix-EVIOCSCLOCKID-related-compile-failure.patch
@@ -0,0 +1,35 @@
+From 663b7be9d27c979c914011a3ce707e227987bc59 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sat, 3 Feb 2018 22:47:18 +0100
+Subject: [PATCH] keytable: fix EVIOCSCLOCKID related compile failure
+
+Fixes:
+
+  keytable.c: In function 'test_event':
+  keytable.c:1351:12: error: 'EVIOCSCLOCKID' undeclared (first use in this function)
+    ioctl(fd, EVIOCSCLOCKID, &mode);
+              ^~~~~~~~~~~~~
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ utils/keytable/keytable.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
+index 34a1522e..925eab00 100644
+--- a/utils/keytable/keytable.c
++++ b/utils/keytable/keytable.c
+@@ -55,6 +55,10 @@ struct input_keymap_entry_v2 {
+ 	u_int8_t  scancode[32];
+ };
+ 
++#ifndef EVIOCSCLOCKID
++#define EVIOCSCLOCKID		_IOW('E', 0xa0, int)
++#endif
++
+ #ifndef EVIOCGKEYCODE_V2
+ #define EVIOCGKEYCODE_V2	_IOR('E', 0x04, struct input_keymap_entry_v2)
+ #define EVIOCSKEYCODE_V2	_IOW('E', 0x04, struct input_keymap_entry_v2)
+-- 
+2.16.1
+
-- 
2.16.1
