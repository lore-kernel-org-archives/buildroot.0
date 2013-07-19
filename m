From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 19 Jul 2013 11:54:28 +0200
Subject: [Buildroot] [git commit] uclibc,
	eglibc: remove REALLY_NOSTDLIB references
Message-ID: <20130719103550.4AEF999A4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cdba648ec750ef49fffe31fe3de06b28ba39e130
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These were required with ARC gcc 4.4.7; ARC gcc 4.8 has been changed
to behave the same as other architectures with -nostdlib, making this
option obsolete.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
