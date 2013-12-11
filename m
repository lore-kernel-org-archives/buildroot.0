From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Dec 2013 21:26:43 +0100
Subject: [Buildroot] [PATCHv2 08/36] python-mad: convert to the Python
	package infrastructure
In-Reply-To: <1386793631-14026-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386793631-14026-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1386793631-14026-9-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-mad/python-mad.mk | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/package/python-mad/python-mad.mk b/package/python-mad/python-mad.mk
index eaa1fae..1b3cb75 100644
--- a/package/python-mad/python-mad.mk
+++ b/package/python-mad/python-mad.mk
@@ -7,8 +7,9 @@
 PYTHON_MAD_VERSION = 0.6
 PYTHON_MAD_SOURCE  = pymad-$(PYTHON_MAD_VERSION).tar.gz
 PYTHON_MAD_SITE    = http://spacepants.org/src/pymad/download/
+PYTHON_MAD_SETUP_TYPE = distutils
 
-PYTHON_MAD_DEPENDENCIES = python libmad
+PYTHON_MAD_DEPENDENCIES = libmad
 
 ifeq ($(BR2_ENDIAN),"LITTLE")
 PYTHON_MAD_ENDIAN=little
@@ -23,19 +24,4 @@ define PYTHON_MAD_CONFIGURE_CMDS
 	echo "mad_include_dir = $(STAGING_DIR)/usr/include" >> $(@D)/Setup
 endef
 
-define PYTHON_MAD_BUILD_CMDS
-	(cd $(@D); \
-		CC="$(TARGET_CC)"		\
-		CFLAGS="$(TARGET_CFLAGS)" 	\
-		LDSHARED="$(TARGET_CC) -shared" \
-		LDFLAGS="$(TARGET_LDFLAGS)" 	\
-	$(HOST_DIR)/usr/bin/python setup.py build_ext \
-	--include-dirs=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR))
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
-endef
-
-define PYTHON_MAD_INSTALL_TARGET_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
-endef
-
-$(eval $(generic-package))
+$(eval $(python-package))
-- 
1.8.1.2
