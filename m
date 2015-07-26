From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 21:49:36 +0200
Subject: [Buildroot] [git commit branch/next] quota: use pkg-config for
	libtirpc flags
Message-ID: <20150808105642.73B0C7FFCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a2732e1b9d91a1cb276ebe17d5acf53f6a9356e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Instead of hardcoding the flags needed for libtirpc, use pkg-config.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/quota/quota.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

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
