Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465EACAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 20:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E910421F3;
	Thu, 11 Sep 2025 20:03:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pvqphev8tBUC; Thu, 11 Sep 2025 20:03:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C3044253D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C3044253D;
	Thu, 11 Sep 2025 20:03:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6ACF5234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63CBE84BC7
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SlQe569Qnjyh for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 20:03:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3073F84BC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3073F84BC8
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3073F84BC8
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:03:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EEED0B9787FA; Thu, 11 Sep 2025 22:03:15 +0200 (CEST)
Message-ID: <bf42d5df-3426-4a3a-af64-a7e3641dba59@rnout.be>
Date: Thu, 11 Sep 2025 22:03:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
 <20250910213241.1529448-10-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250910213241.1529448-10-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1757620996; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=CmXnOGCxdxpMYCCIqPtM2KFgN8H/blp80cFHSKaX7kU=;
 b=FfbE8Uka3Wef20CKx03pNDt2cDQpuGJUnliPmqksyMVWJESJ6+PQvMMR+seJiraC7tDFOx
 9yG2N0KTF4KPRk/Mj/kOzGlD/eQC08H7zR+c6H8zNz8fedXy/B7QE4wQT7o8RBa/QA0260
 Kb+cVlEUws6yhH4+0Psi/vyYuQ3y2Y43dTP7R8Yh5a1xX5SjNwZpSqxABETDkR6fQIJbkD
 fgtBuX+V8H8m5SdxvlZNNleu294QdsxOaVk1SzBvchdZ17gZ0Z01nb5J4FWbbl9k81bgv/
 jE+wnkthnNPzGqARHrZm3xta/1Un0eV413jenCmok+TgAKjoPJw85y5auk+23w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=FfbE8Uka
