Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 963C6C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 11:15:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B91960BD3
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 11:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B91960BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8ADC40236;
	Sun,  1 Aug 2021 11:15:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O5UoaUl0gJZX; Sun,  1 Aug 2021 11:15:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16AEB4032F;
	Sun,  1 Aug 2021 11:15:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE1AB1BF303
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 11:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD1B66060A
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 11:15:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cm-NZ38q7c4q for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 11:15:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1FC2F605AC
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 11:15:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f047:5d71:3678:2af])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id B16E420036C;
 Sun,  1 Aug 2021 13:15:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627816516;
 bh=aCL4dQewy9KNsC/abiz3OLLr8jZBJem7cyoTi6MJDNs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jsOPwSQLchxTd/NNbQfW9ak4UBRkGG0FDJ6A0mp/T+Ahi7BWtewgS16+HoBO7bP3Q
 Mi9sbcn/P6VPYH7/AgdGrYerrLa7tazHQidQImzMeEkTFR+i+sxO43HVQN0/LYkhyR
 rJ0XCm18AHBoFPpziQgoDpcov0q3XC2sczfPycFz4vSTUMC1ScS8bRcYbaHfHtZAtZ
 Y5fuMxWitPtu8C1VrHGNfnV/jKEGHnm+qJN2YUA8QquszHPv/jJd0lvnjrBkKtp17o
 z3wNkqF1SjIv8gSYvfp1RwB15cewsKTimETfha6LdwhcXV/vpX9lr7iQHk5eeIjQvu
 McXyMM1hqklCA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 Aug 2021 13:15:12 +0200
Date: Sun, 1 Aug 2021 13:15:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20210801111512.GR3189549@scaer>
References: <20210801061225.4718-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210801061225.4718-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libsoil: remove package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Bernd, All,

On 2021-08-01 08:12 +0200, Bernd Kuhls spake thusly:
> All kodi screensavers previously needing libsoil removed the dependency.

I was going to say that this is not a sufficient reason to drop libsoil.
Indeed, other packages (not in Buildoroot) may use libsoil, adn as long
as libsoil does not cause any unsolvable build failure, we could very
well keep it.

So I went on to check the state of that package:

    Documented homepage: http://www.lonesock.net/soil.html  --> empty

And if we lok at the page code, we can see it is forwarding to aparking
site...

And as a consequence, the upstream download location returns 404.

To top it off, the source archive, a zip file, was not even
version-named.

