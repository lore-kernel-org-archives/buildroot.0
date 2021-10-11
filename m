Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA19C433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:23:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21C1960F0F
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21C1960F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDB7A81854;
	Mon, 11 Oct 2021 21:23:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J7H4x3LLSRqa; Mon, 11 Oct 2021 21:23:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DF948183D;
	Mon, 11 Oct 2021 21:23:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BEC291BF865
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABB47404DC
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:22:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aysvGlK4szHc for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 21:22:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6B2C0404E1
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 21:22:04 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id z20so72612502edc.13
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 14:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=CLXMHevCeG2XDjpfWIo9NDYjBJYNVGKGwDPqdpTAS7A=;
 b=NUhtcm1tZAhAGgwVDUDhVj/MGA+W5yyG0wbIAouiZOP2PGxPINT8U+nb72/G9VezLY
 c6/nl1dWTPQWJNkUWwoJ2+YVfmu8OiHgAG5zlnpM82t01PoQyZGVVEsQUU0P5FVJDzCX
 93z8m7YspY58EzbjBAiRPtcILglxuBEIPzx/+qetLAus8NF/1XRqCEBAnAt7M1oIx4MX
 sBfFSZChL4ad4i/P0jFiiaiJcCb8h9T2VnZwkSju+ChhDr48Lxk2PhyzLYxBc9ic3n+k
 h4drlf1n4lawOSTDqDlT4NFEY1HL1HQzVqZ9sM3lJP3iDOMQ+ZxSWgmKjXyZG/xrCnkE
 d2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=CLXMHevCeG2XDjpfWIo9NDYjBJYNVGKGwDPqdpTAS7A=;
 b=ZEpb7LlJyUktwkFDZeCKf9B0OPLtKxDqJ3/b1SAbYUYgOQDc9t22sSASTiuNSO6OMt
 DeISBPHJMniG18FCkLz0pSL685H8hZlkK4e8cOYzgzh9SypC73iTDIPkwI9+RdysCic2
 4ZjETa5F8ACkRbT12kqqtvs5kaAQ+A5n4OS1bnf+cLeCgaLm0l7Mwmo/yErL+KOHHriI
 Sn4VR1wYUR/+oFXOMVLmRAsOdNfs8BgL0GGpriqFOPedz+l/zI74lyytoNSKXSXoyNAr
 xr+4Z7Luc1LKO3M6NGTe6HvbmPdxDurZSoOg/2BZkfRcStNe42qKXcyCq8RS/qiY2rLF
 LuvA==
X-Gm-Message-State: AOAM533vjGcHz5pkhox30mRFa1wbUMZ1CJnNfokZBpw6S4UNO9RKY8At
 0PNcRWTd1OBsaK8E6BmxWmKKz7pXCe9eq1Ey
X-Google-Smtp-Source: ABdhPJxPwMtNYacnNO8v3H8F+vJky1QXXVMu0YuGGHmW9rHQRqVa3rWMMiu90bcoz48sIhBPnO1lMg==
X-Received: by 2002:a17:906:3fc1:: with SMTP id
 k1mr28844184ejj.44.1633987322700; 
 Mon, 11 Oct 2021 14:22:02 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id r3sm4735691edo.59.2021.10.11.14.22.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 14:22:02 -0700 (PDT)
Message-ID: <d5196f18-4196-3c6f-9e9b-02bde19aa398@mind.be>
Date: Mon, 11 Oct 2021 23:22:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20211003091955.792415-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211003091955.792415-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/xmrig: bump version to 6.15.1
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



On 03/10/2021 11:19, Bernd Kuhls wrote:
> Changelog: https://github.com/xmrig/xmrig/blob/master/CHANGELOG.md
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/xmrig/xmrig.hash | 2 +-
>   package/xmrig/xmrig.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
> index ebe6fe5726..fcc7cd456d 100644
> --- a/package/xmrig/xmrig.hash
> +++ b/package/xmrig/xmrig.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  155ce4b921839525f03ff7fe3ce9d6ecddf4f2a32cae1b0b83b3808c9db39880  xmrig-6.15.0.tar.gz
> +sha256  4191299f9556556401fe3a1008e11784146ba53fdbbff6ad74ae19c4dd03d2b8  xmrig-6.15.1.tar.gz
>   sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
> diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
> index 16471682ca..45bfe71236 100644
> --- a/package/xmrig/xmrig.mk
> +++ b/package/xmrig/xmrig.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -XMRIG_VERSION = 6.15.0
> +XMRIG_VERSION = 6.15.1
>   XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
>   XMRIG_LICENSE = GPL-3.0+
>   XMRIG_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
