From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Nov 2020 08:15:20 +0100
Subject: [Buildroot] [git commit] package/libsigrokdecode: fix build with
 python 3.9
Message-ID: <20201106070452.66D138127F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46aab84c6fa1c242b304cbd9cd79a7fd94f7a31a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will fix the following build failure with python 3.9 and
sigrok-cli:

/srv/storage/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/5.5.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: /srv/storage/autobuild/run/instance-1/output-1/host/bin/../mips64el-buildroot-linux-uclibc/sysroot/usr/lib/libsigrokdecode.so: undefined reference to `PyList_Insert'

Fixes:
 - http://autobuild.buildroot.org/results/cc6447b926f8223c68d0086428d29a037b18252d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-configure-ac-Add-support-for-Python-3-9.patch | 28 ++++++++++++++++++++++
 package/libsigrokdecode/libsigrokdecode.mk         |  2 ++
 2 files changed, 30 insertions(+)

diff --git a/package/libsigrokdecode/0001-configure-ac-Add-support-for-Python-3-9.patch b/package/libsigrokdecode/0001-configure-ac-Add-support-for-Python-3-9.patch
new file mode 100644
index 0000000000..804e931dcb
--- /dev/null
+++ b/package/libsigrokdecode/0001-configure-ac-Add-support-for-Python-3-9.patch
@@ -0,0 +1,28 @@
+From 9b0ad5177bd692f7556a4756bdbd2da81d9c34ce Mon Sep 17 00:00:00 2001
+From: =?utf8?q?Dan=20Hor=C3=A1k?= <dan@danny.cz>
+Date: Tue, 4 Aug 2020 09:19:44 +0200
+Subject: [PATCH] configure.ac: Add support for Python 3.9.
+
+[Retrieved from:
+https://sigrok.org/gitweb/?p=libsigrokdecode.git;a=commit;h=9b0ad5177bd692f7556a4756bdbd2da81d9c34ce]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index f9958b3..2917cb3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -100,7 +100,7 @@ SR_PKG_CHECK_SUMMARY([srd_pkglibs_summary])
+ # first, since usually only that variant will add "-lpython3.8".
+ # https://docs.python.org/3/whatsnew/3.8.html#debug-build-uses-the-same-abi-as-release-build
+ SR_PKG_CHECK([python3], [SRD_PKGLIBS],
+-	[python-3.8-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
++	[python-3.9-embed], [python-3.8-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
+ AS_IF([test "x$sr_have_python3" = xno],
+ 	[AC_MSG_ERROR([Cannot find Python 3 development headers.])])
+ 
+-- 
+2.24.0.rc2
+
diff --git a/package/libsigrokdecode/libsigrokdecode.mk b/package/libsigrokdecode/libsigrokdecode.mk
index 8c9488784c..18f2cbfee3 100644
--- a/package/libsigrokdecode/libsigrokdecode.mk
+++ b/package/libsigrokdecode/libsigrokdecode.mk
@@ -10,5 +10,7 @@ LIBSIGROKDECODE_LICENSE = GPL-3.0+
 LIBSIGROKDECODE_LICENSE_FILES = COPYING
 LIBSIGROKDECODE_INSTALL_STAGING = YES
 LIBSIGROKDECODE_DEPENDENCIES = host-pkgconf libglib2 python3
+# We're patching configure.ac
+LIBSIGROKDECODE_AUTORECONF = YES
 
 $(eval $(autotools-package))
