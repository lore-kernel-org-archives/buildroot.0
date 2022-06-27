Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89A6C43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 20:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57A1C60E29;
	Mon, 27 Jun 2022 20:12:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57A1C60E29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BxcFru5Bs72g; Mon, 27 Jun 2022 20:12:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CB3F60ACF;
	Mon, 27 Jun 2022 20:12:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CB3F60ACF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D9F781BF2B0
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 20:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B37D64150E
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 20:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B37D64150E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X0hlWdX68FKW for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 20:12:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FF4E414CE
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6FF4E414CE
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 20:12:38 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id ej4so14646112edb.7
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 13:12:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8tZBKmorzGUZSFvgWQFtOI6nQAzQUv52p6kzyky9esM=;
 b=IsgvLQwwmoKJxMpaY/Qz+7B5NOQvaoOLs21bo5SADgotecfyWSQP9HwycH3YnfSL8y
 3FB0K9yDZMhrnkUfDAjmldH8xyOHxgcwF/euOW7ZOSAL9/4sF7/CyVZ8lPSNhbaSiLmd
 lowNOHCOWBPBgF0WfASziyIrrbEpgMhFbr1L4uPbqTRiBpXJ+duusj9sAHtaTu7F4pI2
 rHSz2V4vE8gsdFiVIg9ocwKsnJCt+dGpuGxT9aelaDS0OUnzOnIEJ9VQqCVon9ijQMab
 wVuV6d+BM6a1FVsGITfLPD634dcNci2NowkdengmbuLy3+2qST/AP9RHJdl/PyJaugEP
 jGeg==
X-Gm-Message-State: AJIora9a1ctjgcfe+0IvzWu4i10DiBRiSMpn05B/+pm6SX6CaUV9x8RT
 boW/kel65hZ+JskiMK+iRZpH7Q==
X-Google-Smtp-Source: AGRyM1tVvX2A0x7l8KlYp+0Gwq0lTg7fGLlUnPyCt1CgaJ84WQutRNfKJj+Gpda08Deg8leFOS987g==
X-Received: by 2002:a05:6402:2549:b0:437:788d:b363 with SMTP id
 l9-20020a056402254900b00437788db363mr14376669edb.406.1656360756433; 
 Mon, 27 Jun 2022 13:12:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 jz18-20020a17090775f200b0070fd7da3e47sm5417771ejc.127.2022.06.27.13.12.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 13:12:35 -0700 (PDT)
Message-ID: <742cf792-e320-dc72-c6f8-e647ab4e2402@mind.be>
Date: Mon, 27 Jun 2022 22:12:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Raphael Pavlidis <raphael.pavlidis@googlemail.com>, buildroot@buildroot.org
References: <20220620191403.22187-1-raphael.pavlidis@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220620191403.22187-1-raphael.pavlidis@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8tZBKmorzGUZSFvgWQFtOI6nQAzQUv52p6kzyky9esM=;
 b=eHSo31uMrjWYmhQIH1VdXKViiIjPs7MuJ+bguy3XnQtLpxVTYFrlVTKvKfMnKmXr8s
 pFv+7gBmZeHbYbw4MxqlmQ+Zz7ZBVQPCv0/UA/vdOjVJKvqdOPcS38/trI3gsjnTMjwl
 VK3cRhBbD6kGvVzuncN29TbbWesiPCzwBTO8OcxeCpB7vCGNAg0OnB8nDgnAkCKAw715
 lBUhlDZmWY1hFe1pwhulS8Q51usTPOI04jo8f7JTuIMo3/Qp8jhR/pQtkOTcfATyKp1r
 ZHL+50Qfg68rPSUs/FKXAREZPJvhE6AQx5b6ZHgJxzqm1OCmeZsABvRLTA7LYC5nq8bh
 AvjA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eHSo31uM
Subject: Re: [Buildroot] [PATCH v2 1/1] package/slirp: bump to version 4.7.0
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
Cc: Thomas Huth <huth@tuxfamily.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/06/2022 21:14, Raphael Pavlidis via buildroot wrote:
> https://gitlab.freedesktop.org/slirp/libslirp/-/blob/v4.7.0/CHANGELOG.md
> 
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/slirp/slirp.hash | 2 +-
>   package/slirp/slirp.mk   | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/slirp/slirp.hash b/package/slirp/slirp.hash
> index 326b2ad246..3f7abdee5a 100644
> --- a/package/slirp/slirp.hash
> +++ b/package/slirp/slirp.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  b8a22ac4d601ba16122a67827c0f4361785d4d283f21ff8ed48d4aa1e7693477  libslirp-4.6.1.tar.xz
> +sha256  358ce8b6ea59ec9deac937cc754f0115b992839e7b0cddf30ffb8f77dc21da82  libslirp-v4.7.0.tar.bz2
>   sha256  b28aecf4796a6a22054167f0a976de13d9db335669d37afd2dc7ea4c335e1e13  COPYRIGHT
> diff --git a/package/slirp/slirp.mk b/package/slirp/slirp.mk
> index 43d2c520e9..10d367587d 100644
> --- a/package/slirp/slirp.mk
> +++ b/package/slirp/slirp.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -SLIRP_VERSION = 4.6.1
> -SLIRP_SOURCE = libslirp-$(SLIRP_VERSION).tar.xz
> -SLIRP_SITE = https://gitlab.freedesktop.org/slirp/libslirp/uploads/83b199ea6fcdfc0c243dfde8546ee4c9
> +SLIRP_VERSION = 4.7.0
> +SLIRP_SOURCE = libslirp-v$(SLIRP_VERSION).tar.bz2
> +SLIRP_SITE = https://gitlab.freedesktop.org/slirp/libslirp/-/archive/v$(SLIRP_VERSION)
>   SLIRP_LICENSE = BSD-3-Clause
>   SLIRP_LICENSE_FILES = COPYRIGHT
>   SLIRP_CPE_ID_VENDOR = libslirp_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
