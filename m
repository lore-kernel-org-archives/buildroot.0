From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 25 Apr 2014 23:08:56 +0200
Subject: [Buildroot] [PATCH] evemu: use sysroot provided input.h file
	(instead of host system version)
Message-ID: <1398460136-18217-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch for src/make-event-names.py to use sysroot provided input.h
instead of hard coded '/usr/include/linux/input.h' (host system version)
one.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...names-use-input.h-from-sysroot-instead-of.patch | 30 ++++++++++++++++++++++
 package/evemu/evemu.mk                             |  4 +++
 2 files changed, 34 insertions(+)
 create mode 100644 package/evemu/evemu-0003-make-event-names-use-input.h-from-sysroot-instead-of.patch

diff --git a/package/evemu/evemu-0003-make-event-names-use-input.h-from-sysroot-instead-of.patch b/package/evemu/evemu-0003-make-event-names-use-input.h-from-sysroot-instead-of.patch
new file mode 100644
index 0000000..e8a1f55
--- /dev/null
+++ b/package/evemu/evemu-0003-make-event-names-use-input.h-from-sysroot-instead-of.patch
@@ -0,0 +1,30 @@
+From d2c08aafcae8a0af3cb5a6ae873bbcbd567eae95 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 25 Apr 2014 22:30:06 +0200
+Subject: [PATCH] make-event-names: use input.h from sysroot (instead of host
+ system version)
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/make-event-names.py | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/make-event-names.py b/src/make-event-names.py
+index 2092cfd..5bbc669 100755
+--- a/src/make-event-names.py
++++ b/src/make-event-names.py
+@@ -7,8 +7,10 @@
+ import re
+ import sys
+ import argparse
++import os
+ 
+-SOURCE_FILE = "/usr/include/linux/input.h"
++# environment variable SYSROOT set by buildroot for cross-compilation
++SOURCE_FILE = os.environ.get('SYSROOT', '') + "/usr/include/linux/input.h"
+ 
+ class Bits(object):
+ 	pass
+-- 
+1.8.1.4
+
diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
index df9aea1..0f25f62 100644
--- a/package/evemu/evemu.mk
+++ b/package/evemu/evemu.mk
@@ -14,6 +14,10 @@ EVEMU_LICENSE_FILES = COPYING COPYING.GPL3
 # which doesn't have all the needed modules enabled, breaking the build
 EVEMU_CONF_ENV = ac_cv_path_ASCIIDOC=""
 
+# needed for make-event-names.py to find sysroot provided input.h (instead
+# of host system version)
+EVEMU_MAKE_ENV = SYSROOT=$(STAGING_DIR)
+
 # Uses PKG_CHECK_MODULES() in configure.ac
 EVEMU_DEPENDENCIES = host-pkgconf libevdev
 
-- 
1.8.1.4
