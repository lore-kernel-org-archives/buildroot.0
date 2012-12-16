From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Dec 2012 20:37:53 +0100
Subject: [Buildroot] [git commit] package/python-pyparsing: new package
Message-ID: <20121216200126.BDCBE9A29B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=df07240d6fb4c60ecc65a54ea10dfc729773a803
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                            |    1 +
 package/python-pyparsing/Config.in           |   11 +++++++
 package/python-pyparsing/python-pyparsing.mk |   38 ++++++++++++++++++++++++++
 3 files changed, 50 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f395934..07681b5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -309,6 +309,7 @@ source "package/python-netifaces/Config.in"
 source "package/python-nfc/Config.in"
 source "package/python-protobuf/Config.in"
 source "package/python-pygame/Config.in"
+source "package/python-pyparsing/Config.in"
 source "package/python-serial/Config.in"
 source "package/python-setuptools/Config.in"
 endmenu
diff --git a/package/python-pyparsing/Config.in b/package/python-pyparsing/Config.in
new file mode 100644
index 0000000..126dd0e
--- /dev/null
+++ b/package/python-pyparsing/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_PYPARSING
+	bool "pyparsing"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  The pyparsing module is an alternative approach to creating and
+	  executing simple grammars, vs. the traditional lex/yacc approach,
+	  or the use of regular expressions. The pyparsing module provides
+	  a library of classes that client code uses to construct the grammar
+	  directly in Python code.
+	  
+	  http://pyparsing.wikispaces.com/
diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
new file mode 100644
index 0000000..246df4d
--- /dev/null
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -0,0 +1,38 @@
+#############################################################
+#
+# python-pyparsing
+#
+#############################################################
+
+PYTHON_PYPARSING_VERSION         = 1.5.6
+PYTHON_PYPARSING_SOURCE          = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
+PYTHON_PYPARSING_SITE            = http://downloads.sourceforge.net/project/pyparsing/pyparsing/pyparsing-$(PYTHON_PYPARSING_VERSION)
+PYTHON_PYPARSING_LICENSE         = MIT
+PYTHON_PYPARSING_LICENSE_FILES   = LICENSE
+PYTHON_PYPARSING_INSTALL_STAGING = YES
+PYTHON_PYPARSING_DEPENDENCIES    = python
+
+# Shamelessly vampirised from python-pygame ;-)
+define PYTHON_PYPARSING_BUILD_CMDS
+	(cd $(@D);                                              \
+	 CC="$(TARGET_CC)"                                      \
+	 CFLAGS="$(TARGET_CFLAGS)"                              \
+	 LDSHARED="$(TARGET_CROSS)gcc -shared"                  \
+	 CROSS_COMPILING=yes                                    \
+	 _python_sysroot=$(STAGING_DIR)                         \
+	 _python_srcdir=$(BUILD_DIR)/python$(PYTHON_VERSION)    \
+	 _python_prefix=/usr                                    \
+	 _python_exec_prefix=/usr                               \
+	 $(HOST_DIR)/usr/bin/python setup.py build              \
+	)
+endef
+
+# Shamelessly vampirised from python-pygame ;-)
+define PYTHON_PYPARSING_INSTALL_TARGET_CMDS
+	(cd $(@D);                                              \
+	 $(HOST_DIR)/usr/bin/python setup.py install            \
+	                            --prefix=$(TARGET_DIR)/usr  \
+	)
+endef
+
+$(eval $(generic-package))
