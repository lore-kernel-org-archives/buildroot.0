From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  1 Mar 2014 18:23:02 +0100
Subject: [Buildroot] [lua V3 1/8] luajit: refactor without dont-strip.patch
In-Reply-To: <1393694590-29945-1-git-send-email-francois.perrad@gadz.org>
References: <1393694590-29945-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1393694590-29945-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the variable TARGET_STRIP does the job

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajit/luajit-03-dont-strip.patch |   23 -----------------------
 package/luajit/luajit.mk                  |    2 +-
 2 files changed, 1 insertion(+), 24 deletions(-)
 delete mode 100644 package/luajit/luajit-03-dont-strip.patch

diff --git a/package/luajit/luajit-03-dont-strip.patch b/package/luajit/luajit-03-dont-strip.patch
deleted file mode 100644
index 66bdadf..0000000
--- a/package/luajit/luajit-03-dont-strip.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Don't strip the library and binary
-
-This allows Buildroot to do it if needed, but only if needed.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/src/Makefile
-===================================================================
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -665,12 +665,10 @@
- $(LUAJIT_SO): $(LJVMCORE_O)
- 	$(E) "DYNLINK   $@"
- 	$(Q)$(TARGET_LD) $(TARGET_ASHLDFLAGS) -o $@ $(LJVMCORE_DYNO) $(TARGET_ALIBS)
--	$(Q)$(TARGET_STRIP) $@
- 
- $(LUAJIT_T): $(TARGET_O) $(LUAJIT_O) $(TARGET_DEP)
- 	$(E) "LINK      $@"
- 	$(Q)$(TARGET_LD) $(TARGET_ALDFLAGS) -o $@ $(LUAJIT_O) -lluajit -L. $(TARGET_ALIBS)
--	$(Q)$(TARGET_STRIP) $@
- 	$(E) "OK        Successfully built LuaJIT"
- 
- ##############################################################################
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 4122d0a..72720d8 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -37,7 +37,7 @@ define LUAJIT_BUILD_CMDS
 		DYNAMIC_CC="$(TARGET_CC) -fPIC" \
 		TARGET_LD="$(TARGET_CC)" \
 		TARGET_AR="$(TARGET_AR) rcus" \
-		TARGET_STRIP="$(TARGET_STRIP)" \
+		TARGET_STRIP=true \
 		TARGET_CFLAGS="$(TARGET_CFLAGS)" \
 		TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
 		HOST_CC="$(LUAJIT_HOST_CC)" \
-- 
1.7.9.5
