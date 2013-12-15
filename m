From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 13:37:19 +0100
Subject: [Buildroot] [git commit] python-mad: convert to the Python package
	infrastructure
Message-ID: <20131215130825.D3BE79BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f085d1f425681ae3742dc3f2d99a77ce5b874758
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-mad/python-mad.mk |   20 +++-----------------
 1 files changed, 3 insertions(+), 17 deletions(-)

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
