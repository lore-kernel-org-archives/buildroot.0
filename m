From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 17 Jun 2011 10:59:33 +0200
Subject: [Buildroot] [git commit] bmon: make ncurses dependency optional
Message-ID: <20110617090059.C367588CAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6533b1e362e3514c29e32f1c5bb46df693423fc2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bmon can be built without ncurses support (needs a small patch though),
so don't enforce it in kconfig.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bmon/Config.in         |    1 -
 package/bmon/bmon-curses.patch |   26 ++++++++++++++++++++++++++
 package/bmon/bmon.mk           |    7 ++++++-
 3 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 package/bmon/bmon-curses.patch

diff --git a/package/bmon/Config.in b/package/bmon/Config.in
index 667788b..9692118 100644
--- a/package/bmon/Config.in
+++ b/package/bmon/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_BMON
 	bool "bmon"
 	depends on BR2_INET_IPV6
-	select BR2_PACKAGE_NCURSES
 	help
 	  Linux bandwidth monitor
 
diff --git a/package/bmon/bmon-curses.patch b/package/bmon/bmon-curses.patch
new file mode 100644
index 0000000..0eb164e
--- /dev/null
+++ b/package/bmon/bmon-curses.patch
@@ -0,0 +1,26 @@
+[PATCH] fix build without curses
+
+bmon supports a --disable-curses configure option, but still #error
+out if curses wasn't detected, even though the rest of the code is
+written to work without curses support.
+
+Fix it by removing the bogus #error line.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ include/bmon/config.h |    2 --
+ 1 file changed, 2 deletions(-)
+
+Index: bmon-2.1.0/include/bmon/config.h
+===================================================================
+--- bmon-2.1.0.orig/include/bmon/config.h
++++ bmon-2.1.0/include/bmon/config.h
+@@ -118,8 +118,6 @@
+ #  endif /* !HAVE_CURSES */
+ #elif defined HAVE_CURSES
+ #  include <curses.h>
+-#else
+-#  error "*** ERROR: Neither ncurses nor curses is present on your system. ***"
+ #endif /* HAVE_[N]CURSES */
+ 
+ #if defined HAVE_RRD
diff --git a/package/bmon/bmon.mk b/package/bmon/bmon.mk
index 97d4b02..aa097fb 100644
--- a/package/bmon/bmon.mk
+++ b/package/bmon/bmon.mk
@@ -7,7 +7,12 @@
 BMON_VERSION = 2.1.0
 BMON_SOURCE = bmon-$(BMON_VERSION).tar.gz
 BMON_SITE = http://distfiles.gentoo.org/distfiles
-BMON_DEPENDENCIES = ncurses
+
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+BMON_DEPENDENCIES += ncurses
+else
+BMON_CONF_OPT += --disable-curses
+endif
 
 ifneq ($(BR2_PREFER_STATIC_LIB),y)
 # link dynamically unless explicitly requested otherwise
-- 
1.7.3.4
