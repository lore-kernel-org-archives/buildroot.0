From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  8 Apr 2017 17:18:04 +0200
Subject: [Buildroot] [PATCH 3/3] package/tvheadend: reduce target binary
	size by using pngquant
In-Reply-To: <20170408151804.11102-1-bernd.kuhls@t-online.de>
References: <20170408151804.11102-1-bernd.kuhls@t-online.de>
Message-ID: <20170408151804.11102-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support was added by this commit:
https://github.com/tvheadend/tvheadend/commit/8bf3932539ceadb3bfc1c9453f11175f15aefad2

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index c2981ff22..0336019bc 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -11,6 +11,7 @@ TVHEADEND_LICENSE_FILES = LICENSE.md
 TVHEADEND_DEPENDENCIES = \
 	host-gettext \
 	host-pkgconf \
+	host-pngquant \
 	$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python) \
 	openssl
 
@@ -81,12 +82,19 @@ define TVHEADEND_CONFIGURE_CMDS
 			--python="$(HOST_DIR)/usr/bin/python"	\
 			--enable-dvbscan			\
 			--enable-bundle				\
+			--enable-pngquant			\
 			--disable-ffmpeg_static			\
 			--disable-hdhomerun_static		\
 			$(TVHEADEND_CONF_OPTS)			\
 	)
 endef
 
+define TVHEADEND_FIX_PNGQUANT_PATH
+	$(SED) "s%^pngquant_bin =.*%pngquant_bin = '$(HOST_DIR)/usr/bin/pngquant'%" \
+		$(@D)/support/mkbundle
+endef
+TVHEADEND_POST_CONFIGURE_HOOKS += TVHEADEND_FIX_PNGQUANT_PATH
+
 define TVHEADEND_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
-- 
2.11.0
