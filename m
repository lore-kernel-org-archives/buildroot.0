Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6429CC5CFC1
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 306D140E4A;
	Fri, 14 Aug 2026 14:10:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pevLzI9ak3kw; Fri, 14 Aug 2026 14:10:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B037B40E34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786716630;
	bh=OLbZS5LKZa8vN5GHIHTtwUjvHCEHoaP8OmUDMlfhlHs=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=DcdD2kqfxA510iEqkDhQh7kt6bFR+YM8hky1zVQ3a06jJJu6rdULhsSB7k366FpJt
	 cf6U9J4E0sWSPF5YZKG+RnJtIMvFzFQ/9zbV7P7duoR6xFkroZTDQ1d1sHfRAmj7ep
	 pqk1awDfmid4pGnbKp2focHG9RwcK0oSZTjlggiU9dLmWkDFazrcClSyaPOEoX2og7
	 61we/m735JX4IHZhGZDqseaYXEBkFKM4qZSF+R0t/83/tqb9nWn1jHmq2bjcvOy8kF
	 r1nzZe2rFbEvifxfVWaoFDSf3Kd61dGXFGSd23+hkYcTPznIx9q+tmsrELKCfo5k+p
	 ZHYpa/KbcPKNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B037B40E34;
	Fri, 14 Aug 2026 14:10:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2608023F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BECA403B4
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:10:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GbfVF3KQyv0Q for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:10:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2A4CD4011F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A4CD4011F
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A4CD4011F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:10:28 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-498028b3d5eso12990275e9.1
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:10:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786716627; x=1787321427;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ph/OMrzpcooyEV7eDnbuvurf4QEeEu5luTrEFl1Js2c=;
 b=U/COEWk2nuIZBB7Bd/9cNJ6x+kF88m0gg7FWZbgc+PPdXvXt1vix41l+OtMf6iS0j7
 xqrNeUXG8qCG7EaZvWgOhvGdf/3yqCHgZ0yXkbN8RceCmnemMrlN2fAo7ZW0lS11eRhE
 IshyQKggaadBN2T8HY0ypbrleP0Enj3yPImmrp3tSAgjSvIt4fJzgTgupX3ywjGUEfiT
 ogHld/LY9D+5NMGKTEc5B4zG2mt10cfLUMpuevZAKMQO/RGrWL4hLLDxUXNpek4S6C54
 AM2wMda/sTrUg65vErqEjZKhI+xPCILS6HTiPZhep8CMGUtGvJh8Vw+Xy1AvH8SJbBPb
 2ctQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr4JFo4KXPfHYwz1M2Npnmr4JcygVDbbUaPT3cfg9YD5vOgmhdkTzg89nuwP8J2DMzlTVMp02HWZzA=@buildroot.org
X-Gm-Message-State: AOJu0Yz8PhREZOr4twsf6jDrPbyjkigLNTgTB5DJ5txYc4o5he3+eqZO
 LookAMhDCbCERP6OuWJwBWm4mx3XBF5RFGHHTqTJ2eDc3MfjShwSTQtY17UwTjbjRpI=
X-Gm-Gg: AR+sD10KPgjU66GZ3L5CGE/yZD3MpgpVqys8GdT352eZ1TghHjPQBK+fHpu4lJO2BMl
 0j36Z7Yw7GKmCSNN2K9Q8+XqQVNM5qhHd8KSwqu2KqI8dQ1qYfwsrwchyPXaifg5BKhleaEf56q
 pnJauxN6hCtIwNGJYPGxYplV6yqtzjZciS/CEcBCcmqpBNv5JkTFoT9OBUbC1YBamS1JbN/3wg4
 LSCxFccLYtCmLBJ+QkqUWrT9MWOFaX9Wo6vIgctZoABfAykZBLfXjnDe04YiOnmfdfVoWYcSpN3
 XE95dNUPGG9FvfQMPwq1vhiEKe1znuAMgeRdNQOSA2Bk/TLk/UUDfKTPy3JbPix48HoboTyPy0U
 XBcJd6hjVP+kIN8Cwcs3dxaxuQslg9ZZIAsZMYApZEPtxig2jhP1Einlt+eqkqxYxrkyfhLsufS
 8DDCgqJeOszgKUIWJhUxAD8cXSCb1GcMo6Kjb/4T70YMzn0qsd/rmEwURNPeY0W12tSZJSoGo5c
 v3PLsppHRS2KH/ot49TgkM0XCGZM8Y9l+8D4LRRgJ/FRLUW
X-Received: by 2002:a05:600c:a14:b0:499:5f7a:7ea2 with SMTP id
 5b1f17b1804b1-499879677f7mr99861805e9.12.1786716626233; 
 Fri, 14 Aug 2026 07:10:26 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49988b25625sm56168995e9.13.2026.08.14.07.10.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:10:26 -0700 (PDT)
Message-ID: <d189e57b-f4f7-4768-bdc1-b672f1a523de@mind.be>
Date: Fri, 14 Aug 2026 16:10:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20260606225120.409046-1-romain.naour@smile.fr>
 <20260606225120.409046-3-romain.naour@smile.fr>
Content-Language: en-US
In-Reply-To: <20260606225120.409046-3-romain.naour@smile.fr>
Subject: Re: [Buildroot] [PATCH 3/7] package/ts4900-fpga: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 7/06/26 00:51, Romain Naour via buildroot wrote:
> The ts4900 defconfig was removed, this package is no longer used.
>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to 2025.02.x and 2026.05.x, thanks !

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
