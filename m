Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B51C6FD1F
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 19:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 575CC40360;
	Tue,  2 Apr 2024 19:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5adj8yJVStdt; Tue,  2 Apr 2024 19:53:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D14F404A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D14F404A5;
	Tue,  2 Apr 2024 19:53:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 929DC1BF369
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 19:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AD16404A5
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 19:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oXZo-6nvQeoJ for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 19:53:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6AEE140360
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AEE140360
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6AEE140360
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 19:53:55 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-341c7c8adf3so3886768f8f.0
 for <buildroot@buildroot.org>; Tue, 02 Apr 2024 12:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712087634; x=1712692434;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gJYUTOq20lTZobbIiDbttZl8OR7Fw+AnDMW/L72oyoA=;
 b=oDY7s4BfG2STJRLGAUcpX5FDaxYRCqO5LgJHC4zQmWaanoPVGOPoLUr3fxo+YuNHrW
 yzMyimlP3UFxhRkQbTsmKTpW5jcPhu5FDFwPc1+aaHib02ydKzU1vNCiALJB6dnkqyjS
 DUEBPXaWl5mwGSMJva0Y08PcU909OZt+fmFEaxqE0hWKuYbGBWHoQQ3zfe1vxcP968tu
 RTQhH1TL8vEss8T2BDNmrgZ2QOEIRYR1PKfDVR4rrO/kecazV5ddtz1V1bIZ6h3AhCnu
 eUu4kfEArPvX6h7PRbp4OyOhwfK4BlZOWv25E+ctD3Qu/4aKcirOyEKA0xkNrgp3vFlP
 9l0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzjOIhDE1jlzxJDzLbhMyZzFujEswC5gCkkdGBG/Wj8a4ir/DDwDamv2C5X667rnVsvQHGQWlIjOPy4VczdsDv+HYoBJ+UJQ==
X-Gm-Message-State: AOJu0Yy4lKPt39ECGHW9hDzy7PKYwtSD75KnqCnGLpO5lITL8W0qAl73
 J+W1YsqWOVxBfJbWOQ+rRY/RaVFqegfTlHQX6mrZrVMfEKSqVDu9Ndz4/twCjHo=
X-Google-Smtp-Source: AGHT+IFk6S0WqwwivdCazg52wXJdmDRTXrttr7UHKpb0Y1Eox++ZyCyYW7L4HgIUmK7Wg0OdJ/bh+g==
X-Received: by 2002:a5d:6e02:0:b0:343:526f:29cf with SMTP id
 h2-20020a5d6e02000000b00343526f29cfmr4179553wrz.32.1712087633912; 
 Tue, 02 Apr 2024 12:53:53 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c190600b004161eba16b3sm1549773wmq.29.2024.04.02.12.53.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 12:53:53 -0700 (PDT)
Message-ID: <6fc81e18-165f-4b52-b79c-322ad8682687@mind.be>
Date: Tue, 2 Apr 2024 21:53:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240213204915.27898-1-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20240213204915.27898-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712087634; x=1712692434; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gJYUTOq20lTZobbIiDbttZl8OR7Fw+AnDMW/L72oyoA=;
 b=J4cpG0a2PwiWYWF2u0paYYex5shCd0kpeaIGI9+cL9KM3orCzmk51qsYf7/nx7NUKG
 mkFdgP1bvhk8o6/XlMCYLb5F62AhgQl25NCXMbGEDntoUCHcaprqlgJyX+XnJgkpR51o
 JvrZB3vh5A9DHOH15Lav4UjILlptsQRZq9qT9vo+NAbn3KLwxc/cqgi8FnwYDuQ+Vxdz
 V2kOJLwUf4SibGlXsVuAZi4vTx8RQ956pC2nz6T+R4GSyamjjipi4VzvvO5qtd9F7nFV
 Ex/7JXG1v2RNWZloQMEljEik6+qW27QEtHjHHwZaS3bh4UpDsqHzeGFFYVRzREsiYcj2
 RKdQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=J4cpG0a2
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add lvm2 runtime test
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



On 13/02/2024 21:49, Julien Olivain wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

[snip]
> diff --git a/support/testing/tests/package/test_lvm2/linux-lvm2.fragment b/support/testing/tests/package/test_lvm2/linux-lvm2.fragment
> new file mode 100644
> index 0000000000..0fade167a3
> --- /dev/null
> +++ b/support/testing/tests/package/test_lvm2/linux-lvm2.fragment
> @@ -0,0 +1,2 @@
> +CONFIG_MD=y
> +CONFIG_BLK_DEV_DM=y

  Perhaps these should be enabled by lvm2 itself (using LVM2_LINUX_CONFIG_FIXUPS)?

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
