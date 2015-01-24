From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 24 Jan 2015 16:23:44 +0100
Subject: [Buildroot] [PATCH v2 5/6] package/infozip: silent LFS warning
In-Reply-To: <1422113025-24848-1-git-send-email-romain.naour@openwide.fr>
References: <1422113025-24848-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1422113025-24848-5-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

infozip already defines _LARGEFILE_SOURCE and _LARGEFILE64_SOURCE in
some sources files when LARGE_FILE_SUPPORT is set.
Remove them from CFLAGS.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/infozip/infozip.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/infozip/infozip.mk b/package/infozip/infozip.mk
index 3e8058f..e57f7e1 100644
--- a/package/infozip/infozip.mk
+++ b/package/infozip/infozip.mk
@@ -21,9 +21,14 @@ INFOZIP_CFLAGS = -I. -DUNIX
 # removed since it can't work for cross-compilation.
 INFOZIP_CFLAGS += -DUIDGID_NOT_16BIT
 
+# infozip already defines _LARGEFILE_SOURCE and _LARGEFILE64_SOURCE when
+# necessary, redefining it on the command line causes some warnings.
+INFOZIP_TARGET_CFLAGS = \
+	$(filter-out -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE,$(TARGET_CFLAGS))
+
 define INFOZIP_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		CFLAGS="$(TARGET_CFLAGS) $(INFOZIP_CFLAGS)" \
+		CFLAGS="$(INFOZIP_TARGET_CFLAGS) $(INFOZIP_CFLAGS)" \
 		AS="$(TARGET_CC) -c" \
 		-f unix/Makefile generic
 endef
-- 
1.9.3
