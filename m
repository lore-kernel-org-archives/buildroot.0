From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Oct 2011 09:39:38 +0200
Subject: [Buildroot] [git commit] mpg123: tweak audio module selection
Message-ID: <20111005074050.39882807D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fca4aa233659fa15c7518a3cc83bc2331beb87bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build if host has libarts-dev, and add optional sdl+portaudio support.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mpg123/mpg123.mk |   22 +++++++++++++++++++---
 1 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/package/multimedia/mpg123/mpg123.mk b/package/multimedia/mpg123/mpg123.mk
index 53b7b39..c01c8ad 100644
--- a/package/multimedia/mpg123/mpg123.mk
+++ b/package/multimedia/mpg123/mpg123.mk
@@ -9,6 +9,7 @@ MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mpg123
 MPG123_CONF_OPT = --with-optimization=0 --disable-lfs-alias
 MPG123_INSTALL_STAGING = YES
+
 MPG123_CPU = $(if $(BR2_SOFT_FLOAT),generic_nofpu,generic_fpu)
 
 ifeq ($(BR2_arm),y)
@@ -34,11 +35,26 @@ endif
 
 MPG123_CONF_OPT += --with-cpu=$(MPG123_CPU)
 
-# Check if ALSA is built, then we should configure after alsa-lib so
-# ./configure can find alsa-lib.
+MPG123_AUDIO = dummy oss
+
+ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
+MPG123_AUDIO += portaudio
+MPG123_CONF_OPT += --with-default-audio=portaudio
+MPG123_DEPENDENCIES += portaudio
+endif
+
+ifeq ($(BR2_PACKAGE_SDL),y)
+MPG123_AUDIO += sdl
+MPG123_CONF_OPT += --with-default-audio=sdl
+MPG123_DEPENDENCIES += sdl
+endif
+
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
-MPG123_CONF_OPT += --with-audio=alsa
+MPG123_AUDIO += alsa
+MPG123_CONF_OPT += --with-default-audio=alsa
 MPG123_DEPENDENCIES += alsa-lib
 endif
 
+MPG123_CONF_OPT += --with-audio=$(shell echo $(MPG123_AUDIO) | tr ' ' ,)
+
 $(eval $(call AUTOTARGETS))
