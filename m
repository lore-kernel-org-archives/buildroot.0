From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 15:10:22 +0200
Subject: [Buildroot] [git commit] xbmc: fix missing libraries from
	rpi-userland
Message-ID: <20140608131255.2A0E49CB8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=088ee8cfa40c2092393980530a4fceac782bd0c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xbmc/xbmc.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index ca605a4..1d458d4 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -65,7 +65,8 @@ ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 XBMC_DEPENDENCIES += rpi-userland
 XBMC_CONF_OPT += --with-platform=raspberry-pi --enable-player=omxplayer
 XBMC_CONF_ENV += INCLUDES="-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
-	-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux"
+	-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux" \
+	LIBS="-lvcos -lvchostif"
 endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
