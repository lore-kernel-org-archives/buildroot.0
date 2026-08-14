Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C8CC5DF6A
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7450840613;
	Fri, 14 Aug 2026 14:11:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TCVkiJb8rTee; Fri, 14 Aug 2026 14:11:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A488A40621
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786716690;
	bh=Vh9lQ2go31eT1zGSmmPCOJT5b9VBcS+X3QjmehOUb6c=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Ra6HdbVL61EF5dYAUNFEQoqlAuTIguyHejgD6B7s4gCX7A/TYyWvOIWqvP/NyXT9Y
	 gTKU3QZjijGdlCtpdB1uxj/4UyWKcU1SNIm3DYoKRpcpdEyDCjrhwOZlLmTZ0OnmnX
	 P+SvTNHk2Tx+W7kLibLqWQtIUrSTiUO4+AL5q9whHGr2+AnFES8EicRh2l9FF9MDW+
	 KG8/qKYQsQocksMG7gsa9z14s79H26Z6DDODhTVrX9cJiVS9YmufQWjJOhofxfeRdm
	 4IsNuBgiHkZeajpGcPbhW+hVpOQN9crbpWUJ6vaGtNScorOEPBGZhWtl1purA/PbrA
	 t0WjTbF4pvS2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A488A40621;
	Fri, 14 Aug 2026 14:11:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 703A63DF
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56AFD405F5
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:11:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KpWTVblgFSKC for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:11:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5A7D640506
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A7D640506
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A7D640506
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:11:28 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-4798bea72f9so673391f8f.1
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786716686; x=1787321486;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xFIC6QUKNV7jFj5bIy4RIUhMONVJPNqzbdAqnhBjjH4=;
 b=kgBUiGe8ESdh8G4joVczRUto523hHk7IgCTG0V+QSTb8ZDI6pXhoxaG4uHLA/buSJN
 Hib32ahWGemtIsm1Qjjb/RTfaDqZ8ghyayZ68l4kmp6+B1pLl5zDlun5J5y/uylqL9cO
 Wmc0h6AHVbtdyHQ20gWQWu14Ued28rtsBJsuWEX3TVqJzNY0oQjv0OXsDsJAJKF4zH2H
 xQ8oGMEyv0fet+ORehJom86gqkO3X9/qmroijWGPVsP599QxBPx0SBthmpHHm/pCSGsy
 +zP7OGqcVPqSwQRM+r7TU7JAhE1tbTzuTtJSf/1Z0f4lk2EjenV+9IPD32nDHdMPmkfm
 2ENQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr1muAsmcvvoB60Mkdf5VXUCkfOFri6mMFe452kJju6ZCj3irXGE1ivmEScFPega4r6/pG4gwbF/sY=@buildroot.org
X-Gm-Message-State: AOJu0YwtwUoz9l3bxrt4EbADg+6JAjDV9pLvWZFuk1IwvAmlZyfRRV5m
 qguXqNsZOsysrcLbdzjZjSJoJDgyDtX02GI6Xt3qoLh3RqLhTzzozzMIOe3+80Trd3A=
X-Gm-Gg: AR+sD127xVmt0ZYJvVtMKsObUSFB5huwm6n0Q0AbTrpvicjh3JXUDYRcHJX8Tk24krz
 ybz0ORqaVKeJMOLbMPkR2LfvTFHCWirdZ26yAp9cgVkNNqsStIL/ZMsDrmxNdnMqsBqVsv22HWF
 zbaf1CWMFP/xTsQSjZf2utEluGbz9Ygsg1MXMTGVIQ9fNuAMV8Be7LnjjG9PlqqaitPXgXgOSR1
 7+q67/U//amJF41SjCjbTiVFEykWHd6qW3gFpZ72pi3N55ylTn0nYHGmrl5KcOolXFZEeyxt5bU
 G/ro6fe7y3m9rbHMbhQRnGm5eK255ySUgU0R2A1Dw2atR5uKYornkq+ljNpsKmODLyDEcyjH8pZ
 zn4qSnUZPgi40MHb9b7t/m6dSo0jqQXvPYI35cu+2DldZ4F52pKdy5aOLTSU8uYBeM8qxz9JcFX
 zuzyhZSWKtzueGPlOH20yIJpiDKMvAWQw4wasIUpSkyd1LAaLFVxuaOXM2SGqWt2xVPZY3X6pYJ
 80J0svKurEziAyCAeZdx9PxcEUN2BtjbCO9rnzikElJ6/ar
X-Received: by 2002:a5d:5e13:0:b0:482:93ec:b3ab with SMTP id
 ffacd0b85a97d-48293ecb697mr512178f8f.21.1786716686312; 
 Fri, 14 Aug 2026 07:11:26 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2b1a91sm8048278f8f.21.2026.08.14.07.11.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:11:25 -0700 (PDT)
Message-ID: <dc0815ee-04af-4c8f-b0c6-b31bb26ede38@mind.be>
Date: Fri, 14 Aug 2026 16:11:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20260606225120.409046-1-romain.naour@smile.fr>
 <20260606225120.409046-6-romain.naour@smile.fr>
Content-Language: en-US
In-Reply-To: <20260606225120.409046-6-romain.naour@smile.fr>
Subject: Re: [Buildroot] [PATCH 6/7] configs/acmesystems_arietta_g25_{128mb,
 256mb}_defconfig: remove defconfig
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
> This configuration for the acmesystems arietta g25 were added back in
> February 2016 (commit e173aeece51852d652c557546d9944ee42c91e4f), and has
> not been updated in any significant way since 2019 (the last major
> kernel update [1]).
>
> This defconfig still use a 4.19 kernel that is no longer maintained.
>
> Remove its support.
>
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913803 (acmesystems_arietta_g25_256mb_defconfig)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913802 (acmesystems_arietta_g25_128mb_defconfig)
>
> [1] 42ea31c114f32a100923e51cb2b6b6d67c38ca3f
>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to 2025.02.x and 2026.05.x, thanks !

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
