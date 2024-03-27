Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C694C54E67
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 22:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E7E581F2B;
	Wed, 27 Mar 2024 22:06:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7_wskKqZP-_D; Wed, 27 Mar 2024 22:06:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C38581F31
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C38581F31;
	Wed, 27 Mar 2024 22:06:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 455EE1BF33B
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 22:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31AC740913
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 22:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7jbleII_Yj8y for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 22:06:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CAB9D4090B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAB9D4090B
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CAB9D4090B
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 22:06:36 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33ecb04e018so168945f8f.1
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 15:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711577195; x=1712181995;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BCk/sEpiPP4/RgU5ic+9o9hMV7eO1b8Iz7ZLaCuWMjM=;
 b=pApN98e6L47FAP01WTreovdErWyQmHaBK6D6qDDBRO5tLAzbzhMr9M46M97MhiB+az
 b8qdd1AQ73NXNhX4RIyTqOUmuKVFv4vM1972/Ufle0HZwpai7JMC+20uJfNYcZnWhbHa
 7/n9wsV4YSEWdQRozmUH0AziEr2/qeVZPrxQzjmShXoh2zLYLPFRhaktbQkuj3Y0Hk2i
 LlGB1Qfxt44x17eSCwsSZEBHFcXVfkAHBZsfLgr7apeyDaaO396pqcFD2kMXkvaEoGXx
 ZHPMMGGJmav6fcOVfVHCDS7DSx2qRn6fMKpghbKwyioNA4k8gZx1b605qtYV+iKyNt81
 xigA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVncllHs5x3/rEHm5wbesM9g9Hc1EAXnwkkwY8eSF1/BoOf1PmTmfquOUn75FN8Ps+t2Zf9wX4O1GZrEiQa03Py0pW000AXNQ==
X-Gm-Message-State: AOJu0YwIEQKTPSLIY1h5a44dmBTUCduW8b2yURCFO4Hp13Rty+1rPTHF
 RqqkdgjebZXKiV48vtT+GlAKnIfQHZIujHDLQ8+E83+GOx8nYgXwcj8O/zTbJghRWQrohflszki
 E
X-Google-Smtp-Source: AGHT+IG/I/k7bDh07FzMrIxabahpJU8IKfkCT0NN0Zr3NzPtqiIOhbCQTpac1HRyVOhlTczSaNhakw==
X-Received: by 2002:a5d:5343:0:b0:341:a7dd:9e78 with SMTP id
 t3-20020a5d5343000000b00341a7dd9e78mr932001wrv.36.1711577194852; 
 Wed, 27 Mar 2024 15:06:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 bh8-20020a05600c3d0800b004132ae838absm193819wmb.43.2024.03.27.15.06.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 15:06:34 -0700 (PDT)
Message-ID: <05b65c69-2515-434e-8bc6-c3ad316e7f2d@mind.be>
Date: Wed, 27 Mar 2024 23:06:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240324205324.491751-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240324205324.491751-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711577195; x=1712181995; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BCk/sEpiPP4/RgU5ic+9o9hMV7eO1b8Iz7ZLaCuWMjM=;
 b=G9pjkX6RGrsqM0Q+yY07DoebUxe2iRDWpuSMe2i7CAx6d0Ziyixwvkl9XMS48coq1o
 d2lGxkmIGg3HC5mEswK6ysF3rNPnUOGT51BMRCvSqtLpX5pmQRatgHhS/Qtzm1/SbdQC
 W3lh9qFtctonxZuFn0+u5cUNug3KYYqNgF2HT+bbkKsQ4+dQWeefcHU2VriAmX94ppf4
 6xXLUsWXS8JrIzQ9EGgsFZj4cS7QyeRPdT6siWWxwUc1Qg7CEK7P//dxo7zrz+hJoZSF
 PJe6kZp6ViXYiih42iB8IjSGpnJUUYVIRKMZYMeoGQv836yqxeGvrFrVmnpJ/mXujFvV
 LEQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=G9pjkX6R
Subject: Re: [Buildroot] [PATCH 1/1] package/thermald: bump to version 2.5.6
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/03/2024 21:53, Fabrice Fontaine wrote:
> https://github.com/intel/thermal_daemon/blob/v2.5.6/README.txt
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/thermald/thermald.hash | 2 +-
>   package/thermald/thermald.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/thermald/thermald.hash b/package/thermald/thermald.hash
> index 9693813ca9..fff5ae6284 100644
> --- a/package/thermald/thermald.hash
> +++ b/package/thermald/thermald.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  75c165df45b3d09c904d314c8c19789158e9538f46e3d2b606457dc631eb3af5  thermald-2.5.1.tar.gz
> +sha256  e5a452624f133d71f4aff0bd0c8f8258399a5ae1a7d5aea177fa6a6e33dad1fd  thermald-2.5.6.tar.gz
>   sha256  e98be8bc482e038a14bfbc01caf800bbd0024fff275ef14cd999db6560254a8d  COPYING
> diff --git a/package/thermald/thermald.mk b/package/thermald/thermald.mk
> index fd0246745f..9faa47683b 100644
> --- a/package/thermald/thermald.mk
> +++ b/package/thermald/thermald.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -THERMALD_VERSION = 2.5.1
> +THERMALD_VERSION = 2.5.6
>   THERMALD_SITE = $(call github,intel,thermal_daemon,v$(THERMALD_VERSION))
>   # fetched from Github, with no configure script
>   THERMALD_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
