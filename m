From: Richard Genoud <richard.genoud@gmail.com>
Date: Tue, 20 Jan 2015 11:16:02 +0100
Subject: [Buildroot] [PATCH] infozip: fix compilation with LARGE_FILE_SUPPORT
Message-ID: <1421748962-838-1-git-send-email-richard.genoud@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 package/infozip/infozip.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/infozip/infozip.mk b/package/infozip/infozip.mk
index 229299c52f11..d857df6dd3e9 100644
--- a/package/infozip/infozip.mk
+++ b/package/infozip/infozip.mk
@@ -14,9 +14,15 @@ ifeq ($(BR2_PACKAGE_BZIP2),y)
 INFOZIP_DEPENDENCIES += bzip2
 endif
 
+INFOZIP_CFLAGS = -I. -DUNIX
+
+ifeq ($(BR2_LARGEFILE),y)
+INFOZIP_CFLAGS += -DLARGE_FILE_SUPPORT
+endif
+
 define INFOZIP_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		CFLAGS="$(TARGET_CFLAGS) -I. -DUNIX" \
+		CFLAGS="$(TARGET_CFLAGS) $(INFOZIP_CFLAGS)" \
 		AS="$(TARGET_CC) -c" \
 		-f unix/Makefile generic
 endef
-- 
2.0.0
