Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C578CD4F50
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 18:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C1516069C;
	Mon, 18 May 2026 18:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yqm4cBytDZ0q; Mon, 18 May 2026 18:30:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C96C606BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779129047;
	bh=vghWFd5yC+KVYanZmQdaUsZg67OJgRsi0vT4aNA9pJk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KPjvcyREoAuHqP3R9Oasd7gxPNcZBEdZj2Pz0HdsUd/BF1eTs+Hdc0VvdVVXTvJ/Y
	 ZJkIIc1JFkR2NjntlTssNEEhQhdwtUxraPiAxZtv7utCKnmeoOat3d8ChQZh7RvqIX
	 t8EfFZ+1rRA26X/SrWZrEM5xDzIt+MqUUbP8BCxH0F6fY4b2/jmCsnnzQVbtFjoGNU
	 iVRZEeY7GZYDmhM9eWokfCbVgkaMh5OO/uCOAq4r930+y8A/zgl7Np1J1wvDTCcXLE
	 Y1bOf7ASXKcH6c3yEWhjesmw8bpv4SCALE2UVoYDKOq14VoxpSTBsPTsnBzxrm/aOn
	 PZKPlgESrot3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C96C606BF;
	Mon, 18 May 2026 18:30:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B01D41B2
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92C72606BF
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HDSNB0o4Etg0 for <buildroot@buildroot.org>;
 Mon, 18 May 2026 18:30:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CA1EE6069C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA1EE6069C
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA1EE6069C
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:30:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 24F89B97BC21; Mon, 18 May 2026 20:30:42 +0200 (CEST)
Message-ID: <65ec2e6d-de9e-4dd3-a388-104d405c3eb8@rnout.be>
Date: Mon, 18 May 2026 20:30:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
References: <20260517085341.1338094-1-thomas.devoogdt@barco.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260517085341.1338094-1-thomas.devoogdt@barco.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779129042; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=3HGVb7tNWPnbVEtrr5hjAQ0MRebaQfn4gV4Jjqx9IBw=;
 b=TYuHT1K2uEbC8dbLTPufaZBFM9jJjZoD6Yyt0GL66iLTfIM+rF561FiH0qGr6e5Ihkd88X
 B/t3vzKIj2i5+uEF+8TK+wbEpOAAUNIIFUVdkNZL35qSl4Im7wOLbGwtTG9cwrPmKp0HUi
 elqXRDh7AUH48j7qIQU3CJqk5IuKH4Io+wzsn3rDBtXkmoCGoqSUuA9wrv/yKaJ9rMTGQl
 nqs8AzvvkmoCSeCDpTTSmqiotYZhamAqBReyHG3eTmTwZFEV30ma95rhYLQNmvB4Eg1Bs6
 o7GnnaiQ3umPKSOb2KBy2mqEXP/UAEgyFEVhU4L+vaZsDrINGa2I98rX9KSBnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=TYuHT1K2
Subject: Re: [Buildroot] [PATCH v1 1/2] package/mesa3d: add Gallium VA-API
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



On 17/05/2026 10:53, Thomas Devoogdt wrote:
> Since commit 361bfbc70b2b (package/mesa3d: disable libva support),
> VA-API has been unconditionally disabled in mesa3d due to a circular
> dependency between mesa3d, libva and libgl.
> 
> The circular dependency only occurs when mesa3d is the libgl provider,
> i.e. when GLX is enabled without libglvnd. In that case:
>    mesa3d -> libva -> libgl -> mesa3d
> 
> Re-enable VA-API support as a new BR2_PACKAGE_MESA3D_GALLIUM_VA option,
> guarded by a dependency that prevents the circular case. This allows
> hardware video acceleration on AMD, Intel and other GPUs with Gallium
> drivers.
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

  Since the Signed-off-by has your barco address, I used that as the author 
address as well.

  Applied to next with that changed, thanks.

  Regards,
  Arnout

> ---
>   package/mesa3d/Config.in | 13 +++++++++++++
>   package/mesa3d/mesa3d.mk |  7 +++++--
>   2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 66ebe04394..bfd072d6d0 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -461,6 +461,19 @@ config BR2_PACKAGE_MESA3D_OPENGL_ES
>   
>   endif # BR2_PACKAGE_MESA3D_DRIVER
>   
> +config BR2_PACKAGE_MESA3D_GALLIUM_VA
> +	bool "Gallium VA-API"
> +	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +	# circular dependency: mesa3d -> libva -> libgl -> mesa3d
> +	depends on !BR2_PACKAGE_MESA3D_OPENGL_GLX || BR2_PACKAGE_LIBGLVND
> +	select BR2_PACKAGE_LIBVA
> +	help
> +	  Enable VA-API video acceleration support in Gallium drivers.
> +
> +comment "Gallium VA-API needs a gallium driver, incompatible with GLX w/o libglvnd"
> +	depends on !BR2_PACKAGE_MESA3D_GALLIUM_DRIVER || \
> +		(BR2_PACKAGE_MESA3D_OPENGL_GLX && !BR2_PACKAGE_LIBGLVND)
> +
>   config BR2_PACKAGE_PROVIDES_LIBGBM
>   	default "mesa3d" if BR2_PACKAGE_MESA3D_GBM
>   
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 1eaa4c577e..98f1c6c2bb 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -182,9 +182,12 @@ endif
>   #   - Building OpenGL ES without OpenGL is not supported, so always keep opengl enabled.
>   MESA3D_CONF_OPTS += -Dopengl=true
>   
> -# libva and mesa3d have a circular dependency
> -# we do not need libva support in mesa3d, therefore disable this option
> +ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_VA),y)
> +MESA3D_CONF_OPTS += -Dgallium-va=enabled
> +MESA3D_DEPENDENCIES += libva
> +else
>   MESA3D_CONF_OPTS += -Dgallium-va=disabled
> +endif
>   
>   # libGL is only provided for a full xorg stack, without libglvnd
>   ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
