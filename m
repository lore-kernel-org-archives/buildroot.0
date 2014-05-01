From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 May 2014 22:46:10 +0200
Subject: [Buildroot] [git commit] libwebsockets : bump version
Message-ID: <20140501204656.645FF9CAA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7d25239cea5bb0a198442fd1a16ca3f5f107fb38
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bump to v1.23-chrome32-firefox24
The latest releases use the cmake build infrastructure.
Converted the makefile to the cmake infrastructure.
The autotools infrastructure is no longer supported.

[Peter: correct license data, ensure it gets built after openssl if enabled]
Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libwebsockets/libwebsockets.mk |   18 ++++++++++++------
 1 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index ec5244c..03c5720 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,14 +4,20 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = v1.22-chrome26-firefox18
+LIBWEBSOCKETS_VERSION = v1.23-chrome32-firefox24
 LIBWEBSOCKETS_SOURCE = libwebsockets-$(LIBWEBSOCKETS_VERSION).tar.xz
 LIBWEBSOCKETS_SITE = http://git.libwebsockets.org/cgi-bin/cgit/libwebsockets/snapshot
-LIBWEBSOCKETS_LICENSE = LGPLv2.1
-LIBWEBSOCKETS_LICENSE_FILES = COPYING
+LIBWEBSOCKETS_LICENSE = LGPLv2.1 with exceptions
+LIBWEBSOCKETS_LICENSE_FILES = LICENSE
 LIBWEBSOCKETS_DEPENDENCIES = zlib
-LIBWEBSOCKETS_AUTORECONF = YES
-LIBWEBSOCKETS_CONF_OPT = --without-testapps
 LIBWEBSOCKETS_INSTALL_STAGING = YES
 
-$(eval $(autotools-package))
+LIBWEBSOCKETS_CONF_OPT += -DWITHOUT_TESTAPPS=ON
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBWEBSOCKETS_DEPENDENCIES += openssl
+else
+LIBWEBSOCKETS_CONF_OPT += -DWITH_SSL=OFF
+endif
+
+$(eval $(cmake-package))
