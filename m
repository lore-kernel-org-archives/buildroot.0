Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72C6CAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 20:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73D8C4111D;
	Thu, 11 Sep 2025 20:21:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0C_SkwXEMC3k; Thu, 11 Sep 2025 20:21:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F55F41123
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F55F41123;
	Thu, 11 Sep 2025 20:21:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D4395234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C60B36F5BE
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:21:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q2qdzjCb2OXt for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 20:21:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BB3C36E5F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB3C36E5F7
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB3C36E5F7
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:21:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CA1D2B978815; Thu, 11 Sep 2025 22:21:45 +0200 (CEST)
Message-ID: <731739f5-51c1-4a1c-bf7f-59d195f1e0ee@rnout.be>
Date: Thu, 11 Sep 2025 22:21:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
 <20250910213241.1529448-19-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250910213241.1529448-19-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1757622105; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=LyvJeYu1p51yBUEl/p2bTtIpuHcuqu+am8jmRrL6U8Y=;
 b=jIscMRTFyDcwFbW5/4YRGL1aOkodkqu9V9tX23juRLYvg2JDZf78/OOhcTgO7IW9fiA7uc
 c/yBnq8psv+TuQBH+VCzZWP4Cb0iB7QmJrRQgcq/vAOAcsUKj0y3riONydFZxXibmb70mn
 Jl3QHhgeVqshuAxZKGXyFZQYuqC1EqXoLLgT7Xl27aRJf/lI+AGYsOcmJ1eFkJBvrfYeBd
 b4UpzMG/DEyLB33Veg3+9iaW0sHmVIWDMG7eXa4Aj6XjcLBR4Yra/Zi6VG8vHvVi1CdQSv
 Oik5YkpS3fucQWiqo1ZYwMc6gEmsAoS0U2hKfEXcII9z654cqGjSHbCt4a++JQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=jIscMRTF
Subject: Re: [Buildroot] [PATCH 18/23] package/pinentry: remove gtk2 backend
 support
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
> As we're about to remove libgtk2, we need to first remove support for
> the gtk2 backend of pinentry, which this patch does.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   Config.in.legacy             |  7 +++++++
>   package/pinentry/Config.in   | 22 ----------------------
>   package/pinentry/pinentry.mk | 12 +++---------
>   3 files changed, 10 insertions(+), 31 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index e1fe008cf5..a1b321578b 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>   
>   comment "Legacy options removed in 2025.11"
>   
> +config BR2_PACKAGE_PINENTRY_GTK2
> +	bool "gtk2 backend of pinentry has been removed"
> +	select BR2_LEGACY
> +	help
> +	  Due to the removal of libgtk2, the gtk2 backend of pinentry
> +	  has been removed.
> +
>   config BR2_PACKAGE_NETSURF_GTK
>   	bool "gtk backend of netsurf has been removed"
>   	select BR2_LEGACY
> diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
> index bd5e3af5a1..dc8c9724d7 100644
> --- a/package/pinentry/Config.in
> +++ b/package/pinentry/Config.in
> @@ -6,7 +6,6 @@ menuconfig BR2_PACKAGE_PINENTRY
>   	select BR2_PACKAGE_LIBGPG_ERROR
>   	# At least one backend is needed to avoid build breakage
>   	select BR2_PACKAGE_PINENTRY_NCURSES if \
> -		!BR2_PACKAGE_PINENTRY_GTK2 && \
>   		!BR2_PACKAGE_PINENTRY_QT5
>   	help
>   	  A collection of simple PIN or pass-phrase entry dialogs
> @@ -46,27 +45,6 @@ config BR2_PACKAGE_PINENTRY_NCURSES
>   	help
>   	  The pinentry-ncurses tool
>   
> -config BR2_PACKAGE_PINENTRY_GTK2
> -	bool "pinentry-gtk2"
> -	depends on BR2_PACKAGE_XORG7
> -	depends on BR2_USE_WCHAR
> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	depends on BR2_USE_MMU
> -	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
> -	select BR2_PACKAGE_LIBGTK2
> -	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
> -	help
> -	  The pinentry-gtk2 tool
> -
> -comment "pinentry-gtk2 needs X and a toolchain w/ wchar, threads, C++, gcc >= 4.9"
> -	depends on BR2_USE_MMU
> -	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> -	depends on !BR2_PACKAGE_XORG7 || !BR2_USE_WCHAR || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> -		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> -
>   config BR2_PACKAGE_PINENTRY_QT5
>   	bool "pinentry-qt5"
>   	depends on BR2_INSTALL_LIBSTDCPP
> diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
> index 7482a93d02..ef17df7657 100644
> --- a/package/pinentry/pinentry.mk
> +++ b/package/pinentry/pinentry.mk
> @@ -13,10 +13,12 @@ PINENTRY_DEPENDENCIES = \
>   	libassuan libgpg-error \
>   	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
>   	host-pkgconf
> +# --disable-libcap to avoid PAM dependency
>   PINENTRY_CONF_OPTS += \
>   	--with-libassuan-prefix=$(STAGING_DIR)/usr \
>   	--with-libgpg-error-prefix=$(STAGING_DIR)/usr \
> -	--without-libcap       # requires PAM
> +	--without-libcap \
> +	--disable-pinentry-gtk2
>   
>   # Force the path to "gpgrt-config" (from the libgpg-error package) to
>   # avoid using the one on host, if present.
> @@ -58,14 +60,6 @@ else
>   PINENTRY_CONF_OPTS += --disable-ncurses
>   endif
>   
> -# pinentry-gtk2 backend
> -ifeq ($(BR2_PACKAGE_PINENTRY_GTK2),y)
> -PINENTRY_CONF_OPTS += --enable-pinentry-gtk2
> -PINENTRY_DEPENDENCIES += libgtk2
> -else
> -PINENTRY_CONF_OPTS += --disable-pinentry-gtk2
> -endif
> -
>   # pinentry-qt5 backend
>   ifeq ($(BR2_PACKAGE_PINENTRY_QT5),y)
>   PINENTRY_CONF_OPTS += --enable-pinentry-qt

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
