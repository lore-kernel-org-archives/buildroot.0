From: vomlehn at canopus-us.com <vomlehn@canopus-us.com>
Date: Wed, 28 May 2014 22:24:14 -0700
Subject: [Buildroot] [PATCH 3/3] Support installation of Python in a
	different directory.
In-Reply-To: <1401341054-16705-1-git-send-email-vomlehn@canopus-us.com>
References: <1401341054-16705-1-git-send-email-vomlehn@canopus-us.com>
Message-ID: <1401341054-16705-4-git-send-email-vomlehn@canopus-us.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: David VomLehn <vomlehn@canopus-us.com>

Python is both useful and large. This patch allows installation in a
different directory, which can then be installed on its own device
by packaging it as part of a separated filesystem.

Signed-off-by: David VomLehn <vomlehn@canopus-us.com>
---
 package/python/Config.in |    7 +++++++
 package/python/python.mk |   26 ++++++++++++++++----------
 2 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/package/python/Config.in b/package/python/Config.in
index a0c78c6..58666e7 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -15,6 +15,13 @@ comment "python needs a toolchain w/ wchar"
 
 if BR2_PACKAGE_PYTHON
 
+config BR2_PACKAGE_PYTHON_PREFIX
+	string "Directory for generated files (executables, libraries, etc.)"
+	default "/usr"
+	help
+	  Python is big! Installing Python in a different directory allows
+	  it to be packaged as a separate filesystem.
+
 choice
 	prompt "python module format to install"
 	default BR2_PACKAGE_PYTHON_PYC_ONLY
diff --git a/package/python/python.mk b/package/python/python.mk
index 8a2ba65..9e4843d 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -11,6 +11,9 @@ PYTHON_SITE          = http://python.org/ftp/python/$(PYTHON_VERSION)
 PYTHON_LICENSE       = Python software foundation license v2, others
 PYTHON_LICENSE_FILES = LICENSE
 
+# Relocate to the desired location
+PYTHON_CONF_PREFIX   = $(BR2_PACKAGE_PYTHON_PREFIX)
+
 # Python needs itself to be built, so in order to cross-compile
 # Python, we need to build a host Python first. This host Python is
 # also installed in $(HOST_DIR), as it is needed when cross-compiling
@@ -153,12 +156,12 @@ PYTHON_POST_PATCH_HOOKS += PYTHON_TOUCH_GRAMMAR_FILES
 # idle & smtpd.py have bad shebangs and are mostly samples
 #
 define PYTHON_REMOVE_USELESS_FILES
-	rm -f $(TARGET_DIR)/usr/bin/idle
-	rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR)-config
-	rm -f $(TARGET_DIR)/usr/bin/python2-config
-	rm -f $(TARGET_DIR)/usr/bin/python-config
-	rm -f $(TARGET_DIR)/usr/bin/smtpd.py
-	for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/config/ \
+	rm -f $(TARGET_DIR)$(PYTHON_CONF_PREFIX)/bin/idle
+	rm -f $(TARGET_DIR)$(PYTHON_CONF_PREFIX)/bin/python$(PYTHON_VERSION_MAJOR)-config
+	rm -f $(TARGET_DIR)$(PYTHON_CONF_PREFIX)/bin/python2-config
+	rm -f $(TARGET_DIR)$(PYTHON_CONF_PREFIX)/bin/python-config
+	rm -f $(TARGET_DIR)$(PYTHON_CONF_PREFIX)/bin/smtpd.py
+	for i in `find $(TARGET_DIR)$(PYTHON_CONF_PREFIX)/lib/python$(PYTHON_VERSION_MAJOR)/config/ \
 		-type f -not -name pyconfig.h -a -not -name Makefile` ; do \
 		rm -f $$i ; \
 	done
@@ -170,21 +173,24 @@ PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_REMOVE_USELESS_FILES
 # Make sure libpython gets stripped out on target
 #
 define PYTHON_ENSURE_LIBPYTHON_STRIPPED
-	chmod u+w $(TARGET_DIR)/usr/lib/libpython$(PYTHON_VERSION_MAJOR)*.so
+	mkdir -p $(TARGET_DIR)$(PYTHON_CONF_PREFIX)/lib
+	chmod u+w $(TARGET_DIR)$(PYTHON_CONF_PREFIX)/lib/libpython$(PYTHON_VERSION_MAJOR)*.so
 endef
 
 PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_ENSURE_LIBPYTHON_STRIPPED
 
 # Always install the python symlink in the target tree
 define PYTHON_INSTALL_TARGET_PYTHON_SYMLINK
-	ln -sf python2 $(TARGET_DIR)/usr/bin/python
+	mkdir -p $(TARGET_DIR)$(PYTHON_CONF_PREFIX)/bin
+	ln -sf python2 $(TARGET_DIR)$(PYTHON_CONF_PREFIX)/bin/python
 endef
 
 PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_INSTALL_TARGET_PYTHON_SYMLINK
 
 # Always install the python-config symlink in the staging tree
 define PYTHON_INSTALL_STAGING_PYTHON_CONFIG_SYMLINK
-	ln -sf python2-config $(STAGING_DIR)/usr/bin/python-config
+	mkdir -p $(TARGET_DIR)$(PYTHON_CONF_PREFIX)/bin
+	ln -sf python2-config $(STAGING_DIR)$(PYTHON_CONF_PREFIX)/bin/python-config
 endef
 
 PYTHON_POST_INSTALL_STAGING_HOOKS += PYTHON_INSTALL_STAGING_PYTHON_CONFIG_SYMLINK
@@ -204,7 +210,7 @@ HOST_PYTHON_POST_INSTALL_HOOKS += HOST_PYTHON_INSTALL_PYTHON_SYMLINK
 endif
 
 # Provided to other packages
-PYTHON_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/sysconfigdata/:$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/
+PYTHON_PATH = $(TARGET_DIR)$(PYTHON_CONF_PREFIX)/lib/python$(PYTHON_VERSION_MAJOR)/sysconfigdata/:$(TARGET_DIR)$(PYTHON_CONF_PREFIX)/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.7.9.5
