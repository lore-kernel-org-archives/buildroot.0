From: Samuel Martin <s.martin49@gmail.com>
Date: Thu,  5 Jun 2014 01:04:11 +0200
Subject: [Buildroot] [PATCH v6 2/4] xbmc: fix missing libraries from
	rpi-userland
In-Reply-To: <1401923053-30292-1-git-send-email-s.martin49@gmail.com>
References: <1401923053-30292-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1401923053-30292-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

---
changes v5 -> v6:
- rebase

changes v4 -> v5:
- rebase
- extend commit message

changes v3 -> v4:
- rebase

changes v2 -> v3:
- new patch
---
 package/xbmc/xbmc.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index c7a4607..8c0146e 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -53,7 +53,8 @@ ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 XBMC_DEPENDENCIES += rpi-userland
 XBMC_CONF_OPT += --with-platform=raspberry-pi --enable-player=omxplayer
 XBMC_CONF_ENV += INCLUDES="-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
-	-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux"
+	-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux" \
+	LIBS="-lvcos -lvchostif"
 endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
-- 
2.0.0
