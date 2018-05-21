From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 May 2018 22:39:23 +0200
Subject: [Buildroot] [PATCH] modem-manager: disable -Werror
Message-ID: <20180521203923.21315-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/5d9/5d9e299ff12726d07e8a584a213c1d2a2e419594/

The modem-manager build generates a number of build warnings like:

mm-base-manager.c: In function 'handle_set_logging':
mm-base-manager.c:680:15: error: assignment from incompatible pointer type [-Werror]
     ctx->self = g_object_ref (manager);

Which cause a build failure because of -Werror.  Pass
--disable-more-warnings to disable -Werror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/modem-manager/modem-manager.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 100c4a2941..fe4a7a95da 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -11,6 +11,7 @@ MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
 MODEM_MANAGER_LICENSE_FILES = COPYING COPYING.LIB
 MODEM_MANAGER_DEPENDENCIES = host-pkgconf host-intltool libglib2 libgudev
 MODEM_MANAGER_INSTALL_STAGING = YES
+MODEM_MANAGER_CONF_OPTS = --disable-more-warnings
 
 ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQMI),y)
 MODEM_MANAGER_DEPENDENCIES += libqmi
-- 
2.11.0
