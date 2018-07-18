From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Jul 2018 17:18:12 +0200
Subject: [Buildroot] [git commit] libglib2: Avoid absolute path to python in
 shebang
Message-ID: <20180718151348.F004E8892B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ab5dfb548a840debe6e4e767ea2ea10e9c6e93a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the output directory is nested under a long path name, calling the
gdbus-codegen, glib-genmarshal, or glib-mkenums scripts throws the
error:

> '/usr/bin/env: /...: No such file or directory'

This is because libglib2 uses the absolute path to the python
interpreter for its shebang statements, and shebangs have a max length
of 127 chars[1]. A long absolute path will be cut off and appear as a
missing file.

Since the host Python is present in the $PATH passed to all packages, we
can copy the workaround from Yocto and just use the python interpreter
in $PATH[2]. However, 'python' is used instead of 'python3' as the
scripts are compatible with both.

[1] https://linux.die.net/man/2/execve
[2] http://cgit.openembedded.org/openembedded-core/commit/?id=eef7883587acc933d6f34b559ec03ff84d18573b

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
Signed-off-by: David Owens <david.owens@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...t-hardcode-python-path-into-various-tools.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/libglib2/0004-Do-not-hardcode-python-path-into-various-tools.patch b/package/libglib2/0004-Do-not-hardcode-python-path-into-various-tools.patch
new file mode 100644
index 0000000000..fa558e6dbf
--- /dev/null
+++ b/package/libglib2/0004-Do-not-hardcode-python-path-into-various-tools.patch
@@ -0,0 +1,48 @@
+From b9160d951b9af647b97766c57295ca4f45cf9521 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 3 Oct 2017 10:45:55 +0300
+Subject: [PATCH] Do not hardcode python path into various tools
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+Fetch from: http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch?id=eef7883587acc933d6f34b559ec03ff84d18573b
+Signed-off-by: David Owens <david.owens@rockwellcollins.com>
+---
+ gio/gdbus-2.0/codegen/gdbus-codegen.in | 2 +-
+ gobject/glib-genmarshal.in             | 2 +-
+ gobject/glib-mkenums.in                | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/gio/gdbus-2.0/codegen/gdbus-codegen.in b/gio/gdbus-2.0/codegen/gdbus-codegen.in
+index 8050981..e693ef3 100644
+--- a/gio/gdbus-2.0/codegen/gdbus-codegen.in
++++ b/gio/gdbus-2.0/codegen/gdbus-codegen.in
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env @PYTHON@
++#!/usr/bin/env python
+ 
+ # GDBus - GLib D-Bus Library
+ #
+diff --git a/gobject/glib-genmarshal.in b/gobject/glib-genmarshal.in
+index 09e8408..b2f9d99 100755
+--- a/gobject/glib-genmarshal.in
++++ b/gobject/glib-genmarshal.in
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env @PYTHON@
++#!/usr/bin/env python
+ 
+ # pylint: disable=too-many-lines, missing-docstring, invalid-name
+ 
+diff --git a/gobject/glib-mkenums.in b/gobject/glib-mkenums.in
+index d4bfd11..051fce4 100755
+--- a/gobject/glib-mkenums.in
++++ b/gobject/glib-mkenums.in
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env @PYTHON@
++#!/usr/bin/env python
+ 
+ # If the code below looks horrible and unpythonic, do not panic.
+ #
+-- 
+2.14.1
+
