From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 26 Jul 2015 20:45:15 +0200
Subject: [Buildroot] [PATCH 3/6] busybox: use pkg-config for libtirpc flags
In-Reply-To: <1437936318-9450-1-git-send-email-patrickdepinguin@gmail.com>
References: <1437936318-9450-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1437936318-9450-3-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Instead of hardcoding the flags needed for libtirpc, use pkg-config.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 package/busybox/busybox.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 65ce7ef..6e302f4 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -19,11 +19,11 @@ BUSYBOX_LDFLAGS = \
 # Link against libtirpc if available so that we can leverage its RPC
 # support for NFS mounting with BusyBox
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
-BUSYBOX_DEPENDENCIES += libtirpc
-BUSYBOX_CFLAGS += -I$(STAGING_DIR)/usr/include/tirpc/
+BUSYBOX_DEPENDENCIES += libtirpc host-pkgconf
+BUSYBOX_CFLAGS += "`$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`"
 # Don't use LDFLAGS for -ltirpc, because LDFLAGS is used for
 # the non-final link of modules as well.
-BUSYBOX_CFLAGS_busybox += -ltirpc
+BUSYBOX_CFLAGS_busybox += "`$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`"
 endif
 
 BUSYBOX_BUILD_CONFIG = $(BUSYBOX_DIR)/.config
-- 
1.8.5.1
