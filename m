From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 30 Mar 2018 23:22:39 -0300
Subject: [Buildroot] [PATCH 14/36] toolchain/toolchain.mk: fix code style
In-Reply-To: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
References: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
Message-ID: <20180331022301.27501-15-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rearrange the header of the .mk file so it to be similar to a header
from a package. It doesn't fit in one line, so split the details to a
comment below the header.

GCONV_LIBS is only used inside this file, so rename it to start with
TOOLCHAIN_, following the namespace convention already used by packages.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/toolchain.mk | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/toolchain/toolchain.mk b/toolchain/toolchain.mk
index 59fc905caf..6b2c93ced0 100644
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
@@ -15,7 +19,7 @@ endif
 
 # Install the gconv modules
 ifeq ($(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY),y)
-GCONV_LIBS = $(call qstrip,$(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_LIST))
+TOOLCHAIN_GLIBC_GCONV_LIBS = $(call qstrip,$(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_LIST))
 define COPY_GCONV_LIBS
 	$(Q)found_gconv=no; \
 	for d in $(TOOLCHAIN_EXTERNAL_PREFIX) ''; do \
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
@@ -47,7 +51,7 @@ define COPY_GCONV_LIBS
 				 || exit 1; \
 			done; \
 		done; \
-		./support/scripts/expunge-gconv-modules "$(GCONV_LIBS)" \
+		./support/scripts/expunge-gconv-modules "$(TOOLCHAIN_GLIBC_GCONV_LIBS)" \
 			<$(STAGING_DIR)/usr/lib/$${d}/gconv/gconv-modules \
 			>$(TARGET_DIR)/usr/lib/gconv/gconv-modules; \
 	fi
-- 
2.14.1
