From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:02 +0200
Subject: [Buildroot] [PATCH 16/74] shared-mime-info: convert old-style hook
	to new-style hook
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b4cb198b9710531e0a4ccf5d3f835427daeecaad.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We don't want to use 'make DESTDIR=$(TARGET_DIR) install' as we only
want the MIME database to be installed on the target. So we simply
override the target installation command.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/shared-mime-info/shared-mime-info.mk |   13 ++++++-------
 1 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index 487d4b2..6abfa75 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -8,7 +8,7 @@ SHARED_MIME_INFO_SOURCE = shared-mime-info-$(SHARED_MIME_INFO_VERSION).tar.bz2
 SHARED_MIME_INFO_SITE = http://freedesktop.org/~hadess
 
 SHARED_MIME_INFO_INSTALL_STAGING = YES
-SHARED_MIME_INFO_INSTALL_TARGET = NO
+SHARED_MIME_INFO_INSTALL_TARGET = YES
 
 SHARED_MIME_INFO_AUTORECONF = NO
 SHARED_MIME_INFO_CONF_ENV = XMLLINT=$(HOST_DIR)/usr/bin/xmllint
@@ -21,14 +21,13 @@ HOST_SHARED_MIME_INFO_DEPENDENCIES = host-pkg-config host-intltool
 HOST_SHARED_MIME_INFO_CONF_OPT = \
 	--disable-update-mimedb
 
+define SHARED_MIME_INFO_INSTALL_TARGET_CMDS
+	$(HOST_MAKE_ENV) $(SHARED_MIME_INFO_HOST_BINARY) $(STAGING_DIR)/usr/share/mime
+	$(INSTALL) -D $(STAGING_DIR)/usr/share/mime/mime.cache $(TARGET_DIR)/usr/share/mime/mime.cache
+endef
+
 $(eval $(call AUTOTARGETS,package,shared-mime-info))
 $(eval $(call AUTOTARGETS,package,shared-mime-info,host))
 
 # shared-mime-info for the host
 SHARED_MIME_INFO_HOST_BINARY:=$(HOST_DIR)/usr/bin/update-mime-database
-
-# update the shared-mime-info database in the target
-$(SHARED_MIME_INFO_HOOK_POST_INSTALL):
-	$(HOST_MAKE_ENV) $(SHARED_MIME_INFO_HOST_BINARY) $(STAGING_DIR)/usr/share/mime
-	$(INSTALL) -D $(STAGING_DIR)/usr/share/mime/mime.cache $(TARGET_DIR)/usr/share/mime/mime.cache
-	touch $@
-- 
1.7.0.4
