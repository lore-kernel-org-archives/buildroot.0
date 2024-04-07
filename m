Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73758CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 16:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EDA3414CB;
	Sun,  7 Apr 2024 16:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i2qkxiDKGe9a; Sun,  7 Apr 2024 16:06:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9A8B414E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9A8B414E5;
	Sun,  7 Apr 2024 16:06:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E8061BF326
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2933382052
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id haUdHXWGMjlq for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 16:06:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5ED0682051
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5ED0682051
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5ED0682051
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 16:06:21 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-343d7ff2350so1736067f8f.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 09:06:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712505979; x=1713110779;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jr+919JRiiBqPUd+6yWD6L05vtQbzOO1gA0ELZVH5fI=;
 b=KT494fTWXEzmB5yx41KgvVTZhQprbyeOzOIkpwAmzDe+K7cEsOa6F84O/X1Ruo+UWu
 hNfby97YmVC5mGMahfaOOXmwbw0QiKsf72niV91TMDLCPQyjpdSvebZdhrpjDWrxqKC5
 qRjfMoL9Nw+Z0Zg+72iQWibMFrqaluxQh7eYRRD+TwI6ESCR0F0XiiMrKsCzMzzX7BnD
 aTX+tR5keeZ5xUDC3u15kJ8C9iFiiW5heJUTTWx6gD37BgL4nAl6GU5bC0OngCz0Yw4D
 dh0W9k87gsHRYVmO7lPt/rcY3oXlspkCKKqbN77AKyCrlXT37TE0unYH/s4227UF3bQy
 ZsgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0luliJ+RGTYq69PBo98oxhjIxcfQnpYdHUQQWNECA1V/oT8hREAzipbEDeahFWWVnJFmt3PkRsMqmXwAEn26d7RaL+7Fwfg==
X-Gm-Message-State: AOJu0YxQYrL1h5vSs1sE8cs5bseudY8S+o4pWl1pRHOE41Vy+6rEswXH
 YzXrcaRefzYKceSGWjd2tTwFmuuhjgdokltnclSOLFaTKkn7BvqfEwaLGQpt802FoBNg7peHR1r
 g
X-Google-Smtp-Source: AGHT+IF5AIULR65L8Ua6X2ytQkqUrrYqj65vSc9+LGELqAVBWqsTdVauevwR1JBz0qdO7Q21pL8rdQ==
X-Received: by 2002:adf:a158:0:b0:343:64be:b543 with SMTP id
 r24-20020adfa158000000b0034364beb543mr5320979wrr.57.1712505979421; 
 Sun, 07 Apr 2024 09:06:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a5d4e88000000b003438cc1d2b4sm6924341wru.59.2024.04.07.09.06.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 09:06:18 -0700 (PDT)
Message-ID: <394e2398-a953-4408-893c-098a24f4a3e0@mind.be>
Date: Sun, 7 Apr 2024 18:06:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20240305203739.85077-1-giulio.benetti@benettiengineering.com>
Content-Language: en-GB
In-Reply-To: <20240305203739.85077-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712505979; x=1713110779; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Jr+919JRiiBqPUd+6yWD6L05vtQbzOO1gA0ELZVH5fI=;
 b=ayV/uLIi7EHT2EDFTFoFr4WRPedDlsPzU5CJjjC1arT//zHjoWZkUqiATyUD237Dd/
 +RLOZhkpFk8Q/3oFq9E9CPgZstJb5z7CTxvRUsTKgIDCsoRhc8ootVeiTwXADS3GODdY
 CyjRk8jz7o1UGeah9nwT+Ftw/m/i7MKBLGslPBoO1kTb8TKtcJCy/BF+RWnMklK7tA7x
 y7B2l9PPRrOr595z2qiJOdUBJEdlMTH9YG9kTjOZL9QtE/XRuBqJt80/GGAsViIbEe50
 E1hr1YfVwkUTClllgkhab7YuStvJ3lDk5EXdRC4sF3KalRAC+jzoZxFfF2P0fBzCYfOP
 DWrw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ayV/uLIi
Subject: Re: [Buildroot] [PATCH] package/rtl8723bu: bump to 2024-03-03
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/03/2024 21:37, Giulio Benetti wrote:
> This version allows to build with Linux 6.8
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/rtl8723bu/rtl8723bu.hash | 2 +-
>   package/rtl8723bu/rtl8723bu.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8723bu/rtl8723bu.hash b/package/rtl8723bu/rtl8723bu.hash
> index 66efdaf771..236b9a6726 100644
> --- a/package/rtl8723bu/rtl8723bu.hash
> +++ b/package/rtl8723bu/rtl8723bu.hash
> @@ -1,2 +1,2 @@
>   # Locally computed
> -sha256  a36511894a612a9a05254e5938dafcc32b5ca46b8912582ccca84708e0f82cf9  rtl8723bu-49cb04d796d44debe965c1597f397f34ae277dbc.tar.gz
> +sha256  357c78d6f86794d96530155f9ba102e56421efb6fa43eb33daa0fb57354e8215  rtl8723bu-af3a408d6399655b0db23c2c8720436ca725ca47.tar.gz
> diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
> index 7796def113..0ce8b1afad 100644
> --- a/package/rtl8723bu/rtl8723bu.mk
> +++ b/package/rtl8723bu/rtl8723bu.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RTL8723BU_VERSION = 49cb04d796d44debe965c1597f397f34ae277dbc
> +RTL8723BU_VERSION = af3a408d6399655b0db23c2c8720436ca725ca47
>   RTL8723BU_SITE = $(call github,lwfinger,rtl8723bu,$(RTL8723BU_VERSION))
>   RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
