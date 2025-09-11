Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11AFCAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 20:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 771F684BC7;
	Thu, 11 Sep 2025 20:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AUM72_75ACof; Thu, 11 Sep 2025 20:04:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 589AB84BC8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 589AB84BC8;
	Thu, 11 Sep 2025 20:04:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 66C8E234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5814084BC8
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:04:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UJJGLBGjcSIp for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 20:04:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1689384BC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1689384BC6
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1689384BC6
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:04:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D49E1B9787FA; Thu, 11 Sep 2025 22:03:58 +0200 (CEST)
Message-ID: <ad5ad98b-6e83-49bf-a01a-96de606e151b@rnout.be>
Date: Thu, 11 Sep 2025 22:03:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
 <20250910213241.1529448-11-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250910213241.1529448-11-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1757621039; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=TYIvwJ9YlnjJFd99khN2lPLLKSBmv9CEkjRbxE8dp4g=;
 b=ZmYxfvjg+V5+c/1uGpjYkf/fQDSb7SLJTt1IYa0c7L9K/WCW8qL4308RpPXJUrkM14A7xg
 FANBUO9Nk2V1wAY9oBaXIlAjI/Mqfbqjp2muDwhM/u2DENjKvkKKs64JGlhNaaUIvvjAxo
 x9RRwEzkzWfW81cs+wPowzrI27ZeH/eKrD61Qc/SReMacBj8GKDk8gHqnpwjXTlhnl+9pp
 grPg4Dp3SerXQyFWH14sr8MrM83r21odm9yCEBBa51t6wuS9rY+3jy/YK8SEtohTCdqeb2
 gCaAVuNbV5Qj7m4oIrEKPEAyt5qP+SNIYBqbyeJ4KMtEqvkYWqmbpTbwa0zdWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=ZmYxfvjg
Subject: Re: [Buildroot] [PATCH 10/23] package/libglade: remove package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/09/2025 23:32, Thomas Petazzoni via buildroot wrote:
> libglade requires libgtk2, which we're about to remove, so let's drop
> libglade.

  I extended the commit message a bit to say how long it's dead already. Same 
for the other patches in the series, I'm not going to repeat that every time :-)

  Applied to master, thanks.

  Regards,
  Arnout

> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>   Config.in.legacy               |  7 +++++++
>   package/Config.in              |  1 -
>   package/libglade/Config.in     | 21 ---------------------
>   package/libglade/libglade.hash |  5 -----
>   package/libglade/libglade.mk   | 23 -----------------------
>   5 files changed, 7 insertions(+), 50 deletions(-)
>   delete mode 100644 package/libglade/Config.in
>   delete mode 100644 package/libglade/libglade.hash
>   delete mode 100644 package/libglade/libglade.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index a30755e608..f1f9dd2cfa 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>   
>   comment "Legacy options removed in 2025.11"
>   
> +config BR2_PACKAGE_LIBGLADE
> +	bool "libglade has been removed"
> +	select BR2_LEGACY
> +	help
> +	  The libglade package has been removed, as libgtk2 has been
> +	  removed as well.
> +
>   config BR2_PACKAGE_LEAFPAD
>   	bool "leafpad has been removed"
>   	select BR2_LEGACY
> diff --git a/package/Config.in b/package/Config.in
> index 4974c32a37..d54c579b82 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1760,7 +1760,6 @@ menu "Graphics"
>   	source "package/libfreeimage/Config.in"
>   	source "package/libgdiplus/Config.in"
>   	source "package/libgeotiff/Config.in"
> -	source "package/libglade/Config.in"
>   	source "package/libglew/Config.in"
>   	source "package/libglfw/Config.in"
>   	source "package/libglu/Config.in"
> diff --git a/package/libglade/Config.in b/package/libglade/Config.in
> deleted file mode 100644
> index 0f889542fa..0000000000
> --- a/package/libglade/Config.in
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -config BR2_PACKAGE_LIBGLADE
> -	bool "libglade"
> -	depends on BR2_PACKAGE_LIBGTK2
> -	depends on BR2_USE_WCHAR # glib2
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
> -	depends on BR2_USE_MMU # glib2
> -	depends on !BR2_STATIC_LIBS # at-spi2-core
> -	select BR2_PACKAGE_LIBGLIB2
> -	select BR2_PACKAGE_AT_SPI2_CORE
> -	select BR2_PACKAGE_LIBXML2
> -	help
> -	  Libglade allows you to load glade interface files in a program
> -	  at runtime. It doesn't require GLADE to be used, but GLADE is
> -	  by far the easiest way to create the interface files.
> -
> -	  https://download.gnome.org/sources/libglade/
> -
> -comment "libglade needs a toolchain w/ wchar, threads, dynamic library"
> -	depends on BR2_USE_MMU
> -	depends on BR2_PACKAGE_LIBGTK2
> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> diff --git a/package/libglade/libglade.hash b/package/libglade/libglade.hash
> deleted file mode 100644
> index b04087e286..0000000000
> --- a/package/libglade/libglade.hash
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -# From https://download.gnome.org/sources/libglade/2.6/libglade-2.6.4.sha256sum
> -sha256  64361e7647839d36ed8336d992fd210d3e8139882269bed47dc4674980165dec  libglade-2.6.4.tar.bz2
> -
> -# Hash for license file:
> -sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  COPYING
> diff --git a/package/libglade/libglade.mk b/package/libglade/libglade.mk
> deleted file mode 100644
> index af73d8bd00..0000000000
> --- a/package/libglade/libglade.mk
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -################################################################################
> -#
> -# libglade
> -#
> -################################################################################
> -
> -LIBGLADE_VERSION_MAJOR = 2.6
> -LIBGLADE_VERSION = $(LIBGLADE_VERSION_MAJOR).4
> -LIBGLADE_SOURCE = libglade-$(LIBGLADE_VERSION).tar.bz2
> -LIBGLADE_SITE = https://download.gnome.org/sources/libglade/$(LIBGLADE_VERSION_MAJOR)
> -LIBGLADE_INSTALL_STAGING = YES
> -LIBGLADE_DEPENDENCIES = host-pkgconf libglib2 libgtk2 at-spi2-core libxml2
> -LIBGLADE_LICENSE = LGPL-2.0+
> -LIBGLADE_LICENSE_FILES = COPYING
> -
> -define LIBGLADE_INSTALL_FIX
> -	rm -rf $(TARGET_DIR)/usr/share/xml/libglade \
> -		$(TARGET_DIR)/usr/bin/libglade-convert
> -endef
> -
> -LIBGLADE_POST_INSTALL_TARGET_HOOKS += LIBGLADE_INSTALL_FIX
> -
> -$(eval $(autotools-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
