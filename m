Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19096C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 17:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3ED9401D0;
	Sat, 12 Mar 2022 17:03:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bpUcxor42Ms7; Sat, 12 Mar 2022 17:03:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9EBD4015F;
	Sat, 12 Mar 2022 17:03:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 555D61BF3FF
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4372360E59
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x-JoZaCVNbGW for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 17:02:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47C1060E5A
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 17:02:58 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id g20so14529420edw.6
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 09:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wnYkBR8DlcghwmxxHl+ZuJ5Pasp4v/QgUiFllAvwJaw=;
 b=etNB/hG2ubgGgkeZljylvW3MHDCdzBAfNzQV3uJFNigqNLRNh8lopGjdNoyp+rPrST
 fOO87XbzyQ3fDJHKSVfOEpzv6fZEEhqxEyn2V4K+5Hrg3hP2++iBiXD5c6RkrCetZQNY
 yScY7NG20zR90NGqCfGBx3Y84+/46OuukSiV7ESSbvpF4VZ0enftIM/J/27Xo0PQdr7w
 1EJzVVlwfg/NYpewsHf+nmdgSPh7ZJhxVD4WjttU/eg4F1BXUBYc4YPF4zQYuKl4c9tw
 rCPDQxaahSHopGk6vbUUSL9zmAzycVSYglNyNX7SLTez66peyejKebD25L31XCaAS6tQ
 J2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wnYkBR8DlcghwmxxHl+ZuJ5Pasp4v/QgUiFllAvwJaw=;
 b=QcGlqQLkhQxzhREZ8hH+Tmu/cbq8FGXbMd3W7W3SYx9jKS4M7P6vdIOFvgMMKecL30
 YWco3W/ZBS2I+yNmx4vl7Uv/tquDQ/WOjBLOXYaqCxQMpEVw03QdhYAUYdHyTOyKtzAE
 9ulL3lG8G/Tv9oQ2nUrETFblWz5hAKSu4xpp7Q8CNdPTT9VHugHbq8hF7WCQOhyL7F/V
 X55WQIvT10HBjYMvvyqoAvtL3HsGu7znKUUiDa8fyn9R26zErOKsus65aFMjXMpsMquT
 NppO/rZOIjBNUTRiTLXVmcAc8OiV6TmCPJVoDax/h2JdXU5Udg3scSG5Rw95QmL7Jub3
 GMrA==
X-Gm-Message-State: AOAM531AH60vxCWg7u+zegV9/Lkqe3ZPDzCMwMGd0LQkwYntyCySjb3v
 0kbCZ3MoGfLv9Lvnq4tAKVjbsA==
X-Google-Smtp-Source: ABdhPJw5bniY+VDKe9oO4bXOMoN4ma5lVYXqEw3BKDejbsGkIIXqutupnoQxGPnqqaZS8SDdNPX0kw==
X-Received: by 2002:aa7:ce1a:0:b0:416:460:9df5 with SMTP id
 d26-20020aa7ce1a000000b0041604609df5mr13425302edv.277.1647104576369; 
 Sat, 12 Mar 2022 09:02:56 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a170906c00900b006d4a45869basm4549318ejz.199.2022.03.12.09.02.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 09:02:55 -0800 (PST)
Message-ID: <8ab5efb5-23c6-7feb-9a74-25b646b49f61@mind.be>
Date: Sat, 12 Mar 2022 18:02:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20220221213933.457-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220221213933.457-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v1] package/libinput: bump version to 1.20.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/02/2022 22:39, Peter Seiderer wrote:
> - change site URL to new gitlab.freedesktop.org location
> - change hash from upstream provided to locally computed (and drop sha512)
> 
> For details see [1] and [2].
> 
> [1] https://lists.freedesktop.org/archives/wayland-devel/2022-February/042111.html
> [2] https://gitlab.freedesktop.org/libinput/libinput/-/releases/1.20.0
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libinput/libinput.hash | 5 ++---
>   package/libinput/libinput.mk   | 6 +++---
>   2 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
> index f18a727810..d1c7cfb104 100644
> --- a/package/libinput/libinput.hash
> +++ b/package/libinput/libinput.hash
> @@ -1,6 +1,5 @@
> -# From https://lists.freedesktop.org/archives/wayland-devel/2021-December/042068.html
> -sha256  3cae78ccde19d7d0f387e58bc734d4d17ab5f6426f54a9e8b728c90b17baa068  libinput-1.19.3.tar.xz
> -sha512  f4b776d0da78c687ba21b430a04941ac6b43f68970c82ec9f7360358fdea5ed6a873948ce66a25bcdd64d4b95fa4bf705cc24dbc25c7c0f5fd2d0efbd763f298  libinput-1.19.3.tar.xz
> +# Locally computed
> +sha256  6c1f97892a7d599f97349e5e7c1239901fe00edcd4f6289f410034d5dc06cc85  libinput-1.20.0.tar.bz2
>   
>   # License files
>   sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
> diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
> index 2f9c639c22..b814e3416d 100644
> --- a/package/libinput/libinput.mk
> +++ b/package/libinput/libinput.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -LIBINPUT_VERSION = 1.19.3
> -LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
> -LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
> +LIBINPUT_VERSION = 1.20.0
> +LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.bz2
> +LIBINPUT_SITE = https://gitlab.freedesktop.org/libinput/libinput/-/archive/$(LIBINPUT_VERSION)
>   LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
>   LIBINPUT_INSTALL_STAGING = YES
>   LIBINPUT_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
