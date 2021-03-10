From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 10 Mar 2021 20:44:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/mc: fix build with ncurses
Message-ID: <20210310194431.443498-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wchar support in ncurses is needed since version 4.8.26 and
https://github.com/MidnightCommander/mc/commit/8b4386df83ab5a525f0568113fe1e53d362f433e

Fixes:
 - http://autobuild.buildroot.org/results/446eb0a15a728e2fe7a58312bb7329983b2df647

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...FTBFS-against-NCurses-on-OS-X-10-9-5.patch | 32 +++++++++++++++++++
 package/mc/Config.in                          |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 package/mc/0001-Ticket-4181-FTBFS-against-NCurses-on-OS-X-10-9-5.patch

diff --git a/package/mc/0001-Ticket-4181-FTBFS-against-NCurses-on-OS-X-10-9-5.patch b/package/mc/0001-Ticket-4181-FTBFS-against-NCurses-on-OS-X-10-9-5.patch
new file mode 100644
index 0000000000..6dfae52af5
--- /dev/null
+++ b/package/mc/0001-Ticket-4181-FTBFS-against-NCurses-on-OS-X-10-9-5.patch
@@ -0,0 +1,32 @@
+From ba62dd32add2767d6d13f9abb82f43304418740f Mon Sep 17 00:00:00 2001
+From: Andrew Borodin <aborodin@vmail.ru>
+Date: Sun, 24 Jan 2021 14:19:22 +0300
+Subject: [PATCH] Ticket #4181: FTBFS against NCurses on OS X 10.9.5.
+
+lib/tty/tty-ncurses.h: define _XOPEN_SOURCE_EXTENDED to use cchar_t,
+getcchar(), setcchar().
+
+Signed-off-by: Andrew Borodin <aborodin@vmail.ru>
+[Retrieved from:
+https://github.com/MidnightCommander/mc/commit/ba62dd32add2767d6d13f9abb82f43304418740f]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/tty/tty-ncurses.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/lib/tty/tty-ncurses.h b/lib/tty/tty-ncurses.h
+index 9962c7c413..d75df9533a 100644
+--- a/lib/tty/tty-ncurses.h
++++ b/lib/tty/tty-ncurses.h
+@@ -2,6 +2,11 @@
+ #ifndef MC__TTY_NCURSES_H
+ #define MC__TTY_NCURSES_H
+ 
++/* for cchar_t, getcchar(), setcchar() */
++#ifndef _XOPEN_SOURCE_EXTENDED
++#define _XOPEN_SOURCE_EXTENDED
++#endif
++
+ #ifdef USE_NCURSES
+ #ifdef HAVE_NCURSES_CURSES_H
+ #include <ncurses/curses.h>
diff --git a/package/mc/Config.in b/package/mc/Config.in
index 61f351c41d..ac512116ca 100644
--- a/package/mc/Config.in
+++ b/package/mc/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_MC
 	select BR2_PACKAGE_LIBGLIB2
 	# mc prefers slang, but can use ncurses too
 	select BR2_PACKAGE_SLANG if !BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_WCHAR if BR2_PACKAGE_NCURSES
 	help
 	  GNU Midnight Commander is a visual file manager, licensed
 	  under GNU General Public License. It can use either SLang
-- 
2.30.0
