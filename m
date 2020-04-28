From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 Apr 2020 21:11:50 +0200
Subject: [Buildroot] [git commit] package/matio: new package
Message-ID: <20200428190505.76D6890A5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8da12f0f9f00110d9575515041f0662305844c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

matio is an C library for reading and writing MATLAB MAT files.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/matio/Config.in  |  8 ++++++++
 package/matio/matio.hash |  4 ++++
 package/matio/matio.mk   | 20 ++++++++++++++++++++
 5 files changed, 34 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b36c9f561b..cc72b288be 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1098,6 +1098,7 @@ F:	package/gnuradio/
 F:	package/gqrx/
 F:	package/gr-osmosdr/
 F:	package/libusbgx/
+F:	package/matio/
 F:	package/python-cheetah/
 F:	package/python-markdown/
 F:	package/python-remi/
diff --git a/package/Config.in b/package/Config.in
index bf02870ea2..53c8ce0e29 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1871,6 +1871,7 @@ endif
 	source "package/liquid-dsp/Config.in"
 	source "package/llvm/Config.in"
 	source "package/lttng-libust/Config.in"
+	source "package/matio/Config.in"
 	source "package/mpc/Config.in"
 	source "package/mpdecimal/Config.in"
 	source "package/mpfr/Config.in"
diff --git a/package/matio/Config.in b/package/matio/Config.in
new file mode 100644
index 0000000000..9e2ea6800b
--- /dev/null
+++ b/package/matio/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_MATIO
+	bool "matio"
+	select BR2_PACKAGE_ZLIB
+	help
+	  matio is an C library for reading and writing MATLAB MAT
+	  files.
+
+	  https://sourceforge.net/projects/matio
diff --git a/package/matio/matio.hash b/package/matio/matio.hash
new file mode 100644
index 0000000000..65da53a6f2
--- /dev/null
+++ b/package/matio/matio.hash
@@ -0,0 +1,4 @@
+# From https://sourceforge.net/projects/matio/files/matio/1.5.17/
+sha512  af8ff11c7c44fea9ea6886e381f49ef9186946f3def98ad9695f2d5d1df045c35e8f4ceac12a44be397f7bbd708b4803762b5ce54c45b60a9f446d551c04f5d2  matio-1.5.17.tar.gz
+# Locally computed
+sha256  62a0cab69eeadb3697a2249d5a869915b89e62b59b794dd70802c2b8624ed374  COPYING
diff --git a/package/matio/matio.mk b/package/matio/matio.mk
new file mode 100644
index 0000000000..8af39ce22c
--- /dev/null
+++ b/package/matio/matio.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# matio
+#
+################################################################################
+
+MATIO_VERSION = 1.5.17
+MATIO_SITE = http://downloads.sourceforge.net/project/matio/matio/$(MATIO_VERSION)
+MATIO_LICENSE = BSD-2-Clause
+MATIO_LICENSE_FILES = COPYING
+MATIO_DEPENDENCIES = zlib
+MATIO_INSTALL_STAGING = YES
+
+# va_copy()
+MATIO_CONF_ENV = ac_cv_va_copy=yes
+
+# mat73 require hdf5 (not available), extented-sparse take 2KB
+MATIO_CONF_OPTS = --disable-mat73 --enable-extended-sparse
+
+$(eval $(autotools-package))
