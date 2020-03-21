From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Mar 2020 22:18:54 +0100
Subject: [Buildroot] [git commit] package/x11r7/xkeyboard-config: needs a
 host python3
Message-ID: <20200321210616.A0B1683BA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb3767422c8726e2d565f3a7838c8f68e2767caf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A host python3 is needed to run map-variants.py since version 2.29 and
https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/commit/57c745a9a373b4c9d272d00ff4f16dbcc6d3c48b

The script (with a backported patch) does not have stringent requirements
on python, so we may use a system python3 if present.

Fixes:
 - http://autobuild.buildroot.org/results/7c3cdecc2feed62d7e0bad0e790a8bacaaa34cb7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-fix-python3-support.patch                 | 37 ++++++++++++++++++++++
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |  6 +++-
 2 files changed, 42 insertions(+), 1 deletion(-)

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
index fde5d058d8..f2fc8565c3 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -10,10 +10,14 @@ XKEYBOARD_CONFIG_SITE = https://www.x.org/releases/individual/data/xkeyboard-con
 XKEYBOARD_CONFIG_LICENSE = MIT
 XKEYBOARD_CONFIG_LICENSE_FILES = COPYING
 
+XKEYBOARD_CONFIG_DEPENDENCIES = \
+	$(BR2_PYTHON3_HOST_DEPENDENCY) \
+	host-gettext \
+	host-xapp_xkbcomp
+
 # xkeyboard-config.pc
 XKEYBOARD_CONFIG_INSTALL_STAGING = YES
 
 XKEYBOARD_CONFIG_CONF_OPTS = --disable-runtime-deps
-XKEYBOARD_CONFIG_DEPENDENCIES = host-gettext host-xapp_xkbcomp
 
 $(eval $(autotools-package))
