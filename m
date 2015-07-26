From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 26 Jul 2015 20:45:18 +0200
Subject: [Buildroot] [PATCH 6/6] argus: use pkg-config for libtirpc flags
In-Reply-To: <1437936318-9450-1-git-send-email-patrickdepinguin@gmail.com>
References: <1437936318-9450-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1437936318-9450-6-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Instead of hardcoding the flags needed for libtirpc, use pkg-config.
The linker flags are added to LIBS rather than LDFLAGS, which is more
correct in case of static builds.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 package/argus/argus.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/argus/argus.mk b/package/argus/argus.mk
index c39b664..bd1c559 100644
--- a/package/argus/argus.mk
+++ b/package/argus/argus.mk
@@ -13,10 +13,10 @@ ARGUS_LICENSE = GPLv2+
 ARGUS_LICENSE_FILES = README
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
-ARGUS_DEPENDENCIES += libtirpc
+ARGUS_DEPENDENCIES += libtirpc host-pkgconf
 ARGUS_CONF_ENV += \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/tirpc/" \
-	LDFLAGS="$(TARGET_LDFLAGS) -ltirpc"
+	CFLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`" \
+	LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`"
 endif
 
 $(eval $(autotools-package))
-- 
1.8.5.1
