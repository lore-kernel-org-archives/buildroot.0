From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  6 Apr 2014 13:36:26 +0200
Subject: [Buildroot] [PATCH] libevdev: adjust host-python dependency
Message-ID: <1396784186-13541-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libevdev depends on host-python because of some of its build scripts.
These build scripts support python2 and python3.

When python3 is part of the target selection, then we can just use the
interpreter provided by the host-python3 package.

Fixes:
  http://autobuild.buildroot.net/results/dd0/dd04833b11a0ebb0193c861cb375b2112dd339d1/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/libevdev/libevdev.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index 3a02230..fdaceb5 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -15,7 +15,9 @@ LIBEVDEV_DEPENDENCIES = host-pkgconf
 # Needs Python to generate a header file
 # We can't rely on the system Python, since it may be too old
 # (missing argparse in python 2.6)
-LIBEVDEV_DEPENDENCIES += host-python
+# libevdev build scripts support both python2 and python3, so avoid unneeded
+# dependency on host-python.
+LIBEVDEV_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
 
 # package source code coming from git, so it doesn't have generated
 # configure and Makefile.in
-- 
1.9.1
