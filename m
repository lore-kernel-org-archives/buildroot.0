Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E10C5DF66
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 19:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16A3580E2E;
	Sun, 16 Aug 2026 19:18:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Asb5Pa8q_3xe; Sun, 16 Aug 2026 19:18:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B52F980E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786907891;
	bh=0pmTRzsfXknYyq8XecJ9ZYUq6EBDaditgkyaWnY0atg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b6x2UJ8VQ/m9/XKVsEW2TzQj55lRmPhKU4qfW+zXn1fkDPwjhrAVTt5T2z0gf9a4m
	 9oP1mDO6Wt8Nupw4mmBbcG3HN33NKpV9wjiWMdq8ta7i3IUkIp/eYF4Nibo0raWbrO
	 ttJVOALeMqgvLYE7I+q2lHWL1AxVfPLefNXD05V/mVM8ODOiINOq08BwsvQotfPfZ/
	 gJhNo2focScoDFxYPWEN99GzGDBLFBrXfpdzRJ6r5iTPA4aqitx6oQIu0ft7g3BXlM
	 +pLC2jsaUg4QCLDg6AFytV/mUlJvTjmUI3xL7uCnrjNKG5EsxGSHBzvkthjUlHPlIb
	 mwQuw/rvJUD9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B52F980E11;
	Sun, 16 Aug 2026 19:18:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E62E7194
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC87E40086
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kaZxsbexqu95 for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 19:18:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::732; helo=mail-qk1-x732.google.com;
 envelope-from=alseycmiller@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B895440063
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B895440063
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=CqrVZE7L
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B895440063
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:18:04 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-9309d4ea213so217445385a.1
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 12:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786907883; x=1787512683; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QT1W26fbjJYD1JKNrd2MBKZLDo1i6wtShrX2B2T8AFI=;
 b=CqrVZE7L/NIA1MQOXC7ukGlHxG4AAe3tM7wEOKiiD9K+ysLH7UeZVe6Ia7YkItzU0r
 mHkDRx0k0mSTvDDZ7+xjvoV2q9b0et8xpMYTV9ArWowkeKFqRbWaCkNjePp4fc0WOY9f
 V8JYuBE/sTz3x3g8/9y/ISfuVkDLB/nRcTqo+YJrgsBv7OqAsLBTqoW+NOwhjvUHIn62
 edktKQ8jXpsIPtZwgaeEtkhOn84YUpID5vefXhpDjeDg1Q9+IB+NRVgXY3OFceMcbd1v
 GeTcdlXARPU780gWS6ozkkv4wpZGRANcx5NFX99ZpwajtdFCTQwL52T9El139qWeeKzv
 Fv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786907883; x=1787512683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=QT1W26fbjJYD1JKNrd2MBKZLDo1i6wtShrX2B2T8AFI=;
 b=XJahx+mAX2zyriXTmtzgw/d9k0dRF2tFvDOWDDik/8W3B6PrEpVqHFA0PjCBlGvk+f
 Hhlua5++EtEw39Ne9sXFfHZUyIcsYtTci6dTg8wUfw8HbNhgPNm65qT4gFrhgRM0PK3N
 h+oNMsRQWshE+gdgpQrIznQPt7tZGfsmObvB6iWX3nyti2Yuz7m6x4+5dTZnPP2cYyKE
 OCtzKe4BHJqDFA9L2Qvxtj1WlHE0f3NoAfJPdvCNlhzbKm4B3TDuiDXLvmBGxmI1zfu0
 qrJwM+Ttv/3bkHcgJliJhzSHa7rWeEESlxW3YiWUiDkG1WKpK2V0LKYB4YbdDNb61nwU
 ADyQ==
X-Gm-Message-State: AOJu0YzpzYNId4VURlbyOUsbc20YhlZdZ6Xm625ahlQkrX11AWxpBmuX
 x+kKVjE8y/nd1t6sUQcZsX/78VDzJ2EO27fOl0ZXraWsRq4au2ilQdcWT+jdRA==
