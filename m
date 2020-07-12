From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 15:47:15 +0200
Subject: [Buildroot] [git commit] package/sdl_mixer: add MIDI support using
 Timidity
Message-ID: <20200712135154.AEA37802D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=93a4298f35a0b8058113a2b046b11921a5177dcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add MIDI playback support using SDL_mixer' built-in Timidity synth.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl_mixer/Config.in    | 10 ++++++++++
 package/sdl_mixer/sdl_mixer.mk | 13 +++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/package/sdl_mixer/Config.in b/package/sdl_mixer/Config.in
index 42dfe63c0a..a886b7c1ac 100644
--- a/package/sdl_mixer/Config.in
+++ b/package/sdl_mixer/Config.in
@@ -9,3 +9,13 @@ config BR2_PACKAGE_SDL_MIXER
 	  SMPEG MP3 libraries.
 
 	  http://www.libsdl.org/projects/SDL_mixer/
+
+if BR2_PACKAGE_SDL_MIXER
+
+config BR2_PACKAGE_SDL_MIXER_MIDI_TIMIDITY
+	bool "MIDI support with built-in Timidity synth"
+	help
+	  Support MIDI audio using the built-in synth based on Timidity.
+	  You will need MIDI instruments installed in the filesystem.
+
+endif
diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
index 4cd13de2f6..9636c228ad 100644
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -31,9 +31,18 @@ SDL_MIXER_DEPENDENCIES += fluidsynth
 SDL_MIXER_CONF_OPTS += \
 	--enable-music-midi \
 	--enable-music-fluidsynth-midi
-else
+SDL_MIXER_HAS_MIDI = YES
+endif
+
+ifeq ($(BR2_PACKAGE_SDL_MIXER_MIDI_TIMIDITY),y)
 SDL_MIXER_CONF_OPTS += \
-	--disable-music-midi
+	--enable-music-midi \
+	--enable-music-timidity-midi
+SDL_MIXER_HAS_MIDI = YES
+endif
+
+ifneq ($(SDL_MIXER_HAS_MIDI),YES)
+SDL_MIXER_CONF_OPTS += --disable-music-midi
 endif
 
 ifeq ($(BR2_PACKAGE_LIBMAD),y)
