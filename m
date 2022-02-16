Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13E1C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 19:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FEBF40157;
	Wed, 16 Feb 2022 19:50:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 67_6ETX1UC06; Wed, 16 Feb 2022 19:50:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D765400D6;
	Wed, 16 Feb 2022 19:50:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E25751BF592
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 19:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D033A60F64
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 19:50:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EHKvRWChqSnw for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 19:50:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D63EC60BE5
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 19:50:17 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id h18so5765926edb.7
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 11:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=844NypXkQWOCrtXYqOv1yEnFqhchJddBSCa88VQayiY=;
 b=LWVeYll8UhVxjddjN0e2UmGYfEcFu88/sN1DZiprUSE5PpdvHyVSoFVB+E147wLqWd
 aqr2LBq08AQyqpjWLB+kIyMQ1Ktf2d27tOCke51pATzDjED0SFk4Vb0khu8okBImJbs7
 5pdcauDu9KqScyewRHnLy3SPl/nznxEFRUvWroSPX8iw/vKAljgki6YOJWhgwmhDnd9o
 qhYR9+tRnUU9Dxxc3Fs/car+AcgQSqPOMv2AS1cj27nXWt1Ev1hpiNxBdi5Eo2jvj6YJ
 IOlBPNZKRw41SuoNqwPqLaIucA7L0NDHFICio+1f009ceO6rRsm4bXeoGF2gdFQ8MlOX
 vi1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=844NypXkQWOCrtXYqOv1yEnFqhchJddBSCa88VQayiY=;
 b=qeETjfpDheWG6VjIi1NQX2oxGRR6mnlV4VBMVG28DlOz8/C8gN97g3MChZcTJO14P3
 K3LnjuImfu1gvDi2TUF1sTcI41aqFWTwB4J28NeprxuCkG46ishxFYbQT40zD6s7db3I
 dhubMcqskKJoo14kt9hpRpCaww1uEUE8Lp+OkIXqFC2RaaG5nUEmFkJ9WG2tiHqAEW38
 OfEBo1XSgooYi6PHHu8z+F7rLui6VqQYk0hhTkc5B3Kdw1AbmN8Iui9OffzFMT/MOSve
 Z3xRWJG/Q1DCmgofKrKxIu6Ks8eyYSLv2uh8NHeqpNjcwLzYfMblfN/Lslmd+QKviJyK
 Gc1w==
X-Gm-Message-State: AOAM531Mi0k7jH1U4A7sh3cnCCEycLaRZu+3ywrd8XfrZako2bgw0fqn
 lEr6pLf1jOqR5v/rU+ZkfysXEg==
X-Google-Smtp-Source: ABdhPJzyss9tgq7HfsECkFOi3YftyJPIW0utAzcez023rrAl3nvqvJHt9DEsboO0CvHVSSAmaWDQUQ==
X-Received: by 2002:aa7:d7d3:0:b0:410:d23b:6746 with SMTP id
 e19-20020aa7d7d3000000b00410d23b6746mr4773635eds.453.1645041015958; 
 Wed, 16 Feb 2022 11:50:15 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id kw5sm270047ejc.140.2022.02.16.11.50.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 11:50:15 -0800 (PST)
Message-ID: <24177320-70c0-38ad-e15f-59d813fa0525@mind.be>
Date: Wed, 16 Feb 2022 20:50:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220213091532.1260695-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220213091532.1260695-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 21.3.6
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/02/2022 10:15, Bernd Kuhls wrote:
> Release notes:
> https://lists.freedesktop.org/archives/mesa-announce/2022-February/000663.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to next, thanks.

  Regards,
  Arnout

> ---
>   package/mesa3d-headers/mesa3d-headers.mk | 2 +-
>   package/mesa3d/mesa3d.hash               | 6 +++---
>   package/mesa3d/mesa3d.mk                 | 2 +-
>   3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
> index 871cf2f495..c8573fafad 100644
> --- a/package/mesa3d-headers/mesa3d-headers.mk
> +++ b/package/mesa3d-headers/mesa3d-headers.mk
> @@ -12,7 +12,7 @@ endif
>   
>   # Not possible to directly refer to mesa3d variables, because of
>   # first/second expansion trickery...
> -MESA3D_HEADERS_VERSION = 21.3.5
> +MESA3D_HEADERS_VERSION = 21.3.6
>   MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
>   MESA3D_HEADERS_SITE = https://archive.mesa3d.org
>   MESA3D_HEADERS_DL_SUBDIR = mesa3d
> diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
> index e36d798e21..d64b833100 100644
> --- a/package/mesa3d/mesa3d.hash
> +++ b/package/mesa3d/mesa3d.hash
> @@ -1,6 +1,6 @@
> -# From https://lists.freedesktop.org/archives/mesa-announce/2022-January/000660.html
> -sha256  d93b2a9d2464ee856d7637a07dff6b7cd950f295ad58518bb959f76882cf4a4c  mesa-21.3.5.tar.xz
> -sha512  417d1787f8177567f0c547dde3e24212f7497f2fe7cdaa945fe998cd61ec0e9eb9388feb444e377c4fd8794b056af02aac28d1bbfb9527844391ba49e6893933  mesa-21.3.5.tar.xz
> +# From https://lists.freedesktop.org/archives/mesa-announce/2022-February/000663.html
> +sha256  96bb761fd546e9aa41d025fcc025225c5668443839dae21e3731959beb096736  mesa-21.3.6.tar.xz
> +sha512  8c930e04eade29f689384ee7d6e2f178acbbf30fa6c9fdf132281279658c3c221ec7f9b1318e3c0a654c6136f925a5c0a35eaf849b65db7674641127c71e8a4f  mesa-21.3.6.tar.xz
>   
>   # License
>   sha256  998437f3f75f0c542046f83c1cb349408122268168fb13eb4ae6967aa18b7d98  docs/license.rst
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 5f080ff5fc..95618b2072 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   # When updating the version, please also update mesa3d-headers
> -MESA3D_VERSION = 21.3.5
> +MESA3D_VERSION = 21.3.6
>   MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
>   MESA3D_SITE = https://archive.mesa3d.org
>   MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
