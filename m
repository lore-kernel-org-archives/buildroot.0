From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Thu, 18 Jul 2013 23:47:50 +0200
Subject: [Buildroot] [PATCH v2 1/3] uclibc,
	eglibc: remove REALLY_NOSTDLIB references
In-Reply-To: <1374184072-6531-1-git-send-email-mjonker@synopsys.com>
References: <1374184072-6531-1-git-send-email-mjonker@synopsys.com>
Message-ID: <1374184072-6531-2-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These were required with ARC gcc 4.4.7; ARC gcc 4.8 has been changed
to behave the same as other architectures with -nostdlib, making this
option obsolete.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 package/eglibc/eglibc.mk |    2 +-
 package/uclibc/uclibc.mk |   11 ++---------
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/package/eglibc/eglibc.mk b/package/eglibc/eglibc.mk
index ccdc210..5431ac5 100644
--- a/package/eglibc/eglibc.mk
+++ b/package/eglibc/eglibc.mk
@@ -61,7 +61,7 @@ define EGLIBC_CONFIGURE_CMDS
 	cp $(@D)/build/csu/crt1.o $(STAGING_DIR)/usr/lib/
 	cp $(@D)/build/csu/crti.o $(STAGING_DIR)/usr/lib/
 	cp $(@D)/build/csu/crtn.o $(STAGING_DIR)/usr/lib/
-	$(TARGET_CROSS)gcc -nostdlib $(REALLY_NOSTDLIB) \
+	$(TARGET_CROSS)gcc -nostdlib \
 		-nostartfiles -shared -x c /dev/null -o $(STAGING_DIR)/usr/lib/libc.so
 endef
 
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index f775b15..d5ea7a4 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -163,13 +163,6 @@ endef
 endif
 
 #
-# ARC definitions
-#
-ifeq ($(UCLIBC_TARGET_ARCH),arc)
-REALLY_NOSTDLIB = -really-nostdlib
-endif
-
-#
 # Endianess
 #
 
@@ -407,9 +400,9 @@ define UCLIBC_CONFIGURE_CMDS
 		RUNTIME_PREFIX=$(STAGING_DIR) \
 		headers lib/crt1.o lib/crti.o lib/crtn.o \
 		install_headers
-	$(TARGET_CROSS)gcc -nostdlib $(REALLY_NOSTDLIB) \
+	$(TARGET_CROSS)gcc -nostdlib \
 		-nostartfiles -shared -x c /dev/null -o $(STAGING_DIR)/usr/lib/libc.so
-	$(TARGET_CROSS)gcc -nostdlib $(REALLY_NOSTDLIB) \
+	$(TARGET_CROSS)gcc -nostdlib \
 		-nostartfiles -shared -x c /dev/null -o $(STAGING_DIR)/usr/lib/libm.so
 	cp -pLR $(UCLIBC_DIR)/lib/crt[1in].o $(STAGING_DIR)/usr/lib/
 endef
-- 
1.7.9.5
