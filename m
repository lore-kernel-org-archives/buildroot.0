From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat,  1 Aug 2015 09:46:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/sudo: bump to version 1.8.14p3
Message-ID: <1438415164-12441-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add a patch to fix missing header include with the musl C library:
  ../include/sudo_util.h:220:14: error: unknown type name 'id_t'

Reported upstream:
http://bugzilla.sudo.ws/show_bug.cgi?id=711

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/sudo/0001-musl-fix-missing-header.patch | 19 +++++++++++++++++++
 package/sudo/sudo.hash                          |  4 ++--
 package/sudo/sudo.mk                            |  2 +-
 3 files changed, 22 insertions(+), 3 deletions(-)
 create mode 100644 package/sudo/0001-musl-fix-missing-header.patch

diff --git a/package/sudo/0001-musl-fix-missing-header.patch b/package/sudo/0001-musl-fix-missing-header.patch
new file mode 100644
index 0000000..e3681b2
--- /dev/null
+++ b/package/sudo/0001-musl-fix-missing-header.patch
@@ -0,0 +1,19 @@
+Header sys/types.h is needed for id_t
+
+Patch reported as bug upstream:
+http://bugzilla.sudo.ws/show_bug.cgi?id=711
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+
+diff -purN sudo-1.8.14p3.orig/include/sudo_util.h sudo-1.8.14p3/include/sudo_util.h
+--- sudo-1.8.14p3.orig/include/sudo_util.h	2015-07-22 14:22:49.000000000 +0200
++++ sudo-1.8.14p3/include/sudo_util.h	2015-08-01 09:35:15.077909614 +0200
+@@ -23,6 +23,8 @@
+ # include "compat/stdbool.h"
+ #endif /* HAVE_STDBOOL_H */
+ 
++#include <sys/types.h>
++
+ /*
+  * Macros for operating on struct timeval.
+  */
diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index 94b897d..cf96417 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,2 +1,2 @@
-# From http://www.sudo.ws/pipermail/sudo-announce/2015-March/000138.html
-sha256	e374e5edf2c11c00d6916a9f51cb0ad15e51c7b028370fa15169b07e61e05a25	sudo-1.8.13.tar.gz
+# From http://www.sudo.ws/download.html
+sha256	a8a697cbb113859058944850d098464618254804cf97961dee926429f00a1237	sudo-1.8.14p3.tar.gz
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 10fbc88..4327c8a 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUDO_VERSION = 1.8.13
+SUDO_VERSION = 1.8.14p3
 SUDO_SITE = http://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC BSD-3c
 SUDO_LICENSE_FILES = doc/LICENSE
-- 
2.5.0
