Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99C5CAC5B5
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90A3F61623;
	Thu, 25 Sep 2025 20:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Svx8Jdre-btx; Thu, 25 Sep 2025 20:17:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B9EE6157C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B9EE6157C;
	Thu, 25 Sep 2025 20:17:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 93B12177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BA3F4129F
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nfsas669qyNb for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:17:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 630BD40066
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 630BD40066
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 630BD40066
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:19 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45ed646b656so9888215e9.3
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758831437; x=1759436237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hK8ugMqPaj6hmvDeH3T1XqkQeg5Fj9LSbDfjOGUj86I=;
 b=Ms3JcRDsq6+L4RVgCDlNPSJw4JdeJTAuIi4D/uOrOxB8i/jRSbPw8EMmu9VXBtlP09
 ax1RlZzDEx0d2qrf9kqAOjdqsBFhdYgH/zE9pB0Fr4vYM4aWUu324zA0Jc3vKq+qYZw4
 X8+SLSd9vO+0zvOLHq4VG2LfZsCDJQumWkT1rFMq6/NjAJ8Axb6iHxKtCXJWxgBVrpja
 XL1YBvmNNI9GgI+xmU6N0VlwG1FN40UpNy8299umbZJRArMyQxvP9Sd8oKcv7EGHocgy
 zn/RG2R+P7hAxemCbd+C3UAeqJEVgSlQQXEPqsLLOxLAD32MnZrqCceQGm33BhlB5WYo
 3IDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIX7hVe0i8jZgqWc0hj+tdet6NhAZ+zvrzi1lhhjsABStkA6uHvZVSyxqLvUjPbSkuhY/sDreAWt8=@buildroot.org
X-Gm-Message-State: AOJu0YxwLnWhpEBztn1DadGBr66r2t50+sPjbM3EX8hjxQiKkYCkO3XO
 7FlAQSI66Ys9yUusM+Uc7Lc0b/463doSBJJePmc4XXwLWzfZHxho8zt4395QxfRT288=
X-Gm-Gg: ASbGncu8q1W3zaixTADc918kvEDKICae9oyjCkIzrCgt/oAZOTw+ZnVuoDZjwjNNAtd
 hoTBqAKS/+Ma0rLiXljWQVQBqdNj9awe9LEN/r5qGZ4T05q8oY5dk9Ly6IFmu28dzDGuU/tKl/A
 yw/+ViB4RirNW0SR/zaDUYFHszzITIBtEKBJE4HmY9IK0bRNUjX+ny6IrwT07pPi8H5HhN/lldy
 mU6FfXPUdcGtYSWgZcWIanSNSmRRcQWoksmF6uagiC75/9ebOWqysfF62zFMKVx++Ratv+h5A7B
 lxfwNIw9AvgM9fdMyLc5ns5NiH1cK/us8oPBk08EvLlrx3dqqgKaydP6nLV4M/i2VYsN2hQ+rmO
 MFb+J60xmStpFEBHAPD8ZGtuK6Q==
X-Google-Smtp-Source: AGHT+IESaD5xw/OTx2hfcJOAYj6BPPjMeVgzo6+WAmLhCopTZUaO7Y0PV9qd7YkyhJNMhAmwItlAYA==
X-Received: by 2002:a05:600c:c04b:10b0:46e:2d0d:8053 with SMTP id
 5b1f17b1804b1-46e32a30481mr41120125e9.18.1758831437391; 
 Thu, 25 Sep 2025 13:17:17 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab31e97sm89947265e9.14.2025.09.25.13.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:17:17 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:17:16 +0200
