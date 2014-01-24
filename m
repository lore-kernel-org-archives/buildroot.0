From: =?UTF-8?q?Marcelo=20Guti=C3=A9rrez?= <kuyurix@gmail.com>
Date: Fri, 24 Jan 2014 22:36:36 +0000
Subject: [Buildroot] [PATCH 1/1] gtest: fix shared building
Message-ID: <1390602996-16836-1-git-send-email-kuyurix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When BR2_PREFER_STATIC_LIB is not selected there is no libgtest.a library.

fixes:
http://autobuild.buildroot.net/results/0d5/0d54439e7a722680f1988deb035a0236a18fb41c/build-end.log

Signed-off-by: Marcelo Guti?rrez <kuyurix@gmail.com>
---
 package/gtest/gtest.mk |   13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index e661d73..bf2fd0f 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -16,8 +16,19 @@ define GTEST_EXTRACT_CMDS
 	unzip $(DL_DIR)/$(GTEST_SOURCE) -d $(BUILD_DIR)
 endef
 
-define GTEST_INSTALL_STAGING_CMDS
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+define GTEST_INSTALL_STAGING_STATIC_LIB
 	$(INSTALL) -D -m 0755 $(@D)/libgtest.a $(STAGING_DIR)/usr/lib/libgtest.a
+endef
+else
+define GTEST_INSTALL_STAGING_SHARED_LIB
+	$(INSTALL) -D -m 0755 $(@D)/libgtest.so $(STAGING_DIR)/usr/lib/libgtest.so
+endef
+endif
+
+define GTEST_INSTALL_STAGING_CMDS
+	$(GTEST_INSTALL_STAGING_SHARED_LIB)
+	$(GTEST_INSTALL_STAGING_STATIC_LIB)
 	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/gtest/
 	cp -rp $(@D)/include/gtest/* $(STAGING_DIR)/usr/include/gtest/
 endef
-- 
1.7.10.4
