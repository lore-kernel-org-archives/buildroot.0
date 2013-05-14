From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 14 May 2013 12:37:26 +0200
Subject: [Buildroot] [git commit] sconeserver: fix autobuild failures
Message-ID: <20130514111154.AA8599A1C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d34e073c00236ff41a6df8f0fdd6b0b25dc4ad1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix sconeserver autobuild failures such as the following.

  http://autobuild.buildroot.net/results/58e/58e4886a6ff41e49ac86cbf497bb509fd37f0d68/

The sconeserver version is bumped to a recent revision in which it is
possible to pass the paths to Magick++-config, mysql_config and xml2-config to
the configure script.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sconeserver/sconeserver.mk |   23 +++++++++++------------
 1 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index ab3d1fc..744f389 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -3,25 +3,23 @@
 # sconeserver
 #
 #############################################################
+
 # Release 0.6.0 doesn't build cleanly, so use a recent
 # Subversion trunk snapshot.
-SCONESERVER_VERSION = 183
-SCONESERVER_SITE = \
-	https://sconeserver.svn.sourceforge.net/svnroot/sconeserver/trunk
+SCONESERVER_VERSION = 211
+SCONESERVER_SITE = svn://svn.code.sf.net/p/sconeserver/code/trunk
 SCONESERVER_SITE_METHOD = svn
-
 SCONESERVER_LICENSE = GPLv2+
 SCONESERVER_LICENSE_FILES = COPYING
 
+SCONESERVER_AUTORECONF = YES
 SCONESERVER_DEPENDENCIES += pcre
 SCONESERVER_CONF_OPT += --with-ip --with-local
 
-SCONESERVER_CONF_OPT += CXXFLAGS="$(TARGET_CXXFLAGS) $(SCONESERVER_CXXFLAGS)"
-SCONESERVER_CONF_OPT += LDFLAGS="$(TARGET_LDFLAGS) $(SCONESERVER_LDFLAGS)"
-
 # Sconeserver configure script fails to find the libxml2 headers.
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
-	SCONESERVER_CXXFLAGS += -I$(STAGING_DIR)/usr/include/libxml2
+	SCONESERVER_CONF_OPT += \
+		--with-xml2-config="$(STAGING_DIR)/usr/bin/xml2-config"
 endif
 
 ifeq ($(BR2_INET_IPV6),y)
@@ -52,16 +50,17 @@ endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE),y)
 	SCONESERVER_DEPENDENCIES += imagemagick host-pkgconf
-	SCONESERVER_CONF_OPT += --with-sconesite-image
+	SCONESERVER_CONF_OPT += \
+		--with-sconesite-image \
+		--with-Magick++-config="$(STAGING_DIR)/usr/bin/Magick++-config"
 else
 	SCONESERVER_CONF_OPT += --without-sconesite-image
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_MYSQL),y)
 	SCONESERVER_DEPENDENCIES += mysql_client
-	SCONESERVER_CONF_OPT += --with-mysql
-	SCONESERVER_CXXFLAGS += -I$(STAGING_DIR)/usr/include/mysql
-	SCONESERVER_LDFLAGS += -L$(STAGING_DIR)/usr/lib/mysql
+	SCONESERVER_CONF_OPT += --with-mysql \
+		--with-mysql_config="$(STAGING_DIR)/usr/bin/mysql_config"
 else
 	SCONESERVER_CONF_OPT += --without-mysql
 endif
