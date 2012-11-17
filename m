From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Nov 2012 23:24:00 +0100
Subject: [Buildroot] [PATCH 02/10] libxml2: add support for building host
	library with python support
In-Reply-To: <cover.1353191025.git.thomas.petazzoni@free-electrons.com>
References: <cover.1353191025.git.thomas.petazzoni@free-electrons.com>
Message-ID: <2bf16916bb97596f539490199d5bf40ee85e8e22.1353191025.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vellemans Noel <noel.vellemans@visionbms.com>

Patch based on the initial work of Will Wagner (Thanks Will).
libxml2 host library with python support is required to build mesa3d (7.10.1)

Signed-off-by: Vellemans Noel <noel.vellemans@visionbms.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libxml2/Config.in  |    3 +++
 package/libxml2/libxml2.mk |   10 +++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/libxml2/Config.in b/package/libxml2/Config.in
index ebd63fe..ea62663 100644
--- a/package/libxml2/Config.in
+++ b/package/libxml2/Config.in
@@ -4,3 +4,6 @@ config BR2_PACKAGE_LIBXML2
 	  XML C Parser
 
 	  http://xmlsoft.org/
+
+config BR2_PACKAGE_HOST_LIBXML2_PYTHON
+    bool
\ No newline at end of file
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 71f2bd1..fde3735 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -26,7 +26,15 @@ LIBXML2_POST_INSTALL_STAGING_HOOKS += LIBXML2_STAGING_LIBXML2_CONFIG_FIXUP
 
 HOST_LIBXML2_DEPENDENCIES = host-pkgconf
 
-HOST_LIBXML2_CONF_OPT = --without-debug --without-python
+HOST_LIBXML2_CONF_OPT = --without-debug
+
+ifeq ($(BR2_PACKAGE_HOST_LIBXML2_PYTHON),y)
+HOST_LIBXML2_DEPENDENCIES += host-python
+HOST_LIBXML2_CONF_OPT += --with-python=$(HOST_DIR)/usr
+else
+HOST_LIBXML2_CONF_OPT += --without-python
+endif
+
 
 define LIBXML2_REMOVE_CONFIG_SCRIPTS
 	$(RM) -f $(TARGET_DIR)/usr/bin/xml2-config
-- 
1.7.9.5
