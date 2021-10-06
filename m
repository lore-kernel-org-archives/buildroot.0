Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D4AC433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:27:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4097060F12
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4097060F12
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 118DC40902;
	Wed,  6 Oct 2021 19:27:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oaj_uYKe78Z0; Wed,  6 Oct 2021 19:27:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76212408F5;
	Wed,  6 Oct 2021 19:27:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 830CD1BF350
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72613408F5
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:27:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TN0FB870IFpc for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 19:27:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B21F408F4
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 19:27:25 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id dj4so13871256edb.5
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 12:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BfESUnE81K8V1luonElDLrqhYpohr4hk7hCGD9am0fE=;
 b=A86Co5JPbMJgOrzdGTBySCrlvB2yV+SMNWsjqOVolrAWNZ6QVIqGhtoOyoNtGlplJJ
 E+sFEI+LA9Al6U2ZlumY/BS/FJMOpVhFqSnGdDHCCczXM71ZMKNdPZn+bXmvFQNtrR+J
 inpBMNK+ozJxVpOPIwiU5sxHOZNyKA5i/iG8ZAtvtp8dQhxrPGKdEbyCg3lTxBuzHt9r
 5+qUzc4pEBPLc3KwdFLI3GO46Q2o2tvRADg4+wKpvfWYwCccrWr550dEssODTMwOHhj1
 YQyuCVu7Qy/k2cHn8334lFCnedMzfduaTZ4rvCNpjbWJkDjTWa7l7eXbuisi/0Bl9krG
 MHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BfESUnE81K8V1luonElDLrqhYpohr4hk7hCGD9am0fE=;
 b=w4fAr/fRrL71Jz4cuDwcA85+E8TtNbs49UcHNl7gdEEfVUrsJhldnQb4lvfk+9T8O+
 G6786n83hVLnhSZy5+5opDgUY9Jm+45MBhLbJiJ4KpsIH5J9e6+0e3Kcp56KZ2jkC1Fn
 VW3PkV9DTJr+mSSfDhsYxblrGxeSFVoOs2clsud5Rzqxo1tsDdoZiNG4aGmIh2oi5crI
 gg4zIq7aspXqYxfgXyJvukMpk+8OMQ5bGDaUwZpkTwaftbTz6hT5pvk8Coddf76i8U21
 Dt8HW3UyuGIcbMZPErrSUxB9NDNszBWrZrvOmSNOpQPxdOJxw8qIekibBCjU3IdvqDX2
 k16Q==
X-Gm-Message-State: AOAM530RBqvlHS3fDUuUZ39hhNTQsHV/gaPVNZYvJCxqqpFLzcOxYRYM
 Xnbr1+CodLu0JjdNj2+gKIdgw4PVKtXAxKhf
X-Google-Smtp-Source: ABdhPJw6PmYFedvZ1rHPn1BtzmvtdUrKb55bQohFVH2jPkHZXJ5SkGjWV9hZbVd4ctzIOs/flVkojQ==
X-Received: by 2002:a05:6402:1b90:: with SMTP id
 cc16mr108532edb.2.1633548443597; 
 Wed, 06 Oct 2021 12:27:23 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id bm1sm9294116ejb.38.2021.10.06.12.27.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 12:27:23 -0700 (PDT)
Message-ID: <0161ef97-b3bc-13d8-1682-d9ec2f77e77a@mind.be>
Date: Wed, 6 Oct 2021 21:27:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210924151821.1745669-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210924151821.1745669-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/wavemon: needs libnl tools
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
Cc: =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/09/2021 17:18, Fabrice Fontaine wrote:
> libnl tools is needed since bump to version 0.9.4 in commit
> 5cae1a0d675eca41125b6430157d3d0d78d1220c and
> https://github.com/uoaerg/wavemon/commit/2a22c3dac0675c1d8985263c1a5b62d0a0f9a5e6
> to avoid the following build failure:
> 
> checking for LIBNL3_CLI... no
> configure: error: need libnl-cli-3.0 >= 3.2
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/3e5886e2c96c92e9626b2f6b2cd2b8f43c06da2e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/wavemon/Config.in | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/wavemon/Config.in b/package/wavemon/Config.in
> index 0cb4cb5c69..0e087bd0c8 100644
> --- a/package/wavemon/Config.in
> +++ b/package/wavemon/Config.in
> @@ -1,8 +1,10 @@
>   config BR2_PACKAGE_WAVEMON
>   	bool "wavemon"
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_STATIC_LIBS # libnl tools
>   	select BR2_PACKAGE_NCURSES
>   	select BR2_PACKAGE_LIBNL
> +	select BR2_PACKAGE_LIBNL_TOOLS
>   	help
>   	  wavemon is a wireless device monitoring application that
>   	  allows you to watch signal and noise levels, packet
> @@ -15,5 +17,5 @@ config BR2_PACKAGE_WAVEMON
>   
>   	  https://github.com/uoaerg/wavemon
>   
> -comment "wavemon needs a toolchain w/ threads"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +comment "wavemon needs a toolchain w/ threads, dynamic library"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
