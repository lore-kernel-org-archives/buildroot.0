Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9C3C5AD7B
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 18:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3F32404F8;
	Sun,  9 Aug 2026 18:09:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lk-WNNPmoGxY; Sun,  9 Aug 2026 18:09:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFF3440500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786298976;
	bh=wf7SFjiOdfd7CZOAGUyUtsMu8DHTISDh1+NShWRD3CU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=M+znyzomg8HnkxRx46sCkr51OSyBmSEajNnxgFtNvJHGaD2Q5KUTOZccaBGR9PgZ8
	 h3cdhxpSbyYBAbx542G9k0fhqxRBNrXPMfKOtSBYQHkZC+oMuQYOFf32dtaK5b369r
	 rGj1k+p3JgD7uoJwK3kErHmblErsh98EXu4ZBE0b3lW4WjNFAfM4FSEcMfD0WSpqlA
	 8emZZcWgt0p9UhULExElgTT8VJo4pqoqeMdkQGWuAOAF2dj5XTcoRPMmMPcphtKThU
	 48lpx085rEjF1Q5Fwr9WAiFfP9S9pEPS5bUGqW9b0uferTUZoe+lvcn3Ft2kEOMXGt
	 M07FrBl7GR/Mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFF3440500;
	Sun,  9 Aug 2026 18:09:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D556B28A
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 18:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6AD980D39
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 18:09:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yjUMXVrpi4Ty for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 18:09:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A84CC80D10
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A84CC80D10
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A84CC80D10
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 18:09:34 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CC91060128;
 Sun,  9 Aug 2026 20:09:30 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun,  9 Aug 2026 20:09:26 +0200
Message-ID: <20260809180926.2942045-1-ju.o@free.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786298972;
 bh=seZH4MeAsG4KuUZUcJVliHDoaTazf8jqRvB0SovnRnE=;
 h=From:To:Cc:Subject:Date:From;
 b=M62bEbyS6nmYHuJV2p10ujGCdFUWDbsgDnClqXbMvTMt679bPA8KOP3By+R8yB/M+
 v2KUgfidQ9T77sLA5DRuELuhAkKfTkX8lpHywXUTtUlDw2yoHxr3SY9a5ciqA7QEWB
 1MoPyHaNHOF6BSiKUZYZsZCjPTDnThuzSHeKyI91UgaDKVZ5FE591I343toBsRWa0x
 5eHhIli/H2NvbuFkW1xDXj7l0MpuSxCS0YPUIS/dpjGuCh1vedEn/Ef1ZL3BOD2EDO
 0hFyOshl+vm1IEvu46ADH2kVtPuPneZPIN7o9hIJlEFaLjr7JoVg0FUQUf74DXvMsn
 Z7DmAVrJGSahg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M62bEbyS
Subject: [Buildroot] [PATCH 1/1] package/fluidsynth: security bump to
 version 2.5.7
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since v2.4.7, see:
https://github.com/FluidSynth/fluidsynth/releases

According to:
https://github.com/FluidSynth/fluidsynth/blob/master/doc/wiki/ChangeLog.md

FluidSynth 2.5.6 fixes:
CVE-2026-58264 - a heap-based buffer overrun in command handler (GHSA-mqmq-w63q-cj94)
CVE-2026-61714 - a heap-based buffer overflow in MIDI player (GHSA-976m-35rw-h3m6)
CVE-2026-61721 - a heap-based buffer overrun for DLS samples (GHSA-59ph-rx8r-8p4j)
CVE-2026-61723 - a DLS ptbl chunk integer overflow (GHSA-r4mc-v3p8-pv47)
CVE-2026-61722 - a DLS articulation chunk integer overflow (GHSA-hp72-35pr-6h6r)
CVE-2026-61720 - a SF2 DMOD chunk integer underflow (GHSA-rmc4-c8hw-455w)

FluidSynth 2.5.2 fixes:
CVE-2025-68617 - a heap-based use-after-free involving DLS files (GHSA-ffw2-xvvp-39ch)

SDL2 audio support was removed upstream in commit:
https://github.com/FluidSynth/fluidsynth/commit/89145b004a44a53e734b6bf82a73cef255baef5d

It was replaced by the newer SDL3. This commit reflects that change
(update option name and comments, add legacy option entry).

Also, dynamic library dependency was added in Buildroot commit:
https://gitlab.com/buildroot.org/buildroot/-/commit/111a1c7091aed6f9da03c2a095bcc2f50a1ad32c
This commot removes the duplicate dependency for SDL3.

FluidSynth also added a native DLS soundfont support in:
https://github.com/FluidSynth/fluidsynth/commit/c959f8d208bbad9e396dfb745285806b5a4c5a07
It is enabled by default and uses C++17. This commit adds a new
option with a dependency on gcc >= 7.

The license option hash is also updated, after the FSF address
update in:
https://github.com/FluidSynth/fluidsynth/commit/db42fa333baf1cb7c60556ab75ad1e592c850f68

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/pipelines/2745501844

