Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C73CD1284
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 19:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DF3C40459;
	Tue,  2 Apr 2024 19:39:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J13qvqG6Nzz6; Tue,  2 Apr 2024 19:39:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2378A40640
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2378A40640;
	Tue,  2 Apr 2024 19:39:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EC3F51BF369
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 19:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8C69406DF
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 19:39:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fHMjB60FVeSJ for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 19:39:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 18939404EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18939404EB
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18939404EB
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 19:39:51 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-415a84ea9bbso12980705e9.2
 for <buildroot@buildroot.org>; Tue, 02 Apr 2024 12:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712086790; x=1712691590;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OAxJ5JEciJUuv86rdi7MqEQ7dWXOXStlWKtU/zqhPRQ=;
 b=NnhBi9zfHxByRAzxdNIbC05ym/uXbjNyBhzan4R6Ea4Qjk40iIPtbkELHBd+4GE9Pt
 LZaU0lRV3BxOBJnt4u6wJU39CUYvsI0ubo/ciLdvJGssDXXwFmP1JK6bIefeYTDvo7Jj
 PRq2USLVRMo9i8FcXj6SCIZq7iNoHf6QchNdUz72KFM6YpHTV1nmVvte/IAnCNkLygjI
 TMvNe4AV74lwdoWG4AlgVsLN8ln6upN8DGxMZnMBKAKLtaughCkWOfe0hWpV2KjtHVEr
 f13fc2EuB2vv/6EeKOq4L7zz/3233Pi+d+yJ/L9kmTfSHushUTR+H+7lG+D8b1vUsjEG
 bMYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWafkubrQOn+K3h9/6q/QMh13IKUM8Wx9fCzihKswqreLTKxfDGKf79mxYxZNZEWeQHkPW1uAz/rsmaY6zr817iqzXEzaUxGw==
X-Gm-Message-State: AOJu0YyYn7//9FQi9ltuEtftpeFbMtahMebTP4jphrJwWDhiWFi3hUb0
 OA5S5RChOfNpbKGAaiGnOl4vGdklOJFnyYrXIrM0lgAHKmy8qSLl09Mxd/h/vR0=
X-Google-Smtp-Source: AGHT+IFGs/1jWOiMR+qs6NrujYgNEbvipQQUN3sxjyDG4AmWgd97y40qRnC1zmCdUc9E+FCH/Kg1SA==
X-Received: by 2002:a05:600c:17c7:b0:414:392:38d2 with SMTP id
 y7-20020a05600c17c700b00414039238d2mr2401206wmo.24.1712086790031; 
 Tue, 02 Apr 2024 12:39:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 u22-20020a05600c139600b00414906f1ea1sm18858667wmf.17.2024.04.02.12.39.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 12:39:49 -0700 (PDT)
Message-ID: <dcdea72c-5e31-4ac6-806c-d3640178fbc5@mind.be>
Date: Tue, 2 Apr 2024 21:39:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Buildroot Development <buildroot@buildroot.org>
References: <20240301095442.953549-3-bagasdotme@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240301095442.953549-3-bagasdotme@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712086790; x=1712691590; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OAxJ5JEciJUuv86rdi7MqEQ7dWXOXStlWKtU/zqhPRQ=;
 b=V/gH54s0a6sp7eV/N1FoOjbu72NPGuo/4goVYF8RQnAtkYavzuNMsjGgCVliTD60rL
 uYmef/NoglQnwAqfms4uXOey4dPSS6sGiJYzcPoUJAGU75uXfp8+gICAvCR/XD5QVXzW
 VhqdDUZMipJmgsPfs2fVN5vy7FR19ZoS5oSK4XMnXaVs+x8d0HNOlGB9qjttd8oj7S0W
 8kV5OMgUxMn6H3dlYtC7cLPwKofkbuwQ2ozWNDJ53bDT4E4LsdAoeB09Xyj8K1lUeoZQ
 VT0VsSpoXue8BBsGEJwXFrfwTxFdqJakz0+QpnGYVzn9RD3Zn4Tb6nLJcIZJo12zJHNu
 SrZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=V/gH54s0
Subject: Re: [Buildroot] [PATCH] package/git: bump to version 2.44.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/03/2024 10:54, Bagas Sanjaya wrote:
> Bump the package version to 2.44.0. For the full release notes, see the
> release announcement at [1].
> 
> Link: https://lore.kernel.org/git/xmqqbk87w164.fsf@gitster.g/ [1]
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/git/git.hash | 2 +-
>   package/git/git.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/git/git.hash b/package/git/git.hash
> index 9cf044cc07..f609a4aaa4 100644
> --- a/package/git/git.hash
> +++ b/package/git/git.hash
> @@ -1,5 +1,5 @@
>   # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
> -sha256  5446603e73d911781d259e565750dcd277a42836c8e392cac91cf137aa9b76ec  git-2.43.0.tar.xz
> +sha256  e358738dcb5b5ea340ce900a0015c03ae86e804e7ff64e47aa4631ddee681de3  git-2.44.0.tar.xz
>   # Locally calculated
>   sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
>   sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
> diff --git a/package/git/git.mk b/package/git/git.mk
> index 1502968186..a9cc3c30a7 100644
> --- a/package/git/git.mk
> +++ b/package/git/git.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GIT_VERSION = 2.43.0
> +GIT_VERSION = 2.44.0
>   GIT_SOURCE = git-$(GIT_VERSION).tar.xz
>   GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
>   GIT_LICENSE = GPL-2.0, LGPL-2.1+
> 
> base-commit: 5f253e3e04e57d72f470eead8591a2606f98d396
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
