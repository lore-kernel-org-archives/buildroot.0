From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 22:54:48 +0200
Subject: [Buildroot] [git commit] ffmpeg: add --pkg-config to configure
	options
Message-ID: <20140921205504.0A7939D739@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a9a5a8159937cbc5e472cbd0b144d596b85a3386
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ffmpeg does not understand the PKG_CONFIG env variable,
so it throws a line like this at the end of its configuration:

WARNING: .../output/host/usr/bin/arm-none-linux-gnueabi-pkg-config not found, library detection may fail.

Apparently, some of the indevs and outdevs need a pkg-config.
This patch adds the --pkg-config to let ffmpeg know where it
is.

[Thomas: remove unrelated formatting change.]

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 1481abc..c6f305a 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -64,7 +64,7 @@ FFMPEG_CONF_OPT = \
 	--disable-symver \
 	--disable-doc
 
-FFMPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+FFMPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv) host-pkgconf
 
 ifeq ($(BR2_ENABLE_DEBUG),y)
 FFMPEG_CONF_OPT += --enable-debug
@@ -333,6 +333,7 @@ define FFMPEG_CONFIGURE_CMDS
 		--arch=$(BR2_ARCH) \
 		--target-os="linux" \
 		--disable-stripping \
+		--pkg-config="$(PKG_CONFIG_HOST_BINARY)" \
 		$(if $(BR2_GCC_TARGET_TUNE),--cpu=$(BR2_GCC_TARGET_TUNE)) \
 		$(SHARED_STATIC_LIBS_OPTS) \
 		$(FFMPEG_CONF_OPT) \
