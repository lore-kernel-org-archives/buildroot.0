Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED78C433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:22:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F379360C4D
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F379360C4D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA80F4022F;
	Mon, 11 Oct 2021 21:22:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9nw7Oifd36Qm; Mon, 11 Oct 2021 21:22:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA99040375;
	Mon, 11 Oct 2021 21:22:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C94A01BF865
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0958608F2
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:20:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LdwmCl9Yui5d for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 21:20:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C64D3608EB
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 21:20:56 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id d9so48806550edh.5
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 14:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=y8RDNOBFqUsKeYrGX9ojk1xk05lALsBE5vcACWJWyNs=;
 b=A7G33T5Pu7r0XDsiqo3y3iu9xW1I5pfVM0gFpdzL6n00VyPKzhaPkX4b5ULKiYB9AA
 Q9uDrWG/S7Pazs7HLFv8o4f6Dpy6RmYTzpB56B6Ree5kw9UVzZbnLyXscCNRClx8qKOL
 k92JTiAadx3dBOKVQayEfMPK4DpEmePIQtTMcZzKI13DzaM3szCZcO7zy1POQ/mCZ4hw
 BHNXE0lXThF25XhdPXHDI9QPAedIYN7ybwscZWyKc2DKCIEJZk7pNi+5/T5Zqy9d6IhR
 vWqpF+zzDJ8Zeh9y246j6MkRAAYphOAMzuoCX8nKhTrDm9D5XUIjNxJHkOtKe2f0gsba
 JCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=y8RDNOBFqUsKeYrGX9ojk1xk05lALsBE5vcACWJWyNs=;
 b=jiht2ksx0cPs/qzJ+GF0BdqUuBOqhM9u5DKn1MHcRPaHRfFZxdP4d6RI7bbmk8zIhk
 EfewvRQ9YnMeJkVxq+EXJAY7cC97i8Quhopb+fyiJZRHyAUdIGQHFVSgfB3ZjdKtJaxo
 6XYcoSp1MpRlTXCwucsygCUFU3NL0Y7IVgwXsscCmnETXwsEbp+HhNoKIdUQK0B75MiX
 bkwLq7jVi1p7a03XWSrit57WpLZKtH/DVKCF4iQMt2OQjJ7zSAJPNyhnKU1kHHOVeMar
 qFEoi5Orj2DKKfEC5vlZol8rBP9iK2ag+DnJNnllUwbsrp7RxN4c49gI9p4csrKmpPGT
 r9ag==
X-Gm-Message-State: AOAM530xM6rcjjfOjsGaosJpN2Sb3LQB5csJTUUxlTcUE4z74wdyalsV
 I3HczUXdqd4u5/ruCv7JnI0blwuYlNkLPjAk
X-Google-Smtp-Source: ABdhPJzy53mDsGT9sYA669VTUYvgH06GbC4lWv2nVN95Ax3umxoMIysrIMrux7rrRHkpr4LYRJ5l8Q==
X-Received: by 2002:a17:906:1299:: with SMTP id
 k25mr28411814ejb.139.1633987254945; 
 Mon, 11 Oct 2021 14:20:54 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id b2sm3994386ejj.124.2021.10.11.14.20.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 14:20:54 -0700 (PDT)
Message-ID: <2d42200e-e68b-be60-afdb-b529f35e0247@mind.be>
Date: Mon, 11 Oct 2021 23:20:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20211002065117.694719-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211002065117.694719-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/stellarium: bump version to
 0.21.2
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/10/2021 08:51, Bernd Kuhls wrote:
> Release notes:
> http://stellarium.org/release/2021/09/27/stellarium-0.21.2.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/stellarium/stellarium.hash | 4 ++--
>   package/stellarium/stellarium.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
> index 3bd1e6b3f2..4c949d6587 100644
> --- a/package/stellarium/stellarium.hash
> +++ b/package/stellarium/stellarium.hash
> @@ -1,5 +1,5 @@
>   # From https://github.com/Stellarium/stellarium/releases
> -sha1  cc0b2c450ecead1481317f6038512a6a52d32001  stellarium-0.21.1.tar.gz
> -sha256  072309c6bc48233b39884ae558b23764d0e08eabd96b014b53d780be11a33211  stellarium-0.21.1.tar.gz
> +sha1  e61b66eae54888cf90f6dab7b49bc4ca6d9d941b   stellarium-0.21.2.tar.gz
> +sha256  e588b66a173834f74a6462f5219ce4d38e8f87405b932267f6f1d2d4dbff4a82  stellarium-0.21.2.tar.gz
>   # Locally computed
>   sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
> diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
> index 20e0e9ffec..810eb0541b 100644
> --- a/package/stellarium/stellarium.mk
> +++ b/package/stellarium/stellarium.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -STELLARIUM_VERSION = 0.21.1
> +STELLARIUM_VERSION = 0.21.2
>   STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
>   STELLARIUM_LICENSE = GPL-2.0+
>   STELLARIUM_LICENSE_FILES = COPYING
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
