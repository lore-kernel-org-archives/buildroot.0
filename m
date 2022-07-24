Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F89C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 10:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68C6740BA3;
	Sun, 24 Jul 2022 10:30:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68C6740BA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Tt2ML4Vg9l4; Sun, 24 Jul 2022 10:30:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 594EE40B97;
	Sun, 24 Jul 2022 10:29:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 594EE40B97
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EAB261BF2E4
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C36B9417C4
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:29:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C36B9417C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QVJjgzB-UkMD for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 10:29:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52DCF424BE
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 52DCF424BE
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 10:29:44 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id h9so12159562wrm.0
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 03:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UzcgGTJpdmXct7yGfh5VQDbcR2hC2sgs3othIBTeYCk=;
 b=4PbkBfPKvhqj6Heg5f8RWgZ+/Cy5IO4/p00PwPLpxEzJUe31C4WkOyN/QTzDmkYQtM
 ud45M7GEqLgb07CneInia7UIP8bQTQHI61Y14sl+b541Tghz0ja9H7IK3udjKA0A25dd
 AT/RYIuAS/H2EjOFPlgwwKybhvf1xulTnEabb6NLvoCkDr+LtqXHeJIGqzCFd168Q/XM
 zGHXlFi48out+K0Z4wBvIjMf3howJI8QgDgMwKvxyHMC/bxGgn4BGhZpX0t4ORO3q6Cz
 zeOveEOuRX7z4gfDA4ggZC+s1s0wsWyTFRd/lQ4xMraGusnQwEaifKHyaT7lhlUC1PYe
 AsCQ==
X-Gm-Message-State: AJIora98dHboJjbifOfTuvWKSvY7zyvANC+S1duU5PfOKRL2EZI77S84
 zur1DE7Z0GQkysYF33zcWxyrNg==
X-Google-Smtp-Source: AGRyM1vhPtkD7EBWg9YNRj6YqN5AkhbBOnr2aBt+n5rbxw3iFCvmal0U4OY9nrpNtivP0nQqmLBZYA==
X-Received: by 2002:adf:df86:0:b0:21d:8506:99e2 with SMTP id
 z6-20020adfdf86000000b0021d850699e2mr5062100wrl.696.1658658581955; 
 Sun, 24 Jul 2022 03:29:41 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a05600c510f00b003a30fbde91dsm16031530wms.20.2022.07.24.03.29.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 03:29:41 -0700 (PDT)
Message-ID: <b6314344-0390-4920-13db-fa3e8adde9a9@mind.be>
Date: Sun, 24 Jul 2022 12:29:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220723214802.2424635-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220723214802.2424635-1-bernd.kuhls@t-online.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UzcgGTJpdmXct7yGfh5VQDbcR2hC2sgs3othIBTeYCk=;
 b=NytXbY7QspCLJuJYRDKSHCx1PaN+Vt0l1Z1YY5pp4SXyBShsbjjAIGL5A2jhumD+AT
 BKaT7rfvmnhgRk/mYLikRNCmtcwzrPVEg46GJOUkn/CHxDBMHIiVCCq91R2ybkfP8iz7
 KO9onb9yEl4GxmR6JjErEHHg01uIGgztgU4XkHYNVcx87ZQdfy0ulg783juZ29ELuFIr
 ryUJI6W/NcVEamf5jXTUs+1QeF6Ivz+H4y/5WowYkL5bIe5GQfhAuer1uLjnvvk8l2y1
 Dj4CBHrDPgQ2JEhbzh5L8OmMN/ilOOMkEG7t1OaUtpGGJaYUhOYhxhOB6UERAc8aDQRN
 hHZw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NytXbY7Q
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 22.1.4
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/07/2022 23:48, Bernd Kuhls wrote:
> No release announcement available from upstream this time so we had to
> computed the tarball hash ourselves.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/mesa3d-headers/mesa3d-headers.mk | 2 +-
>   package/mesa3d/mesa3d.hash               | 5 ++---
>   package/mesa3d/mesa3d.mk                 | 2 +-
>   3 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
> index 6a9810b880..a5cefa254f 100644
> --- a/package/mesa3d-headers/mesa3d-headers.mk
> +++ b/package/mesa3d-headers/mesa3d-headers.mk
> @@ -12,7 +12,7 @@ endif
>   
>   # Not possible to directly refer to mesa3d variables, because of
>   # first/second expansion trickery...
> -MESA3D_HEADERS_VERSION = 22.1.3
> +MESA3D_HEADERS_VERSION = 22.1.4
>   MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
>   MESA3D_HEADERS_SITE = https://archive.mesa3d.org
>   MESA3D_HEADERS_DL_SUBDIR = mesa3d
> diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
> index bf99539d2e..dfbd207b36 100644
> --- a/package/mesa3d/mesa3d.hash
> +++ b/package/mesa3d/mesa3d.hash
> @@ -1,5 +1,4 @@
> -# From https://lists.freedesktop.org/archives/mesa-announce/2022-June/000682.html
> -sha256  b98f32ba7aa2a1ff5725fb36eb999c693079f0ca16f70aa2f103e2b6c3f093e3  mesa-22.1.3.tar.xz
> -sha512  e7348839eb37de89c90d21277a7cbb42ee673ad6c656177853f6d35db99556dbac29867712222342d902b4fa67df5687c9d543bad99c81bcd0ecfb7f08f37480  mesa-22.1.3.tar.xz
> +# Locally computed
> +sha256  670d8cbe8b72902a45ea2da68a9da4dc4a5d99c5953a926177adbce1b1640b76  mesa-22.1.4.tar.xz
>   # License
>   sha256  4bc15d14dcc134b024cbdca3b5330010136ce8a427b6f8353440ce2ad7aab037  docs/license.rst
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 1769a697e4..60184e4987 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   # When updating the version, please also update mesa3d-headers
> -MESA3D_VERSION = 22.1.3
> +MESA3D_VERSION = 22.1.4
>   MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
>   MESA3D_SITE = https://archive.mesa3d.org
>   MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