X-Gm-Gg: AR+sD11ewYwy3TT4Zzkyw3NrWjKJiN59/GTugN0SxJm4SjcBa99AiblxDbXr/5GcDaf
 p5k3hD23I9lBPxvtWwDyToIKqWEBBbOAOsgK0MGj0gsPkMTvbZQigxWuJfyPzBi64YBMHgeC/9o
 3PaHaAZ0AfFGovxCjIwYPeAPPORlCAMw/bK78gZL0qk3brGeau6E5Lse7iRpECs8jFnVYLHeQ4a
 4LCPTcnGlZ68901ZP5IxQXkV3n3v7sVTfTUgCiCxjf0tS1BnFSXV9BD3X/udKBXiQhKssBYes9t
 m0ydgPwpEje4legEkZfNfMRalyD2gM2fwXglE5S+00Tc7aIz0XYnFuESrh16bnMSF2RcByeNbmh
 YIa2XGRLIIh4eMjH1r8L8R3S4G7bmBNrLe/9T58SOC8a5UDgQu1gv4IslGRDC1ndccJWKAFQeDF
 8c+85bzuZMsG4XLgQICp44jGTTcZNXeL30ak5cTMzhpR6veoSKkux0zP681tLDRpH+Oa1CEJd1j
 78qpV3OeXym1s8bu1HmR5q/zA==
X-Received: by 2002:a05:620a:90ca:20b0:930:f723:35f5 with SMTP id
 af79cd13be357-936d223ec93mr1573471485a.20.1786907883408; 
 Sun, 16 Aug 2026 12:18:03 -0700 (PDT)
Received: from optiplex-7020.tail176fc.ts.net ([67.21.186.162])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-936cdf561efsm825489585a.8.2026.08.16.12.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2026 12:18:02 -0700 (PDT)
From: Alsey Coleman Miller <alseycmiller@gmail.com>
To: buildroot@buildroot.org
Cc: Michael Fischer <mf@go-sys.de>,
 Alsey Coleman Miller <alseycmiller@gmail.com>
Date: Sun, 16 Aug 2026 15:18:29 -0400
Message-ID: <20260816191830.533747-8-alseycmiller@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260816191830.533747-1-alseycmiller@gmail.com>
References: <20260816191830.533747-1-alseycmiller@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 7/8] package/sdl3_mixer: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SDL3_mixer is the multi-channel audio mixer library for SDL3. It plays
AIFF, AU, VOC and WAVE, MIDI through the built-in timidity, and MP3,
Ogg Vorbis and FLAC through the bundled dr_mp3, stb_vorbis and dr_flac
decoders, none of which need a dependency.

The better decoders are built when their libraries are already in the
configuration: flac, mpg123, opusfile, wavpack, fluidsynth, libxmp for
modules and game-music-emu for console chiptunes. Ogg Vorbis comes from
vorbisfile or tremor and never both, since upstream errors out when the
two are enabled together, so tremor is used only when libvorbis is
absent.

VENDORED is off so the copies of those libraries in the tarball are not
used, DEPS_SHARED off so they are linked rather than dlopen()ed, and
STRICT on so a decoder that cannot find its library fails the build
instead of being dropped silently.

Built with CMake, like sdl3 itself, rather than with the autotools setup
the SDL2 counterpart uses.

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
---
 DEVELOPERS                         |   1 +
 package/Config.in                  |   1 +
 package/sdl3_mixer/Config.in       |  17 +++++
 package/sdl3_mixer/sdl3_mixer.hash |   3 +
 package/sdl3_mixer/sdl3_mixer.mk   | 103 +++++++++++++++++++++++++++++
 5 files changed, 125 insertions(+)
 create mode 100644 package/sdl3_mixer/Config.in
 create mode 100644 package/sdl3_mixer/sdl3_mixer.hash
 create mode 100644 package/sdl3_mixer/sdl3_mixer.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 56b01fa5cc..964fe9a597 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -172,6 +172,7 @@ N:	Alsey Coleman Miller <alseycmiller@gmail.com>
 F:	package/liblc3/
 F:	package/plutosvg/
 F:	package/plutovg/
