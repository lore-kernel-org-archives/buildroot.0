Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF649C433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 20:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79FA760B83;
	Tue, 15 Mar 2022 20:17:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0hKIVbJhywSA; Tue, 15 Mar 2022 20:17:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B9B160B08;
	Tue, 15 Mar 2022 20:17:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BADCC1BF31E
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 20:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9DCB842D6
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 20:17:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pSdmzzLcnnUa for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 20:17:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 785878426E
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 20:17:23 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id b24so246392edu.10
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 13:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wbyzX3fPs8dmmIYb6unMYrdSoJn9wgX0sfWc0PSfXZM=;
 b=ggAtrab3MCVF8rIBWafZ6jMPmW6tAUHmYkO25oJkzla638nOznbbqbB1gdi672hUuu
 5Zb6tI5cLi09f2Y1tv5MqDs8gvvOb4w6a9NVuIlUd3P/ik/v64GBUcZTYvpZj/EC543I
 H40y3Wreg0UWO+IvrzN2TvTa3/J4Q8JfMapMEqPt45XhqD7x9xTW1pmrDT/Dk7pr2D6A
 aiw7OKNSXFw4H3Pp54HNYJrmkEERY5hTZc27YL1LiNb+W4ZTltDIZPK4ggTNHhYqBVu8
 PgF75htLBsOMMC8jUt1wO42YnyaCFRQRaawGecpEPcekbnEpDS0giWDeBVTh13lRQA0y
 F9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wbyzX3fPs8dmmIYb6unMYrdSoJn9wgX0sfWc0PSfXZM=;
 b=VoWIb4wj4oUoT5mHuBUT6aosmXDQv2bIviM0ZK9Ir35dMh9+IeZ9EMW2VK7qzHKNAT
 DG/fvVKjWbXt3eA/O+y2ZTnc3iJCA4+M8xOqfdRCJGKYwiBpmuEd05tIm2Ez4FMsPyJw
 VfVDvWRezxJz3/IH505s+lShU5orkIcpcSiouJoYL0R0D0RKtyBmsVXrRKkwRYkfVPGM
 6N1hAuL4D30yJSeorjrjyDgZU91BsTkrgZAqv9PJFobURHi8fb2LP0Isb/snP8+lIpq/
 OEkqQPpqPy5IwCtoGEVEozQ+v+kuWVoxBpJXjmmANGCkOgTSO69S0Cj119DW9dk/6Lua
 c7qg==
X-Gm-Message-State: AOAM532jGyFrQwIzdGxxkLAmUvOI4qb6ab94aXcHvB2bobVDvOILH8lW
 lXgPw8gedV66S00LpXnV7/zcX22Jx4ix6Q==
X-Google-Smtp-Source: ABdhPJxUlFqYRGz6zmXNLTNJL3a484HjpUBUWPErq3Iu047cT6DWAcjp+smDBw8O109kOWAobwIBQA==
X-Received: by 2002:a50:d9c2:0:b0:413:97b5:d9e6 with SMTP id
 x2-20020a50d9c2000000b0041397b5d9e6mr26706385edj.334.1647375441687; 
 Tue, 15 Mar 2022 13:17:21 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a170906a18400b006db0a78bde8sm24327ejy.87.2022.03.15.13.17.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 13:17:21 -0700 (PDT)
