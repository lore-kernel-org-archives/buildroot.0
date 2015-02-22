From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Feb 2015 23:23:04 +0100
Subject: [Buildroot] [PATCHv2] toolchain: fix installing gconv libs with
	multi-arch toolchain
Message-ID: <1424643784-23210-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For a multi-arch toolchain, gconv modules are in a sub-directory named
after the machine gcc targets. This is the case, for example, for the
Linaro ARM 2014.09 toolchain, which has the gconv modules in (relative
to the sysroot):
    /usr/lib/arm-linux-gnueabihf/gconv

while the Sourcery CodeBench ARM 2014.05 (non-multi-arch) has them in:
    /usr/lib/gconv

So, to catter for both cases, search both paths. We want to favour the
machine-specific gconv modules over potentially existing "generic" ones,
so we first search that (if it exists) and fallback to looking in the
generic location.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes v1 -> v2:
  - also handle the case where the gconv modules list is specified

---
Notes: I'm not too happy about the use of "gcc -dumpmachine", but
that's the only solution I found that worked on my use-case. I tried
duplicating the ARCH_SUBDIR trick from toolchain-external, but that
did not work...
---
 toolchain/toolchain.mk | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/toolchain/toolchain.mk b/toolchain/toolchain.mk
index 3f9900b..51294c3 100644
--- a/toolchain/toolchain.mk
+++ b/toolchain/toolchain.mk
@@ -17,28 +17,39 @@ endif
 ifeq ($(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY),y)
 GCONV_LIBS = $(call qstrip,$(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_LIST))
 define COPY_GCONV_LIBS
-	$(Q)if [ -z "$(GCONV_LIBS)" ]; then \
-		$(INSTALL) -m 0644 -D $(STAGING_DIR)/usr/lib/gconv/gconv-modules \
-				      $(TARGET_DIR)/usr/lib/gconv/gconv-modules; \
-		$(INSTALL) -m 0644 $(STAGING_DIR)/usr/lib/gconv/*.so \
+	$(Q)machine=$$($(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS) -dumpmachine); \
+	found_gconv=no; \
+	for d in $${machine} ''; do \
+		[ -d "$(STAGING_DIR)/usr/lib/$${d}/gconv" ] || continue; \
+		found_gconv=yes; \
+		break; \
+	done; \
+	if [ "$${found_gconv}" = "no" ]; then \
+		printf "Unable to find gconv modules\n" >&2; \
+		exit 1; \
+	fi; \
+	if [ -z "$(GCONV_LIBS)" ]; then \
+		$(INSTALL) -m 0644 -D $(STAGING_DIR)/usr/lib/$${d}/gconv/gconv-modules \
+				      $(TARGET_DIR)/usr/lib/gconv/gconv-modules && \
+		$(INSTALL) -m 0644 $(STAGING_DIR)/usr/lib/$${d}/gconv/*.so \
 				   $(TARGET_DIR)/usr/lib/gconv \
 		|| exit 1; \
 	else \
 		for l in $(GCONV_LIBS); do \
-			$(INSTALL) -m 0644 -D $(STAGING_DIR)/usr/lib/gconv/$${l}.so \
+			$(INSTALL) -m 0644 -D $(STAGING_DIR)/usr/lib/$${d}/gconv/$${l}.so \
 					      $(TARGET_DIR)/usr/lib/gconv/$${l}.so \
 			|| exit 1; \
-			$(TARGET_READELF) -d $(STAGING_DIR)/usr/lib/gconv/$${l}.so |\
+			$(TARGET_READELF) -d $(STAGING_DIR)/usr/lib/$${d}/gconv/$${l}.so |\
 			sort -u |\
 			sed -e '/.*(NEEDED).*\[\(.*\.so\)\]$$/!d; s//\1/;' |\
 			while read lib; do \
-				 $(INSTALL) -m 0644 -D $(STAGING_DIR)/usr/lib/gconv/$${lib} \
+				 $(INSTALL) -m 0644 -D $(STAGING_DIR)/usr/lib/$${d}/gconv/$${lib} \
 						       $(TARGET_DIR)/usr/lib/gconv/$${lib} \
 				 || exit 1; \
 			done; \
 		done; \
 		./support/scripts/expunge-gconv-modules "$(GCONV_LIBS)" \
-			<$(STAGING_DIR)/usr/lib/gconv/gconv-modules \
+			<$(STAGING_DIR)/usr/lib/$${d}/gconv/gconv-modules \
 			>$(TARGET_DIR)/usr/lib/gconv/gconv-modules; \
 	fi
 endef
-- 
1.9.1
