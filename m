From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Oct 2013 00:21:25 +0200
Subject: [Buildroot] [git commit] freetype: bump to version 2.5.0.1
Message-ID: <20131026082234.436B09BBC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8cefffd4ea2810474d91283d7430b21cf7273e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freetype/freetype.mk |   14 ++++++++++++--
 1 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 177adf5..1ca779e 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,9 +4,11 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.4.12
+FREETYPE_VERSION_MAJOR = 2.5.0
+FREETYPE_VERSION_MINOR = 1
+FREETYPE_VERSION = $(FREETYPE_VERSION_MAJOR).$(FREETYPE_VERSION_MINOR)
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
-FREETYPE_SITE = http://downloads.sourceforge.net/project/freetype/freetype2/$(FREETYPE_VERSION)
+FREETYPE_SITE = http://downloads.sourceforge.net/project/freetype/freetype2/$(FREETYPE_VERSION_MAJOR)
 FREETYPE_INSTALL_STAGING = YES
 FREETYPE_MAKE_OPT = CCexe="$(HOSTCC)"
 FREETYPE_LICENSE = Dual FTL/GPLv2+
@@ -18,6 +20,14 @@ FREETYPE_CONFIG_SCRIPTS = freetype-config
 
 HOST_FREETYPE_DEPENDENCIES = host-pkgconf
 
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+FREETYPE_DEPENDENCIES += libpng
+FREETYPE_CONF_OPT += LIBPNG_CFLAGS="`$(STAGING_DIR)/usr/bin/libpng-config --cflags`" \
+	LIBPNG_LDFLAGS="`$(STAGING_DIR)/usr/bin/libpng-config --ldflags`"
+else
+FREETYPE_CONF_OPT += --without-png
+endif
+
 # Extra fixing since includedir and libdir are expanded from configure values
 define FREETYPE_FIX_CONFIG_FILE
 	$(SED) 's:^includedir=.*:includedir="$${prefix}/include":' \
