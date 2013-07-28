From: Axel Lin <axel.lin@ingics.com>
Date: Mon, 29 Jul 2013 00:48:37 +0800
Subject: [Buildroot] [PATCH] uclibc/arm: don't install ldd.host and
 ldconfig.host if !HAVE_SHARED
Message-ID: <1375030117.13990.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ldd.host and ldconfig.host will be built only when HAVE_SHARED=y.

This fixes below build error when
 # BR2_BFIN_FLAT is not set
 # ARCH_HAS_MMU is not set
 UCLIBC_FORMAT_FLAT=y

make[1]: Leaving directory `/opt/test/buildroot/buildroot/output/build/uclibc-0.9.33.2'
/usr/bin/install -D -m 0755 /opt/test/buildroot/buildroot/output/build/uclibc-0.9.33.2/utils/ldd.host /opt/test/buildroot/buildroot/output/host/usr/bin/ldd
/usr/bin/install: cannot stat '/opt/test/buildroot/buildroot/output/build/uclibc-0.9.33.2/utils/ldd.host': No such file or directory
make: *** [/opt/test/buildroot/buildroot/output/build/uclibc-0.9.33.2/.stamp_staging_installed] Error 1

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/uclibc/uclibc.mk | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 644c531..1fe1a40 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -514,10 +514,12 @@ endef
 # For FLAT binfmts (static) there are no host utils
 ifeq ($(BR2_BINFMT_FLAT),)
 define UCLIBC_INSTALL_UTILS_STAGING
-	$(INSTALL) -D -m 0755 $(@D)/utils/ldd.host $(HOST_DIR)/usr/bin/ldd
-	ln -sf ldd $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldd
-	$(INSTALL) -D -m 0755 $(@D)/utils/ldconfig.host $(HOST_DIR)/usr/bin/ldconfig
-	ln -sf ldconfig $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldconfig
+	if grep -q HAVE_SHARED=y $(@D)/.config; then \
+		$(INSTALL) -D -m 0755 $(@D)/utils/ldd.host $(HOST_DIR)/usr/bin/ldd; \
+		ln -sf ldd $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldd; \
+		$(INSTALL) -D -m 0755 $(@D)/utils/ldconfig.host $(HOST_DIR)/usr/bin/ldconfig; \
+		ln -sf ldconfig $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldconfig; \
+	fi
 endef
 endif
 
-- 
1.8.1.2
