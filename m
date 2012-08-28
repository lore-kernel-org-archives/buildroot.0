From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 27 Aug 2012 21:58:06 -0400
Subject: [Buildroot] [PATCH] cjson: bug fix - use -fPIC instead of -fpic
Message-ID: <1346119086-3465-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change is to fix the autobuild failure at:
http://autobuild.buildroot.net/results/45e2c08d5e3c868b2d7fdf26a7c5f88de5ff8f61/build-end.log
I can't actually reproduce this bug, because my machine cannot
run the 64-bit microblaze toolchain.  However, the log makes
it clear that -fPIC is needed, and grepping for fPIC and fpic
under packages makes it clear that cjson should have used -fPIC
anyway.  So even if the bug isn't fixed, it must surely be improved.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/cjson/cjson.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 6f26bb8..a2de8ab 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -14,7 +14,7 @@ define CJSON_EXTRACT_CMDS
 endef
 
 define CJSON_BUILD_CMDS
-	cd $(@D)/cJSON && $(TARGET_CC) $(TARGET_CFLAGS) -shared -fpic cJSON.c -o libcJSON.so
+	cd $(@D)/cJSON && $(TARGET_CC) $(TARGET_CFLAGS) -shared -fPIC cJSON.c -o libcJSON.so
 endef
 
 define CJSON_INSTALL_STAGING_CMDS
-- 
1.7.9.5
