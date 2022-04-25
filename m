Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF89C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 19:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66DA740ABF;
	Mon, 25 Apr 2022 19:04:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E9Mbic3W2YA6; Mon, 25 Apr 2022 19:04:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C3C840AA2;
	Mon, 25 Apr 2022 19:04:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A73F61BF312
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A45ED60BDE
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:04:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nDuNB6p4-7um for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 19:04:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB49F605DB
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 19:04:10 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id u15so31412928ejf.11
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 12:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=MVLHXd59lSFvvtbHe7n/zfdPCYqWqWLPkoQ3B8TPqlc=;
 b=Rp4MIbksqgIZk57+iunHUdkApeufNDnPWtqC0SPxrtGlvBVsm0LK8rhlo8tSWJXSYj
 5Ex+jbfUUOurdHvb/NFLAbNz2iQqJFDEBqIU8fICKcaXyqgExw2MHpEHOhueGEuRX+tY
 CL90wsHGxOD0U49rRuVQDXiz17PHXe2nia4fE5BfDzgQKv3nhVGcOde5Ev9WAg2ADqLp
 nJ/0AOocwsimBSYihhVCFd/xx9Sne/JxVf9VwZ4x32pIxprRpRFMYVipCECWD9pSpxut
 zIZF2IJLKCnLXU5HmR1aeJA/wsbWBKQDDgabtxFneNLKCjoaq6TmIbEP5bqJ0lpsNT87
 YF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MVLHXd59lSFvvtbHe7n/zfdPCYqWqWLPkoQ3B8TPqlc=;
 b=o/khh1e7bfyuahVGjdOeoEBdEb0P2WxBAmVKH8Trh7NuK/y/wjDwYt5WwxppfSenpW
 9LCFnmMGmR3xiPYhDUs37mvu2zRGItt2LGs5LXrsOwp2+laNVWxkYwPZ514iFLcmXorJ
 ojaWDbO3YKyQTx+JI5g89cREPqzgGK5TpJlWwypkrZhm+0nl0oWUM/+mXZRIAwRYK8Is
 uY1dOPzBdS/oyulBAahzgHCNn4tdxtnNmk/1R8IJpZccK/pYQwA/C3RMDLcqfowEwDxX
 YxPY+rqjC58ipuIK8sVGTrwrxB1RQPBuAsBuId6waIqr2OJgIaLBYyCQODWMEqQTW13j
 TfHg==
X-Gm-Message-State: AOAM533KHXJKBOxF0I9LG81+J+t3NfnqCNHMMF5QG6sx00ZEuBY5t8UO
 Ubw0lCRSmsPbh0ikDP167Yzfew==
X-Google-Smtp-Source: ABdhPJxF+/LhXfqL8yh7yyYGi2qK1ohyxdXlhNGrV5b9UsqZwFiG5kkwCfa03P1LXi/RX6vCEv8zEg==
X-Received: by 2002:a17:907:1ca2:b0:6f0:2798:83e7 with SMTP id
 nb34-20020a1709071ca200b006f0279883e7mr17836424ejc.85.1650913449052; 
 Mon, 25 Apr 2022 12:04:09 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 b17-20020aa7dc11000000b00412ae7fda95sm4976032edu.44.2022.04.25.12.04.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 12:04:08 -0700 (PDT)
Message-ID: <64215008-0628-0a54-5110-efcab8831d98@mind.be>
Date: Mon, 25 Apr 2022 21:04:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220422073244.63829-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220422073244.63829-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-skin-confluence: bump
 version
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



On 22/04/2022 09:32, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/kodi-skin-confluence/kodi-skin-confluence.hash | 2 +-
>   package/kodi-skin-confluence/kodi-skin-confluence.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.hash b/package/kodi-skin-confluence/kodi-skin-confluence.hash
> index e3d1ff73f4..c840e5b161 100644
> --- a/package/kodi-skin-confluence/kodi-skin-confluence.hash
> +++ b/package/kodi-skin-confluence/kodi-skin-confluence.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  49ba4dcf4b512ac0a97bd1a4ebf14685d294d89a7a07c26ddda0fe730c8aa047  kodi-skin-confluence-37a196cdb58c0da87b5b22b047a5d44dc447f1ae.tar.gz
> +sha256  c57b9a303ad1ebf14ad487901e5da15eba7b3a40304046974fad1d64fb7b8b57  kodi-skin-confluence-e6d31bc84eea73a04b2a23358929d5276be832b8.tar.gz
>   sha256  89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.txt
> diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.mk b/package/kodi-skin-confluence/kodi-skin-confluence.mk
> index fcae506d1e..c32718fd10 100644
> --- a/package/kodi-skin-confluence/kodi-skin-confluence.mk
> +++ b/package/kodi-skin-confluence/kodi-skin-confluence.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -KODI_SKIN_CONFLUENCE_VERSION = 37a196cdb58c0da87b5b22b047a5d44dc447f1ae
> +KODI_SKIN_CONFLUENCE_VERSION = e6d31bc84eea73a04b2a23358929d5276be832b8
>   KODI_SKIN_CONFLUENCE_SITE = $(call github,xbmc,skin.confluence,$(KODI_SKIN_CONFLUENCE_VERSION))
>   KODI_SKIN_CONFLUENCE_LICENSE = GPL-2.0
>   KODI_SKIN_CONFLUENCE_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
