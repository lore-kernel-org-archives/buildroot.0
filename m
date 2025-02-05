Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9941FC02196
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 12:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E476B407C0;
	Wed,  5 Feb 2025 12:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GghvDLdjo4tx; Wed,  5 Feb 2025 12:06:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B84A40653
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B84A40653;
	Wed,  5 Feb 2025 12:06:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 49E4212F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B74B409EF
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:06:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5inmJ-0wtUnL for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 12:06:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 14A524022B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14A524022B
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14A524022B
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:06:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5E9C43426;
 Wed,  5 Feb 2025 12:06:45 +0000 (UTC)
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Wed, 05 Feb 2025 13:06:33 +0100
MIME-Version: 1.0
Message-Id: <20250205-remove_mimic-v1-1-5315e747c71b@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAEhUo2cC/x3MTQqAIBBA4avIrBNMsUVXiQh/ppqFGgoSiHdPW
 n6L9xoUzIQFVtYgY6VCKQ7MEwN3m3ghJz8MUkgtpNA8Y0gVj0CBHPcKjbXKWLlYGMmT8aT3321
 77x/r+uZoXgAAAA==
X-Change-ID: 20250205-remove_mimic-d3eabb3ab26b
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpefvhhhomhgrshcuuehonhhnvghfihhllhgvuceothhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfeekffejgeekgfdutdefjefhleeileettdegheffgedtffetvdeuveegfefgtedunecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghloheplgdujedvrdduiedrvddruddtlegnpdhmrghilhhfrhhomhepthhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegviigvqhhui
 hgvlhesvhgrnhhguhgrrhguihgrshhurhdrtghomhdrrghrpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomh
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738757206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qRt7tZB0hnWuS962HxhEIJPxYjtfQNJDg6xuq3sz9+c=;
 b=UpsxCFCDrPPfaTIOpdXLqxMpjrX2lH8t4kR8c3Qk0LZg5fcj9NSMv0/+u0tDDgRUWXw9zF
 WaYHCI6L3j7c2cz2VAq4HMcTmn/wP1hdSze9jc9wo33or95eNKYoJSOwt9xpL2FSO5lwL0
 3OG8y2KKl+ps+6PZcJilPXooMSEcEnlxwo0eGhqZaSYrHvXrFX0tmjtWHGbXxDr6NqRjiC
 hNzi63Xq1sdbmSCjD2qtIzCnZSRyfZSaiy4I4T/bEQw7XXEbNcQrxG2zRyeayZFL0s6a6w
 efjRiTn3w5LuGozdW/4Pr8rxcaU+oo6r1SC+SEo24ChBFw0XVBflYVTdxaq10Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UpsxCFCD
Subject: [Buildroot] [PATCH] package/mimic: remove the mimic package
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

The mimic package hasn't been updated in recent years and
downloading this package is now broken.
This commit removes the mimic package.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 Config.in.legacy                                   |  6 ++++
 DEVELOPERS                                         |  1 -
 package/Config.in                                  |  1 -
 .../0001-Fix-linking-on-gcc-10.2.0-or-newer.patch  | 27 --------------
 package/mimic/Config.in                            | 41 ----------------------
 package/mimic/mimic.hash                           |  3 --
 package/mimic/mimic.mk                             | 29 ---------------
 7 files changed, 6 insertions(+), 102 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index e091fd8c0a972c3043e9664652e3d40e6d83af8b..41f9876edfbd64cf504739f9e61e9fb39a463f36 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -172,6 +172,12 @@ config BR2_PACKAGE_DIRECTFB
 	  This package was no longer maintained upstream, so it was
 	  dropped from Buildroot.
 
+config BR2_PACKAGE_MIMIC
+	bool "mimic has been removed"
+	select BR2_LEGACY
+	help
+	  The mimic package has been removed from Buildroot.
+
 config BR2_PACKAGE_SDL2_DIRECTFB
 	bool "sdl2 directfb support removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 5ca66b2f2841bec4d6fe0c39a373dc6d3d7fcb94..c131c9bf47ad87f5f8caaa37cde619de361baf45 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -953,7 +953,6 @@ F:	configs/ci20_defconfig
 F:	package/fio/
 F:	package/iptraf-ng/
 F:	package/jimtcl/
-F:	package/mimic/
 F:	package/nodm/
 F:	package/openbox/
 F:	package/supertuxkart/
diff --git a/package/Config.in b/package/Config.in
index 3f4dd42cbe481de470e3e818d9692640950cc76b..71f5a9d81455049fee01251b271a18bac2c53630 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -31,7 +31,6 @@ menu "Audio and video applications"
 	source "package/kodi/Config.in"
 	source "package/lame/Config.in"
 	source "package/madplay/Config.in"
-	source "package/mimic/Config.in"
 	source "package/minimodem/Config.in"
 	source "package/miraclecast/Config.in"
 	source "package/mjpegtools/Config.in"
