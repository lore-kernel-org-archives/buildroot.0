Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29717C5CFC1
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E53CD40E3A;
	Fri, 14 Aug 2026 14:09:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8PTtFmmgugut; Fri, 14 Aug 2026 14:09:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF58140E07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786716587;
	bh=XIcAkx1FTV1EoSsdKgd6QtgJ/AzXT8+O63gmn000rYk=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=QUDYJvDsjpTsPuVGIsC/tcegyWUqVjM8THONF5P8TYKq7BPlfUV13fzQKP43PWzhf
	 4vh0jUyuWhmA4q8i0WRbCgVBcX5AGff/XlWBpHeUPG6SH50rCxPSOh+esNzYV9wOA+
	 eKi0F3olBeXlFKYc08gfgtEtQjdaQ9uwk5MpZk5NP/aEeB+wRAkvVm0V1Xk2LLolsn
	 OWoNoGjmtiezbQsi6uekaTjngDroZL2jdnoVRsdlYzVtC19YcpwJQ9itSGkTHP2TM6
	 ngKdD5qflgH/fOd3VphI83CvjNT0lDJ6gKbMNJq+KE7BwmXJdcUMo6P6IYBs72lNB9
	 MdpuWnDGtIVtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF58140E07;
	Fri, 14 Aug 2026 14:09:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FCD73DF
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7170C40DF9
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:09:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fDB_PMFxItS0 for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:09:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4D00440E07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D00440E07
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D00440E07
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:09:45 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4954a32cf1eso5698105e9.3
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786716583; x=1787321383;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ycb2Qcp/XrbwLl+f6rTekSSB6nZ+HNum5MjVriFCY7s=;
 b=JS6FM702fhk9Bpe+Rq4rnryKCusZyIENpFs0gJ+DaKJuC6nJzWZnJTaUrltwbjC+Si
 mlpjajnQjYNVOPAxMgh8w5DE3ps5isyeJf4jtkU1ez2jbkng7ubxHKjTMaIrIpgwNnfY
 YzZQY2BNgSGTd0gI1TC5MAE+jKNo9I1LvcZ2wUsvUkwX2w8UgDqGavie/xF6/dL86zUH
 qEbR7qiOMAICsIcUSOdIfg1CX4ZrHNLrB4HSGiyBSsIlN1gJctE/489tQiO69w6utyyz
 eCkOnHGTrNbVbQFaU992nqVvUoZsusrjDPCt1vXsFWUX5jCT7qlLZTylA5PTlMmw3jKC
 x74A==
X-Forwarded-Encrypted: i=1;
 AHgh+Roquv1EGP52DuB1xVmQko+33sId7bZEgp3Ycl6UAz+rDb+c2eP/58vVzdD6uZ/l8ORU4PLwef4nqOU=@buildroot.org
X-Gm-Message-State: AOJu0YxAwRdNCqQpJ5YkORjJ2vMRuXpSZE00N1QG1noadasGuGD7D5bZ
 irj/mKvA5W+RB037sjRLvjX9+wBXcNWyDcC5qCz4PgGpjYMI8ZwNpYwTP2ij2eOxhhs=
X-Gm-Gg: AR+sD12mqGIrvnXDj5KLHaUOk6XWLHL9QrouJQOXpFIKB+8EZwEDYjSZXyVJD62ot3R
 Ej6BEyYp54lAQyO6ZIhak99Zk5CYBXh5g8mKkljbsN/9TQQQq+V8DpsLJk/nuhDImPoD2OIH+5P
 hn3qt2PBHGpnE9THRFiq6YImXS4/IRvO9FwNa5nJodGZzXJgCERCIaiiMl+SigtDdm1F7wPrU6y
 47YtIyvwTqZUa0I44Qca0EGVtkAAvKgzNwQtxiAmZO9/Pv6Q/5sVVEEBtG0fD+U4A1RiMQgrwGq
 7SMHhQ1E9ID91PW4WoQJbfrWoJsi7xNVDP6LFVw/4mibJNFrGVCMClU16aulVLAw7jhjXdVaXIw
 cVpdBkOLD1YO/5pdQSK1FGDdUGxpXxh0bod3/8v5uKiUbUAZMkBgROHsxi5oSxmLxoER/TLk3FA
 HqKML1wzBDh4z8+HG24u1z3+qz/thuNdoIqefIHoPJxz9aSTV3ooSXAzvLlpbi4zwixjGJHUeoY
 1+meH0uXwv9R+hj8CP6ZXxqo7qxEqt86xfE5u9ijJCNWRUl
X-Received: by 2002:a05:600c:628c:b0:499:87f3:a2a3 with SMTP id
 5b1f17b1804b1-49987f3a33emr98118515e9.15.1786716582646; 
 Fri, 14 Aug 2026 07:09:42 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2b1a91sm8038567f8f.21.2026.08.14.07.09.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:09:42 -0700 (PDT)
Message-ID: <d01ab35a-7f79-4f2c-ab6e-bc2efdc4b794@mind.be>
Date: Fri, 14 Aug 2026 16:09:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20260606225120.409046-1-romain.naour@smile.fr>
Content-Language: en-US
In-Reply-To: <20260606225120.409046-1-romain.naour@smile.fr>
Subject: Re: [Buildroot] [PATCH 1/7] configs/s6lx9_microboard_defconfig:
 remove defconfig
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
> This configuration for the s6lx9 microboard was added back in March 2012
> (commit 49084a198247575650c155b6f5f147fb034becc5), and has not been
> updated in any significant way since then.
>
> This defconfig still use a 4.4.7 (no longer maintained) and out of tree
> devicetree (lx9_mmu.dts).
>
> Remove its support.
>
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/14728914045 (s6lx9_microboard_defconfig)
>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to 2025.02.x and 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