Note to the LTS maintainers:

The CVEs fixed here are a bit hard to backport.
This new FluidSynth version also depends of a new SDL3 library.

I let you decide what to do (update the package in LTS, do nothing,
try to backport, or remove the package). What would be your opinion
in such a case?
---
 Config.in.legacy                   |  6 ++++++
 package/fluidsynth/Config.in       | 21 +++++++++++++--------
 package/fluidsynth/fluidsynth.hash |  4 ++--
 package/fluidsynth/fluidsynth.mk   | 16 +++++++++++-----
 4 files changed, 32 insertions(+), 15 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index e2f9d9131f..49d2e33513 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.08"
 
+config BR2_PACKAGE_FLUIDSYNTH_SDL2
+	bool "fluidsynth sdl2 audio support removed"
+	select BR2_LEGACY
+	help
+	  FluidSynth SDL2 audio support was removed in v2.5.0.
+
 config BR2_PACKAGE_TS4900_FPGA
 	bool "ts4900-fpga removed"
 	select BR2_LEGACY
diff --git a/package/fluidsynth/Config.in b/package/fluidsynth/Config.in
index 66fb07f45e..206824560b 100644
--- a/package/fluidsynth/Config.in
+++ b/package/fluidsynth/Config.in
@@ -84,15 +84,11 @@ comment "pulseaudio support needs a toolchain w/ dynamic library, wchar, threads
 	depends on BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC
 	depends on BR2_STATIC_LIBS || !BR2_USE_MMU || !BR2_TOOLCHAIN_HAS_THREADS
 
-config BR2_PACKAGE_FLUIDSYNTH_SDL2
-	bool "sdl2"
-	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_SDL2
+config BR2_PACKAGE_FLUIDSYNTH_SDL3
+	bool "sdl3"
+	select BR2_PACKAGE_SDL3
 	help
-	  Enable SDL2 audio support.
-
-comment "SDL2 audio support needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+	  Enable SDL3 audio support.
 
 comment "Misc options"
 
@@ -114,6 +110,15 @@ config BR2_PACKAGE_FLUIDSYNTH_FLOATS
 	  Enable 32-bit single precision float support, instead of
 	  64-bit double precision floats for DSP samples.
 
+config BR2_PACKAGE_FLUIDSYNTH_NATIVE_DLS
+	bool "Native DLS soundfont"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	help
+	  Enable the native DLS soundfont format support.
+
+comment "native dls soundfont support needs gcc >= 7"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
+
 config BR2_PACKAGE_FLUIDSYNTH_READLINE
 	bool "readline"
 	select BR2_PACKAGE_READLINE
diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
index 9953997692..0d727e75e6 100644
--- a/package/fluidsynth/fluidsynth.hash
+++ b/package/fluidsynth/fluidsynth.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7fb0e328c66a24161049e2b9e27c3b6e51a6904b31b1a647f73cc1f322523e88  fluidsynth-2.4.7.tar.gz
-sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
+sha256  ce27840221ab00dd59bf27e85ecbba480c6c2a7c9fbec4243658f68f59c07f4a  fluidsynth-2.5.7.tar.gz
+sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  LICENSE
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index e06afe4a07..1d6cb118ff 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUIDSYNTH_VERSION = 2.4.7
+FLUIDSYNTH_VERSION = 2.5.7
 FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
 FLUIDSYNTH_LICENSE = LGPL-2.1+
 FLUIDSYNTH_LICENSE_FILES = LICENSE
@@ -46,6 +46,12 @@ else
 FLUIDSYNTH_CONF_OPTS += -Denable-libsndfile=0
 endif
 
+ifeq ($(BR2_PACKAGE_FLUIDSYNTH_NATIVE_DLS),y)
+FLUIDSYNTH_CONF_OPTS += -Denable-native-dls=1
+else
+FLUIDSYNTH_CONF_OPTS += -Denable-native-dls=0
+endif
+
 ifeq ($(BR2_PACKAGE_FLUIDSYNTH_PORTAUDIO),y)
 FLUIDSYNTH_CONF_OPTS += -Denable-portaudio=1
 FLUIDSYNTH_DEPENDENCIES += portaudio
@@ -67,11 +73,11 @@ else
 FLUIDSYNTH_CONF_OPTS += -Denable-readline=0
 endif
 
-ifeq ($(BR2_PACKAGE_FLUIDSYNTH_SDL2),y)
-FLUIDSYNTH_CONF_OPTS += -Denable-sdl2=1
-FLUIDSYNTH_DEPENDENCIES += sdl2
+ifeq ($(BR2_PACKAGE_FLUIDSYNTH_SDL3),y)
+FLUIDSYNTH_CONF_OPTS += -Denable-sdl3=1
+FLUIDSYNTH_DEPENDENCIES += sdl3
 else
-FLUIDSYNTH_CONF_OPTS += -Denable-sdl2=0
+FLUIDSYNTH_CONF_OPTS += -Denable-sdl3=0
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
