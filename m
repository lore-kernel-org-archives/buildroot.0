Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A32C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 19:02:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1134460E8B
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 19:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1134460E8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCF58400C9;
	Thu, 21 Oct 2021 19:02:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d6XGzt6b7WzX; Thu, 21 Oct 2021 19:02:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCB5240100;
	Thu, 21 Oct 2021 19:02:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D51A1BF865
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 19:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39C7183CEB
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 19:02:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i2VEmOWiOatu for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 19:02:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07F5C83CEF
 for <buildroot@busybox.net>; Thu, 21 Oct 2021 19:02:10 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id t16so4826566eds.9
 for <buildroot@busybox.net>; Thu, 21 Oct 2021 12:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=UF29VWynyznVm0cjHC9z+5X93x+t8aIpwIVPnFBNoxk=;
 b=AMm2R97ClKc96ZKXXCABfsJTndekZ6woeecU9AVqjOCPollhyI2s3gGrSFdTzwfmjG
 3A1BZ6OlefWUhEpV4Sa3UcBv/PPxMX9izGlEFCrNvY+us6WgfAxwLe7r59YLV1k/mBnH
 xcYgOF/waPc2R/Ydl2ate2DmNlDVVXe6GtSVBM2RwhiZjogVRewry7BtPZEP1n+QkUiz
 cAHBg7+jRxjYA1Mq3V3MmfIgWAgykFxsKjFVRGobQkHVwQ4OYrHIjVxYEOmSAS3ptZUw
 8UzzvPMQVd6V2YFHLP/MVMHiyRB1q3YXKoqq8YQ2crJQFPGzMV9gdzYsrrLHf1CFVVUT
 gTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UF29VWynyznVm0cjHC9z+5X93x+t8aIpwIVPnFBNoxk=;
 b=dzJWPLM5k4+2Qx/zV3urxxRtEWocSkCltXg89rEb+BhaIUanRpXNetk+bsXroarMq9
 mbt6VSlwJNnhJrd4LMRN0W8ZCZPoLJ5TFufM2Mm0NOVts9XtZ+670CH/4el17T700AqD
 pY4T2JsjxqutFcx0yLU8NgWwO/YqORQMjy2j1DaE8E0X/O0g8nu9yomaIVTskVnQpBJc
 qsZdgp7dBdVC+vEY/sCeTS6S/IJA4im90ri8+rTh6T+TmPtBhhuqyD597yHpi2rzguJD
 wZb2M1KZrTqvG7JYgRkKmbf2uAfJT3JDIp9kh8lx7/BZGn099WD8iM85kFdaoH7fFZ7b
 JzBQ==
X-Gm-Message-State: AOAM5318DHozd7/urUoWOPp/6Q15f3QvEtVzRD58dWIzNrvgtBGp6E8a
 Aqxmf6j04nAxZHBOlemaFB+HNg==
X-Google-Smtp-Source: ABdhPJxcbzf3l7lDSkaOhexNTI3F6kEu9kDzstMCZTjjdmRFZ5wA7pd/pFEckKNA6Ww/FPISn7agTg==
X-Received: by 2002:a17:907:7f90:: with SMTP id
 qk16mr9466334ejc.26.1634842928596; 
 Thu, 21 Oct 2021 12:02:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id y8sm2839028ejm.104.2021.10.21.12.02.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 12:02:07 -0700 (PDT)
Message-ID: <57be8f10-e1f0-4a6f-b002-e59fdc3ad730@mind.be>
Date: Thu, 21 Oct 2021 21:02:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20211008152522.1390875-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211008152522.1390875-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/luajit: back to mainline
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



On 08/10/2021 17:25, Francois Perrad wrote:
> now, the moonjit fork is abandonned
> and Mike Pall resumed its activity on LuaJIT

  Applied to master, thanks.

  As usual, I completely rewrote the commit log:

     package/luajit: back to mainline and bump to 05f1984e

     Because upstream was inactive, we switched to the moonjit fork in commit
     2ca0accc. Now, the moonjit fork is abandonned and Mike Pall resumed
     their activity on LuaJIT. Therefore, we can move back to mainline.

     There is no new upstream release yet, so take a commit from git. The
     official site https://luajit.org/git/luajit.git doesn't offer tarball
     downloads, so use the github mirror instead.

     The moonjit part is no longer in the COPYRIGHT file (obviously). Also,
     compared to the 2.0.5 release, the URLs in the file have been changes to
     https. Therefore, the hash is updated.

     Also, switch the hash file to two spaces.


  In the future, *please* take the time to explain why the license hash changed. 
If I have to check this myself, it takes me five times longer to apply a patch 
then if I only have to improve the commit message a little.

  Regards,
  Arnout

> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>   package/luajit/Config.in   | 2 +-
>   package/luajit/luajit.hash | 4 ++--
>   package/luajit/luajit.mk   | 4 ++--
>   3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/luajit/Config.in b/package/luajit/Config.in
> index eb3eb0199..e4e124924 100644
> --- a/package/luajit/Config.in
> +++ b/package/luajit/Config.in
> @@ -27,7 +27,7 @@ config BR2_PACKAGE_LUAJIT
>   	  ABI-compatible to the standard Lua interpreter and can be
>   	  deployed as a drop-in replacement.
>   
> -	  https://github.com/moonjit/moonjit
> +	  https://luajit.org/luajit.html
>   
>   if BR2_PACKAGE_LUAJIT
>   
> diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
> index 532ec0b29..1497ee9df 100644
> --- a/package/luajit/luajit.hash
> +++ b/package/luajit/luajit.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256 c3de8e29aa617fc594c043f57636ab9ad71af2b4a3a513932b05f5cdaa4320b2  luajit-2.1.2.tar.gz
> +sha256  b1b19f92451a661ba1167ee0b259299616cb3a1cdaf5ab05d7ccffaffeb4a0fb  luajit-05f1984e1a862e4b3d3c3b370c773492e2edf84a.tar.gz
>   
>   # Locally calculated
> -sha256 aa64a7706ded773011b933f4230d7b35ba662598197f82ac2c7bca62abdaa4d7  COPYRIGHT
> +sha256  43fc251179d900f9948e51dd3cc93733d1219f2db060faaa0c8100ad054f54d8  COPYRIGHT
> diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
> index defa21dd3..fbbd8ebc7 100644
> --- a/package/luajit/luajit.mk
> +++ b/package/luajit/luajit.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -LUAJIT_VERSION = 2.1.2
> -LUAJIT_SITE = $(call github,moonjit,moonjit,$(LUAJIT_VERSION))
> +LUAJIT_VERSION = 05f1984e1a862e4b3d3c3b370c773492e2edf84a
> +LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
>   LUAJIT_LICENSE = MIT
>   LUAJIT_LICENSE_FILES = COPYRIGHT
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
