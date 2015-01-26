From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 26 Jan 2015 11:17:38 -0300
Subject: [Buildroot] [PATCH 1/2] benejson: fix for non-wchar toolchains
Message-ID: <1422281859-4003-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wchar needs to be disabled in order for it to build on !wchar. Fixes:
http://autobuild.buildroot.net/results/71f/71f19d5056b56d40463b9fef7fa859e0025c4991/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/benejson/benejson.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/benejson/benejson.mk b/package/benejson/benejson.mk
index 75753d2..2b8d09d 100644
--- a/package/benejson/benejson.mk
+++ b/package/benejson/benejson.mk
@@ -9,9 +9,17 @@ BENEJSON_SITE = $(call github,codehero,benejson,$(BENEJSON_VERSION))
 BENEJSON_LICENSE = MIT
 BENEJSON_LICENSE_FILES = LICENSE
 BENEJSON_INSTALL_STAGING = YES
-
 BENEJSON_DEPENDENCIES = host-scons
 
+# wchar support needs to be manually disabled
+ifeq ($(BR2_USE_WCHAR),)
+define BENEJSON_DISABLE_WCHAR
+	$(SED) 's,^#define BNJ_WCHAR_SUPPORT,#undef BNJ_WCHAR_SUPPORT,' \
+		$(@D)/benejson/benejson.h
+endef
+BENEJSON_POST_PATCH_HOOKS += BENEJSON_DISABLE_WCHAR
+endif
+
 define BENEJSON_BUILD_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS) CROSS=$(TARGET_CROSS) \
-- 
2.0.5
