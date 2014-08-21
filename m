From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Aug 2014 15:25:50 +0200
Subject: [Buildroot] [git commit] package/xmlstarlet: fix static linking
Message-ID: <20140821132557.AAA779D4CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b840bc6345d417c628fabf2761e9c2988f10526d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The static linking with libxml2 and lib(e)xslt (--enable-static-libs)
need to be enabled when BR2_PREFER_STATIC_LIB is set.

Fixes:
http://autobuild.buildroot.net/results/0fd/0fd4a65ab98a4cf3fe893c29628608a71e96ecbc/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xmlstarlet/xmlstarlet.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
index 16f736e..7a8451f 100644
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -12,9 +12,15 @@ XMLSTARLET_LICENSE_FILES = COPYING
 XMLSTARLET_DEPENDENCIES += libxml2 libxslt \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
-XMLSTARLET_CONF_OPT += --disable-static-libs \
+XMLSTARLET_CONF_OPT += \
 	--with-libxml-prefix=${STAGING_DIR}/usr \
 	--with-libxslt-prefix=${STAGING_DIR}/usr \
 	--with-libiconv-prefix=${STAGING_DIR}/usr
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+XMLSTARLET_CONF_OPT += --enable-static-libs
+else
+XMLSTARLET_CONF_OPT += --disable-static-libs
+endif
+
 $(eval $(autotools-package))
