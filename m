From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Mar 2016 19:11:06 -0300
Subject: [Buildroot] [PATCH] shared-mime-info: attempt to fix parallel build
	issues
Message-ID: <1457993466-15145-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to https://bugs.freedesktop.org/show_bug.cgi?id=46093 the
problem lies with 'make check' which is enabled by default.
But we don't care about running the check target, so disable it.
It will hopefully finally fix, for target:
http://autobuild.buildroot.net/results/03f/03fcc8aff675eb035e123eb2b01e4ed122c66cbc/
For host:
http://autobuild.buildroot.net/results/6c1/6c1fd50913ef8a3a5cc108f428f2c195c768324d/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/shared-mime-info/shared-mime-info.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index b3e4470..a70bc9a 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -10,15 +10,18 @@ SHARED_MIME_INFO_SITE = http://freedesktop.org/~hadess
 SHARED_MIME_INFO_INSTALL_STAGING = YES
 SHARED_MIME_INFO_CONF_ENV = XMLLINT=$(HOST_DIR)/usr/bin/xmllint
 SHARED_MIME_INFO_DEPENDENCIES = host-shared-mime-info libxml2 libglib2
-SHARED_MIME_INFO_CONF_OPTS = --disable-update-mimedb
+SHARED_MIME_INFO_CONF_OPTS = \
+	--disable-update-mimedb \
+	--disable-default-make-check
+HOST_SHARED_MIME_INFO_CONF_OPTS = \
+	--disable-update-mimedb \
+	--disable-default-make-check
 SHARED_MIME_INFO_LICENSE = GPLv2
 SHARED_MIME_INFO_LICENSE_FILES = COPYING
 
 HOST_SHARED_MIME_INFO_DEPENDENCIES = \
 	host-pkgconf host-intltool host-libxml2 host-libglib2
 
-HOST_SHARED_MIME_INFO_CONF_OPTS = --disable-update-mimedb
-
 define SHARED_MIME_INFO_INSTALL_TARGET_CMDS
 	$(HOST_MAKE_ENV) $(SHARED_MIME_INFO_HOST_BINARY) $(STAGING_DIR)/usr/share/mime
 	$(INSTALL) -D $(STAGING_DIR)/usr/share/mime/mime.cache $(TARGET_DIR)/usr/share/mime/mime.cache
-- 
2.4.10