Subject: Re: [Buildroot] [PATCH 09/23] package/{libfm,
 pcmanfm}: handle libgtk2 removal
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
> As we're about to remove libgtk2, the libfm and pcmanfm packages need
> to be adjusted so that they work with libgtk3 only. This requires a
> bit of re-arrangment of the dependencies, to properly propagate the
> libgtk3 dependencies.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libfm/Config.in    | 34 ++++++++++++++++++++++------------
>   package/libfm/libfm.mk     | 11 ++---------
>   package/pcmanfm/Config.in  | 35 ++++++++++++++++++++++-------------
>   package/pcmanfm/pcmanfm.mk | 11 ++---------
>   4 files changed, 48 insertions(+), 43 deletions(-)
> 
> diff --git a/package/libfm/Config.in b/package/libfm/Config.in
> index e78bc99b76..f35e9a17fd 100644
> --- a/package/libfm/Config.in
> +++ b/package/libfm/Config.in
> @@ -1,15 +1,19 @@
>   config BR2_PACKAGE_LIBFM
>   	bool "libfm"
> -	depends on BR2_PACKAGE_XORG7
> -	depends on BR2_USE_WCHAR # libglib2
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> -	depends on BR2_USE_MMU # libglib2
> -	depends on BR2_INSTALL_LIBSTDCPP # libgtk2
> -	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
> +	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # libgtk3
> +	depends on BR2_USE_WCHAR # libgtk3, libglib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk3, libglib2
> +	depends on BR2_USE_MMU # libgtk3, libglib2
> +	depends on BR2_INSTALL_LIBSTDCPP # libgtk3
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk3
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk3
> +	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL # libgtk3
> +	depends on BR2_PACKAGE_XORG7 # libgtk3-x11
> +	depends on BR2_PACKAGE_HAS_LIBGL # libgtk3-x1
>   	select BR2_PACKAGE_CAIRO
>   	select BR2_PACKAGE_LIBGLIB2
> -	select BR2_PACKAGE_LIBGTK2 if !BR2_PACKAGE_LIBGTK3_X11
> +	select BR2_PACKAGE_LIBGTK3
> +	select BR2_PACKAGE_LIBGTK3_X11
>   	select BR2_PACKAGE_MENU_CACHE
>   	help
>   	  A glib/gio-based library providing some file management
> @@ -22,9 +26,15 @@ config BR2_PACKAGE_LIBFM
>   
>   	  http://wiki.lxde.org/en/Libfm
>   
> -comment "libfm needs X.org and a toolchain w/ wchar, threads, C++, gcc >= 4.9"
> +comment "libfm a toolchain w/ wchar, threads, C++, gcc >= 4.9"
> +	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
>   	depends on BR2_USE_MMU
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> -	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> -		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_XORG7
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +
> +comment "libfm needs X.org with an OpenGL backend"
> +	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
> +	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on !BR2_PACKAGE_XORG7 || BR2_PACKAGE_HAS_LIBGL
> diff --git a/package/libfm/libfm.mk b/package/libfm/libfm.mk
> index 29f6d7d56a..419fce59d8 100644
> --- a/package/libfm/libfm.mk
> +++ b/package/libfm/libfm.mk
> @@ -7,12 +7,13 @@
>   LIBFM_VERSION = 1.3.2
>   LIBFM_SOURCE = libfm-$(LIBFM_VERSION).tar.xz
>   LIBFM_SITE = http://sourceforge.net/projects/pcmanfm/files
> -LIBFM_DEPENDENCIES = menu-cache libglib2 cairo
> +LIBFM_DEPENDENCIES = menu-cache libglib2 cairo libgtk3
>   LIBFM_LICENSE = GPL-2.0+, LGPL-2.1+
>   LIBFM_LICENSE_FILES = COPYING src/extra/fm-xml-file.c
>   LIBFM_INSTALL_STAGING = YES
>   # We're patching src/modules/Makefile.am
>   LIBFM_AUTORECONF = YES
> +LIBFM_CONF_OPTS = --with-gtk=3
>   
>   ifeq ($(BR2_PACKAGE_LIBEXIF),y)
>   LIBFM_CONF_OPTS += --enable-exif
> @@ -21,12 +22,4 @@ else
>   LIBFM_CONF_OPTS += --disable-exif
>   endif
>   
> -ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
> -LIBFM_CONF_OPTS += --with-gtk=3
> -LIBFM_DEPENDENCIES += libgtk3
> -else
> -LIBFM_CONF_OPTS += --with-gtk=2
> -LIBFM_DEPENDENCIES += libgtk2
> -endif
> -
>   $(eval $(autotools-package))
> diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
> index 73b8c7c04c..a4522d88f4 100644
> --- a/package/pcmanfm/Config.in
> +++ b/package/pcmanfm/Config.in
> @@ -1,16 +1,20 @@
>   config BR2_PACKAGE_PCMANFM
>   	bool "pcmanfm"
> -	depends on BR2_PACKAGE_XORG7
> -	depends on BR2_USE_WCHAR # libglib2
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> -	depends on BR2_USE_MMU # libglib2
> -	depends on BR2_INSTALL_LIBSTDCPP # libgtk2
> -	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
> +	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # libfm
> +	depends on BR2_USE_WCHAR # libfm
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libfm
> +	depends on BR2_USE_MMU # libfm
> +	depends on BR2_INSTALL_LIBSTDCPP # libfm
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libfm
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libfm
> +	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL # libfm
> +	depends on BR2_PACKAGE_XORG7 # libfm
> +	depends on BR2_PACKAGE_HAS_LIBGL # libfm
>   	select BR2_PACKAGE_LIBFM
>   	select BR2_PACKAGE_MENU_CACHE
>   	select BR2_PACKAGE_LIBGLIB2
> -	select BR2_PACKAGE_LIBGTK2 if !BR2_PACKAGE_LIBGTK3_X11
> +	select BR2_PACKAGE_LIBGTK3
> +	select BR2_PACKAGE_LIBGTK3_X11
>   	help
>   	  PCMan File Manager (PCManFM) is a file manager application
>   	  developed by Hong Jen Yee from Taiwan which is meant to be a
> @@ -18,10 +22,15 @@ config BR2_PACKAGE_PCMANFM
>   
>   	  http://wiki.lxde.org/en/PCManFM
>   
> -comment "pcmanfm needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
> +comment "pcmanfm a toolchain w/ wchar, threads, C++, gcc >= 4.9"
> +	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
>   	depends on BR2_USE_MMU
> -	depends on BR2_PACKAGE_XORG7
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> -	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> -		!BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +
> +comment "pcmanfm needs X.org with an OpenGL backend"
> +	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
> +	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on !BR2_PACKAGE_XORG7 || BR2_PACKAGE_HAS_LIBGL
> diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
> index 9b233f614d..46d750b1e6 100644
> --- a/package/pcmanfm/pcmanfm.mk
> +++ b/package/pcmanfm/pcmanfm.mk
> @@ -7,18 +7,11 @@
>   PCMANFM_VERSION = 1.3.2
>   PCMANFM_SOURCE = pcmanfm-$(PCMANFM_VERSION).tar.xz
>   PCMANFM_SITE = http://sourceforge.net/projects/pcmanfm/files
> -PCMANFM_DEPENDENCIES = libglib2 menu-cache libfm $(TARGET_NLS_DEPENDENCIES)
> +PCMANFM_DEPENDENCIES = libglib2 menu-cache libfm libgtk3 $(TARGET_NLS_DEPENDENCIES)
>   PCMANFM_LICENSE = GPL-2.0+
>   PCMANFM_LICENSE_FILES = COPYING
>   PCMANFM_CPE_ID_VALID = YES
>   PCMANFM_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
> -
> -ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
> -PCMANFM_CONF_OPTS += --with-gtk=3
> -PCMANFM_DEPENDENCIES += libgtk3
> -else
> -PCMANFM_CONF_OPTS += --with-gtk=2
> -PCMANFM_DEPENDENCIES += libgtk2
> -endif
> +PCMANFM_CONF_OPTS = --with-gtk=3
>   
>   $(eval $(autotools-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
