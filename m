From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Wed, 4 Sep 2013 18:09:51 -0500
Subject: [Buildroot] [PATCH 12/17] python-pyparsing: Add host build option
In-Reply-To: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1378336196-27403-13-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
 package/python-pyparsing/python-pyparsing.mk |   47 ++++++++++++++++++-------
 1 files changed, 34 insertions(+), 13 deletions(-)

diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index 7814ce3..b6ba40d 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -14,25 +14,46 @@ PYTHON_PYPARSING_DEPENDENCIES    = python
 
 # Shamelessly vampirised from python-pygame ;-)
 define PYTHON_PYPARSING_BUILD_CMDS
-	(cd $(@D);                                              \
-	 CC="$(TARGET_CC)"                                      \
-	 CFLAGS="$(TARGET_CFLAGS)"                              \
-	 LDSHARED="$(TARGET_CROSS)gcc -shared"                  \
-	 CROSS_COMPILING=yes                                    \
-	 _python_sysroot=$(STAGING_DIR)                         \
-	 _python_srcdir=$(BUILD_DIR)/python$(PYTHON_VERSION)    \
-	 _python_prefix=/usr                                    \
-	 _python_exec_prefix=/usr                               \
-	 $(HOST_DIR)/usr/bin/python setup.py build              \
+	(cd $(@D); \
+		CC="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDSHARED="$(TARGET_CROSS)gcc -shared" \
+		CROSS_COMPILING=yes \
+		_python_sysroot=$(STAGING_DIR) \
+		_python_srcdir=$(BUILD_DIR)/python$(PYTHON_VERSION) \
+		_python_prefix=/usr \
+		_python_exec_prefix=/usr \
+		$(HOST_DIR)/usr/bin/python setup.py build \
 	)
 endef
 
 # Shamelessly vampirised from python-pygame ;-)
 define PYTHON_PYPARSING_INSTALL_TARGET_CMDS
-	(cd $(@D);                                              \
-	 $(HOST_DIR)/usr/bin/python setup.py install            \
-	                            --prefix=$(TARGET_DIR)/usr  \
+	(cd $(@D); \
+		$(HOST_DIR)/usr/bin/python setup.py install \
+		--prefix=$(TARGET_DIR)/usr \
+	)
+endef
+
+HOST_PYTHON_PYPARSING_DEPENDENCIES = host-python
+
+define HOST_PYTHON_PYPARSING_BUILD_CMDS
+	(cd $(@D); \
+		_python_sysroot=$(HOST_DIR) \
+		_python_srcdir=$(BUILD_DIR)/host-python$(PYTHON_VERSION) \
+		_python_prefix=/usr \
+		_python_exec_prefix=/usr \
+		$(HOST_DIR)/usr/bin/python setup.py build \
+	)
+endef
+
+define HOST_PYTHON_PYPARSING_INSTALL_CMDS
+	(cd $(@D); \
+		$(HOST_DIR)/usr/bin/python setup.py install \
+		--prefix=$(HOST_DIR)/usr \
 	)
 endef
 
 $(eval $(generic-package))
+$(eval $(host-generic-package))
+
-- 
1.7.1
