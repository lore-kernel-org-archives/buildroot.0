From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 30 Apr 2014 12:06:51 +0200
Subject: [Buildroot] [PATCH 1/1] libwebsockets : bump version to v1.23
Message-ID: <1398852411-17462-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bump to v1.23-chrome32-firefox24
The latest releases use the cmake build infrastructure.
Converted the makefile to the cmake infrastructure.

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/libwebsockets/libwebsockets.mk | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index ec5244c..1d76bc9 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,14 +4,18 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = v1.22-chrome26-firefox18
+LIBWEBSOCKETS_VERSION = v1.23-chrome32-firefox24
 LIBWEBSOCKETS_SOURCE = libwebsockets-$(LIBWEBSOCKETS_VERSION).tar.xz
 LIBWEBSOCKETS_SITE = http://git.libwebsockets.org/cgi-bin/cgit/libwebsockets/snapshot
 LIBWEBSOCKETS_LICENSE = LGPLv2.1
 LIBWEBSOCKETS_LICENSE_FILES = COPYING
 LIBWEBSOCKETS_DEPENDENCIES = zlib
-LIBWEBSOCKETS_AUTORECONF = YES
-LIBWEBSOCKETS_CONF_OPT = --without-testapps
 LIBWEBSOCKETS_INSTALL_STAGING = YES
 
-$(eval $(autotools-package))
+LIBWEBSOCKETS_CONF_OPT += -DWITHOUT_TESTAPPS=ON
+
+ifeq ($(BR2_PACKAGE_OPENSSL),)
+	LIBWEBSOCKETS_CONF_OPT += -DWITH_SSL=OFF
+endif
+
+$(eval $(cmake-package))
-- 
1.9.2
