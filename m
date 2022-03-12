Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E01C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 20:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4306460E6B;
	Sat, 12 Mar 2022 20:21:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p5uEE9TxQ9Wt; Sat, 12 Mar 2022 20:21:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6248760E67;
	Sat, 12 Mar 2022 20:21:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3BC891BF3DD
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24732825E6
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:21:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4vWsGYuh_DEQ for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 20:21:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D28A825DC
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 20:21:00 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id m12so14870128edc.12
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 12:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=LSizS/9zesc9L3Q8q0KExOOaZnxhpSqIfupAWQD+YuY=;
 b=UO3fFFcyk3bNCX1tPaHBa38tZUeG+PYJwNAQ3Nz19C3A48lUPxoSSm3+//H/FuX+9f
 7593j3XORoTuCCstRbpdAWQk6j6H4cJq6KDux2SYcf7Q8lnAVmWLJFyHmVxi5u+Td+Cf
 d2UZZGiE/1/rhOJDWs4BwJtPX7prnFAlDYoDQVyW02XIlneV1b9xxc3NaeSG5DvwF+xe
 lpQdT0CDj1wC7JeCrR7hO8V29ylVc+sRJrxKa9WaKvqsYJPAvOXp1XPVYE5TQJgQS6RM
 TTSR1x2RY7AWabiOlNI8hnO+oQd/Sjxd4OPQI2mFNR9ETPL0p8wJI98PUJxxTPCJyPSJ
 XgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=LSizS/9zesc9L3Q8q0KExOOaZnxhpSqIfupAWQD+YuY=;
 b=PqFeMC+tB7dDVyGE012PNa+sHQaXI1MJndwUXINsdcyY5fQcWOJ26Q+X2KdOFBJOUn
 DeZxHa326KdubBLOd0zflhG5g4EuNzOwLVpyITjGRDtMzZ1wXJuJlyPblOqUGXh1/X5T
 OdT8wB4mAU471L11gS56cglReilM4e79lixhCu0QUvAcyVNgKM7oR3XoVJnUrMCxjzMz
 Swfx0RLOMOvreY4l6HxsfDYvhwoFVpXgJUoxqgxX68eJ+sMDZtQULTmQKvVyM16QqHpp
 ay9Kinc4EXbjT3dtMIUveFteRN/d/F/Ye4KJn/EH+JP041qnr5CNAplr6yeUTq2bMXV5
 M/Ug==
X-Gm-Message-State: AOAM5330nrjOvGGXmNf+rMRQZX+MMl7YFrYXwhf8hWkW0HidfbdVL638
 kv+6UkOdObfQI9jKSSkRAKMAtXMd47l6iw==
X-Google-Smtp-Source: ABdhPJwaYe4uNT7ZAjdMK3xCSflpIMvaaknoiPgmzfDXOzOKj4ZLHa1tQc6swSd+l4lDvWO3B1moRQ==
X-Received: by 2002:a50:cf48:0:b0:415:df40:9e3d with SMTP id
 d8-20020a50cf48000000b00415df409e3dmr14057453edk.185.1647116459098; 
 Sat, 12 Mar 2022 12:20:59 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 lk10-20020a170906cb0a00b006da92317793sm4649243ejb.131.2022.03.12.12.20.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 12:20:58 -0800 (PST)
