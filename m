Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1509CC6FD1C
	for <buildroot@archiver.kernel.org>; Sat, 25 Mar 2023 21:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98A3581B52;
	Sat, 25 Mar 2023 21:02:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98A3581B52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IBo-BlgAdsQy; Sat, 25 Mar 2023 21:02:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E48CE81BA9;
	Sat, 25 Mar 2023 21:02:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E48CE81BA9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 016211BF32D
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 21:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC3A360A8A
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 21:02:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC3A360A8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z1ucj4Tfdy-c for <buildroot@lists.busybox.net>;
 Sat, 25 Mar 2023 21:02:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 731A66068A
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 731A66068A
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 21:02:10 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id t10so21036307edd.12
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 14:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679778128;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iSu3tIFJWRDT2eC2dACjYK/Zj/axV2gT2WXNjwIaHHU=;
 b=bMp8dlqSgzVlUFR6p1WxsqQPSJkvxrmNfD1OyKzz3FT/X1prJSYhct9PboQ6TeSNUk
 mClCtp/Vokvv6XQSdzFyFR8SXWoU/fxV9L73dKzcXMXWRqeH++AyD3GEYPUY255atyuZ
 YYUNoM9+cunYR2adKSaKiylWmY/KxDRD+mN9qTC4vkdck6GieEO0khjwwMLtlrNX8YBM
 X+Y7KsFbF7H/irxhUI9LoWkw0NKEecKbWePKrCKaZzChFv8I6ikSWSxKKxy+o1RGhec/
 Sh75rQZuEX5QAObRY7wIlae+auD7A6Vzo0CaVSIP3TWjSw52fT7G2eisIhcDGBil3Jt2
 Cnww==
X-Gm-Message-State: AAQBX9eVsfH2PwozGRR6h5spcE74CFz3GscxA1dV/y7OXWg8u3ZGPvFL
 nCTz930rUlhbI0lILB33zjZu5A==
X-Google-Smtp-Source: AKy350ZRCzyprxifXfvpcMjrzvMK8Jei3ZG4KfXjgIMkL25X0oR2hxn9h+Z5p+6jAexKprgF10aPHw==
X-Received: by 2002:a05:6402:28c:b0:501:cde8:c523 with SMTP id
 l12-20020a056402028c00b00501cde8c523mr7242393edv.6.1679778128137; 
 Sat, 25 Mar 2023 14:02:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:e7c3:8953:3ab9:2c18?
 (ptr-9fplejqcmbwz6qb22hk.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:e7c3:8953:3ab9:2c18])
 by smtp.gmail.com with ESMTPSA id
 g20-20020a50d5d4000000b004fd29e87535sm3964460edj.14.2023.03.25.14.02.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Mar 2023 14:02:07 -0700 (PDT)
Message-ID: <e0fd063f-347f-8621-3bb3-860e37893822@mind.be>
Date: Sat, 25 Mar 2023 22:02:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Vincent Fazio <vfazio@xes-inc.com>, buildroot@buildroot.org
References: <20230221172205.2450111-1-vfazio@xes-inc.com>
 <20230221172205.2450111-15-vfazio@xes-inc.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230221172205.2450111-15-vfazio@xes-inc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1679778128;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iSu3tIFJWRDT2eC2dACjYK/Zj/axV2gT2WXNjwIaHHU=;
 b=P6Dmzb0MGP+8cIJ3QAQnQNf3DbmVer+7sTI7cwhekifIZXnswe++B9w+LY+uGHYygl
 3MjpHIBlsb502F5jkqFw2laxLAZaQNRL86V9Cy5c5tpEOv08OiDqdAQg5FHpsKxuBg3n
 wXV/NpeoHXwJZZ6pXWpNJVpcGCz211c3m8nDFUSTEK1kVW6p/krkCjbP1sJO4mpAUmnL
 PAxtXAZozR2/sXLv12zIfVVhqPBDv9y0528okMxU+P4RZ+vIs737LmelletZcM7gSYfW
 NvufVGZwDFgu9C1wjHc/CKES65J+WVPcjg5cEqdwjzQ0gJrm4V5dC6kD2wvDnqSUNA2E
 c1+w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=P6Dmzb0M
Subject: Re: [Buildroot] [PATCH 15/15] manual: drop LIBFOO_GETTEXTIZE,
 add LIBFOO_AUTOPOINT
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Vincent Fazio <vfazio@gmail.com>, Joris Lijssens <joris.lijssens@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/02/2023 18:22, Vincent Fazio wrote:
> From: Vincent Fazio <vfazio@gmail.com>
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---
>   docs/manual/adding-packages-autotools.txt | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
> index 8655a79693..ad96957f3d 100644
> --- a/docs/manual/adding-packages-autotools.txt
> +++ b/docs/manual/adding-packages-autotools.txt
> @@ -130,10 +130,9 @@ cases, typical packages will therefore only use a few of them.
>     passed to the 'autoreconf' program if
>     +LIBFOO_AUTORECONF=YES+. By default, empty.
>   
> -* +LIBFOO_GETTEXTIZE+, tells whether the package should be
> -  gettextized or not (i.e. if the package uses a different gettext
> -  version than Buildroot provides, and it is needed to run

  I have applied as is. However, I wonder if this sentence "if the package uses 
a different gettext version than Buildroot provides" wasn't still relevant.

  Regards,
  Arnout

> -  'gettextize'.) Only valid when +LIBFOO_AUTORECONF=YES+. Valid
> +* +LIBFOO_AUTOPOINT+, tells whether the package should be
> +  autopointed or not (i.e. if the package needs I18N infrastructure
> +  copied in.) Only valid when +LIBFOO_AUTORECONF=YES+. Valid
>     values are +YES+ and +NO+. The default is +NO+.
>   
>   * +LIBFOO_LIBTOOL_PATCH+ tells whether the Buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