Message-ID: <a6478dd4-b3bd-704c-6750-65c5b07fc07a@mind.be>
Date: Tue, 15 Mar 2022 21:17:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220227100104.3694504-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220227100104.3694504-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libsecret: bump to version
 0.20.5
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/02/2022 11:01, Fabrice Fontaine wrote:
> - Switch to meson-package
> - Add bash-completion and tpm2-tss optional dependencies
> 
> https://gitlab.gnome.org/GNOME/libsecret/-/tags/0.20.5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libsecret/libsecret.hash |  4 ++--
>   package/libsecret/libsecret.mk   | 36 +++++++++++++++++++++-----------
>   2 files changed, 26 insertions(+), 14 deletions(-)
> 
> diff --git a/package/libsecret/libsecret.hash b/package/libsecret/libsecret.hash
> index 792ec838e3..4eb3d9b95c 100644
> --- a/package/libsecret/libsecret.hash
> +++ b/package/libsecret/libsecret.hash
> @@ -1,5 +1,5 @@
> -# From https://download.gnome.org/sources/libsecret/0.20/libsecret-0.20.4.sha256sum
> -sha256  325a4c54db320c406711bf2b55e5cb5b6c29823426aa82596a907595abb39d28  libsecret-0.20.4.tar.xz
> +# From https://download.gnome.org/sources/libsecret/0.20/libsecret-0.20.5.sha256sum
> +sha256  3fb3ce340fcd7db54d87c893e69bfc2b1f6e4d4b279065ffe66dac9f0fd12b4d  libsecret-0.20.5.tar.xz
>   
>   # Hash for license file:
>   sha256  a1a33180d02960ab1c5de36cf20b1a2f0fe9888d83826ad263da5db52f1b183b  COPYING
> diff --git a/package/libsecret/libsecret.mk b/package/libsecret/libsecret.mk
> index 4d14c231d7..82fe38ac1a 100644
> --- a/package/libsecret/libsecret.mk
> +++ b/package/libsecret/libsecret.mk
> @@ -5,33 +5,45 @@
>   ################################################################################
>   
>   LIBSECRET_VERSION_MAJOR = 0.20
> -LIBSECRET_VERSION = $(LIBSECRET_VERSION_MAJOR).4
> +LIBSECRET_VERSION = $(LIBSECRET_VERSION_MAJOR).5
>   LIBSECRET_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsecret/$(LIBSECRET_VERSION_MAJOR)
>   LIBSECRET_SOURCE = libsecret-$(LIBSECRET_VERSION).tar.xz
>   LIBSECRET_INSTALL_STAGING = YES
>   LIBSECRET_DEPENDENCIES = libglib2 $(TARGET_NLS_DEPENDENCIES)
> -LIBSECRET_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
> +LIBSECRET_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
>   LIBSECRET_CONF_OPTS = \
> -	--disable-manpages \
> -	--disable-strict \
> -	--disable-coverage \
> -	--enable-vala=no
> +	-Dgtk_doc=false \
> +	-Dmanpage=false \
> +	-Dvapi=false
>   LIBSECRET_LICENSE = LGPL-2.1+
>   LIBSECRET_LICENSE_FILES = COPYING
>   
> +ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
> +LIBSECRET_CONF_OPTS += -Dbash_completion=enabled
> +LIBSECRET_DEPENDENCIES += bash-completion
> +else
> +LIBSECRET_CONF_OPTS += -Dbash_completion=disabled
> +endif
> +
>   ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> -LIBSECRET_CONF_OPTS += --enable-introspection=yes
> +LIBSECRET_CONF_OPTS += -Dintrospection=true
>   LIBSECRET_DEPENDENCIES += gobject-introspection
>   else
> -LIBSECRET_CONF_OPTS += --enable-introspection=no
> +LIBSECRET_CONF_OPTS += -Dintrospection=false
>   endif
>   
>   ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
>   LIBSECRET_DEPENDENCIES += libgcrypt
> -LIBSECRET_CONF_OPTS += --enable-gcrypt \
> -	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
> +LIBSECRET_CONF_OPTS += -Dgcrypt=true
> +else
> +LIBSECRET_CONF_OPTS += -Dgcrypt=false
> +endif
> +
> +ifeq ($(BR2_PACKAGE_TPM2_TSS),y)
> +LIBSECRET_CONF_OPTS += -Dtpm2=true
> +LIBSECRET_DEPENDENCIES += tpm2-tss
>   else
> -LIBSECRET_CONF_OPTS += --disable-gcrypt
> +LIBSECRET_CONF_OPTS += -Dtpm2=false
>   endif
>   
> -$(eval $(autotools-package))
> +$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
