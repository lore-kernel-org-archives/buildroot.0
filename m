From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 15 May 2018 21:51:54 +0200
Subject: [Buildroot] [RFC PATCH v2 3/8] meson: prevent RPATH stripping
In-Reply-To: <20180515195159.6694-1-eric.le.bihan.dev@free.fr>
References: <20180515195159.6694-1-eric.le.bihan.dev@free.fr>
Message-ID: <20180515195159.6694-4-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, Meson strips RPATH from the executable it builds [1,2],
unless explicitly set via install_rpath.

This will make support/scripts/check-host-rpath fail when building the
host variant of a Meson-based package.

So add a patch to prevent RPATH from being stripped if install_rpath is
not set and notify user about it.

[1] https://github.com/mesonbuild/meson/issues/2567
[2] https://github.com/mesonbuild/meson/issues/314#issuecomment-157658562

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 ...y-fix-RPATH-if-install_rpath-is-not-empty.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch

diff --git a/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch b/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch
new file mode 100644
index 0000000000..03c1944258
--- /dev/null
+++ b/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch
@@ -0,0 +1,32 @@
+From 53e4920038d5562b7b672fec8b9469fc02eef4ad Mon Sep 17 00:00:00 2001
+From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+Date: Thu, 10 May 2018 21:57:49 +0200
+Subject: [PATCH] Only fix RPATH if install_rpath is not empty
+
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+---
+ mesonbuild/scripts/meson_install.py | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/mesonbuild/scripts/meson_install.py b/mesonbuild/scripts/meson_install.py
+index 013f2a00..f7ff1dcc 100644
+--- a/mesonbuild/scripts/meson_install.py
++++ b/mesonbuild/scripts/meson_install.py
+@@ -368,7 +368,13 @@ def install_targets(d):
+                     printed_symlink_error = True
+         if os.path.isfile(outname):
+             try:
+-                depfixer.fix_rpath(outname, install_rpath, False)
++                # Buildroot check-host-rpath script expects RPATH
++                # But if install_rpath is empty, it will stripped.
++                # So, preserve it in this case
++                if install_rpath:
++                    depfixer.fix_rpath(outname, install_rpath, False)
++                else:
++                    print("Skipping RPATH fixing")
+             except SystemExit as e:
+                 if isinstance(e.code, int) and e.code == 0:
+                     pass
+-- 
+2.14.3
+
-- 
2.14.3
