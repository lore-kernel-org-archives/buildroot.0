Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75AEC433FE
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 15:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8110C401B9;
	Sun, 12 Dec 2021 15:13:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zfiwBtbxs3uY; Sun, 12 Dec 2021 15:13:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BF4740550;
	Sun, 12 Dec 2021 15:12:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 05ECF1BF3EC
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9C8A85453
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:12:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qpl3w_TkhtJo for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 15:12:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E55D18544D
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 15:12:56 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id l25so44937458eda.11
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 07:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=L5Fg1Ridj5STjEfKCqTMw3YCPiEw+jXvi39XX2blJHI=;
 b=QThYPyctFSN2sphJbUjNKerlAIUQKX5asa+zAFdLg6ppRoPfXB+90gV8XkVfgqQKon
 gQTOr6Dps2rtsEsG87VSKbfuEPyB7LHZ7SmBZmsKLj3wfZK44CPbaowhw4YkUhj3oZQc
 C0vVI/o1SR1kePtqdaiZUJcUYEFCOdHO5WUpElMhDoBKkHGj8Gv34wUALP5er1X1K8t5
 hxxenAKfWnbsS6HkHijR//LJsaj2g9jgr/VX/B5w9sVX1E9Y+348YWwhzXSePqA6EGod
 tmcBl4ef7H14KaeBROfdyzzgRf8aIFwgXUXAbBimXSNfh1/mtl5Cpiy5oXkg0FwpQmKN
 p4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=L5Fg1Ridj5STjEfKCqTMw3YCPiEw+jXvi39XX2blJHI=;
 b=frODIhJxokpZOQIKPgyLbtvnUSYckaKFOuFS5OC7O6DIb3pYQCtkXwFpVDflDsSqN7
 01mDQCoQuB8F6/WJ0f06KWFHRh6CM5Ygejf6e7e+xisAOdZHm0PoO6L07Z9CnSvXs35n
 AApu+nl/aatZ1ar9dAE94L8HzMkPpyivDj3A/jE+vAvRmli9+Ypaap8g2pndl4xFHitp
 JBO2YDE3GIEbjjFqkQBTB5MPKTxtuGC/FQDffnKkSTa54cvos8JSsDU2XuzsUaHo97OR
 Ed0+Rmnfuij+K1EgnWSbY3p8RQWYVf6bwh+7AyEQAiz473D2SJn1R2yPtjDrhu6I4Ape
 iENg==
X-Gm-Message-State: AOAM533ylb7N4xxsF/gLjMiLUcn7fCEjg3i9d7D3YyeHnF8MpEqHmCle
 79WQ9dDsbMaFxpZp2G16Vu9W2g==
X-Google-Smtp-Source: ABdhPJwjiv3RQ4gLDBHQHz9XKwwhAxH8kY9ul34YJ+yW4ar0cJganSBPrC3kW7Ly5XnRUGoQjQk+9A==
X-Received: by 2002:a17:906:3a8c:: with SMTP id
 y12mr37877385ejd.517.1639321975023; 
 Sun, 12 Dec 2021 07:12:55 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id kx3sm4634384ejc.112.2021.12.12.07.12.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 07:12:54 -0800 (PST)
Message-ID: <cb7842ff-b3a0-c115-6078-98c012a65d59@mind.be>
Date: Sun, 12 Dec 2021 16:12:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20211212084857.127023-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211212084857.127023-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/2] package/x11r7/xapp_xauth: bump version
 to 1.1.1
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



On 12/12/2021 09:48, Bernd Kuhls wrote:
> Removed md5 and sha1 license hashes.
> 
> Release notes:
> https://lists.x.org/archives/xorg-announce/2021-November/003118.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Both applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/x11r7/xapp_xauth/xapp_xauth.hash | 9 ++++-----
>   package/x11r7/xapp_xauth/xapp_xauth.mk   | 2 +-
>   2 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/package/x11r7/xapp_xauth/xapp_xauth.hash b/package/x11r7/xapp_xauth/xapp_xauth.hash
> index 0251c083a7..22ea4cadfd 100644
> --- a/package/x11r7/xapp_xauth/xapp_xauth.hash
> +++ b/package/x11r7/xapp_xauth/xapp_xauth.hash
> @@ -1,7 +1,6 @@
> -# From https://lists.x.org/archives/xorg-announce/2019-July/003005.html
> -md5 e50587c1bb832aafd1a19d91a0890a0b  xauth-1.1.tar.bz2
> -sha1 16180e36d75a23cb182cb91e78f24273f1a63967  xauth-1.1.tar.bz2
> -sha256 6d1dd1b79dd185107c5b0fdd22d1d791ad749ad6e288d0cdf80964c4ffa7530c  xauth-1.1.tar.bz2
> -sha512 b6ecd59a853a491ef45bf8cfbff63bed36645f81cb79ae9d18458b57f7502bccf92f0d979d3337578518646f680ad379e67b1dac15a927cbb11372733e7a3a0c  xauth-1.1.tar.bz2
> +# From https://lists.x.org/archives/xorg-announce/2021-November/003118.html
> +sha256  164ea0a29137b284a47b886ef2affcb0a74733bf3aad04f9b106b1a6c82ebd92  xauth-1.1.1.tar.bz2
> +sha512  998c3158378fff50d368959c29335173b8d98e02591cb3d7b2f9534b5a44b19deb4cb7da9bf291ca5a37f69f833d72839b2c6611723306d10c1b4968ae4d4120  xauth-1.1.1.tar.bz2
> +
>   # Locally computed
>   sha256 dcdf5fa36a652efbe61a21def1301739b0010334ae3f049f1cff433221a8c7a5  COPYING
> diff --git a/package/x11r7/xapp_xauth/xapp_xauth.mk b/package/x11r7/xapp_xauth/xapp_xauth.mk
> index cd900f0055..64b064d3bd 100644
> --- a/package/x11r7/xapp_xauth/xapp_xauth.mk
> +++ b/package/x11r7/xapp_xauth/xapp_xauth.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -XAPP_XAUTH_VERSION = 1.1
> +XAPP_XAUTH_VERSION = 1.1.1
>   XAPP_XAUTH_SOURCE = xauth-$(XAPP_XAUTH_VERSION).tar.bz2
>   XAPP_XAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
>   XAPP_XAUTH_LICENSE = MIT
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