diff --git a/package/mimic/0001-Fix-linking-on-gcc-10.2.0-or-newer.patch b/package/mimic/0001-Fix-linking-on-gcc-10.2.0-or-newer.patch
deleted file mode 100644
index ea02bf587e033aab8f408ea48a20ce5798095c3c..0000000000000000000000000000000000000000
--- a/package/mimic/0001-Fix-linking-on-gcc-10.2.0-or-newer.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 77b36eaeb2c38eba571b8db7e9bb0fd507774e6d Mon Sep 17 00:00:00 2001
-From: Kris Gesling <kris.gesling@mycroft.ai>
-Date: Tue, 11 May 2021 09:15:22 +0930
-Subject: [PATCH] Fix linking on gcc 10.2.0 or newer
-
-Co-authored-by: MichaelSabal <michaelsabal@users.noreply.github.com>
-
-[Retrieved from:
-https://github.com/MycroftAI/mimic1/commit/77b36eaeb2c38eba571b8db7e9bb0fd507774e6d]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lang/cmu_indic_lang/cmu_indic_lang.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lang/cmu_indic_lang/cmu_indic_lang.h b/lang/cmu_indic_lang/cmu_indic_lang.h
-index 75ee46c..83e2afa 100644
---- a/lang/cmu_indic_lang/cmu_indic_lang.h
-+++ b/lang/cmu_indic_lang/cmu_indic_lang.h
-@@ -51,7 +51,7 @@ void cmu_indic_lang_init(cst_voice *v);
- extern const cst_phoneset cmu_indic_phoneset;
- extern const cst_cart cmu_indic_phrasing_cart; 
- 
--const cst_regex * const cst_rx_not_indic;
-+extern const cst_regex * const cst_rx_not_indic;
- 
- #ifdef __cplusplus
- } /* extern "C" */
diff --git a/package/mimic/Config.in b/package/mimic/Config.in
deleted file mode 100644
index 79641d37902e6456bee9e9d93004390214fd0fec..0000000000000000000000000000000000000000
--- a/package/mimic/Config.in
+++ /dev/null
@@ -1,41 +0,0 @@
-comment "mimic needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
-
-config BR2_PACKAGE_MIMIC
-	bool "mimic"
-	depends on BR2_USE_WCHAR
-	help
-	  Mimic is a fast, lightweight Text-to-speech engine developed
-	  by Mycroft A.I. and VocaliD, based on Carnegie Mellon
-	  University's Flite (Festival-Lite) software. Mimic takes in
-	  text and reads it out loud to create a high quality voice.
-
-	  https://github.com/MycroftAI/mimic
-
-if BR2_PACKAGE_MIMIC
-
-choice
-	prompt "audio backend"
-	default BR2_PACKAGE_MIMIC_AUDIO_BACKEND_NONE
-
-config BR2_PACKAGE_MIMIC_AUDIO_BACKEND_NONE
-	bool "none"
-	help
-	  With no backend, mimic will only be able to produce .wav
-	  files.
-
-config BR2_PACKAGE_MIMIC_AUDIO_BACKEND_ALSA
-	bool "alsa"
-	depends on BR2_PACKAGE_ALSA_LIB
-
-config BR2_PACKAGE_MIMIC_AUDIO_BACKEND_PORTAUDIO
-	bool "alsa via portaudio"
-	depends on BR2_PACKAGE_PORTAUDIO
-
-config BR2_PACKAGE_MIMIC_AUDIO_BACKEND_PULSEAUDIO
-	bool "pulseaudio"
-	depends on BR2_PACKAGE_PULSEAUDIO
-
-endchoice
-
-endif # BR2_PACKAGE_MIMIC
diff --git a/package/mimic/mimic.hash b/package/mimic/mimic.hash
deleted file mode 100644
index 10780d415d427c1455cbb4d83e91790b02908cd9..0000000000000000000000000000000000000000
--- a/package/mimic/mimic.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  725003c9972d5b67c49d5ea6a89cb26b63414ff2c7adbbaf9200cf9eb55f80eb  mimic-1.1.0.tar.gz
-sha256  c423c1c6d260091d80ee4c00f386a10fea39963a3f1530f2c245f15dd20324ee  COPYING
diff --git a/package/mimic/mimic.mk b/package/mimic/mimic.mk
deleted file mode 100644
index 2d246561c96696ae80e97d69a577d8f25180fc06..0000000000000000000000000000000000000000
--- a/package/mimic/mimic.mk
+++ /dev/null
@@ -1,29 +0,0 @@
-################################################################################
-#
-# mimic
-#
-################################################################################
-
-MIMIC_VERSION = 1.1.0
-MIMIC_SITE = $(call github,MycroftAI,mimic,$(MIMIC_VERSION))
-MIMIC_LICENSE = MIT
-MIMIC_LICENSE_FILES = COPYING
-
-MIMIC_DEPENDENCIES = host-pkgconf
-
-ifeq ($(BR2_PACKAGE_MIMIC_AUDIO_BACKEND_ALSA),y)
-MIMIC_AUDIO_BACKEND = alsa
-MIMIC_DEPENDENCIES += alsa-lib
-else ifeq ($(BR2_PACKAGE_MIMIC_AUDIO_BACKEND_PORTAUDIO),y)
-MIMIC_AUDIO_BACKEND = portaudio
-MIMIC_DEPENDENCIES += portaudio
-else ifeq ($(BR2_PACKAGE_MIMIC_AUDIO_BACKEND_PULSEAUDIO),y)
-MIMIC_AUDIO_BACKEND = pulseaudio
-MIMIC_DEPENDENCIES += pulseaudio
-else ifeq ($(BR2_PACKAGE_MIMIC_AUDIO_BACKEND_NONE),y)
-MIMIC_AUDIO_BACKEND = none
-endif
-
-MIMIC_CONF_OPTS += --with-audio=$(MIMIC_AUDIO_BACKEND)
-
-$(eval $(autotools-package))

---
base-commit: d5b3795e92727c6565901cddf0c0f17c7854df56
change-id: 20250205-remove_mimic-d3eabb3ab26b

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
