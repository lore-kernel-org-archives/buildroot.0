From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Dec 2016 22:38:22 +0100
Subject: [Buildroot] [git commit] package/mpv: make it a waf-package
Message-ID: <20161202225223.5BBDF81E52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c06e102a64a11b15a8cdcc89d2c4a1a2368defd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
index 4f04fdf..0dd488d 100644
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
 
+MPV_NEEDS_EXTERNAL_WAF = YES
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
