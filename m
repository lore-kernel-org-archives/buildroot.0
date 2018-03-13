From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 13 Mar 2018 22:18:25 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] meson: fix error when restorecon unavailable
Message-ID: <20180313211825.25745-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-meson is used by some packages such as libmpdclient.
If selinuxenabled is installed on host but restorecon is unavailable
(for an "unknwown" reason), install will crash.

Fixes:
 - http://autobuild.buildroot.net/results/d5dcdfdfab3503fdc387f99e68267972a38c417d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1->v2:
 - Update patch following upstream review: https://github.com/mesonbuild/meson/pull/3236#pullrequestreview-103570704

 ...NotFoundError-when-restorecon-unavailable.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/meson/0001-Fix-FileNotFoundError-when-restorecon-unavailable.patch

diff --git a/package/meson/0001-Fix-FileNotFoundError-when-restorecon-unavailable.patch b/package/meson/0001-Fix-FileNotFoundError-when-restorecon-unavailable.patch
new file mode 100644
index 0000000000..3f1ca68dfc
--- /dev/null
+++ b/package/meson/0001-Fix-FileNotFoundError-when-restorecon-unavailable.patch
@@ -0,0 +1,31 @@
+From 8edc477b7d7b160004eb700a1b7523237333d9ec Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 13 Mar 2018 18:52:36 +0100
+Subject: [PATCH] Fix FileNotFoundError when restorecon unavailable
+
+Fixes:
+ - http://autobuild.buildroot.net/results/d5dcdfdfab3503fdc387f99e68267972a38c417d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ mesonbuild/scripts/meson_install.py | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/mesonbuild/scripts/meson_install.py b/mesonbuild/scripts/meson_install.py
+index f895f17d..1414ace2 100644
+--- a/mesonbuild/scripts/meson_install.py
++++ b/mesonbuild/scripts/meson_install.py
+@@ -97,6 +97,10 @@ def restore_selinux_contexts():
+         # is ignored quietly.
+         return
+ 
++    if not shutil.which('restorecon'):
++        # If we don't have restorecon, failure is ignored quietly.
++        return
++
+     with subprocess.Popen(['restorecon', '-F', '-f-', '-0'],
+                           stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE) as proc:
+         out, err = proc.communicate(input=b'\0'.join(os.fsencode(f) for f in selinux_updates) + b'\0')
+-- 
+2.14.1
+
-- 
2.14.1
