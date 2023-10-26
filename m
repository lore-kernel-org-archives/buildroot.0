Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F29C25B48
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 09:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC7A1415AE;
	Thu, 26 Oct 2023 09:34:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC7A1415AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iQvCRwwwyNkX; Thu, 26 Oct 2023 09:34:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5D2241777;
	Thu, 26 Oct 2023 09:34:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5D2241777
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3152E1BF2B8
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC51641F78
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC51641F78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l0hHvzF6Bhya for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 09:27:34 +0000 (UTC)
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F66741F77
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 09:27:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F66741F77
Received: by mail-ej1-x644.google.com with SMTP id
 a640c23a62f3a-9adca291f99so99543966b.2
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 02:27:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698312452; x=1698917252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+rVyZN2Kn0A4zrKJ013m7q0ewCAtGk9GPYLrwE5nRi0=;
 b=pWDv/b6T9wfnqGvRndIh6zoO/diIAC5GkI9yNpnyAgrztWAaDx8fkZKCTWemjX7LjT
 Rf9GoHXNjgTHitdGLnQa00Fc/XDCOS651zmi3fuytOaSB5hat6pwuYnTASqZO3InALgi
 KBUKo2eEru4bGQUycGUgWu/is8yQ5YFPG/2XhGXmCdQ86TBIJgmacUScuYU130vUpGWn
 yflgABJHIjDReMmMEVOfHWh0AY0gy2JzDvnALcRjPTgo0pbbkljJ+QMocDfpTX5jE0lT
 52lGNm3OQiQyRgU4DkO/TeBz9/XZd/gEJdpKs3xjLlxHaztaxU7mzuESwC5k61pf3rKP
 5b0Q==
X-Gm-Message-State: AOJu0YzkTvBDrn/UwiATq8AzjDMPiVvb1IYCFKPEye5lmoQngQv1uD5y
 LyakQUwKDAaZkQ/QPeDKWZmhrp6Uwc8eX70y6TchPjIM0A2Lm5o3
X-Google-Smtp-Source: AGHT+IHaZkkHBO3CrwKjpT2uovYWc8twLNrz+or8dAWdTs44Ja9YKWcFq7/u2csOHPZvvBy2hL7gQQ==
X-Received: by 2002:a17:907:60d2:b0:9b2:7b89:8199 with SMTP id
 hv18-20020a17090760d200b009b27b898199mr14187233ejc.53.1698312452491; 
 Thu, 26 Oct 2023 02:27:32 -0700 (PDT)
Received: from fedora.. ([77.241.232.0]) by smtp.gmail.com with ESMTPSA id
 mb8-20020a170906eb0800b009b947f81c4asm11268438ejb.155.2023.10.26.02.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 02:27:31 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 11:26:59 +0200
Message-ID: <20231026092701.12345-29-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698312452; x=1698917252;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+rVyZN2Kn0A4zrKJ013m7q0ewCAtGk9GPYLrwE5nRi0=;
 b=rVK4Ach2xxeAzeRpMmIBPg0pf3D6nATerip2p0lvMpDNW6bHkMuNL2sETGneOQ3vOV
 D8QgbV6Zz2/a5r90Px3pSMmlPrpffqFsmb7b3/6zg7OBMuSzJDz2g/xdD9o7ykv6Blm5
 OKgRrC+FeVnB4b7R7zgDAr14ByPydqGsiVgcc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=rVK4Ach2
Subject: [Buildroot] [PATCH 28/30] package/python-pygame: drop package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The python-pygame package has not recieved any update since
Sun May 1 22:15:17 2016 (commit: a9ec96e545102ae5ccd4280323d35360b0a5072d)

As python 3.12.0 no longer supports distutils, drop the package as the package
is clearly unmaintained.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 Config.in.legacy                         |   7 ++
 package/Config.in                        |   2 -
 package/python-pygame/Config.in          |  50 ----------
 package/python-pygame/python-pygame.hash |   3 -
 package/python-pygame/python-pygame.mk   | 111 -----------------------
 5 files changed, 7 insertions(+), 166 deletions(-)
 delete mode 100644 package/python-pygame/Config.in
 delete mode 100644 package/python-pygame/python-pygame.hash
 delete mode 100644 package/python-pygame/python-pygame.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 8e406f2b13..f1d5f345c3 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -153,6 +153,13 @@ config BR2_PACKAGE_PYTHON_PYXB
 	  python-pyxb has been removed due to being abandoned and
 	  distutils no longer being supported in python 3.12.0.
 
