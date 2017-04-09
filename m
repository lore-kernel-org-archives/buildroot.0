From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Apr 2017 16:05:49 +0200
Subject: [Buildroot] [git commit] package/tvheadend: reduce target binary
	size by using pngquant
Message-ID: <20170409140648.20AD082122@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=efd6d5fd24706d825abae5f2bb39771fce586f09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support was added by this commit:
https://github.com/tvheadend/tvheadend/commit/8bf3932539ceadb3bfc1c9453f11175f15aefad2

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tvheadend/tvheadend.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index c2981ff..0336019 100644
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