Message-ID: <20250925201716.44780-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909072653.942584-1-thomas.petazzoni@bootlin.com>
References: <20250909072653.942584-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758831437; x=1759436237; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hK8ugMqPaj6hmvDeH3T1XqkQeg5Fj9LSbDfjOGUj86I=;
 b=fJWu7T8ssP4DGWLrq5NIIigQFDgT4mX2vEMP3kY9Nr6SN7A/etnpsJ67m7JOuPzaPO
 Gs8ADKggMeNQGMKdGGFtcjuzLFRUXSCumM1P5G1V7mvgjzIGniJyztws5akqdFX7lUM/
 fhhD8c1WnePZozkHCk9aHmZuIvyhqqXv6wm7TSl9ExoTZpOd+THHtB9MzgGG9HVKkF2X
 PELPXsmn79amWjjk7p0orvmpDPvHGjWGi0/IxvfQDnrhoJVT4iKrFzJ6zb/5OU7wDolp
 o8XPsDMcanBf+4wiomlexJQgHpZGuRcUmCAgBuK5wPlMTuKcCTGm61Vur0d9KpSFx1U0
 i0gQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fJWu7T8s
Subject: Re: [Buildroot] [PATCH] package/chocolate-doom: bump to 3.1.1 to
 fix GCC 15.x issues
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Changes in 3.1.0:
> 
>   https://github.com/chocolate-doom/chocolate-doom/releases/tag/chocolate-doom-3.1.0
> 
> Changes in 3.1.1:
> 
>   https://github.com/chocolate-doom/chocolate-doom/releases/tag/chocolate-doom-3.1.1
> 
> The SDL2_mixer and SDL2_net dependencies are now optional since 3.1.0,
> so adjust the packaging accordingly.
> 
> Fixes:
> 
>   https://autobuild.buildroot.net/results/90a01c5925e7f5f50b3ea06d6ea7b0da66814a15/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.08.x. Thanks

