From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Oct 2016 17:02:20 +0100
Subject: [Buildroot] [PATCH 09/10] package/mpv: make it a waf-package
In-Reply-To: <cover.1477843328.git.yann.morin.1998@free.fr>
References: <cover.1477843328.git.yann.morin.1998@free.fr>
Message-ID: <5405b08670b69296777ecefbd8c616a9053686a7.1477843328.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mpv/mpv.hash |  1 -
 package/mpv/mpv.mk   | 30 +++---------------------------
 2 files changed, 3 insertions(+), 28 deletions(-)

diff --git a/package/mpv/mpv.hash b/package/mpv/mpv.hash
index eea0db0..fb287ef 100644
--- a/package/mpv/mpv.hash
+++ b/package/mpv/mpv.hash
@@ -1,3 +1,2 @@
 # Locally calculated
 sha256	fe6ec9d2ded5ce84b963f54b812d579d04f944f4a737f3ae639c4d5d9e842b56	v0.20.0.tar.gz
-sha256	01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca343fe091f22fca60c98b	waf-1.8.12
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 4f04fdf..0c5a64f 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -5,16 +5,16 @@
 ################################################################################
 
 MPV_VERSION = 0.20.0
-MPV_WAF_VERSION = 1.8.12
 MPV_SITE = https://github.com/mpv-player/mpv/archive
 MPV_SOURCE = v$(MPV_VERSION).tar.gz
-MPV_EXTRA_DOWNLOADS = https://waf.io/waf-$(MPV_WAF_VERSION)
 MPV_DEPENDENCIES = \
 	host-pkgconf ffmpeg zlib \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 MPV_LICENSE = GPLv2+
 MPV_LICENSE_FILES = LICENSE
 
+MPV_BUNDLED_WAF = NO
+
 # Some of these options need testing and/or tweaks
 MPV_CONF_OPTS = \
 	--prefix=/usr \
@@ -235,28 +235,4 @@ else
 MPV_CONF_OPTS += --disable-x11
 endif
 
-define MPV_COPY_WAF
-	$(INSTALL) -m 0755 $(DL_DIR)/waf-$(MPV_WAF_VERSION) $(@D)/waf
-endef
-MPV_POST_EXTRACT_HOOKS += MPV_COPY_WAF
-
-define MPV_CONFIGURE_CMDS
-	cd $(@D); \
-		$(TARGET_CONFIGURE_OPTS) \
-		./waf configure $(MPV_CONF_OPTS)
-endef
-
-define MPV_BUILD_CMDS
-	cd $(@D); \
-		$(TARGET_MAKE_ENV) \
-		./waf build
-endef
-
-define MPV_INSTALL_TARGET_CMDS
-	cd $(@D); \
-		$(TARGET_MAKE_ENV) \
-		DESTDIR=$(TARGET_DIR) \
-		./waf install
-endef
-
-$(eval $(generic-package))
+$(eval $(waf-package))
-- 
2.7.4
