Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1433CEB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 13:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B52E660F3C;
	Sun, 18 Jun 2023 13:08:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B52E660F3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6dUPgfhdZ-qs; Sun, 18 Jun 2023 13:08:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E48E4605A3;
	Sun, 18 Jun 2023 13:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E48E4605A3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B1F5F1BF59E
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89CBA40972
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89CBA40972
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0umKj56qHJlw for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 13:08:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FED64090D
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2FED64090D
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 13:08:19 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9741caaf9d4so325518066b.0
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 06:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687093697; x=1689685697;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L3y0aLzew0uLK1+Yrgr/VnOOkoBrVrunuDL4FneWVjc=;
 b=A313uqhOb04Dm585JhYhkt/h5JWDcG3PH6xNHAttKGR9Tch4A0UPIiEwxOa/WJlPj/
 AyhAVEB8tP85Xn9NwQGVYDkC+FfsKV/WzSMIEj0wWQ5UJ4RFcTL+XFxvlJeKZRWR10zZ
 VaNvZPE26HiNFhoZux+yO+NHJ/Q2FFnU7rdSEZthQVAUzOYKNykC95pkbk3N91f2DcLe
 kxg1/4G878wpgRXQiBoycEwuv9RjEXWlI9yMDIxw5ZbVNNQj05JSJqXIPGMULBxZqga6
 0Yq+TNBoAR9WvCksbqWXSuAT8br9R6Ra4burrrVmA+jtcjV9JzPLEIaDXj4VqHOf4b89
 2FTA==
X-Gm-Message-State: AC+VfDy2WHQWT27RaFiEcIkAWGTmCpBv+Yo1t1iWtjKHCaGgFxmImpoQ
 EjLj/I8dxrq7mjezf4TCaSEHAg==
X-Google-Smtp-Source: ACHHUZ5jV5Zppl56jl6JHJtmOblqWKgtPMPTZe7KDH8yClHYXqWFpWQQiQ9bgIF644y9ImlmMYQDwQ==
X-Received: by 2002:a17:907:7255:b0:987:1d27:61e4 with SMTP id
 ds21-20020a170907725500b009871d2761e4mr4299455ejc.26.1687093697326; 
 Sun, 18 Jun 2023 06:08:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 li16-20020a170906f99000b009707fa1c316sm13247265ejb.213.2023.06.18.06.08.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jun 2023 06:08:16 -0700 (PDT)
Message-ID: <be7d7019-bde4-58f0-a8b5-788b744b4088@mind.be>
Date: Sun, 18 Jun 2023 15:08:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230605072021.1882516-1-james.hilliard1@gmail.com>
In-Reply-To: <20230605072021.1882516-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687093697; x=1689685697;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L3y0aLzew0uLK1+Yrgr/VnOOkoBrVrunuDL4FneWVjc=;
 b=KSOKx97AEXp4O521KagEqwh0XAIf/rKpVzz89xL+5SGT4YNihC6BNBc/ROxw7/TZRr
 NbHNqqkGIJf+cRVlH0jKCO3X7VicfxjNhtjgwbRplH2neny+oTwW71u7z4fEX58a5/z8
 mPsgqXHTR5ilfGamYKDxoBNbV6yq5FU4huKbtBq8M1Og2tUku2Wf3biexlPrDu/eMjNA
 vywupQeGM8sQn0EjmAe6ikvBzeq9DIn2KP5apvw0Ub0z1UqMjfSDFj0jKdW+7/VSmWj2
 zfJJd0pmbbw7VH8tqtNgU1izpAQDZ7911/mdjveCApu8LO0lQRvEnG8xTIib/pHbgtXL
 9ZMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KSOKx97A
Subject: Re: [Buildroot] [PATCH 1/1] package/python-weasyprint: bump to
 version 59.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/06/2023 09:20, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-weasyprint/python-weasyprint.hash | 4 ++--
>   package/python-weasyprint/python-weasyprint.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-weasyprint/python-weasyprint.hash b/package/python-weasyprint/python-weasyprint.hash
> index d6026cf034..c22677cad0 100644
> --- a/package/python-weasyprint/python-weasyprint.hash
> +++ b/package/python-weasyprint/python-weasyprint.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/weasyprint/json
> -md5  497030cecafffca06bae2b161846b461  weasyprint-57.2.tar.gz
> -sha256  b8e9ef2dcbcfbc82e99215acfd68f947b2b5f1999b5b156db75fabe380ba7e9a  weasyprint-57.2.tar.gz
> +md5  2cb135e7c5318bb1652205035f083922  weasyprint-59.0.tar.gz
> +sha256  223a76636b3744eaa4ab8a2885f50cf46cf8ebb1acb99b5276d02feccf507492  weasyprint-59.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  bfd14eccfa6100575460e685556b183399d4bd335904e3c9521b0116d21c54da  LICENSE
> diff --git a/package/python-weasyprint/python-weasyprint.mk b/package/python-weasyprint/python-weasyprint.mk
> index 27b07226d9..a1e3d23b75 100644
> --- a/package/python-weasyprint/python-weasyprint.mk
> +++ b/package/python-weasyprint/python-weasyprint.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_WEASYPRINT_VERSION = 57.2
> +PYTHON_WEASYPRINT_VERSION = 59.0
>   PYTHON_WEASYPRINT_SOURCE = weasyprint-$(PYTHON_WEASYPRINT_VERSION).tar.gz
> -PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/b1/88/335dd6cb71a9d58584c975bf1db0ab9a3a9f15f9bffef1cbfac0fb1ee72e
> +PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/1d/69/11343bbb46d4f2a311677058e19cc2f7bc55a769b64c547a64ea1e2b6045
>   PYTHON_WEASYPRINT_SETUP_TYPE = flit
>   PYTHON_WEASYPRINT_LICENSE = BSD-3-Clause
>   PYTHON_WEASYPRINT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
