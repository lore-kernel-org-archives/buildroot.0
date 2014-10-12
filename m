From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Oct 2014 20:13:25 +0200
Subject: [Buildroot] [PATCH 3/8] package/tvheadend: Convert to
	autotools-package
In-Reply-To: <1413137610-21887-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413137610-21887-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1413137610-21887-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tvheadend does not use autoconf but its configure script behaves as such.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend.mk |   27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 1445838..25a732c 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -20,26 +20,11 @@ endif
 
 TVHEADEND_DEPENDENCIES += dtv-scan-tables
 
-define TVHEADEND_CONFIGURE_CMDS
-	(cd $(@D);				\
-	 $(TARGET_CONFIGURE_OPTS)		\
-	 $(TARGET_CONFIGURE_ARGS)		\
-	 ./configure				\
-	 --prefix=/usr				\
-	 --arch="$(ARCH)"			\
-	 --cpu="$(BR2_GCC_TARGET_CPU)"		\
-	 --python="$(HOST_DIR)/usr/bin/python"	\
-	 --disable-dvbscan			\
-	)
-endef
-
-define TVHEADEND_BUILD_CMDS
-	$(MAKE) -C $(@D)
-endef
-
-define TVHEADEND_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
-endef
+TVHEADEND_CONF_OPTS += \
+	--arch="$(ARCH)" \
+	--cpu="$(BR2_GCC_TARGET_CPU)" \
+	--python="$(HOST_DIR)/usr/bin/python" \
+	--disable-dvbscan
 
 #----------------------------------------------------------------------------
 # To run tvheadend, we need:
@@ -62,4 +47,4 @@ define TVHEADEND_USERS
 tvheadend -1 tvheadend -1 * /home/tvheadend - video TVHeadend daemon
 endef
 
-$(eval $(generic-package))
+$(eval $(autotools-package))
-- 
1.7.10.4
