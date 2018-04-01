From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 08:47:18 +0200
Subject: [Buildroot] [git commit] toolchain/toolchain.mk: fix code style
Message-ID: <20180401064726.3C175818D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0837c0a149c53aa49eca6d9efc29b0214457d74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rearrange the header of the .mk file so it becomes similar to a header
from a package. It doesn't fit in one line, so split the details to a
comment below the header.

GCONV_LIBS is only used inside this file, so rename it to start with
TOOLCHAIN_, following the namespace convention already used by packages.

Rename the hook COPY_GCONV_LIBS to TOOLCHAIN_GLIBC_COPY_GCONV_LIBS
following the convention used for hooks in packages.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/toolchain.mk | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/toolchain/toolchain.mk b/toolchain/toolchain.mk
index 59fc905caf..e7451e2643 100644
--- a/toolchain/toolchain.mk
+++ b/toolchain/toolchain.mk
@@ -1,7 +1,11 @@
-# This file contains toolchain-related customisation of the content
-# of the target/ directory. Those customisations are added to the
-# TARGET_FINALIZE_HOOKS, to be applied just after all packages
-# have been built.
+################################################################################
+#
+# toolchain-related customisation of the content of the target/ directory
+#
+################################################################################
+
+# Those customisations are added to the TARGET_FINALIZE_HOOKS, to be applied
+# just after all packages have been built.
 
 # Install default nsswitch.conf file if the skeleton doesn't provide it
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
@@ -15,8 +19,8 @@ endif
 
 # Install the gconv modules
 ifeq ($(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY),y)
-GCONV_LIBS = $(call qstrip,$(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_LIST))
-define COPY_GCONV_LIBS
+TOOLCHAIN_GLIBC_GCONV_LIBS = $(call qstrip,$(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_LIST))
+define TOOLCHAIN_GLIBC_COPY_GCONV_LIBS
 	$(Q)found_gconv=no; \
 	for d in $(TOOLCHAIN_EXTERNAL_PREFIX) ''; do \
 		[ -d "$(STAGING_DIR)/usr/lib/$${d}/gconv" ] || continue; \
@@ -27,14 +31,14 @@ define COPY_GCONV_LIBS
 		printf "Unable to find gconv modules\n" >&2; \
 		exit 1; \
 	fi; \
-	if [ -z "$(GCONV_LIBS)" ]; then \
+	if [ -z "$(TOOLCHAIN_GLIBC_GCONV_LIBS)" ]; then \
 		$(INSTALL) -m 0644 -D $(STAGING_DIR)/usr/lib/$${d}/gconv/gconv-modules \
 				      $(TARGET_DIR)/usr/lib/gconv/gconv-modules && \
 		$(INSTALL) -m 0644 $(STAGING_DIR)/usr/lib/$${d}/gconv/*.so \
 				   $(TARGET_DIR)/usr/lib/gconv \
 		|| exit 1; \
 	else \
-		for l in $(GCONV_LIBS); do \
+		for l in $(TOOLCHAIN_GLIBC_GCONV_LIBS); do \
 			$(INSTALL) -m 0644 -D $(STAGING_DIR)/usr/lib/$${d}/gconv/$${l}.so \
 					      $(TARGET_DIR)/usr/lib/gconv/$${l}.so \
 			|| exit 1; \
@@ -47,10 +51,10 @@ define COPY_GCONV_LIBS
 				 || exit 1; \
 			done; \
 		done; \
-		./support/scripts/expunge-gconv-modules "$(GCONV_LIBS)" \
+		./support/scripts/expunge-gconv-modules "$(TOOLCHAIN_GLIBC_GCONV_LIBS)" \
 			<$(STAGING_DIR)/usr/lib/$${d}/gconv/gconv-modules \
 			>$(TARGET_DIR)/usr/lib/gconv/gconv-modules; \
 	fi
 endef
-TOOLCHAIN_TARGET_FINALIZE_HOOKS += COPY_GCONV_LIBS
+TOOLCHAIN_TARGET_FINALIZE_HOOKS += TOOLCHAIN_GLIBC_COPY_GCONV_LIBS
 endif
