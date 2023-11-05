Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8B7C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 20:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD07240A6F;
	Sun,  5 Nov 2023 20:30:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD07240A6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yWOSsbZneI-d; Sun,  5 Nov 2023 20:30:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AC3140A98;
	Sun,  5 Nov 2023 20:30:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AC3140A98
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 98ED51BF48C
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71C95418A8
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71C95418A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1rAPP_tMwCHA for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 20:26:28 +0000 (UTC)
Received: from mail-oa1-x43.google.com (mail-oa1-x43.google.com
 [IPv6:2001:4860:4864:20::43])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C815418A7
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 20:26:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C815418A7
Received: by mail-oa1-x43.google.com with SMTP id
 586e51a60fabf-1ea82246069so2311653fac.3
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 12:26:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699215987; x=1699820787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eH8iLkUg0eAhZGytSej4TZxO58deOHZFSIiOY00d1YA=;
 b=iiaiK47RIf24YkhLX/sN3T4jwG7DCqLs43UGeF5H3/pR5eKqrdpMA7M/7vUzttKmK9
 nGU5nfWbbinzWLuV7CNMngjmG1ds9N+V/jFL1Dcy73evmyhXF4ZEP1ydBqFjcxIQ6FXY
 027JLOza+c9k29BV+Z+C3Br4QI+z+48CdIZs3wY/QDcnYR0jdqqKMnNZXy5Tz66xYiXs
 GsE52HAQCfM0bJo7d3JTsWhn9qvJoRsy9hrRMSIbI/7wWIdMEulnbCel1neq/5o91WHe
 /+YcxBQFGllORIFgnb5YS0hPlxX9PKqskn1GDGViQklMGEGToZu6gHVSj2jaanOW8ml1
 fbYA==
X-Gm-Message-State: AOJu0YzY4GJJBcar6qd1F0f2e2dI4ixevVjn9v/CBUSVjTzpGhi7PVwf
 3+/rmUrNeOKaddUAEAvlw63l9aQmbLFzZalMUzw5zbMciYQ=
X-Google-Smtp-Source: AGHT+IFki0Xb+V+QfQTUQKp8fVBUUcb4Vq3mo/IhD4g8oRBY88Txj309qRaK1/MihppbYDikPjaReQ==
X-Received: by 2002:a05:6358:7252:b0:168:d31f:9fe3 with SMTP id
 i18-20020a056358725200b00168d31f9fe3mr35761967rwa.23.1699215986910; 
 Sun, 05 Nov 2023 12:26:26 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a170902ee1400b001c735421215sm4478175plb.216.2023.11.05.12.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 12:26:26 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 13:25:50 -0700
Message-ID: <20231105202555.359391-19-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
References: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699215987; x=1699820787;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eH8iLkUg0eAhZGytSej4TZxO58deOHZFSIiOY00d1YA=;
 b=PXXF9UwwdsblQLY3EjnDBHAh+L0y2Q9iauVKInmMl/UNnspLbI3AmOWUEEfPHgOBwh
 HqRWEJdVAnq1+sECW/4Ut+JPlhv5vwTJJ/KtcA9zLbdsWLmslBerRI066AxDzR6H3XJC
 KBJpfGQsKR19v3vcrtYEkaZe1NgcKaRPswyBM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=PXXF9Uww
Subject: [Buildroot] [PATCH v2 19/24] package/python-pygame: drop package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The python-pygame package has not recieved any update since
Sun May 1 22:15:17 2016 (commit: a9ec96e545102ae5ccd4280323d35360b0a5072d)
As python 3.12.0 no longer supports distutils, drop the package as the package
is clearly unmaintained.

If someone wants to re-introduce this package at a later date they are more
than welcome to do so!

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2:
 - Remove python-pygame from the DEVELOPERS file
 - Don't remove python-pyxb from Config.in in this patch.

 DEVELOPERS                               |   1 -
 package/Config.in                        |   1 -
 package/python-pygame/Config.in          |  50 ----------
 package/python-pygame/python-pygame.hash |   3 -
 package/python-pygame/python-pygame.mk   | 111 -----------------------
 5 files changed, 166 deletions(-)
 delete mode 100644 package/python-pygame/Config.in
 delete mode 100644 package/python-pygame/python-pygame.hash
 delete mode 100644 package/python-pygame/python-pygame.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3334cad77f..b890fb2586 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1687,7 +1687,6 @@ F:	package/libcddb/
 F:	package/libmodbus/
 F:	package/ltris/
 F:	package/opentyrian/
-F:	package/python-pygame/
 
 N:	Julien Corjon <corjon.j@ecagroup.com>
 F:	package/qt5/
diff --git a/package/Config.in b/package/Config.in
index 32347fe4e8..19e5035878 100644
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
