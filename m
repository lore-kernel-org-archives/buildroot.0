From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 18:46:46 +0200
Subject: [Buildroot] [git commit] sphinxbase: new package
Message-ID: <20160702164707.54F3F80301@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63ee560d2f5113f325f05697d2fb0fdc61448859
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CMUSphinx toolkit is a speech recognition toolkit with various tools
used to build speech applications. CMU Sphinx toolkit has a number of
packages for different tasks and applications. The toolkit is designed
for use on mobile platforms.

Signed-off-by: Jonathan Ben-Avraham <yba@tkos.co.il>
[Thomas:
 - license is BSD-2c, not MIT
 - add --without-lapack]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                  |  1 +
 package/sphinxbase/Config.in       | 13 +++++++++++++
 package/sphinxbase/sphinxbase.hash |  2 ++
 package/sphinxbase/sphinxbase.mk   | 16 ++++++++++++++++
 4 files changed, 32 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 7844cdd..550beb3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1316,6 +1316,7 @@ endif
 	source "package/protobuf-c/Config.in"
 	source "package/qhull/Config.in"
 	source "package/qlibc/Config.in"
+	source "package/sphinxbase/Config.in"
 	source "package/startup-notification/Config.in"
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
diff --git a/package/sphinxbase/Config.in b/package/sphinxbase/Config.in
new file mode 100644
index 0000000..00a19f6
--- /dev/null
+++ b/package/sphinxbase/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_SPHINXBASE
+	bool "sphinxbase"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  CMUSphinx toolkit is a leading speech recognition toolkit
+	  with various tools used to build speech applications. CMU
+	  Sphinx toolkit has a number of packages for different tasks
+	  and applications.
+
+	  http://cmusphinx.sourceforge.net/
+
+comment "sphinxbase needs a toolchain with threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/sphinxbase/sphinxbase.hash b/package/sphinxbase/sphinxbase.hash
new file mode 100644
index 0000000..9fbb6df
--- /dev/null
+++ b/package/sphinxbase/sphinxbase.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 06971dbe272d2f73bde0ef7b3538c0c8f8ea885cb171fd6b17a5975bced66e64 sphinxbase-5prealpha.tar.gz
diff --git a/package/sphinxbase/sphinxbase.mk b/package/sphinxbase/sphinxbase.mk
new file mode 100644
index 0000000..a8f9a53
--- /dev/null
+++ b/package/sphinxbase/sphinxbase.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# sphinxbase
+#
+################################################################################
+
+SPHINXBASE_VERSION = 5prealpha
+SPHINXBASE_SITE = http://downloads.sourceforge.net/project/cmusphinx/sphinxbase/5prealpha
+SPHINXBASE_LICENSE = BSD-2c
+# Note http://sourceforge.net/p/cmusphinx/bugs/441/ "LICENSE file missing in"
+# 5prealpha tarballs". The license is contained in the copyright notice at the
+# top of each source file. For example:
+SPHINXBASE_LICENSE_FILES = src/libsphinxbase/util/bio.c
+SPHINXBASE_CONF_OPTS = --without-python --without-lapack
+
+$(eval $(autotools-package))
