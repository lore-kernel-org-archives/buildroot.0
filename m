From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  7 Jun 2014 14:31:30 +0200
Subject: [Buildroot] [PATCH v12 30/32] xbmc: fix missing libraries from
	rpi-userland
In-Reply-To: <1402144292-27837-1-git-send-email-bernd.kuhls@t-online.de>
References: <1402144292-27837-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1402144292-27837-31-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel Martin <s.martin49@gmail.com>

When rpi-userland libraries are built as shared-objects, not all needed
libraries are passed in the LD_FLAGS, leading to failure at linkage.

To avoid this issue, set the LIBS variable content in accordance with the
INCLUDES variable value.

The commit 5e3b1f31b3f82e3b163567f10d7131c9d649a2cf currently works
around this issue by forcing rpi-userland to be statically linked,
whereas it is actually a LIBS flags problem in xbmc package.

A follow-up patch fixes rpi-userland package.

Reported-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/xbmc.mk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index ac8b1a0..ae365e8 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -60,7 +60,8 @@ ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 XBMC_DEPENDENCIES += rpi-userland
 XBMC_CONF_OPT += --with-platform=raspberry-pi --enable-player=omxplayer
 XBMC_CONF_ENV += INCLUDES="-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
-	-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux"
+	-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux" \
+	LIBS="-lvcos -lvchostif"
 endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
-- 
1.7.10.4
