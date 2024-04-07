Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8F9CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 15:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5D6640835;
	Sun,  7 Apr 2024 15:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x65Ljg-biTPj; Sun,  7 Apr 2024 15:50:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 763594087B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 763594087B;
	Sun,  7 Apr 2024 15:50:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 943B71BF2CC
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80B8B60A8E
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 33m5eyoZUWzp for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 15:50:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6EBFC60A8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EBFC60A8C
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EBFC60A8C
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 15:50:07 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-41650de9743so3238145e9.2
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 08:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712505006; x=1713109806;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qvXOYnUN8jw2jKZfTSvztQVx8qxTD0an8V1VcXa27nI=;
 b=vI+K4aZPmKrJiV1iIWhgFUAyT9WZlwPIxiP6PVRdirXlvabO1MCNTj76bSwOK/XJMB
 hWvfzK7Rg0AZoF2eDXVQNfdMz1jwnSmjnrB2bcm2PmhE5fKLSWcgpY0hkMI5M3AwDoOw
 b0ZkL4NkQW4l+U6Bc6m7RJItW+u3uKYyqrT0zv5q/KnxDN7dFOH7hHnAKbh6fr03D9IQ
 xt54166OL5bhCyloOWKNSL+JmxgHWX2ycurY5vgM6+nvtzXFQWukib0f9b2OKWHZgnU6
 lBXvvmxOUKXUXQhorCDSTdIfAWyYB168RidDfjn1ghEZ4VQlCqYksUyxx15WfkyGJL0I
 wBag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjVrFXTQL0033PBMOWkeBlDWuzRE0+7xTY+X0WcR0RDleSTOgDlwK65b2ld8QZLW/qJsa+2SunxH1NNl0sstu3pD9W9g89Dw==
X-Gm-Message-State: AOJu0YzHegYa52/DlvPzSL1vsaGrYyNao+FWVe7C3ydP5JljsfUd4kc1
 XG6fP/eO+IcVCWe2yYARjtXndJ0BgwV26QIJq4N7cV3YxYepkZSPTp33EntO035SarAd4bHMWUf
 h
X-Google-Smtp-Source: AGHT+IEkhnRqo2F0I+uokKMUqNF2Y/5vzv6Zy9Oq3Z/4NJiB33iffL5Ogm0IYiBXoLXfw99NSpMrNg==
X-Received: by 2002:a05:600c:4ece:b0:416:3365:b9c7 with SMTP id
 g14-20020a05600c4ece00b004163365b9c7mr3729971wmq.13.1712505005927; 
 Sun, 07 Apr 2024 08:50:05 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 n32-20020a05600c3ba000b00415612e29a1sm10335119wms.30.2024.04.07.08.50.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 08:50:04 -0700 (PDT)
Message-ID: <8fae3698-06d0-4466-8fa2-dfd04e6623ac@mind.be>
Date: Sun, 7 Apr 2024 17:50:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Saeed Kazemi <kazemi.ms@gmail.com>, buildroot@buildroot.org
References: <20240326185653.3656142-1-kazemi.ms@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240326185653.3656142-1-kazemi.ms@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712505006; x=1713109806; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qvXOYnUN8jw2jKZfTSvztQVx8qxTD0an8V1VcXa27nI=;
 b=KtYqZryBZAqBaoXxEb/qaqsv8NF5fMJ1kXfP9PRSydUScHtgfmQaeTUFcLEleSuTDA
 98STTeJeBP+C2+wfzpkqKyyxFIjkIeBgCoK5Gxh+7OHJRESLlPLCL9NIliWbI47Fer5W
 cu9NWd2zuCCwS5ryVleZjdNqfKKs2+0+v7T0MUrc0vPkFR8BiU/KG5v0ZVn8yfuUTCBr
 JiK+cEqHWRVeFilMA3Zdl+i+/J/g66bR9wk48kkpgVw0sUuUka44jsVUaSxBhAf06avP
 1yYlrS5qHm8eJwEFy0YaXvij+av+uiQxEGDqPfyJibYpcZOpqxUSSCFA9TSxocspavBz
 Gu3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KtYqZryB
Subject: Re: [Buildroot] [PATCH 1/1] package/eza: bump to version 0.18.8
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



On 26/03/2024 19:56, Saeed Kazemi wrote:
> Release notes:
> https://github.com/eza-community/eza/releases/tag/v0.18.8
> 
> Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/eza/eza.hash | 2 +-
>   package/eza/eza.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/eza/eza.hash b/package/eza/eza.hash
> index 48c2fa8ffe..d8d55e42ca 100644
> --- a/package/eza/eza.hash
> +++ b/package/eza/eza.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  995a77848e75737a267b64613acaa6096ba8943f048676d5722c3ff238fb29f9  eza-0.18.3.tar.gz
> +sha256  32621dea52695b75fe6f6d24ebd19812b0491a852cb2a970382838dd798cc46c  eza-0.18.8.tar.gz
>   sha256  2762990c7fbba9d550802a2593c1d857dcd52596bb0f9f192a97e9a7ac5f4f9e  LICENCE
> diff --git a/package/eza/eza.mk b/package/eza/eza.mk
> index 7ec3f127b4..506e515566 100644
> --- a/package/eza/eza.mk
> +++ b/package/eza/eza.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -EZA_VERSION = 0.18.3
> +EZA_VERSION = 0.18.8
>   EZA_SITE = $(call github,eza-community,eza,v$(EZA_VERSION))
>   EZA_LICENSE = MIT
>   EZA_LICENSE_FILES = LICENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
