From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 23 Jan 2015 00:44:28 +0100
Subject: [Buildroot] [PATCH 2/3] package/infozip: silent LFS warning
In-Reply-To: <1421970269-31287-1-git-send-email-romain.naour@openwide.fr>
References: <1421970269-31287-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1421970269-31287-2-git-send-email-romain.naour@openwide.fr>
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
 package/infozip/infozip.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/infozip/infozip.mk b/package/infozip/infozip.mk
index 229299c..d827d0d 100644
--- a/package/infozip/infozip.mk
+++ b/package/infozip/infozip.mk
@@ -14,9 +14,13 @@ ifeq ($(BR2_PACKAGE_BZIP2),y)
 INFOZIP_DEPENDENCIES += bzip2
 endif
 
+# infozip already defines _LARGEFILE_SOURCE and _LARGEFILE64_SOURCE when
+# necessary, redefining it on the command line causes some warnings.
+INFOZIP_CFLAGS = $(filter-out -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE,$(TARGET_CFLAGS))
+
 define INFOZIP_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		CFLAGS="$(TARGET_CFLAGS) -I. -DUNIX" \
+		CFLAGS="$(INFOZIP_CFLAGS) -I. -DUNIX" \
 		AS="$(TARGET_CC) -c" \
 		-f unix/Makefile generic
 endef
-- 
1.9.3
