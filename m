From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 26 May 2021 22:04:36 +0200
Subject: [Buildroot] [git commit branch/next] package/python-pymupdf: new
 package.
Message-ID: <20210526194129.ABB6B83AF4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=71f7fc8a27af383d3307945bf6e880491cb74bd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Python bindings for the PDF rendering library MuPDF.

Signed-off-by: Rapha??l M??lotte <raphael.melotte@essensium.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Arnout:
 - propagate harfbuzz dependencies;
 - add comment to mupdf to keep versions in sync;
 - clarify license situation + lack of license file]
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/mupdf/mupdf.mk                     |  1 +
 package/python-pymupdf/Config.in           | 21 +++++++++++++++++++++
 package/python-pymupdf/python-pymupdf.hash |  3 +++
 package/python-pymupdf/python-pymupdf.mk   | 26 ++++++++++++++++++++++++++
 6 files changed, 53 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2a7a64ce15..a0a9cebfe6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2254,6 +2254,7 @@ F:	package/mupdf/
 F:	package/python-boto3/
 F:	package/python-botocore/
 F:	package/python-jmespath/
+F:	package/python-pymupdf/
 F:	package/python-s3transfer/
 
 N:	Refik Tuzakli <tuzakli.refik@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index c30ceb03b4..e42f579494 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1138,6 +1138,7 @@ menu "External python modules"
 	source "package/python-pylibftdi/Config.in"
 	source "package/python-pylru/Config.in"
 	source "package/python-pymodbus/Config.in"
+	source "package/python-pymupdf/Config.in"
 	source "package/python-pymysql/Config.in"
 	source "package/python-pynacl/Config.in"
 	source "package/python-pyopenssl/Config.in"
diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index 6058b85792..5a905f7903 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# python-pymupdf's version must match exactly mupdf's version
 MUPDF_VERSION = 1.16.0
 MUPDF_SOURCE = mupdf-$(MUPDF_VERSION)-source.tar.gz
 MUPDF_SITE = https://mupdf.com/downloads/archive
diff --git a/package/python-pymupdf/Config.in b/package/python-pymupdf/Config.in
new file mode 100644
index 0000000000..cd4c8cfcbb
--- /dev/null
+++ b/package/python-pymupdf/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_PYTHON_PYMUPDF
+	bool "python-pymupdf"
+	depends on BR2_INSTALL_LIBSTDCPP # mupdf -> harfbuzz
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mupdf -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # mupdf -> harfbuzz
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_MUPDF
+	select BR2_PACKAGE_ZLIB
+	help
+	  Python bindings for the PDF rendering library MuPDF.
+
+	  https://github.com/pymupdf/PyMuPDF
+
+comment "python-pymupdf needs Xorg"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_PACKAGE_XORG7
+
+comment "python-pymupdf needs a toolchain w/ C++, gcc >= 4.8"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/python-pymupdf/python-pymupdf.hash b/package/python-pymupdf/python-pymupdf.hash
new file mode 100644
index 0000000000..6729c6b91b
--- /dev/null
+++ b/package/python-pymupdf/python-pymupdf.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/pymupdf/json
+md5	0e924bbb7364ba63df65d33fee9656f0  PyMuPDF-1.16.0.tar.gz
+sha256	1a6cc5b8b0fb9aa16bfa453fdfed445398f00d2556e78d90ba54cdce8d900857  python-pymupdf-1.16.0.tar.gz
diff --git a/package/python-pymupdf/python-pymupdf.mk b/package/python-pymupdf/python-pymupdf.mk
new file mode 100644
index 0000000000..9f8d1744b1
--- /dev/null
+++ b/package/python-pymupdf/python-pymupdf.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# python-pymupdf
+#
+################################################################################
+
+# python-pymupdf's version must match exactly mupdf's version
+PYTHON_PYMUPDF_VERSION = 1.16.0
+PYTHON_PYMUPDF_SOURCE = PyMuPDF-$(PYTHON_PYMUPDF_VERSION).tar.gz
+PYTHON_PYMUPDF_SITE = https://files.pythonhosted.org/packages/d2/da/692102b6e6868a57d1dc7f98d07413116a02493b3b49a798dcd6f676d368
+PYTHON_PYMUPDF_SETUP_TYPE = distutils
+PYTHON_PYMUPDF_LICENSE = GPL-3.0, AGPL-3.0+ (code generated from mupdf)
+# No license file included in pip, but it's present on github
+PYTHON_PYMUPDF_DEPENDENCIES = mupdf zlib
+
+PYTHON_PYMUPDF_ENV = CFLAGS="-I$(STAGING_DIR)/usr/include/mupdf"
+
+# We need to remove the original paths as we provide them in the CFLAGS:
+define PYTHON_PYMUPDF_REMOVE_PATHS
+	sed -i "s:\/usr\/include\/mupdf::g" $(@D)/setup.py
+	sed -i "s:\/usr\/local\/include\/mupdf::g" $(@D)/setup.py
+endef
+
+PYTHON_PYMUPDF_POST_PATCH_HOOKS = PYTHON_PYMUPDF_REMOVE_PATHS
+
+$(eval $(python-package))
