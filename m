From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Fri, 24 Apr 2020 10:56:24 +0200
Subject: [Buildroot] [PATCH v2] package/matio: new package
Message-ID: <20200424085624.23908-1-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

matio is an C library for reading and writing MATLAB MAT files.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
Changes v1 -> v2:
 * add one blank line befor URL (Heiko)
 * drop blank lines around MATIO_DEPENDENCIES and MATIO_INSTALL_STAGING (Heiko)
 * drop comment about STAGING (Heiko)
 * += -> + for MATIO_CONF_ENV (Heiko)
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/matio/Config.in  | 15 +++++++++++++++
 package/matio/matio.hash |  5 +++++
 package/matio/matio.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 47 insertions(+)
 create mode 100644 package/matio/Config.in
 create mode 100644 package/matio/matio.hash
 create mode 100644 package/matio/matio.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c57bc1c5c9..6cd115be38 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1101,6 +1101,7 @@ F:	package/gnuradio/
 F:	package/gqrx/
 F:	package/gr-osmosdr/
 F:	package/libusbgx/
+F:	package/matio/
 F:	package/python-cheetah/
 F:	package/python-markdown/
 F:	package/python-remi/
diff --git a/package/Config.in b/package/Config.in
index a9c6f6fcbc..f7c48d2d9e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1868,6 +1868,7 @@ endif
 	source "package/liquid-dsp/Config.in"
 	source "package/llvm/Config.in"
 	source "package/lttng-libust/Config.in"
+	source "package/matio/Config.in"
 	source "package/mpc/Config.in"
 	source "package/mpdecimal/Config.in"
 	source "package/mpfr/Config.in"
diff --git a/package/matio/Config.in b/package/matio/Config.in
new file mode 100644
index 0000000000..b6c4223e44
--- /dev/null
+++ b/package/matio/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_MATIO
+	bool "matio"
+	select BR2_PACKAGE_ZLIB
+	help
+	  matio is an C library for reading and writing MATLAB MAT
+	  files.
+
+	  https://sourceforge.net/projects/matio
+
+if BR2_PACKAGE_MATIO
+
+config BR2_PACKAGE_MATIO_SPARSE
+	bool "sparse support"
+
+endif
diff --git a/package/matio/matio.hash b/package/matio/matio.hash
new file mode 100644
index 0000000000..d84f50e0b2
--- /dev/null
+++ b/package/matio/matio.hash
@@ -0,0 +1,5 @@
+# From https://sourceforge.net/projects/matio/files/matio/1.5.17/
+sha512  af8ff11c7c44fea9ea6886e381f49ef9186946f3def98ad9695f2d5d1df045c35e8f4ceac12a44be397f7bbd708b4803762b5ce54c45b60a9f446d551c04f5d2  matio-1.5.17.tar.gz
+# Locally computed
+sha256  5e455527d370ab297c4abe5a2ab4d599c93ac7c1a0c85d841cc5c22f8221c400  matio-1.5.17.tar.gz
+sha256  62a0cab69eeadb3697a2249d5a869915b89e62b59b794dd70802c2b8624ed374  COPYING
diff --git a/package/matio/matio.mk b/package/matio/matio.mk
new file mode 100644
index 0000000000..2ac46f10ad
--- /dev/null
+++ b/package/matio/matio.mk
@@ -0,0 +1,25 @@
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
+MATIO_CONF_OPTS = --enable-mat73=no
+
+ifeq ($(BR2_PACKAGE_MATIO_SPARSE),y)
+MATIO_CONF_OPTS += --enable-extended-sparse=yes
+else
+MATIO_CONF_OPTS += --enable-extended-sparse=no
+endif
+
+$(eval $(autotools-package))
-- 
2.25.1
