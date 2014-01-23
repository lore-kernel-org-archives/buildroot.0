From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 23 Jan 2014 09:28:31 +0100
Subject: [Buildroot] [PATCH 2/4] luajit: refactor without shared-lib.patch
In-Reply-To: <1390465713-12600-1-git-send-email-francois.perrad@gadz.org>
References: <1390465713-12600-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1390465713-12600-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the variable BUILDMODE does the job

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajit/luajit-02-shared-lib.patch |   17 -----------------
 package/luajit/luajit.mk                  |    1 +
 2 files changed, 1 insertion(+), 17 deletions(-)
 delete mode 100644 package/luajit/luajit-02-shared-lib.patch

diff --git a/package/luajit/luajit-02-shared-lib.patch b/package/luajit/luajit-02-shared-lib.patch
deleted file mode 100644
index 361e5c2..0000000
--- a/package/luajit/luajit-02-shared-lib.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Compile the luajit binary dynamically against the luajit library
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/src/Makefile
-===================================================================
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -669,7 +669,7 @@
- 
- $(LUAJIT_T): $(TARGET_O) $(LUAJIT_O) $(TARGET_DEP)
- 	$(E) "LINK      $@"
--	$(Q)$(TARGET_LD) $(TARGET_ALDFLAGS) -o $@ $(LUAJIT_O) $(TARGET_O) $(TARGET_ALIBS)
-+	$(Q)$(TARGET_LD) $(TARGET_ALDFLAGS) -o $@ $(LUAJIT_O) -lluajit -L. $(TARGET_ALIBS)
- 	$(Q)$(TARGET_STRIP) $@
- 	$(E) "OK        Successfully built LuaJIT"
- 
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 186b3fd..01fbb78 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -44,6 +44,7 @@ define LUAJIT_BUILD_CMDS
 		HOST_CFLAGS="$(HOST_CFLAGS)" \
 		HOST_LDFLAGS="$(HOST_LDFLAGS)" \
 		$(LUAJIT_NO_LARGEFILE) \
+		BUILDMODE=dynamic \
 		-C $(@D) amalg
 endef
 
-- 
1.7.9.5
