From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Wed,  2 Mar 2016 09:40:41 +0200
Subject: [Buildroot] [PATCH v3 1/1] sphinxbase: new package
Message-ID: <1456904441-28632-1-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CMUSphinx toolkit is a speech recognition toolkit with various tools
used to build speech applications. CMU Sphinx toolkit has a number of
packages for different tasks and applications. The toolkit is designed
for use on mobile platforms.

Signed-off-by: Jonathan Ben-Avraham <yba@tkos.co.il>

---
Changes v2 -> v3:
 1. Respin for the 2016-2-23 Sphinxbase version
  a. Updated SPHINXBASE_SITE to match Sourceforge URL change
  b. Updated SHA256 hash for the new tarball (the tarball name did not change)
  c. Removed unnecessary SPHINXBASE_AUTORECONF left over from v1 of this patch
  d. Re-tested only with gcc-linaro-4.9-2014.11-x86_64_arm-linux-gnueabihf
  e. Thanks to Yegor Yefremov <yegorslists@googlemail.com> for review

Changes v1 -> v2:
 1. Applied all review comments by Arnout Vandecappelle:
  a. Removed comments regarding github repo
  b. Added comment regarding missing license file upstream bug report
  c. Added example source file as license file
  d. Removed redundant source specification

 2. Tested patch application with git apply --check

 package/Config.in                  |  1 +
 package/sphinxbase/Config.in       | 13 +++++++++++++
 package/sphinxbase/sphinxbase.hash |  2 ++
 package/sphinxbase/sphinxbase.mk   | 16 ++++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/sphinxbase/Config.in
 create mode 100644 package/sphinxbase/sphinxbase.hash
 create mode 100644 package/sphinxbase/sphinxbase.mk

diff --git a/package/Config.in b/package/Config.in
index 529ad33..4e70c6d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1223,6 +1223,7 @@ endif
 	source "package/protobuf-c/Config.in"
 	source "package/qhull/Config.in"
 	source "package/qlibc/Config.in"
+	source "package/sphinxbase/Config.in"
 	source "package/startup-notification/Config.in"
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
diff --git a/package/sphinxbase/Config.in b/package/sphinxbase/Config.in
new file mode 100644
index 0000000..ee9ca31
--- /dev/null
+++ b/package/sphinxbase/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_SPHINXBASE
+	bool "sphinxbase"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  CMUSphinx toolkit is a leading speech recognition toolkit with
+	  various tools used to build speech applications. CMU Sphinx
+	  toolkit has a number of packages for different tasks and
+	  applications.
+
+	  http://cmusphinx.sourceforge.net/
+
+comment "sphinxbase needs a toolchain with threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/sphinxbase/sphinxbase.hash b/package/sphinxbase/sphinxbase.hash
new file mode 100644
index 0000000..47b6dab
--- /dev/null
+++ b/package/sphinxbase/sphinxbase.hash
@@ -0,0 +1,2 @@
+# Locally computed for the 2016-02-23 Sphinxbase release
+sha256 06971dbe272d2f73bde0ef7b3538c0c8f8ea885cb171fd6b17a5975bced66e64 sphinxbase-5prealpha.tar.gz
diff --git a/package/sphinxbase/sphinxbase.mk b/package/sphinxbase/sphinxbase.mk
new file mode 100644
index 0000000..4f63ecd
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
+SPHINXBASE_LICENSE = MIT
+# Note http://sourceforge.net/p/cmusphinx/bugs/441/ "LICENSE file missing in"
+# 5prealpha tarballs". The license is contained in the copyright notice at the
+# top of each source file. For example:
+SPHINXBASE_LICENSE_FILES = src/libsphinxbase/util/bio.c
+SPHINXBASE_CONF_OPTS = --without-python
+
+$(eval $(autotools-package))
-- 
2.1.4
