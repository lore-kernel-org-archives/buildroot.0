From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Dec 2014 21:40:23 +0100
Subject: [Buildroot] [git commit] package/tvheadend: Fix inclusion of DVB
	frequency tables in bundled build
Message-ID: <20141214205926.9994B7FF63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b7a7b4cb06478a56542bb36c06bd183360009a32
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tvheadend/tvheadend.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

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
 
