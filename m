From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Nov 2012 23:41:41 +0100
Subject: [Buildroot] [git commit] libxml2: add support for building host
	library with python support
Message-ID: <20121117225525.0B8859A081@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e445f54bc74ea762a2444cf92be0864e639027a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch based on the initial work of Will Wagner (Thanks Will).
libxml2 host library with python support is required to build mesa3d (7.10.1)

Signed-off-by: Vellemans Noel <noel.vellemans@visionbms.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libxml2/Config.in  |    3 +++
 package/libxml2/libxml2.mk |   10 +++++++++-
 2 files changed, 12 insertions(+), 1 deletions(-)

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
