From: Martin Banky <martin.banky@gmail.com>
Date: Sat, 25 Sep 2010 00:33:54 -0700
Subject: [Buildroot] [PATCH 01/01] libtool: bump to 2.4 - now with sysroot
	support
In-Reply-To: <1285400034-17267-1-git-send-email-Martin.Banky@gmail.com>
References: <1285400034-17267-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1285400034-17267-2-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sysroot support. This allows you to build cross-compiled packages
with the same prefix that will be used on the destination machine,
and still find dependent libraries under the compiler's "sysroot".
Without sysroot support, paths internal to the build system may leak
into the product of the build.

Sysroot support is disabled unless the --with-sysroot configure
option is passed to configure, because .la files generated with
sysroot support will not be usable in general with older Libtools.

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/libtool/libtool.mk |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 4278029..d28ad2d 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -3,9 +3,13 @@
 # libtool
 #
 #############################################################
-LIBTOOL_VERSION = 1.5.24
+LIBTOOL_VERSION = 2.4
 LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.gz
 LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
+LIBTOOL_LIBTOOL_PATCH = NO
+LIBTOOL_AUTORECONF = NO
+
+LIBTOOL_CONF_OPT = --with-sysroot
 
 ifeq ($(BR2_ENABLE_DEBUG),y) # install-exec doesn't install aclocal stuff
 LIBTOOL_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
@@ -24,5 +28,5 @@ $(eval $(call AUTOTARGETS,package,libtool))
 $(eval $(call AUTOTARGETS,package,libtool,host))
 
 # variables used by other packages
-LIBTOOL:=$(HOST_DIR)/usr/bin/libtool
-LIBTOOLIZE:=$(HOST_DIR)/usr/bin/libtoolize
+LIBTOOL = $(HOST_DIR)/usr/bin/libtool
+LIBTOOLIZE = $(HOST_DIR)/usr/bin/libtoolize
-- 
1.7.3
