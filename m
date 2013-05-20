From: Markos Chandras <markos.chandras@gmail.com>
Date: Mon, 20 May 2013 12:55:51 +0100
Subject: [Buildroot] [PATCH] directfb: Fix imlib2-config detection and
	dependencies
Message-ID: <1369050951-26751-1-git-send-email-markos.chandras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

The configure script will detect the host /usr/bin/imlib2-config if
there is one instead of the one in the staging directory. Moreover,
directfb uses --enable-imlib2 by default so it needs to depend on the
BR2_PACKAGE_IMLIB2.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
Another option would be to make the imlib2 support optional
(similar to png support)
---
 package/directfb/Config.in   | 1 +
 package/directfb/directfb.mk | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index b9ff5f9..dc7ba21 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_DIRECTFB
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_IMLIB2
 	select BR2_PACKAGE_ZLIB
 	help
 	  http://www.directfb.org/
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 5ead084..034d388 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -10,6 +10,8 @@ DIRECTFB_SOURCE = DirectFB-$(DIRECTFB_VERSION).tar.gz
 DIRECTFB_LICENSE = LGPLv2.1+
 DIRECTFB_LICENSE_FILES = COPYING
 DIRECTFB_INSTALL_STAGING = YES
+
+DIRECTFB_CONF_ENV = ac_cv_path_IMLIB2_CONFIG=$(STAGING_DIR)/usr/bin/imlib2-config
 DIRECTFB_CONF_OPT = \
 	--localstatedir=/var \
 	--disable-explicit-deps \
@@ -25,7 +27,7 @@ DIRECTFB_CONF_OPT = \
 	--without-tools
 DIRECTFB_CONFIG_SCRIPTS = directfb-config
 
-DIRECTFB_DEPENDENCIES = freetype zlib
+DIRECTFB_DEPENDENCIES = freetype imlib2 zlib
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_MULTI),y)
 DIRECTFB_CONF_OPT += --enable-multi --enable-fusion
-- 
1.8.2.1