Message-ID: <6c13f61c-d2e9-5433-d331-772d7d71fbfa@mind.be>
Date: Sat, 12 Mar 2022 21:20:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20220224162517.222437-1-romain.naour@gmail.com>
 <20220224162517.222437-2-romain.naour@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220224162517.222437-2-romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCHv2 2/2] package/efl: handle input option
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/02/2022 17:25, Romain Naour wrote:
> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> Commit 2d7a3e48c574c05346b66f79cdb75ecdfa7f074e forgot to manage input
> option on target which was added (and enabled by default) by
> https://git.enlightenment.org/core/efl.git/commit/?id=0c2cf7e1bf7ca547655d25aaea30d081101b42be
> resulting in the following build failure when eeze is disabled:
> 
> ../output-1/build/efl-1.26.0/src/lib/elput/meson.build:1:0: ERROR: Unknown variable "eeze".
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/4a840c54bad9748b5748738378a0352d02de1f7e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> [Romain:
>    Rename BR2_PACKAGE_EFL_LIBINPUT to BR2_PACKAGE_EFL_ELPUT to match the
>    upstream name.
>    use BR2_PACKAGE_EFL_ELPUT for BR2_PACKAGE_EFL_DRM
>    remove duplicate libxkbcommon in EFL_DEPENDENCIES]
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> v2: rework BR2_PACKAGE_EFL_DRM
> ---
>   package/efl/Config.in | 19 +++++++++++++++----
>   package/efl/efl.mk    |  9 +++++++--
>   2 files changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/package/efl/Config.in b/package/efl/Config.in
> index 4c78bef7c8..c4f82b92e3 100644
> --- a/package/efl/Config.in
> +++ b/package/efl/Config.in
> @@ -85,6 +85,19 @@ config BR2_PACKAGE_EFL_LIBFRIBIDI
>   	  so you may also trigger code paths with bugs that are never
>   	  normally used.
>   
> +config BR2_PACKAGE_EFL_ELPUT
> +	bool "Enable elput support (recommended)"
> +	default y
> +	depends on BR2_PACKAGE_HAS_UDEV # libinput, efl-eeze
> +	select BR2_PACKAGE_EFL_EEZE
> +	select BR2_PACKAGE_LIBINPUT
> +	select BR2_PACKAGE_LIBXKBCOMMON
> +	help
> +	  Eplut is used to support gesture recognition.
> +
> +comment "elput needs udev /dev management"
> +	depends on !BR2_PACKAGE_HAS_UDEV
> +
>   config BR2_PACKAGE_EFL_LIBSNDFILE
>   	bool "Enable libsndfile support (recommended)"
>   	default y
> @@ -216,13 +229,11 @@ endchoice # OpenGL support
>   
>   config BR2_PACKAGE_EFL_DRM
>   	bool "Evas DRM Engine"
> -	depends on BR2_PACKAGE_HAS_UDEV # efl-eeze
> +	depends on BR2_PACKAGE_HAS_UDEV # efl-elput, efl-eeze
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
>   	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # require libgbm from mesa3d
> -	select BR2_PACKAGE_EFL_EEZE
> +	select BR2_PACKAGE_EFL_ELPUT

  Is this really true? The description of elput says that it's about gesture 
recognition, I don't see how that's related to the DRM backend. And the help 
text below is saying something like "you can use input gestures both on drm and 
fb", so it's weird that elput is only required for drm...

>   	select BR2_PACKAGE_LIBDRM
> -	select BR2_PACKAGE_LIBINPUT # For elput

  There was a corresponding _DEPENDENCIES += in the .mk file, I removed that 
since it's covered by elput.

  With that change, both applied to master, thanks.

  Regards,
  Arnout


> -	select BR2_PACKAGE_LIBXKBCOMMON
>   	help
>   	  This option enable building support for the Evas DRM Engine.
>   
> diff --git a/package/efl/efl.mk b/package/efl/efl.mk
> index 43a2dc4fcb..bb0bd3f76d 100644
> --- a/package/efl/efl.mk
> +++ b/package/efl/efl.mk
> @@ -67,6 +67,13 @@ else
>   EFL_CONF_OPTS += -Deeze=false
>   endif
>   
> +ifeq ($(BR2_PACKAGE_EFL_ELPUT),y)
> +EFL_DEPENDENCIES += libinput libxkbcommon
> +EFL_CONF_OPTS += -Dinput=true
> +else
> +EFL_CONF_OPTS += -Dinput=false
> +endif
> +
>   ifeq ($(BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT),y)
>   EFL_DEPENDENCIES += util-linux
>   EFL_CONF_OPTS += -Dlibmount=true
> @@ -204,8 +211,6 @@ else
>   EFL_CONF_OPTS += -Dwl=false
>   endif
>   
> -EFL_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBXKBCOMMON),libxkbcommon)
> -
>   # json evas loader is disabled by default by upstream.
>   # Disable libspectre (ps).
>   # Keep all other evas loader enabled or handled below.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
