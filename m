From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 13 Oct 2014 19:45:55 +0200
Subject: [Buildroot] [PATCH v2 5/7] package/tvheadend: Enable bundled build
In-Reply-To: <1413222357-8299-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413222357-8299-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1413222357-8299-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-python is needed to create a bundled version of the tvheadend binary which
includes all files used by the web UI.

Having host-python alone as dependency is not enough, we need to add
--enable-bundle to enable this functionality.

Also remove the now bundled webinterface files from /usr/share/tvheadend/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend.mk |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 767194d..e92e12d 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -37,6 +37,7 @@ define TVHEADEND_CONFIGURE_CMDS
 	 --cpu="$(BR2_GCC_TARGET_CPU)"		\
 	 --python="$(HOST_DIR)/usr/bin/python"	\
 	 --disable-dvbscan			\
+	 --enable-bundle			\
 	)
 endef
 
@@ -48,6 +49,13 @@ define TVHEADEND_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
 endef
 
+define TVHEADEND_CLEAN_SHARE
+	rm -rf "$(TARGET_DIR)/usr/share/tvheadend/docs"
+	rm -rf "$(TARGET_DIR)/usr/share/tvheadend/src"
+endef
+
+TVHEADEND_POST_INSTALL_TARGET_HOOKS += TVHEADEND_CLEAN_SHARE
+
 #----------------------------------------------------------------------------
 # To run tvheadend, we need:
 #  - a startup script, and its config file
@@ -58,7 +66,7 @@ define TVHEADEND_INSTALL_DB
 	              $(TARGET_DIR)/home/tvheadend/.hts/tvheadend/accesscontrol/1
 	chmod -R go-rwx $(TARGET_DIR)/home/tvheadend
 endef
-TVHEADEND_POST_INSTALL_TARGET_HOOKS = TVHEADEND_INSTALL_DB
+TVHEADEND_POST_INSTALL_TARGET_HOOKS += TVHEADEND_INSTALL_DB
 
 define TVHEADEND_INSTALL_INIT_SYSV
 	$(INSTALL) -D package/tvheadend/etc.default.tvheadend $(TARGET_DIR)/etc/default/tvheadend
-- 
1.7.10.4
