From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:06 +0200
Subject: [Buildroot] [PATCH 20/74] libcurl: convert old-style hook to
	new-style
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <fa6c7989acb94e4df7ab42cec252d946e8fb0c43.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcurl/libcurl.mk |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 488df04..782bfb3 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -23,12 +23,14 @@ else
 LIBCURL_CONF_OPT += --without-ssl
 endif
 
-$(eval $(call AUTOTARGETS,package,libcurl))
-
-$(LIBCURL_HOOK_POST_INSTALL):
+define LIBCURL_TARGET_CLEANUP
 	rm -rf $(TARGET_DIR)/usr/bin/curl-config \
 	       $(if $(BR2_PACKAGE_CURL),,$(TARGET_DIR)/usr/bin/curl)
-	touch $@
+endef
+
+LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_TARGET_CLEANUP
+
+$(eval $(call AUTOTARGETS,package,libcurl))
 
 curl: libcurl
 curl-clean: libcurl-clean
-- 
1.7.0.4