+F:	package/sdl3_mixer/
 
 N:	Alvaro G. M <alvaro.gamez@hazent.com>
 F:	package/dcron/
diff --git a/package/Config.in b/package/Config.in
index 5e1601036c..853d3bd07d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -369,6 +369,7 @@ comment "Graphic libraries"
 	source "package/sdl3/Config.in"
 	source "package/sdl3_gfx/Config.in"
 	source "package/sdl3_image/Config.in"
+	source "package/sdl3_mixer/Config.in"
 	source "package/sdl3_ttf/Config.in"
 	source "package/spirv-headers/Config.in"
 	source "package/tk/Config.in"
diff --git a/package/sdl3_mixer/Config.in b/package/sdl3_mixer/Config.in
new file mode 100644
index 0000000000..cfefb4719b
--- /dev/null
+++ b/package/sdl3_mixer/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_SDL3_MIXER
+	bool "sdl3_mixer"
+	depends on BR2_PACKAGE_SDL3
+	help
+	  SDL3_mixer is a multi-channel audio mixer library for
+	  SDL3. It plays AIFF, AU, VOC and WAVE samples, MIDI
+	  through the built-in timidity, and MP3, Ogg Vorbis and
+	  FLAC through the bundled dr_mp3, stb_vorbis and dr_flac
+	  decoders.
+
+	  The higher quality decoders are used instead when their
+	  libraries are enabled in the configuration (flac, mpg123,
+	  libvorbis or tremor, opusfile, wavpack, fluidsynth), and
+	  module and console chiptune playback is added by libxmp
+	  and game-music-emu.
+
+	  https://github.com/libsdl-org/SDL_mixer
diff --git a/package/sdl3_mixer/sdl3_mixer.hash b/package/sdl3_mixer/sdl3_mixer.hash
new file mode 100644
index 0000000000..44602037e1
--- /dev/null
+++ b/package/sdl3_mixer/sdl3_mixer.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  182a07c745375e113dc740d43964ff21b0be29f29f59876c4dbc4db3d32f6901  SDL3_mixer-3.2.4.tar.gz
+sha256  e36997fe492c48e7ed873065cc3a694f38e8189a328d3709099ffdc9a8843f4c  LICENSE.txt
diff --git a/package/sdl3_mixer/sdl3_mixer.mk b/package/sdl3_mixer/sdl3_mixer.mk
new file mode 100644
index 0000000000..beff679466
--- /dev/null
+++ b/package/sdl3_mixer/sdl3_mixer.mk
@@ -0,0 +1,103 @@
+################################################################################
+#
+# sdl3_mixer
+#
+################################################################################
+
+SDL3_MIXER_VERSION = 3.2.4
+SDL3_MIXER_SOURCE = SDL3_mixer-$(SDL3_MIXER_VERSION).tar.gz
+SDL3_MIXER_SITE = https://www.libsdl.org/projects/SDL_mixer/release
+SDL3_MIXER_LICENSE = Zlib
+SDL3_MIXER_LICENSE_FILES = LICENSE.txt
+SDL3_MIXER_CPE_ID_VENDOR = libsdl
+SDL3_MIXER_CPE_ID_PRODUCT = sdl_mixer
+SDL3_MIXER_INSTALL_STAGING = YES
+SDL3_MIXER_DEPENDENCIES = sdl3 host-pkgconf
+
+# AIFF, AU, VOC and WAVE, plus the bundled dr_flac, dr_mp3, stb_vorbis and
+# timidity decoders, need no dependency and are left enabled by default.
+# STRICT makes the build fail when a decoder we asked for cannot find its
+# library, instead of silently dropping it. DEPS_SHARED=OFF links the
+# decoder libraries directly rather than dlopen()ing them at runtime.
+SDL3_MIXER_CONF_OPTS = \
+	-DSDLMIXER_VENDORED=OFF \
+	-DSDLMIXER_DEPS_SHARED=OFF \
+	-DSDLMIXER_STRICT=ON \
+	-DSDLMIXER_TESTS=OFF \
+	-DSDLMIXER_EXAMPLES=OFF \
+	-DSDLMIXER_INSTALL_MAN=OFF
+
+ifeq ($(BR2_PACKAGE_GAME_MUSIC_EMU),y)
+SDL3_MIXER_CONF_OPTS += -DSDLMIXER_GME=ON
+SDL3_MIXER_DEPENDENCIES += game-music-emu
+else
+SDL3_MIXER_CONF_OPTS += -DSDLMIXER_GME=OFF
+endif
+
+# MOD playback goes through libxmp; libxmp-lite is not packaged.
+ifeq ($(BR2_PACKAGE_LIBXMP),y)
+SDL3_MIXER_CONF_OPTS += \
+	-DSDLMIXER_MOD=ON \
+	-DSDLMIXER_MOD_XMP=ON \
+	-DSDLMIXER_MOD_XMP_LITE=OFF
+SDL3_MIXER_DEPENDENCIES += libxmp
+else
+SDL3_MIXER_CONF_OPTS += -DSDLMIXER_MOD=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_FLAC),y)
+SDL3_MIXER_CONF_OPTS += -DSDLMIXER_FLAC_LIBFLAC=ON
+SDL3_MIXER_DEPENDENCIES += flac
+else
+SDL3_MIXER_CONF_OPTS += -DSDLMIXER_FLAC_LIBFLAC=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_MPG123),y)
+SDL3_MIXER_CONF_OPTS += -DSDLMIXER_MP3_MPG123=ON
+SDL3_MIXER_DEPENDENCIES += mpg123
+else
+SDL3_MIXER_CONF_OPTS += -DSDLMIXER_MP3_MPG123=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_FLUIDSYNTH),y)
+SDL3_MIXER_CONF_OPTS += -DSDLMIXER_MIDI_FLUIDSYNTH=ON
+SDL3_MIXER_DEPENDENCIES += fluidsynth
+else
+SDL3_MIXER_CONF_OPTS += -DSDLMIXER_MIDI_FLUIDSYNTH=OFF
+endif
+
+# Opus is decoded through opusfile, which pulls in opus and libogg.
+ifeq ($(BR2_PACKAGE_OPUSFILE),y)
+SDL3_MIXER_CONF_OPTS += -DSDLMIXER_OPUS=ON
+SDL3_MIXER_DEPENDENCIES += opusfile
+else
+SDL3_MIXER_CONF_OPTS += -DSDLMIXER_OPUS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_WAVPACK),y)
+SDL3_MIXER_CONF_OPTS += -DSDLMIXER_WAVPACK=ON
+SDL3_MIXER_DEPENDENCIES += wavpack
+else
+SDL3_MIXER_CONF_OPTS += -DSDLMIXER_WAVPACK=OFF
+endif
+
+# Ogg Vorbis comes from either vorbisfile or tremor, never both; upstream
+# errors out when the two are enabled together. tremor is the integer-only
+# decoder, so it is only used when libvorbis is absent.
+ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
+SDL3_MIXER_CONF_OPTS += \
+	-DSDLMIXER_VORBIS_VORBISFILE=ON \
+	-DSDLMIXER_VORBIS_TREMOR=OFF
+SDL3_MIXER_DEPENDENCIES += libvorbis
+else ifeq ($(BR2_PACKAGE_TREMOR),y)
+SDL3_MIXER_CONF_OPTS += \
+	-DSDLMIXER_VORBIS_VORBISFILE=OFF \
+	-DSDLMIXER_VORBIS_TREMOR=ON
+SDL3_MIXER_DEPENDENCIES += tremor
+else
+SDL3_MIXER_CONF_OPTS += \
+	-DSDLMIXER_VORBIS_VORBISFILE=OFF \
+	-DSDLMIXER_VORBIS_TREMOR=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
