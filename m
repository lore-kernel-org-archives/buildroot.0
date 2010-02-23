From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2010 21:06:55 +0100
Subject: [Buildroot] [PATCH 31/40] shared-mime-info: do not depend on phony
	target in hook
In-Reply-To: <cover.1266955555.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266955555.git.thomas.petazzoni@free-electrons.com>
Message-ID: <520dd9fbe5896175285a494aeeabe221bce9db62.1266955555.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Real targets should not depend on phony targets, otherwise they get
rebuilt everytime.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/shared-mime-info/shared-mime-info.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index 80b0ccc..fe14142 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -12,7 +12,7 @@ SHARED_MIME_INFO_INSTALL_TARGET = NO
 
 SHARED_MIME_INFO_AUTORECONF = NO
 SHARED_MIME_INFO_CONF_ENV = XMLLINT=$(HOST_DIR)/usr/bin/xmllint
-SHARED_MIME_INFO_DEPENDENCIES = host-pkg-config host-libglib2 host-libxml2 libxml2 libglib2
+SHARED_MIME_INFO_DEPENDENCIES = host-pkg-config host-libglib2 host-libxml2 host-shared-mime-info libxml2 libglib2
 
 SHARED_MIME_INFO_CONF_OPT = --disable-update-mimedb
 
@@ -28,7 +28,7 @@ $(eval $(call AUTOTARGETS,package,shared-mime-info,host))
 SHARED_MIME_INFO_HOST_BINARY:=$(HOST_DIR)/usr/bin/update-mime-database
 
 # update the shared-mime-info database in the target
-$(SHARED_MIME_INFO_HOOK_POST_INSTALL): host-shared-mime-info
+$(SHARED_MIME_INFO_HOOK_POST_INSTALL):
 	$(HOST_MAKE_ENV) $(SHARED_MIME_INFO_HOST_BINARY) $(STAGING_DIR)/usr/share/mime
 	$(INSTALL) -D $(STAGING_DIR)/usr/share/mime/mime.cache $(TARGET_DIR)/usr/share/mime/mime.cache
 	touch $@
-- 
1.6.3.3