So this package is most probably really not used.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> For reference:
> https://github.com/xbmc/screensaver.matrixtrails/commit/92a0d44e9151cfce3be74e81a3e39f0688d69b7a
> https://github.com/xbmc/screensaver.asterwave/commit/8a778873754de09c93031408c71b3c40d198f3bc
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: Fixed typo in Config.in.legacy
> 
>  Config.in.legacy                        |  7 ++++
>  DEVELOPERS                              |  1 -
>  package/Config.in                       |  1 -
>  package/libsoil/0001-fix-makefile.patch | 40 --------------------
>  package/libsoil/Config.in               | 12 ------
>  package/libsoil/libsoil.hash            |  4 --
>  package/libsoil/libsoil.mk              | 50 -------------------------
>  7 files changed, 7 insertions(+), 108 deletions(-)
>  delete mode 100644 package/libsoil/0001-fix-makefile.patch
>  delete mode 100644 package/libsoil/Config.in
>  delete mode 100644 package/libsoil/libsoil.hash
>  delete mode 100644 package/libsoil/libsoil.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 5233785209..891eee98cc 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>  
>  comment "Legacy options removed in 2021.08"
>  
> +config BR2_PACKAGE_LIBSOIL
> +	bool "libsoil package removed"
> +	select BR2_LEGACY
> +	help
> +	  The libsoil package was removed. All packages needing
> +	  libsoil removed the dependency.
> +
>  config BR2_PACKAGE_CLAPACK
>  	bool "cblas/clapack package removed"
>  	select BR2_LEGACY
> diff --git a/DEVELOPERS b/DEVELOPERS
> index adfcc96059..114e133e94 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -387,7 +387,6 @@ F:	package/libpng/
>  F:	package/libsidplay2/
>  F:	package/libsilk/
>  F:	package/libsndfile/
> -F:	package/libsoil/
>  F:	package/libsoundtouch/
>  F:	package/libsquish/
>  F:	package/libudfread/
> diff --git a/package/Config.in b/package/Config.in
> index 5066690a81..09cac91fb0 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1512,7 +1512,6 @@ menu "Graphics"
>  	source "package/libqrencode/Config.in"
>  	source "package/libraw/Config.in"
>  	source "package/librsvg/Config.in"
> -	source "package/libsoil/Config.in"
>  	source "package/libsvg/Config.in"
>  	source "package/libsvg-cairo/Config.in"
>  	source "package/libsvgtiny/Config.in"
> diff --git a/package/libsoil/0001-fix-makefile.patch b/package/libsoil/0001-fix-makefile.patch
> deleted file mode 100644
> index 310d26448b..0000000000
> --- a/package/libsoil/0001-fix-makefile.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -Various makefile fixes to allow cross compilation
> -
> -Partly ported from
> -http://anonscm.debian.org/cgit/pkg-games/libsoil.git/tree/debian/patches/linking_correctly.patch
> -
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> -
> -diff -uNr soil.org/projects/makefile/alternate_Makefile.txt soil/projects/makefile/alternate_Makefile.txt
> ---- soil.org/projects/makefile/alternate_Makefile.txt	2008-07-07 18:13:28.000000000 +0200
> -+++ soil/projects/makefile/alternate_Makefile.txt	2015-11-07 11:15:04.140106336 +0100
> -@@ -1,8 +1,8 @@
> - MAKE = make
> --CC = gcc
> --INSTALL_FILE = install -p -o root -g root -m 644
> --INSTALL_DIR = install -p -o root -g root -d
> --LN = ln -s
> -+CC = $(GCC)
> -+INSTALL_FILE = $(INSTALL) -m 644
> -+INSTALL_DIR = $(INSTALL) -d
> -+LN = ln -sf
> - RM = rm -fv
> - CFLAGS += -c -O2 -Wall
> - LDFLAGS +=
> -@@ -23,13 +23,13 @@
> - all: $(OFILES) lib
> - 
> - %.o: %.c
> --	$(CC) $(CFLAGS) $< -o $@
> -+	$(CC) $(CFLAGS) -c -fPIC $< -o $@
> - 
> - lib: $(OFILES)
> - 	# create static library
> --	ar -cvq $(LIBNAME).a $(OFILES)
> -+	$(AR) -cvq $(LIBNAME).a $(OFILES)
> - 	# create shared library
> --	gcc -shared -Wl,-soname,$(LIBNAME).so.$(MAJOR) -o $(LIBNAME).so.$(VERSION) $(OFILES)
> -+	$(CC) -shared -Wl,-soname,$(LIBNAME).so.$(MAJOR) -o $(LIBNAME).so.$(VERSION) $(OFILES) -lGL -lm
> - 
> - install:
> - 	$(INSTALL_DIR) $(DESTDIR)/$(INCLUDEDIR)
> diff --git a/package/libsoil/Config.in b/package/libsoil/Config.in
> deleted file mode 100644
> index aea0cc3548..0000000000
> --- a/package/libsoil/Config.in
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -config BR2_PACKAGE_LIBSOIL
> -	bool "libsoil"
> -	depends on BR2_PACKAGE_HAS_LIBGL
> -	depends on !BR2_STATIC_LIBS
> -	help
> -	  SOIL is a tiny C library used primarily for uploading
> -	  textures into OpenGL.
> -
> -	  http://www.lonesock.net/soil.html
> -
> -comment "libsoil needs an OpenGL backend and a toolchain w/ dynamic library"
> -	depends on !BR2_PACKAGE_HAS_LIBGL || BR2_STATIC_LIBS
> diff --git a/package/libsoil/libsoil.hash b/package/libsoil/libsoil.hash
> deleted file mode 100644
> index 2596cd6b4d..0000000000
> --- a/package/libsoil/libsoil.hash
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -# Locally calculated
> -sha256  a2305b8d64f6d636e36d669bbdb0ca5445d1345c754b3d61d3f037dad2e5f701  soil.zip
> -sha256  a53f0508cafb544aa0b11c241c1000055bd9d827d19712f4de08898e36f29728  src/stb_image_aug.c
> -sha256  449ba815b6f610660515246d029f5d08b45178fe8f9f9f520939edad85a7935e  src/image_helper.c
> diff --git a/package/libsoil/libsoil.mk b/package/libsoil/libsoil.mk
> deleted file mode 100644
> index 2945edd8dd..0000000000
> --- a/package/libsoil/libsoil.mk
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -################################################################################
> -#
> -# libsoil
> -#
> -################################################################################
> -
> -LIBSOIL_VERSION = 20080707
> -LIBSOIL_SOURCE = soil.zip
> -LIBSOIL_SITE = http://www.lonesock.net/files
> -LIBSOIL_INSTALL_STAGING = YES
> -LIBSOIL_DEPENDENCIES = libgl
> -LIBSOIL_LICENSE = Public Domain, MIT
> -LIBSOIL_LICENSE_FILES = src/stb_image_aug.c src/image_helper.c
> -LIBSOIL_MAKEFILE = ../projects/makefile/alternate_Makefile.txt
> -
> -define LIBSOIL_EXTRACT_CMDS
> -	$(UNZIP) -d $(@D) $(LIBSOIL_DL_DIR)/$(LIBSOIL_SOURCE)
> -	mv $(@D)/Simple\ OpenGL\ Image\ Library/* $(@D)
> -endef
> -
> -# gnu patch < v2.5.9 doesn't correctly handle spaces in file names,
> -# and we want to patch the 'alternate Makefile.txt' file, so rename
> -# the file (and patch the renamed file) for compatibility with older
> -# distributions
> -define REMOVE_SPACE_FROM_FILENAME
> -	cd $(@D)/projects/makefile/ && \
> -		mv "alternate Makefile.txt" alternate_Makefile.txt
> -endef
> -LIBSOIL_POST_EXTRACT_HOOKS += REMOVE_SPACE_FROM_FILENAME
> -
> -define LIBSOIL_BUILD_CMDS
> -	$(MAKE) $(TARGET_CONFIGURE_OPTS) -f $(LIBSOIL_MAKEFILE) \
> -		-C $(@D)/src
> -endef
> -
> -define LIBSOIL_INSTALL_STAGING_CMDS
> -	$(MAKE) $(TARGET_CONFIGURE_OPTS) -f $(LIBSOIL_MAKEFILE) \
> -		DESTDIR=$(STAGING_DIR) install \
> -		INSTALL=$(INSTALL) \
> -		-C $(@D)/src
> -endef
> -
> -define LIBSOIL_INSTALL_TARGET_CMDS
> -	$(MAKE) $(TARGET_CONFIGURE_OPTS) -f $(LIBSOIL_MAKEFILE) \
> -		DESTDIR=$(TARGET_DIR) install \
> -		INSTALL=$(INSTALL) \
> -		-C $(@D)/src
> -endef
> -
> -$(eval $(generic-package))
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
