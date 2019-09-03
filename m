From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:35 -0000
Subject: [Buildroot] [git commit] package/python-brotli: new package
Message-ID: <20190903133619.78BF28A52E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f176b837bbd2eb5ab4d23b7ba0528e548287aa7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Thomas: license is MIT, not Apache-2.0]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/python-brotli/Config.in          |  7 +++++++
 package/python-brotli/python-brotli.hash |  5 +++++
 package/python-brotli/python-brotli.mk   | 20 ++++++++++++++++++++
 5 files changed, 34 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8ad48b95cb..27a98db256 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1087,6 +1087,7 @@ F:	package/python-aiomonitor/
 F:	package/python-aiojobs/
 F:	package/python-aiorwlock/
 F:	package/python-async-timeout/
+F:	package/python-brotli/
 F:	package/python-cchardet/
 F:	package/python-multidict/
 F:	package/python-pycares/
diff --git a/package/Config.in b/package/Config.in
index c984dcea6f..9f544f955c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -844,6 +844,7 @@ menu "External python modules"
 	source "package/python-beautifulsoup4/Config.in"
 	source "package/python-bitstring/Config.in"
 	source "package/python-bottle/Config.in"
+	source "package/python-brotli/Config.in"
 	source "package/python-cached-property/Config.in"
 	source "package/python-can/Config.in"
 	source "package/python-cbor/Config.in"
diff --git a/package/python-brotli/Config.in b/package/python-brotli/Config.in
new file mode 100644
index 0000000000..1c09c26866
--- /dev/null
+++ b/package/python-brotli/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_BROTLI
+	bool "python-brotli"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Python bindings for the Brotli compression library.
+
+	  https://github.com/google/brotli
diff --git a/package/python-brotli/python-brotli.hash b/package/python-brotli/python-brotli.hash
new file mode 100644
index 0000000000..eaf59ae71e
--- /dev/null
+++ b/package/python-brotli/python-brotli.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/brotli/json
+md5	3444b534e86f65f9f229fd123965be87  Brotli-1.0.7.zip
+sha256	0538dc1744fd17c314d2adc409ea7d1b779783b89fd95bcfb0c2acc93a6ea5a7  Brotli-1.0.7.zip
+# Locally computed sha256 checksums
+sha256	3d180008e36922a4e8daec11c34c7af264fed5962d07924aea928c38e8663c94  LICENSE
diff --git a/package/python-brotli/python-brotli.mk b/package/python-brotli/python-brotli.mk
new file mode 100644
index 0000000000..745255f413
--- /dev/null
+++ b/package/python-brotli/python-brotli.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# python-brotli
+#
+################################################################################
+
+PYTHON_BROTLI_VERSION = 1.0.7
+PYTHON_BROTLI_SOURCE = Brotli-$(PYTHON_BROTLI_VERSION).zip
+PYTHON_BROTLI_SITE = https://files.pythonhosted.org/packages/cd/9c/7955895f5672ecc85270244582c6b53ff95bb4c24bf77bd9271d42351635
+PYTHON_BROTLI_SETUP_TYPE = setuptools
+PYTHON_BROTLI_LICENSE = MIT
+PYTHON_BROTLI_LICENSE_FILES = LICENSE
+
+define PYTHON_BROTLI_EXTRACT_CMDS
+	$(UNZIP) -d $(@D) $(PYTHON_BROTLI_DL_DIR)/$(PYTHON_BROTLI_SOURCE)
+	mv $(@D)/Brotli-$(PYTHON_BROTLI_VERSION)/* $(@D)
+	$(RM) -r $(@D)/Brotli-$(PYTHON_BROTLI_VERSION)
+endef
+
+$(eval $(python-package))
