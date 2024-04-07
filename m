Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09042CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 14:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCF2C605D4;
	Sun,  7 Apr 2024 14:49:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tf-1ciAVQQTk; Sun,  7 Apr 2024 14:49:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F041660788
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F041660788;
	Sun,  7 Apr 2024 14:49:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C52B41BF30F
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD507406FD
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:49:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tEdk3FwquTbd for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 14:49:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2C56B406FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C56B406FB
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C56B406FB
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 14:49:34 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3442f4e098bso541228f8f.1
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 07:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712501372; x=1713106172;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lD3/4tC2v6p7jsNHvNL5qvZBiLR1zCPmnWQDQiY3Bxw=;
 b=XprF//MFb/0Ue0texPgX7TvkZlnOg1b78YhJZOVwGsIjJuDN++arTYLKGGYbUOY0en
 fJgZDjtWcCvrOsqaawivknOCCWSb0LYLdyUzxWhFBdm37IBmg+3PBjktMnfUlEztbORB
 BjKVCth/u9uWw0YUBXzwGf0KpLJtTgXxbuhHKZkipz1lHC1BbuNtOM54nc4jC1D/Iy69
 4awZbKRMWoa7i92rKFfq7pcBemc2bqMBuATvQe2zVzjxq5GnBO5Z1LfxqKHoExgy9eYF
 +LsN2Wnrd3MpopHnr55qzYs9XUtqSVAqGDPzHwiz2Ov94xIEIYmqjppCZ2S3Leq0JFO9
 B+2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0S8npqc3EMGjQFeo9B48QNRM3R+KcOK6Nu8JyG/I1LflKy0Wop4zs33WqfGE+vJqpZwjxTRe1oKTinNuUVJ92DrFQ0zSPPA==
X-Gm-Message-State: AOJu0YwQAedUuGQYuxTC03qSsmk5zY+4KQr1GdtYx+C0QK2nF9iX81d5
 zxScrq2JPBdLlsUw8vLaa6zcT+FWSTpfpMq456JmEnBDceCcQ5BH8GB/fcVf/0I=
X-Google-Smtp-Source: AGHT+IGFPcyEUBIgX4EPo94qMEFcRg+4kkRG8Wtm6B+43y9lKpRQP7mIj74BgOrl79CG2CF0Hg8yeA==
X-Received: by 2002:adf:fc51:0:b0:343:8beb:34e3 with SMTP id
 e17-20020adffc51000000b003438beb34e3mr5079822wrs.29.1712501372131; 
 Sun, 07 Apr 2024 07:49:32 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 dx18-20020a0560000e1200b00343d840b3f8sm6783030wrb.33.2024.04.07.07.49.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 07:49:31 -0700 (PDT)
Message-ID: <548dca9c-3ca1-4d36-93cc-e15a827eefa7@mind.be>
Date: Sun, 7 Apr 2024 16:49:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240225092425.783094-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240225092425.783094-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712501372; x=1713106172; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lD3/4tC2v6p7jsNHvNL5qvZBiLR1zCPmnWQDQiY3Bxw=;
 b=cx9NKA5/7t66PvFGPtsqqPHBo3+9F+IAJt/xUKotav4a4BctiyfgrANg/DJSKZRzyy
 xE5+4iUZikNHeyk27He/q4cSlfE7qcBoB5GkX7T7dSkblgw1kNAClg4QHN04ANnsC+VK
 Ze6DdEwsJcV9ugwJ26hvHaMiqAxD/aC2k2oQV7FrgodIRxEq7uzsZW7SzTRdrm5dGXnr
 osOpoU3kr1427GFRAeJneYePnHC6nEA5E6LhytSAO+JWciHPByORO3yFO357KDlCblLF
 WNK2YiytZbud76wh3bpR+9LKFT5viiKMDfqsGh1j8+Ndun+LoN5I354QCtfjveqCrVpF
 N5gw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cx9NKA5/
Subject: Re: [Buildroot] [PATCH 1/1] package/gdal: add openssl optional
 dependency
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
Cc: Dominik Michael Rauh <dmrauh@posteo.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/02/2024 10:24, Fabrice Fontaine wrote:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/gdal/gdal.mk | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
> index 247e13663c..77ffb514c2 100644
> --- a/package/gdal/gdal.mk
> +++ b/package/gdal/gdal.mk
> @@ -46,7 +46,6 @@ GDAL_CONF_OPTS = \
>   	-DGDAL_USE_BLOSC=OFF \
>   	-DGDAL_USE_BRUNSLI=OFF \
>   	-DGDAL_USE_CFITSIO=OFF \
> -	-DGDAL_USE_OPENSSL=OFF \
>   	-DGDAL_USE_CRYPTOPP=OFF \
>   	-DGDAL_USE_CRNLIB=OFF \
>   	-DGDAL_USE_ECW=OFF \
> @@ -130,6 +129,13 @@ else
>   GDAL_CONF_OPTS += -DENABLE_DEFLATE64=OFF
>   endif
>   
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +GDAL_DEPENDENCIES += openssl
> +GDAL_CONF_OPTS += -DGDAL_USE_OPENSSL=ON
> +else
> +GDAL_CONF_OPTS += -DGDAL_USE_OPENSSL=OFF
> +endif
> +
>   ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
>   GDAL_DEPENDENCIES += postgresql
>   GDAL_CONF_OPTS += -DGDAL_USE_POSTGRESQL=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
