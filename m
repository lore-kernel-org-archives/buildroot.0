From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Date: Fri,  6 Sep 2019 13:18:49 +0300
Subject: [Buildroot] [PATCH] pppd: use uclibc libcrypt instead of openssl
Message-ID: <20190906101849.4621-1-alexander.i.mukhin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If building with uclibc, fall back to using its cryptographic routines
instead of openssl. This removes unnecessary dependence.

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
---
 package/pppd/Config.in |  2 +-
 package/pppd/pppd.mk   | 10 +++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/pppd/Config.in b/package/pppd/Config.in
index bf05689f53..7db5674bf1 100644
--- a/package/pppd/Config.in
+++ b/package/pppd/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_PPPD
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_TOOLCHAIN_USES_MUSL # Use __P() macro all over the tree
 	depends on BR2_USE_MMU
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  An implementation of the Point-to-point protocol.
 
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 4dffc17941..be6c443eec 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -12,10 +12,14 @@ PPPD_LICENSE_FILES = \
 	pppd/tdb.c pppd/plugins/pppoatm/COPYING \
 	pppdump/bsd-comp.c pppd/ccp.c pppd/plugins/passprompt.c
 
+PPPD_MAKE_OPTS = HAVE_INET6=y
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 PPPD_DEPENDENCIES = openssl
-PPPD_MAKE_OPTS = \
-	HAVE_INET6=y \
-	OPENSSL_INCLUDE_DIR=$(STAGING_DIR)/usr/include/openssl
+PPPD_MAKE_OPTS += OPENSSL_INCLUDE_DIR=$(STAGING_DIR)/usr/include/openssl
+else
+PPPD_MAKE_OPTS += USE_CRYPT=y
+endif
+
 PPPD_INSTALL_STAGING = YES
 PPPD_TARGET_BINS = chat pppd pppdump pppstats
 PPPD_RADIUS_CONF = \
-- 
2.20.1
