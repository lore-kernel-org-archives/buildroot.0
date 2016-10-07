From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 22:58:00 +0200
Subject: [Buildroot] [git commit] atop: new package
Message-ID: <20161007211807.7B8D4803E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a809e7fb1a41c858f7a630a536c9bd341c866fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Atop is an ASCII full-screen performance monitor for Linux.

- install only the basic functionality (command line tool atop).

- add patch to fix musl build by removing unused include of termio.h.
  Patch was accepted upstream.

Support for extra functionality can be added by follow-up patches:
- init scripts (sysv and systemd) to autostart logging the system
  activity.
- process accounting (needs counterpart enabled in the kernel).

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |  1 +
 .../0001-remove-unused-include-of-termio.h.patch   | 52 ++++++++++++++++++++++
 package/atop/Config.in                             | 18 ++++++++
 package/atop/atop.hash                             |  2 +
 package/atop/atop.mk                               | 21 +++++++++
 5 files changed, 94 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 2941c45..a1da86a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1687,6 +1687,7 @@ endmenu
 menu "System tools"
 	source "package/acl/Config.in"
 	source "package/android-tools/Config.in"
+	source "package/atop/Config.in"
 	source "package/attr/Config.in"
 	source "package/audit/Config.in"
 	source "package/bootutils/Config.in"
diff --git a/package/atop/0001-remove-unused-include-of-termio.h.patch b/package/atop/0001-remove-unused-include-of-termio.h.patch
new file mode 100644
index 0000000..3a04b05
--- /dev/null
+++ b/package/atop/0001-remove-unused-include-of-termio.h.patch
@@ -0,0 +1,52 @@
+remove unused include of termio.h
+
+This header is not provided by musl, leading to build failures.
+
+Patch status: accepted upstream.
+
+Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
+---
+diff -purN atop-2.2-3.orig/showgeneric.c atop-2.2-3/showgeneric.c
+--- atop-2.2-3.orig/showgeneric.c	2016-07-19 22:07:43.275324499 -0300
++++ atop-2.2-3/showgeneric.c	2016-07-19 22:08:16.171453283 -0300
+@@ -268,7 +268,6 @@ static const char rcsid[] = "$Id: showge
+ #include <errno.h>
+ #include <fcntl.h>
+ #include <string.h>
+-#include <termio.h>
+ #include <unistd.h>
+ #include <stdarg.h>
+ #include <curses.h>
+diff -purN atop-2.2-3.orig/showlinux.c atop-2.2-3/showlinux.c
+--- atop-2.2-3.orig/showlinux.c	2016-07-19 22:07:43.275324499 -0300
++++ atop-2.2-3/showlinux.c	2016-07-19 22:08:20.979472459 -0300
+@@ -274,7 +274,6 @@ static const char rcsid[] = "$Id: showli
+ #include <string.h>
+ #include <errno.h>
+ #include <fcntl.h>
+-#include <termio.h>
+ #include <unistd.h>
+ #include <stdarg.h>
+ #include <curses.h>
+diff -purN atop-2.2-3.orig/showprocs.c atop-2.2-3/showprocs.c
+--- atop-2.2-3.orig/showprocs.c	2016-07-19 22:07:43.275324499 -0300
++++ atop-2.2-3/showprocs.c	2016-07-19 22:08:25.083488900 -0300
+@@ -94,7 +94,6 @@ static const char rcsid[] = "$Id: showpr
+ #include <string.h>
+ #include <errno.h>
+ #include <fcntl.h>
+-#include <termio.h>
+ #include <unistd.h>
+ #include <stdarg.h>
+ #include <curses.h>
+diff -purN atop-2.2-3.orig/showsys.c atop-2.2-3/showsys.c
+--- atop-2.2-3.orig/showsys.c	2016-07-19 22:07:43.275324499 -0300
++++ atop-2.2-3/showsys.c	2016-07-19 22:08:29.099505047 -0300
+@@ -80,7 +80,6 @@ static const char rcsid[] = "XXXXXX";
+ #include <string.h>
+ #include <errno.h>
+ #include <fcntl.h>
+-#include <termio.h>
+ #include <unistd.h>
+ #include <stdarg.h>
+ #include <curses.h>
diff --git a/package/atop/Config.in b/package/atop/Config.in
new file mode 100644
index 0000000..d42a201
--- /dev/null
+++ b/package/atop/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_ATOP
+	bool "atop"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_ZLIB
+	help
+	  Atop is an ASCII full-screen performance monitor for Linux
+	  that is capable of reporting the activity of all processes
+	  (even if processes have finished during the interval), daily
+	  logging of system and process activity for long-term analysis,
+	  highlighting overloaded system resources by using colors, etc.
+	  At regular intervals, it shows system-level activity related
+	  to the CPU, memory, swap, disks (including LVM) and network
+	  layers, and for every process (and thread) it shows e.g. the
+	  CPU utilization, memory growth, disk utilization, priority,
+	  username, state, and exit code.
+
+	  http://www.atoptool.nl
diff --git a/package/atop/atop.hash b/package/atop/atop.hash
new file mode 100644
index 0000000..bbf268d
--- /dev/null
+++ b/package/atop/atop.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  c785b8a2355be28b3de6b58a8ea4c4fcab8fadeaa57a99afeb03c66fac8e055d  atop-2.2-3.tar.gz
diff --git a/package/atop/atop.mk b/package/atop/atop.mk
new file mode 100644
index 0000000..27e1f82
--- /dev/null
+++ b/package/atop/atop.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# atop
+#
+################################################################################
+
+ATOP_VERSION = 2.2-3
+ATOP_SITE = http://www.atoptool.nl/download
+ATOP_LICENSE = GPLv2+
+ATOP_LICENSE_FILES = COPYING
+ATOP_DEPENDENCIES = ncurses zlib
+
+define ATOP_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define ATOP_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/atop $(TARGET_DIR)/usr/bin/atop
+endef
+
+$(eval $(generic-package))