> ---
>  .checkpackageignore                           |  1 -
>  ...move-redundant-demoextend-definition.patch | 29 -------------------
>  package/chocolate-doom/Config.in              |  2 --
>  package/chocolate-doom/chocolate-doom.hash    |  2 +-
>  package/chocolate-doom/chocolate-doom.mk      | 22 ++++++++++++--
>  5 files changed, 20 insertions(+), 36 deletions(-)
>  delete mode 100644 package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 8cf2f4a215..5b0e0b177b 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -292,7 +292,6 @@ package/cdrkit/0003-Add-extern-to-char-outfile-declaration-to-fix-build-.patch l
>  package/cfm/S65cfm lib_sysv.Indent lib_sysv.Variables
>  package/cgroupfs-mount/S30cgroupfs Shellcheck lib_sysv.Indent lib_sysv.Variables
>  package/chipmunk/0001-Fix-build-failure-on-musl.patch lib_patch.Upstream
> -package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch lib_patch.Upstream
>  package/chrony/S49chronyd lib_sysv.Variables
>  package/cmake/0001-rename-cmake-rootfile.patch lib_patch.Upstream
>  package/cmocka/0001-Don-t-redefine-uintptr_t.patch lib_patch.Upstream
> diff --git a/package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch b/package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch
> deleted file mode 100644
> index 06bf54c583..0000000000
> --- a/package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From a8fd4b1f563d24d4296c3e8225c8404e2724d4c2 Mon Sep 17 00:00:00 2001
> -From: Jordan Christiansen <xordspar0@gmail.com>
> -Date: Sun, 15 Mar 2020 16:55:33 -0500
> -Subject: [PATCH] Remove redundant demoextend definition
> -
> -GCC 10 enables -fno-common by default, which causes the linker to fail when
> -there are multiple definitions of a global variable.
> -
> -See https://gcc.gnu.org/gcc-10/porting_to.html
> -
> -[Retrieved from:
> -https://github.com/chocolate-doom/chocolate-doom/commit/a8fd4b1f563d24d4296c3e8225c8404e2724d4c2]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - src/hexen/mn_menu.c | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/src/hexen/mn_menu.c b/src/hexen/mn_menu.c
> -index 059f45b3e..a97b7fcd1 100644
> ---- a/src/hexen/mn_menu.c
> -+++ b/src/hexen/mn_menu.c
> -@@ -131,7 +131,6 @@ boolean MenuActive;
> - int InfoType;
> - int messageson = true;
> - boolean mn_SuicideConsole;
> --boolean demoextend; // from h2def.h
> - 
> - // PRIVATE DATA DEFINITIONS ------------------------------------------------
> - 
> diff --git a/package/chocolate-doom/Config.in b/package/chocolate-doom/Config.in
> index 406b04ecf1..3cefd057ec 100644
> --- a/package/chocolate-doom/Config.in
> +++ b/package/chocolate-doom/Config.in
> @@ -3,8 +3,6 @@ config BR2_PACKAGE_CHOCOLATE_DOOM
>  	depends on BR2_USE_MMU # fork()
>  	depends on !BR2_STATIC_LIBS # sdl2
>  	select BR2_PACKAGE_SDL2
> -	select BR2_PACKAGE_SDL2_MIXER
> -	select BR2_PACKAGE_SDL2_NET
>  	help
>  	  Chocolate Doom is a set of conservative source ports for Doom,
>  	  Heretic, Hexen and Strife, with a philosophy of preserving the
> diff --git a/package/chocolate-doom/chocolate-doom.hash b/package/chocolate-doom/chocolate-doom.hash
> index 79eb1c6a3f..9d89b830f6 100644
> --- a/package/chocolate-doom/chocolate-doom.hash
> +++ b/package/chocolate-doom/chocolate-doom.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  d435d6177423491d60be706da9f07d3ab4fabf3e077ec2a3fc216e394fcfc8c7  chocolate-doom-3.0.1.tar.gz
> +sha256  1edcc41254bdc194beb0d33e267fae306556c4d24110a1d3d3f865717f25da23  chocolate-doom-3.1.1.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/chocolate-doom/chocolate-doom.mk b/package/chocolate-doom/chocolate-doom.mk
> index 581b2c51c2..599a15d3fa 100644
> --- a/package/chocolate-doom/chocolate-doom.mk
> +++ b/package/chocolate-doom/chocolate-doom.mk
> @@ -4,13 +4,15 @@
>  #
>  ################################################################################
>  
> -CHOCOLATE_DOOM_VERSION = 3.0.1
> -CHOCOLATE_DOOM_SITE = http://www.chocolate-doom.org/downloads/$(CHOCOLATE_DOOM_VERSION)
> +CHOCOLATE_DOOM_VERSION = 3.1.1
> +CHOCOLATE_DOOM_SITE = $(call github,chocolate-doom,chocolate-doom,chocolate-doom-$(CHOCOLATE_DOOM_VERSION))
>  CHOCOLATE_DOOM_LICENSE = GPL-2.0+
>  CHOCOLATE_DOOM_LICENSE_FILES = COPYING
>  CHOCOLATE_DOOM_CPE_ID_VENDOR = chocolate-doom
>  CHOCOLATE_DOOM_CPE_ID_PRODUCT = chocolate_doom
> -CHOCOLATE_DOOM_DEPENDENCIES = host-pkgconf sdl2 sdl2_mixer sdl2_net
> +CHOCOLATE_DOOM_DEPENDENCIES = host-pkgconf sdl2
> +# Fetch from git
> +CHOCOLATE_DOOM_AUTORECONF = YES
>  
>  # Avoid installing desktop entries, icons, etc.
>  CHOCOLATE_DOOM_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-exec
> @@ -23,6 +25,20 @@ endif
>  
>  CHOCOLATE_DOOM_CONF_ENV += CFLAGS="$(CHOCOLATE_DOOM_CFLAGS)"
>  
> +ifeq ($(BR2_PACKAGE_SDL2_MIXER),y)
> +CHOCOLATE_DOOM_DEPENDENCIES += sdl2_mixer
> +CHOCOLATE_DOOM_CONF_OPTS += --enable-sdl2mixer
> +else
> +CHOCOLATE_DOOM_CONF_OPTS += --disable-sdl2mixer
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SDL2_NET),y)
> +CHOCOLATE_DOOM_DEPENDENCIES += sdl2_net
> +CHOCOLATE_DOOM_CONF_OPTS += --enable-sdl2net
> +else
> +CHOCOLATE_DOOM_CONF_OPTS += --disable-sdl2net
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBPNG),y)
>  CHOCOLATE_DOOM_DEPENDENCIES += libpng
>  CHOCOLATE_DOOM_CONF_OPTS += --with-libpng
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
