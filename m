Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176BCC433EF
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 19:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70464419E6;
	Thu,  5 May 2022 19:49:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TT87Ji4ESH4D; Thu,  5 May 2022 19:49:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67681419BB;
	Thu,  5 May 2022 19:49:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB3E41BF376
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 19:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1B7C607CE
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 19:49:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GTGTPa3zJaFq for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 19:49:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBC92607BC
 for <buildroot@buildroot.org>; Thu,  5 May 2022 19:49:41 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id m20so10642612ejj.10
 for <buildroot@buildroot.org>; Thu, 05 May 2022 12:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=z2N9HtgmczzIxYNfKRVm25HRi/DL+Qxk1mkB9tes5Es=;
 b=apCQnBdD8pECOAoiOOxwD2KuCj6Azk1B+hYeoJXuNxm1bXLPI/RLHKsHeDS48YAgRd
 6DEJqY8Dq0JHsUj6reYKrF/hcrjZK0JlM+AV23vojr/R2+rSz18Tlz3Cyz5Ag5S9G4al
 kppDVrFp/t319Rqg2dK2Hy4/0qOKANCHpyCW79kV9e94ZV75h3rAYSeVdxrjG3yqPqZ0
 iLcbE2LVDgzCdgt25aypsScI7DAPijp85B1S2e0ipDC3TTy8UjIKD4txfy7NGdMfOPkZ
 E258C6+vJPqEaC9/A3qQSn34cjhh2RVU7PsPMry9EJ93SgInZSZ0iT8xL/wBMqgZ7yCG
 2X2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=z2N9HtgmczzIxYNfKRVm25HRi/DL+Qxk1mkB9tes5Es=;
 b=t9/JgCrm7eZYbcUDU2Qwf1VmX4FJxzWUWv6vMbdN5g5Mh9dBfqsC/3xMUnweM0ztd3
 XKJhqwG8J6ynUVtFCS0N7ttUv3YTMHi5YGSFqIZRb1FHckmOtrAN7NJUePRvVchz/9va
 9Ia2PRzDhTsvk9dm+d8ikHmKWpAcP59XSiqhx3vuWGT5HL4aQgepOESnOs7CJO4R74fn
 dEkIxywG3tUHo/vi43eieukCnvqsSGbZFxjzXWzkw1Ina0Ui+dwckTxZ1waz1Zt9Yywl
 4tAbsfHy69ZnlezZDg62lf5HQV8kYtL5A66JjfD7/XpUiodHYiCr2WDrlwmM1trtteEk
 Lj3Q==
X-Gm-Message-State: AOAM533GXsjJOsodVuRsjmYQ5illdi/9JvgnFnYCxqlOPAv1NgUiaqic
 7Im1+i/yWgQofiIXHYsCuET+Eg==
X-Google-Smtp-Source: ABdhPJy8RpzP1qkeJnVYIjc8TSfROO8z824tn+MaagjDYpXcM5eJ1P12/IkNNbryhwGhFVtRNX0wYw==
X-Received: by 2002:a17:907:6e07:b0:6f4:d185:9f57 with SMTP id
 sd7-20020a1709076e0700b006f4d1859f57mr9178280ejc.668.1651780180009; 
 Thu, 05 May 2022 12:49:40 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ml12-20020a170906cc0c00b006f3ef214e59sm1078974ejb.191.2022.05.05.12.49.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 12:49:39 -0700 (PDT)
Message-ID: <4b1c6344-f269-1388-07cf-57e6d068f0bc@mind.be>
Date: Thu, 5 May 2022 21:49:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
References: <20220505155424.3002847-1-neal.frager@amd.com>
 <20220505155424.3002847-2-neal.frager@amd.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220505155424.3002847-2-neal.frager@amd.com>
Subject: Re: [Buildroot] [PATCH v1 2/2] DEVELOPERS update
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
Cc: luca@lucaceresoli.net, giulio.benetti@benettiengineering.com,
 michal.simek@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/05/2022 17:54, Neal Frager via buildroot wrote:
> Updating Neal Frager in the DEVELOPERS file.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>   DEVELOPERS | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 292b919137..861496fb9d 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2100,8 +2100,13 @@ F:	package/pkg-qmake.mk
>   F:	package/qt5/qt5opcua/
>   
>   N:	Neal Frager <neal.frager@amd.com>
> +F:	board/zynq/
>   F:	board/zynqmp/
> +F:	board/zynqmp/kria/

  This is already comprised in board/zynqmp/ above, so no need.

  Regards,
  Arnout

> +F:	configs/zynq_zc706_defconfig
>   F:	configs/zynqmp_zcu102_defconfig
> +F:	configs/zynqmp_zcu106_defconfig
> +F:	configs/zynqmp_kria_kv260_defconfig
>   
>   N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
>   F:	package/uacme/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
