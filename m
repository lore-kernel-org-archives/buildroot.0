From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 26 Jul 2015 20:45:16 +0200
Subject: [Buildroot] [PATCH 4/6] quota: use pkg-config for libtirpc flags
In-Reply-To: <1437936318-9450-1-git-send-email-patrickdepinguin@gmail.com>
References: <1437936318-9450-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1437936318-9450-4-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Instead of hardcoding the flags needed for libtirpc, use pkg-config.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 package/quota/quota.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 332f42e..5e5e637 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -19,9 +19,9 @@ QUOTA_LIBS += -lintl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
-QUOTA_DEPENDENCIES += libtirpc
-QUOTA_CFLAGS += -I$(STAGING_DIR)/usr/include/tirpc/
-QUOTA_LIBS += -ltirpc
+QUOTA_DEPENDENCIES += libtirpc host-pkgconf
+QUOTA_CFLAGS += "`$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`"
+QUOTA_LIBS += "`$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`"
 endif
 
 QUOTA_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) CFLAGS="$(QUOTA_CFLAGS) -D_GNU_SOURCE" LIBS="$(QUOTA_LIBS)"
-- 
1.8.5.1
