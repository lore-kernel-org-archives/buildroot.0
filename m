Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1603ACD98C2
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 20:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C279F81882;
	Tue, 10 Oct 2023 20:54:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C279F81882
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XdvjHfA2J3-R; Tue, 10 Oct 2023 20:54:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D199982294;
	Tue, 10 Oct 2023 20:54:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D199982294
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 986B61BF389
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 20:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71E7A81882
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 20:53:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71E7A81882
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E30FbuBpBK9S for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 20:53:27 +0000 (UTC)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3657B811AA
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 20:53:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3657B811AA
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-53627feca49so10170735a12.1
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 13:53:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696971205; x=1697576005;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vb742itcvhPAdv9XRbEj8nhbY0bqJc0MAD6Y1RFCZ/Y=;
 b=l9uWeWkWCTIFf/JPNQDi5j7EYlua3K+fjAerKtKQmPIZkifuqC1millRwbh7qus6k2
 jSQykFRPmpqqxeVbPziwe2vzyuGDMuQWiIN/aPgZ2ZXHefVTM6YxMA+yhsf6lur66Gcq
 5QYG9ErqwKKAgUNByjmcyJZeAE6LUmSJ5NyjQ69WDjaXAbMG6p9hDAj8095nYarGdG5j
 LTl7cP6z+fUeYFT33PkYNrayxJoGmYnDmEfECjsRiEnFtVUa/1oBek6UQ4rXd8lKyFFT
 rLuYFeg7ZU7FO7iqjjKflgxkjxhhtoGdHlaZg1IYRtJFbL9JVzwqVm6fldQHQyinKHT9
 hnSQ==
X-Gm-Message-State: AOJu0YzKris/9GJohqf22dxVDctxZSSVZWYYCz7ouAIhoENi5sLnNFRT
 uNDG4yfkXHSaISPnsDci9KveDw==
X-Google-Smtp-Source: AGHT+IFmAvtUz/CLcGvruj39Lepo8ZRU+LsFrX3kz7vn5xRtk1oQorRcsEbnPJM08TRjrKlGBgvh5g==
X-Received: by 2002:a05:6402:c94:b0:53b:307b:3969 with SMTP id
 cm20-20020a0564020c9400b0053b307b3969mr11370163edb.7.1696971205417; 
 Tue, 10 Oct 2023 13:53:25 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 h14-20020aa7de0e000000b00532eba07773sm8171874edv.25.2023.10.10.13.53.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 13:53:24 -0700 (PDT)
Message-ID: <adae598d-b5d2-7c0d-fb83-4fdccc10030e@mind.be>
Date: Tue, 10 Oct 2023 22:53:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
References: <20231009142233.1773833-1-adam.duskett@amarulasolutions.com>
In-Reply-To: <20231009142233.1773833-1-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696971205; x=1697576005; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vb742itcvhPAdv9XRbEj8nhbY0bqJc0MAD6Y1RFCZ/Y=;
 b=RQCOw9zZWRzFXlhYt4DtGF2N4DUZPWofEZe1N0c21Eb3ACrvVhRaFl36IbdS5hJ4gx
 wl7Jxaq+ReS6xklQJiiqR4YrvDBuzLyJxIP2LmpIe2spSXRa7ByEtXgFcxYKb7RFHACH
 f9MVZ2gYYB2/+VCvfjulNKePNNNgbrOa6ObTIGdu/6CjiW/9ZbRIw4OycHMQ5+uQmgUE
 J4y6tAinVAPGb+c2EAVNkDpMpOPsQQ1W0wkYD57PGm3f4IK3A1ssMVzUiq6an+BK4gSH
 e6oF2V0MQTIIQy7VjdLGdX/xceQho/AGEmTK5iwGio1WcH3JqWDofb/CCp+BgIf9Mh6S
 peLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RQCOw9zZ
Subject: Re: [Buildroot] [PATCH 1/1] package/sysvinit: bump version to 3.04
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



On 09/10/2023 16:22, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/sysvinit/sysvinit.hash | 2 +-
>   package/sysvinit/sysvinit.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/sysvinit/sysvinit.hash b/package/sysvinit/sysvinit.hash
> index f81e55fc44..67b0ab38f0 100644
> --- a/package/sysvinit/sysvinit.hash
> +++ b/package/sysvinit/sysvinit.hash
> @@ -1,5 +1,5 @@
>   # Locally computed:
> -sha256  b05c3677bb698afe64c997968b00c49b2a9bd320ce963523230ee7ea41197757  sysvinit-2.99.tar.xz
> +sha256  2a621fe6e4528bc91308b74867ddaaebbdf7753f02395c0c5bae817bd2b7e3a5  sysvinit-3.04.tar.xz
>   
>   # Hash for license files:
>   sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
> index 1bf10deb63..b7fe39ca43 100644
> --- a/package/sysvinit/sysvinit.mk
> +++ b/package/sysvinit/sysvinit.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SYSVINIT_VERSION = 2.99
> +SYSVINIT_VERSION = 3.04
>   SYSVINIT_SOURCE = sysvinit-$(SYSVINIT_VERSION).tar.xz
>   SYSVINIT_SITE = http://download.savannah.nongnu.org/releases/sysvinit
>   SYSVINIT_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
