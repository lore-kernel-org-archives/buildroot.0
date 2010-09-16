From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] libcurl: convert old-style hook
	to new-style
Message-ID: <20100916113825.40BC28AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fa6c7989acb94e4df7ab42cec252d946e8fb0c43
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
1.7.1
