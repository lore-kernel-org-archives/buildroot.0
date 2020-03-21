From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 21 Mar 2020 10:55:33 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xkeyboard-config: needs
 host-python3
Message-ID: <20200321095533.137088-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-python3 is needed to run map-variants.py since version 2.29 and
https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/commit/57c745a9a373b4c9d272d00ff4f16dbcc6d3c48b

Fixes:
 - http://autobuild.buildroot.org/results/7c3cdecc2feed62d7e0bad0e790a8bacaaa34cb7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-fix-python3-support.patch            | 37 +++++++++++++++++++
 .../xkeyboard-config/xkeyboard-config.mk      |  2 +-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xkeyboard-config/0001-fix-python3-support.patch

diff --git a/package/x11r7/xkeyboard-config/0001-fix-python3-support.patch b/package/x11r7/xkeyboard-config/0001-fix-python3-support.patch
new file mode 100644
index 0000000000..c9f8b59d0c
--- /dev/null
+++ b/package/x11r7/xkeyboard-config/0001-fix-python3-support.patch
@@ -0,0 +1,37 @@
+From c847c834cce190c5c835a454bfe548195da9fa53 Mon Sep 17 00:00:00 2001
+From: MilhouseVH <milhouseVH.github@nmacleod.com>
+Date: Sun, 16 Feb 2020 09:41:43 +0000
+Subject: [PATCH] fix python3 support
+
+https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/issues/197
+[Retrieved from:
+https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/commit/c847c834cce190c5c835a454bfe548195da9fa53]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ rules/compat/map-variants.py | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/rules/compat/map-variants.py b/rules/compat/map-variants.py
+index ebbfec9..979ba43 100755
+--- a/rules/compat/map-variants.py
++++ b/rules/compat/map-variants.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python3
++#!/usr/bin/env python3
+ 
+ import argparse
+ import re
+@@ -12,8 +12,8 @@ class Layout(object):
+             assert variant is None
+             # parse a layout(variant) string
+             match = re.match(r'([^(]+)\(([^)]+)\)', layout)
+-            self.layout = match[1]
+-            self.variant = match[2]
++            self.layout = match.groups()[0]
++            self.variant = match.groups()[1]
+ 
+     def __str__(self):
+         if self.variant:
+-- 
+2.24.1
+
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index fde5d058d8..39c58cb0d3 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -14,6 +14,6 @@ XKEYBOARD_CONFIG_LICENSE_FILES = COPYING
 XKEYBOARD_CONFIG_INSTALL_STAGING = YES
 
 XKEYBOARD_CONFIG_CONF_OPTS = --disable-runtime-deps
-XKEYBOARD_CONFIG_DEPENDENCIES = host-gettext host-xapp_xkbcomp
+XKEYBOARD_CONFIG_DEPENDENCIES = host-gettext host-python3 host-xapp_xkbcomp
 
 $(eval $(autotools-package))
-- 
2.25.1
