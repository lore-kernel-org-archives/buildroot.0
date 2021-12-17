Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E8CC433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 17:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3653140C1A;
	Fri, 17 Dec 2021 17:39:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id knqrkR13UgJX; Fri, 17 Dec 2021 17:39:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42DC840C04;
	Fri, 17 Dec 2021 17:39:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9EFB51BF2AF
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 17:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CDB484CA4
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 17:39:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id okYw7DtYgo9o for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 17:39:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DBC784C40
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 17:39:01 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id t5so10831445edd.0
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 09:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bo8jLSFaIiEJ286WxwG2GOFZe8WLr0q+i4s/eIFMTyo=;
 b=ZR1thbuTwkfVb3kAMhSE7rtMFUsWZ67lTPe9j/dXzdCz7ghjfs/OzKxA8dg8wKgZUn
 StpfC22C4M74HXllKC2pctYQpX+ZjqUgEXz2paY71XXzY8QLratBH/YpGogY6w1tbyST
 dH1lKi6teg+izhFsgEv+gO58NykD9RIVbIdwstGyGcwkGgUpG9qf34c9dtXLb4ysLKQ/
 uFyC5Tb5/Mc5z6myZas7HalczHL5k0qWunbpknxJ8vIqHnpXMfkdtPQ+GQR2JBffQkSP
 gm25joXpAMshCZzDLbM7o0MlzXnluluVp0X8MqE2ZQTEeUZmBGlgLnjK4DBiJH5sb8JW
 KZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bo8jLSFaIiEJ286WxwG2GOFZe8WLr0q+i4s/eIFMTyo=;
 b=ImtdRw/2qvC4UDvhlNLIVL6EsBbimA0ZMvPgoeOibYcw0GI0uOc763lUmAzhTZGD4E
 zm53LsEjpsoGxLaGp3+G3X9M0kFRSHOWdCFrQju3RKBvntkAxZMgnU03QC7q71tzTbsw
 yj2jgjBamMKsZVLexMP9wH+5RVIWezONGlR/xaPrdKp0HxTbHjk60TZzCFVQynU0oKLh
 uQLVr35fU32GH6EFFSo1iT/c2UOeHc0o13/uVgqMhAreqRyiQFYwokRb7cGvvlZ7M3O+
 z3g7Iy6G2hNJJrrOuaXepR5HaHdIAY1DAFy2vfMJP4nSkzrs+HK/Bcl3C3w8kPX06w0V
 G+kA==
X-Gm-Message-State: AOAM531w1jWKDxF3v+9ib3yvZ6P2krG37rQ0eHkezxwFvzoIAN9nb1aS
 CdOIJejp5S4DxMlo5+Bw/gll4g==
X-Google-Smtp-Source: ABdhPJyKxIp2cHd/KNlW5Y8lueaLq+0TlZ6KtcdIeX3um6xbcFjEAMop6K9cBa+Ieq96M/aAjEfSbg==
X-Received: by 2002:a17:906:7299:: with SMTP id
 b25mr3383393ejl.550.1639762739658; 
 Fri, 17 Dec 2021 09:38:59 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id l18sm3081572ejo.114.2021.12.17.09.38.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 09:38:59 -0800 (PST)
Message-ID: <3f89fc32-268f-625c-4db0-d4917d4ff436@mind.be>
Date: Fri, 17 Dec 2021 18:38:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20211216212811.787978-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211216212811.787978-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-gmmlib: bump version to
 22.0.0
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/12/2021 22:28, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/intel-gmmlib/intel-gmmlib.hash | 2 +-
>   package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
> index 88f82a9596..60d45a315e 100644
> --- a/package/intel-gmmlib/intel-gmmlib.hash
> +++ b/package/intel-gmmlib/intel-gmmlib.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  77473df5440915e7c487a0f1c3f6236a8c29610528c6f0833da9caae834a1741  intel-gmmlib-21.3.3.tar.gz
> +sha256  337c63f5bbc2c7ea2ba85aecd40ae72dc65187ba07c4feea73e129d53f30677c  intel-gmmlib-22.0.0.tar.gz
>   sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
> diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
> index 2071d9f533..36e61dc4d2 100644
> --- a/package/intel-gmmlib/intel-gmmlib.mk
> +++ b/package/intel-gmmlib/intel-gmmlib.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -INTEL_GMMLIB_VERSION = 21.3.3
> +INTEL_GMMLIB_VERSION = 22.0.0
>   INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
>   INTEL_GMMLIB_LICENSE = MIT
>   INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
