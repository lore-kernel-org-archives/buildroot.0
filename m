From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 23:09:15 +0200
Subject: [Buildroot] [git commit] package/python-mwscrape2slob: new package
Message-ID: <20161009210953.59B9081EC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24a688857aeba207cce88e079c1ccfc2bcadbaab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                     |  1 +
 package/python-mwscrape2slob/Config.in                | 19 +++++++++++++++++++
 .../python-mwscrape2slob/python-mwscrape2slob.hash    |  2 ++
 package/python-mwscrape2slob/python-mwscrape2slob.mk  | 12 ++++++++++++
 4 files changed, 34 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 6e071ef..60184ce 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -712,6 +712,7 @@ menu "External python modules"
 	source "package/python-msgpack/Config.in"
 	source "package/python-mwclient/Config.in"
 	source "package/python-mwscrape/Config.in"
+	source "package/python-mwscrape2slob/Config.in"
 	source "package/python-netaddr/Config.in"
 	source "package/python-netifaces/Config.in"
 	source "package/python-networkmanager/Config.in"
diff --git a/package/python-mwscrape2slob/Config.in b/package/python-mwscrape2slob/Config.in
new file mode 100644
index 0000000..799ab29
--- /dev/null
+++ b/package/python-mwscrape2slob/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_PYTHON_MWSCRAPE2SLOB
+	bool "python-mwscrape2slob"
+	depends on !BR2_BINFMT_FLAT # python-slob -> python-pyicu -> icu
+	depends on BR2_INSTALL_LIBSTDCPP # python-slob -> python-pyicu -> icu
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_COUCHDB # runtime
+	select BR2_PACKAGE_PYTHON_CSSSELECT # runtime
+	select BR2_PACKAGE_PYTHON_CSSUTILS # runtime
+	select BR2_PACKAGE_PYTHON_LXML # runtime
+	select BR2_PACKAGE_PYTHON_SLOB # runtime
+	help
+	  A tool to create slob with content from a MediaWiki CouchDB
+	  created by mwscrape.
+
+	  https://github.com/itkach/mwscrape2slob
+
+comment "python-mwscrape2slob needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_PYTHON3 && !BR2_BINFMT_FLAT
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-mwscrape2slob/python-mwscrape2slob.hash b/package/python-mwscrape2slob/python-mwscrape2slob.hash
new file mode 100644
index 0000000..f1f5e4f
--- /dev/null
+++ b/package/python-mwscrape2slob/python-mwscrape2slob.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 367ffc3203f7eb2cc26211f58c0693526652d9a238af48c88f936920e804faf7  python-mwscrape2slob-0f9124ed62009dff6a230947d80340f5a61a6f49.tar.gz
diff --git a/package/python-mwscrape2slob/python-mwscrape2slob.mk b/package/python-mwscrape2slob/python-mwscrape2slob.mk
new file mode 100644
index 0000000..4d27d8d
--- /dev/null
+++ b/package/python-mwscrape2slob/python-mwscrape2slob.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# python-mwscrape2slob
+#
+################################################################################
+
+PYTHON_MWSCRAPE2SLOB_VERSION = 0f9124ed62009dff6a230947d80340f5a61a6f49
+PYTHON_MWSCRAPE2SLOB_SITE = $(call github,itkach,mwscrape2slob,$(PYTHON_MWSCRAPE2SLOB_VERSION))
+PYTHON_MWSCRAPE2SLOB_LICENSE = GPLv3, Apache-2.0 (MathJax), GPL (MediaWiki monobook style sheet)
+PYTHON_MWSCRAPE2SLOB_SETUP_TYPE = distutils
+
+$(eval $(python-package))
