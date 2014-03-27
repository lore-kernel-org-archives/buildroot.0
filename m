From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Mar 2014 23:38:10 +0100
Subject: [Buildroot] [git commit] sdl: Fix host variant dependencies
Message-ID: <20140327224928.1597C9C3AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bfe884fac7467425b4f9bd02e124696fea780661
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host variant of sdl inherited the dependencies and conf opt from
sdl which could lead to some trouble.

For example:
  If you were to build host-sdl and had alsa-lib enabled in your
  packages list, it would try to build host-alsa-lib which does not
  exists.

This patch define basic dependencies and conf opt for the host variant.

Reported-by: Eric Limpens <limpens@gmail.com>
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl/sdl.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index d5fb331..086f5e9 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -21,6 +21,7 @@ SDL_PRE_CONFIGURE_HOOKS += SDL_RUN_AUTOGEN
 HOST_SDL_PRE_CONFIGURE_HOOKS += SDL_RUN_AUTOGEN
 
 SDL_DEPENDENCIES += host-automake host-autoconf host-libtool
+HOST_SDL_DEPENDENCIES += host-automake host-autoconf host-libtool
 
 ifeq ($(BR2_PACKAGE_SDL_FBCON),y)
 SDL_CONF_OPT += --enable-video-fbcon=yes
@@ -70,6 +71,12 @@ SDL_CONF_OPT += --enable-pulseaudio=no \
 		--disable-nasm \
 		--disable-video-ps3
 
+HOST_SDL_CONF_OPT += --enable-pulseaudio=no \
+		--disable-arts \
+		--disable-esd \
+		--disable-nasm \
+		--disable-video-ps3
+
 SDL_CONFIG_SCRIPTS = sdl-config
 
 # Remove the -Wl,-rpath option.
