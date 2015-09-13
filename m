From: David du Colombier <0intro@gmail.com>
Date: Sun, 13 Sep 2015 23:50:36 +0200
Subject: [Buildroot] [PATCH v2 1/1] wpa_supplicant: fix static link with
	readline
Message-ID: <1442181036-4119-1-git-send-email-0intro@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When linking statically, the order of libraries on the
linker command matters, since readline depends on ncurses.

Signed-off-by: David du Colombier <0intro@gmail.com>
---
 .../0005-fix-readline-libs-ordering.patch          | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/wpa_supplicant/0005-fix-readline-libs-ordering.patch

diff --git a/package/wpa_supplicant/0005-fix-readline-libs-ordering.patch b/package/wpa_supplicant/0005-fix-readline-libs-ordering.patch
new file mode 100644
index 0000000..ae7cf9e
--- /dev/null
+++ b/package/wpa_supplicant/0005-fix-readline-libs-ordering.patch
@@ -0,0 +1,24 @@
+commit 631f0893038743cebd2def39df61aceb48bd43a9
+Author: David du Colombier <0intro@gmail.com>
+Date:   Sun Sep 13 23:40:43 2015 +0200
+
+    wpa_supplicant: fix static link with readline
+    
+    The readline library depends on ncurses, so
+    it should be set before ncurses on the linker
+    command line to be able to be statically linked
+    successfully.
+
+diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
+index 1597412..581db02 100644
+--- a/wpa_supplicant/Makefile
++++ b/wpa_supplicant/Makefile
+@@ -1408,7 +1408,7 @@ LIBS += $(DBUS_LIBS)
+ 
+ ifdef CONFIG_READLINE
+ OBJS_c += ../src/utils/edit_readline.o
+-LIBS_c += -lncurses -lreadline
++LIBS_c += -lreadline -lncurses
+ else
+ ifdef CONFIG_WPA_CLI_EDIT
+ OBJS_c += ../src/utils/edit.o
-- 
1.8.3.1
