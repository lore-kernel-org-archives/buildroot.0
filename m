Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0780CCD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFB616F544;
	Sat, 30 May 2026 13:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hAIjV1qKAC3G; Sat, 30 May 2026 13:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1D046F545
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780146074;
	bh=qoVHAKKAhWBk9T4shDafXFQxgddRhn/I0FEbrGj0sgE=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=fPvJ9z4XoePrI12W4WnEEXFFUfCnUOMlrG9HjMHNUmaHA55zvQ6iiIWJQ7oOTulel
	 Fm6mHboxCHTVT89wI89HLZNZKc/7DaivTJ5SedTz5KTMqFvy1sHtI/XgQfk2kbHTna
	 G1iiTG8zMoiSIcuvk2KexHcKkhNOXKzcAeg2di7HDOqCsFCsJJDzQNJTmjVSs1YSOL
	 QTVRqk/Zrxhg4iAzRN/ojzUpe6npI1PUlxOD1NVyMEbNh/HlN9AIViMt/lRvXmhuvn
	 20QMZG+fnRnKzRvjGRO1NC7BJ1S8xOObEyA0Fwek7Xju0rHWpd8T+Zr6srfMUtLS26
	 FCR2b0xMFMt9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1D046F545;
	Sat, 30 May 2026 13:01:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E5D1D218
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D733384D5F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id envip92RBe1X for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:01:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D820584D5D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D820584D5D
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D820584D5D
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:01:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 34126B97C704; Sat, 30 May 2026 12:53:57 +0200 (CEST)
Message-ID: <c5507e2d-2514-401d-ae78-8f17351170c5@rnout.be>
Date: Sat, 30 May 2026 12:53:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260409184048.3180731-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260409184048.3180731-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780138437; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=oB1+6iifWtCaaRxwMYmGDVNJFl+mNvmHUtdTvjdvqe4=;
 b=cOnxOf7/Eiraa+7ep9VqnSmNGYBCMxS5l/nlVbgRae4Psvbxhru3f1n7rGlX5JoA2SGQIT
 XUge0ZsA3pZNjiYJIhWqfAe9Of6+pBEqu0zbB1g1+sGKxars+ZXJP/CixRom4k9VS39Al2
 YFvsNNL98dEQGnWWkn3DfcJwYQGZU/T1wQyD74ET2yBrxLhh0hbVvz5t87d+7fOUTNslR8
 tP8hnRGrNI64gnWtstRd0m2fS3Ml5hloxx2spLaadYX3x58ACYOmLOY8Af8M25vvmhPNDO
 mFXp3x3slRGxC+JVOUWeGaNnzqluD/8/q3hDVZkbxcl+xXlGn35SkPoLFRP5pg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=cOnxOf7/
Subject: Re: [Buildroot] [PATCH 1/3] package/kodi: fix wayland build
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



On 09/04/2026 20:40, Bernd Kuhls wrote:
> Fixes wayland-related build error:
> make[4]: *** No rule to make target '/usr/share/waylandpp/protocols/presentation-time.xml',
>   needed by 'wayland-extra-protocols.hpp'.  Stop.
> 
> by adding a configure parameter pointing to STAGING_DIR.
> 
> The build error was not recorded by the autobuilders and can be
> reproduced by this defconfig:
> 
> BR2_x86_64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_PER_PACKAGE_DIRECTORIES=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_PACKAGE_KODI=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_MESA3D_OPENGL_ES=y
> BR2_PACKAGE_PYTHON3=y
> BR2_PACKAGE_PYTHON3_PY_ONLY=y
> BR2_PACKAGE_WAYLAND=y
> 
> LibreELEC added this configure parameter seven years ago:
> https://github.com/LibreELEC/LibreELEC.tv/commit/d19ab98bf324364bf36b7c2d630524267dfaaa01
> 
> so a backport to LTS branches should be considered.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied this patch to master and the other two to next, thanks.

  So this means we'll start getting autobuilder failures for kodi, nice :-)

  Regards,
  Arnout

> ---
>   package/kodi/kodi.mk | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index c31e789503..02feb17b4d 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -126,7 +126,8 @@ endif
>   ifeq ($(BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND),y)
>   KODI_CONF_OPTS += \
>   	-DPC_WAYLANDPP_SCANNER=$(HOST_DIR)/bin/wayland-scanner \
> -	-DPC_WAYLANDPP_SCANNER_FOUND=ON
> +	-DPC_WAYLANDPP_SCANNER_FOUND=ON \
> +	-DWAYLANDPP_PROTOCOLS_DIR=$(STAGING_DIR)/usr/share/waylandpp/protocols
>   KODI_CORE_PLATFORM_NAME += wayland
>   KODI_DEPENDENCIES += libxkbcommon waylandpp
>   endif

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