+config BR2_PACKAGE_PYTHON_PYGAME
+	bool "python-pygame removed"
+	select BR2_LEGACY
+	help
+	  python-pygame has been removed due to being abandoned and
+	  distutils no longer being supported in python 3.12.0.
+
 config BR2_KERNEL_HEADERS_6_4
 	bool "kernel headers version 6.4.x are no longer supported"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 4e489c4706..d756094c4b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1228,7 +1228,6 @@ menu "External python modules"
 	source "package/python-pydyf/Config.in"
 	source "package/python-pyelftools/Config.in"
 	source "package/python-pyftpdlib/Config.in"
-	source "package/python-pygame/Config.in"
 	source "package/python-pygments/Config.in"
 	source "package/python-pyhamcrest/Config.in"
 	source "package/python-pyicu/Config.in"
@@ -1267,7 +1266,6 @@ menu "External python modules"
 	source "package/python-pytz/Config.in"
 	source "package/python-pyudev/Config.in"
 	source "package/python-pyusb/Config.in"
-	source "package/python-pyxb/Config.in"
 	source "package/python-pyyaml/Config.in"
 	source "package/python-pyzmq/Config.in"
 	source "package/python-qrcode/Config.in"
diff --git a/package/python-pygame/Config.in b/package/python-pygame/Config.in
deleted file mode 100644
index 57eb020742..0000000000
--- a/package/python-pygame/Config.in
+++ /dev/null
@@ -1,50 +0,0 @@
-config BR2_PACKAGE_PYTHON_PYGAME
-	bool "python-pygame"
-	select BR2_PACKAGE_SDL
-	help
-	  Pygame is a cross-platfrom library designed to make it easy
-	  to write multimedia software, such as games, in
-	  Python. Pygame requires the Python language and SDL
-	  multimedia library.
-	  It can also make use of several other popular libraries.
-
-	  http://www.pygame.org/
-
-if BR2_PACKAGE_PYTHON_PYGAME
-config BR2_PACKAGE_PYTHON_PYGAME_IMAGE
-	bool "pygame.image"
-	select BR2_PACKAGE_SDL_IMAGE
-	select BR2_PACKAGE_SDL_IMAGE_PNG
-	select BR2_PACKAGE_SDL_IMAGE_JPEG
-	help
-	  pygame module for loading, saving and transfering images.
-	  Will autoselect sdl_image with png and jpeg support.
-
-config BR2_PACKAGE_PYTHON_PYGAME_EXAMPLES
-	bool "pygame.examples"
-	help
-	  Include examples.
-	  Selecting this option adds about 1.5 MB to the target file
-	  system.
-
-config BR2_PACKAGE_PYTHON_PYGAME_FONT
-	bool "pygame.font"
-	select BR2_PACKAGE_SDL_TTF
-	help
-	  pygame module for loading and rendering fonts.
-	  Will autoselect sdl_ttf.
-
-config BR2_PACKAGE_PYTHON_PYGAME_MIXER
-	bool "pygame.mixer"
-	select BR2_PACKAGE_SDL_MIXER
-	help
-	  pygame module for loading and playing sounds.
-	  Will autoselect sdl_mixer.
-
-config BR2_PACKAGE_PYTHON_PYGAME_SCRAP
-	bool "pygame.scrap"
-	depends on BR2_PACKAGE_SDL_X11
-	help
-	  pygame module for clipboard support (X11 needed)
-
-endif
diff --git a/package/python-pygame/python-pygame.hash b/package/python-pygame/python-pygame.hash
deleted file mode 100644
index c0496515e2..0000000000
--- a/package/python-pygame/python-pygame.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  f95a7dd68ea294d415e36e068d2f533c5a01c67773452d14a535c5c7455681fe  pygame-d61ea8eabd56.tar.gz
-sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  LGPL
diff --git a/package/python-pygame/python-pygame.mk b/package/python-pygame/python-pygame.mk
deleted file mode 100644
index 600dd9e743..0000000000
--- a/package/python-pygame/python-pygame.mk
+++ /dev/null
@@ -1,111 +0,0 @@
-################################################################################
-#
-# python-pygame
-#
-################################################################################
-
-# stable 1.9.1 release requires V4L which has been wiped out of recent Linux
-# kernels, so use latest mercurial revision until next stable release is out.
-PYTHON_PYGAME_VERSION = d61ea8eabd56
-PYTHON_PYGAME_SOURCE = pygame-$(PYTHON_PYGAME_VERSION).tar.gz
-PYTHON_PYGAME_SITE = https://bitbucket.org/pygame/pygame
-PYTHON_PYGAME_SITE_METHOD = hg
-PYTHON_PYGAME_SETUP_TYPE = distutils
-PYTHON_PYGAME_LICENSE = LGPL-2.1+
-PYTHON_PYGAME_LICENSE_FILES = LGPL
-
-ifeq ($(BR2_PACKAGE_PYTHON_PYGAME_IMAGE),y)
-PYTHON_PYGAME_OPT_DEPENDS += sdl_image
-endif
-
-ifeq ($(BR2_PACKAGE_PYTHON_PYGAME_FONT),y)
-PYTHON_PYGAME_OPT_DEPENDS += sdl_ttf
-endif
-
-ifeq ($(BR2_PACKAGE_PYTHON_PYGAME_MIXER),y)
-PYTHON_PYGAME_OPT_DEPENDS += sdl_mixer
-endif
-
-PYTHON_PYGAME_DEPENDENCIES = sdl $(PYTHON_PYGAME_OPT_DEPENDS)
-
-ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_IMAGE),y)
-define PYTHON_PYGAME_UNCONFIGURE_IMAGE
-	$(SED) 's/^imageext/#imageext/' $(@D)/Setup
-endef
-endif
-
-ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_FONT),y)
-define PYTHON_PYGAME_UNCONFIGURE_FONT
-	$(SED) 's/^font/#font/' $(@D)/Setup
-endef
-endif
-
-ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_MIXER),y)
-define PYTHON_PYGAME_UNCONFIGURE_MIXER
-	$(SED) 's/^mixer/#mixer/g' $(@D)/Setup
-endef
-endif
-
-# Both require numpy or numeric python module
-define PYTHON_PYGAME_UNCONFIGURE_SNDARRAY
-	$(SED) 's/^_numericsndarray/#_numericsndarray/' $(@D)/Setup
-endef
-
-define PYTHON_PYGAME_UNCONFIGURE_SURFARRAY
-	$(SED) 's/^_numericsurfarray/#_numericsurfarray/' $(@D)/Setup
-endef
-
-# Requires smpeg
-define PYTHON_PYGAME_UNCONFIGURE_MOVIE
-	$(SED) 's/^movie/#movie/' $(@D)/Setup
-endef
-
-ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_SCRAP),y)
-define PYTHON_PYGAME_UNCONFIGURE_SCRAP
-	$(SED) 's/^scrap/#scrap/' $(@D)/Setup
-endef
-endif
-
-define PYTHON_PYGAME_UNCONFIGURE_FREETYPE
-	$(SED) 's/^_freetype/#_freetype/' $(@D)/Setup
-endef
-
-PYTHON_PYGAME_SDL_FLAGS = `$(STAGING_DIR)/usr/bin/sdl-config --cflags`
-PYTHON_PYGAME_SDL_FLAGS += `$(STAGING_DIR)/usr/bin/sdl-config --libs`
-
-# Pygame needs a Setup file where options should be commented out if
-# dependencies are not available
-define PYTHON_PYGAME_CONFIGURE_CMDS
-	cp -f $(@D)/Setup.in $(@D)/Setup
-	$(SED) "s~^SDL = ~SDL = $(PYTHON_PYGAME_SDL_FLAGS) \n#~" $(@D)/Setup
-	$(SED) 's/^pypm/#pypm/' $(@D)/Setup
-	$(PYTHON_PYGAME_UNCONFIGURE_IMAGE)
-	$(PYTHON_PYGAME_UNCONFIGURE_FONT)
-	$(PYTHON_PYGAME_UNCONFIGURE_MIXER)
-	$(PYTHON_PYGAME_UNCONFIGURE_SNDARRAY)
-	$(PYTHON_PYGAME_UNCONFIGURE_SURFARRAY)
-	$(PYTHON_PYGAME_UNCONFIGURE_MOVIE)
-	$(PYTHON_PYGAME_UNCONFIGURE_SCRAP)
-	$(PYTHON_PYGAME_UNCONFIGURE_FREETYPE)
-endef
-
-define PYTHON_PYGAME_REMOVE_DOC
-	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pygame/docs
-endef
-
-PYTHON_PYGAME_POST_INSTALL_TARGET_HOOKS += PYTHON_PYGAME_REMOVE_DOC
-
-define PYTHON_PYGAME_REMOVE_TESTS
-	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pygame/tests
-endef
-
-PYTHON_PYGAME_POST_INSTALL_TARGET_HOOKS += PYTHON_PYGAME_REMOVE_TESTS
-
-ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_EXAMPLES),y)
-define PYTHON_PYGAME_REMOVE_EXAMPLES
-	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/pygame/examples
-endef
-PYTHON_PYGAME_POST_INSTALL_TARGET_HOOKS += PYTHON_PYGAME_REMOVE_EXAMPLES
-endif
-
-$(eval $(python-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
