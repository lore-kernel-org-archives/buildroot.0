From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Sep 2015 08:13:57 +0200
Subject: [Buildroot] [git commit] wpa_supplicant: fix static link with
	readline
Message-ID: <20150914061925.1048D81E1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=821f3793149bb20abe89b55d21a1242b894adb8a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When linking statically, the order of libraries on the
linker command matters, since readline depends on ncurses.

Signed-off-by: David du Colombier <0intro@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0005-fix-readline-libs-ordering.patch          |   26 ++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/wpa_supplicant/0005-fix-readline-libs-ordering.patch b/package/wpa_supplicant/0005-fix-readline-libs-ordering.patch
new file mode 100644
index 0000000..2a9b832
--- /dev/null
+++ b/package/wpa_supplicant/0005-fix-readline-libs-ordering.patch
@@ -0,0 +1,26 @@
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
+    Signed-off-by: David du Colombier <0intro@gmail.com>
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
