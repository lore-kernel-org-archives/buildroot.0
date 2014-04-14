From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 14 Apr 2014 23:05:52 +0200
Subject: [Buildroot] [PATCH 5/5] openpgm: make its build system
	python2/python3 friendly
In-Reply-To: <1397509552-5278-1-git-send-email-s.martin49@gmail.com>
References: <1397509552-5278-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1397509552-5278-6-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes build issue when python3 is enabled, and host python2
interpreter is not available.

Fixes:
  http://autobuild.buildroot.net/results/01f/01f886a073439c0639ed93e596b68bcadf1a5824/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Baruch Siach <baruch@tkos.co.il>

---

Note that, though current openpgm trunk (svn+1508) supports python2 and
python3, I have not backported the upstream patch because
version_generator.py has been touched by several non-atomic change sets.
---
 ...on_generator.py-make-it-python3-compliant.patch | 42 ++++++++++++++++++++++
 package/openpgm/openpgm.mk                         |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 package/openpgm/openpgm-0001-version_generator.py-make-it-python3-compliant.patch

diff --git a/package/openpgm/openpgm-0001-version_generator.py-make-it-python3-compliant.patch b/package/openpgm/openpgm-0001-version_generator.py-make-it-python3-compliant.patch
new file mode 100644
index 0000000..97cff29
--- /dev/null
+++ b/package/openpgm/openpgm-0001-version_generator.py-make-it-python3-compliant.patch
@@ -0,0 +1,42 @@
+From e04f5c20fc1536f8e6d4faf32f2f4657d441f7c8 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Mon, 14 Apr 2014 17:54:37 +0200
+Subject: [PATCH] version_generator.py: make it python3 compliant
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ openpgm/pgm/version_generator.py | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/openpgm/pgm/version_generator.py b/openpgm/pgm/version_generator.py
+index 2265480..c31376f 100755
+--- a/openpgm/pgm/version_generator.py
++++ b/openpgm/pgm/version_generator.py
+@@ -1,5 +1,7 @@
+ #!/usr/bin/python
+ 
++from __future__ import print_function
++
+ import os
+ import platform
+ import time
+@@ -8,7 +10,7 @@ build_date = time.strftime ("%Y-%m-%d")
+ build_time = time.strftime ("%H:%M:%S")
+ build_rev = filter (str.isdigit, "$Revision: 1369 $")
+ 
+-print """
++print("""
+ /* vim:ts=8:sts=8:sw=4:noai:noexpandtab
+  * 
+  * OpenPGM version.
+@@ -47,6 +49,6 @@ const char* pgm_build_revision = "%s";
+ 
+ 
+ /* eof */
+-"""%(build_date, build_time, platform.system(), platform.machine(), build_rev)
++"""%(build_date, build_time, platform.system(), platform.machine(), build_rev))
+ 
+ # end of file
+-- 
+1.9.2
+
diff --git a/package/openpgm/openpgm.mk b/package/openpgm/openpgm.mk
index 3ec5c77..951effb 100644
--- a/package/openpgm/openpgm.mk
+++ b/package/openpgm/openpgm.mk
@@ -12,6 +12,7 @@ OPENPGM_LICENSE_FILES = openpgm/pgm/LICENSE
 OPENPGM_INSTALL_STAGING = YES
 OPENPGM_AUTORECONF = YES
 OPENPGM_SUBDIR = openpgm/pgm/
+OPENPGM_DEPENDENCIES = $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
 OPENPGM_CONF_ENV = ac_cv_file__proc_cpuinfo=yes ac_cv_file__dev_rtc=no \
                    ac_cv_file__dev_hpet=no
 
-- 
1.9.2
