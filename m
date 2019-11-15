From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Nov 2019 21:11:25 +0100
Subject: [Buildroot] [git commit] package/libsigrokdecode: fix build with
 python 3.8
Message-ID: <20191115200401.770038EFA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f5be8c55215b78a1453df2fd62b5edbf288c2d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will fix build with sigrok-cli and python 3.8

Fixes:
 - http://autobuild.buildroot.org/results/4855d42545cbfeeec7529410acc84b61bc8790af

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1-configure-ac-Add-support-for-Python-3-8.patch | 41 ++++++++++++++++++++++
 package/libsigrokdecode/libsigrokdecode.mk         |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/package/libsigrokdecode/0001-configure-ac-Add-support-for-Python-3-8.patch b/package/libsigrokdecode/0001-configure-ac-Add-support-for-Python-3-8.patch
new file mode 100644
index 0000000000..21a166f2c6
--- /dev/null
+++ b/package/libsigrokdecode/0001-configure-ac-Add-support-for-Python-3-8.patch
@@ -0,0 +1,41 @@
+From afae4fa61ffd8dee62667e60f931e371061c7d7d Mon Sep 17 00:00:00 2001
+From: Uwe Hermann <uwe@hermann-uwe.de>
+Date: Tue, 12 Nov 2019 21:58:23 +0100
+Subject: [PATCH] configure.ac: Add support for Python 3.8.
+
+This fixes bug #1438.
+[Retrieved from:
+https://sigrok.org/gitweb/?p=libsigrokdecode.git;a=commit;h=afae4fa61ffd8dee62667e60f931e371061c7d7d]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 772b984..d59e0be 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -89,15 +89,18 @@ SRD_PKGLIBS_TESTS=
+ SR_PKG_CHECK_SUMMARY([srd_pkglibs_summary])
+ 
+ # Python 3 is always needed.
++# Starting with Python 3.8 we need to check for "python-3.8-embed"
++# first, since usually only that variant will add "-lpython3.8".
++# https://docs.python.org/3/whatsnew/3.8.html#debug-build-uses-the-same-abi-as-release-build
+ SR_PKG_CHECK([python3], [SRD_PKGLIBS],
+-	[python3 >= 3.2], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2])
++	[python-3.8-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
+ AS_IF([test "x$sr_have_python3" = xno],
+ 	[AC_MSG_ERROR([Cannot find Python 3 development headers.])])
+ 
+ # We also need to find the name of the python3 executable (for 'make install').
+ # Some OSes call this python3, some call it python3.2, etc. etc.
+ AC_ARG_VAR([PYTHON3], [Python 3 interpreter])
+-AC_CHECK_PROGS([PYTHON3], [python3.7 python3.6 python3.5 python3.4 python3.3 python3.2 python3])
++AC_CHECK_PROGS([PYTHON3], [python3.8 python3.7 python3.6 python3.5 python3.4 python3.3 python3.2 python3])
+ AS_IF([test "x$PYTHON3" = x],
+ 	[AC_MSG_ERROR([Cannot find Python 3 interpreter.])])
+ 
+-- 
+2.24.0.rc2
+
diff --git a/package/libsigrokdecode/libsigrokdecode.mk b/package/libsigrokdecode/libsigrokdecode.mk
index f509fbdf7e..02f484bbf7 100644
--- a/package/libsigrokdecode/libsigrokdecode.mk
+++ b/package/libsigrokdecode/libsigrokdecode.mk
@@ -10,5 +10,7 @@ LIBSIGROKDECODE_LICENSE = GPL-3.0+
 LIBSIGROKDECODE_LICENSE_FILES = COPYING
 LIBSIGROKDECODE_INSTALL_STAGING = YES
 LIBSIGROKDECODE_DEPENDENCIES = host-pkgconf libglib2 python3
+# We're patching configure.ac
+LIBSIGROKDECODE_AUTORECONF = YES
 
 $(eval $(autotools-package))
