From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Jan 2020 15:30:43 +0100
Subject: [Buildroot] [git commit] package/suricata: fix shabang for python
 scripts
Message-ID: <20200101142232.BCAD98EA4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=061768a04085be1b118e056b8523976edbd06823
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

/usr/bin/suricatactl and /usr/bin/suricatasc have their interpreter set
to the path of python in the HOST machine.

Use distutils' option '-e' to specify a better shabang.

[yann.morin.1998 at free.fr:
  - author did not provide their SoB, but it's simple enough to
    not require it for once
  - reword commit log
  - use git-formatted patch, with a proper commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...n-ensure-proper-shabang-on-python-scripts.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/suricata/0003-python-ensure-proper-shabang-on-python-scripts.patch b/package/suricata/0003-python-ensure-proper-shabang-on-python-scripts.patch
new file mode 100644
index 0000000000..4be591be3f
--- /dev/null
+++ b/package/suricata/0003-python-ensure-proper-shabang-on-python-scripts.patch
@@ -0,0 +1,45 @@
+From 44fe2328b715db25134ee095526d2fa47e6cd834 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Wed, 1 Jan 2020 15:25:57 +0100
+Subject: [PATCH] python: ensure proper shabang on python scripts
+
+When instlling python scripts, distutils would use the python used to
+run setup.py as shabang for the scripts it installs.
+
+However, when cross-compiling, this is most often not correct.
+
+Instead, using '/usr/bin/env python' is guaranteed to find the proper
+python in the PATH, so we need to instruct setyup.py to use that as the
+executable.
+
+[yann.morin.1998 at free.fr:
+  - author did not provide their SoB, but it's simple enough to
+    not require it for once
+  - provide proper commit log
+]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ python/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/python/Makefile.am b/python/Makefile.am
+index 59d195f29..a41604f72 100644
+--- a/python/Makefile.am
++++ b/python/Makefile.am
+@@ -6,11 +6,11 @@ EXTRA_DIST =	setup.py \
+ if HAVE_PYTHON
+ all-local:
+ 	cd $(srcdir) && \
+-		$(HAVE_PYTHON) setup.py build --build-base $(abs_builddir)
++		$(HAVE_PYTHON) setup.py build -e "/usr/bin/env python" --build-base $(abs_builddir)
+ 
+ install-exec-local:
+ 	cd $(srcdir) && \
+-		$(HAVE_PYTHON) setup.py build --build-base $(abs_builddir) \
++		$(HAVE_PYTHON) setup.py build -e "/usr/bin/env python" --build-base $(abs_builddir) \
+ 		install --prefix $(DESTDIR)$(prefix)
+ 
+ uninstall-local:
+-- 
+2.20.1
+
