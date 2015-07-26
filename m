From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 21:49:57 +0200
Subject: [Buildroot] [git commit branch/next] argus: use pkg-config for
	libtirpc flags
Message-ID: <20150808105642.83C217FFCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50e63d67ab64b9b1d40ed77cb0ea08a68276bbba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Instead of hardcoding the flags needed for libtirpc, use pkg-config.
The linker flags are added to LIBS rather than LDFLAGS, which is more
correct in case of static builds.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/argus/argus.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

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
