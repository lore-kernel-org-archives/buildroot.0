From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Dec 2014 10:53:29 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/tvheadend: Fix inclusion of DVB
	frequency tables in bundled build
Message-ID: <1418550811-15547-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: add comment (Thomas)
    change to --enable-dvbscan, otherwise data files are not included

 package/tvheadend/tvheadend.mk |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index e0ce160..9c93807 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -50,14 +50,20 @@ define TVHEADEND_CONFIGURE_CMDS
 			--arch="$(ARCH)"			\
 			--cpu="$(BR2_GCC_TARGET_CPU)"		\
 			--python="$(HOST_DIR)/usr/bin/python"	\
-			--disable-dvbscan			\
+			--enable-dvbscan			\
 			--enable-bundle				\
 			--disable-libffmpeg_static		\
 			$(TVHEADEND_CONF_OPTS)			\
 	)
 endef
 
+# The tvheadend build system expects the transponder data to be present inside
+# its source tree. To prevent a downloaded initiated by the build system just
+# copy the data files in the right place and add the corresponding stamp file.
 define TVHEADEND_BUILD_CMDS
+	$(INSTALL) -d $(@D)/data/dvb-scan
+	cp -r $(TARGET_DIR)/usr/share/dvb/* $(@D)/data/dvb-scan/
+	touch $(@D)/data/dvb-scan/.stamp
 	$(MAKE) -C $(@D)
 endef
 
-- 
1.7.10.4
