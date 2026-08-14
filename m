Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E68C5CFC1
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C87B640E43;
	Fri, 14 Aug 2026 14:10:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m-J8PF_Dov21; Fri, 14 Aug 2026 14:10:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B419C40E30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786716613;
	bh=/y0urv8ur6N091u8E9HQVnw5XT57sMiHcdftC1oqPuY=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=pemOXs3F/UHtx6kLfJJVBRkV8+KFAYIKnXPEJgEApFPMIZYCMTl8zTZ6dz60SZ91/
	 5IEDhznyDKTC0W7LnmgG3aWcc06lHyVooKSIf6HtZ1XqCZrlGsUSQZ+GowEdU+Untn
	 o3Llo7lvcRB2e/JuCnu19E9ppHRWn1Jav96+CTSq/uJna61lsqc15yI957KE/1MqkX
	 yxZsS5jFfHxUV7NoNIQTD8aQe4MH7X4Z3V/GaqzNlbToiUm7N7vw3X6AhUdX/BM3KN
	 lCN2elXIOVa8knNwEoxjFXjsIynKi3Ght+N3uve8vaBGoyb8/YxXpZ9hRIoIGvxQ51
	 2A+vk+Zhd6z/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B419C40E30;
	Fri, 14 Aug 2026 14:10:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2110D23F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E88640E30
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:10:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YXPp3I0af20c for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:10:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0C82C40E18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C82C40E18
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C82C40E18
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:10:11 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-47f703a9e5dso523101f8f.0
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:10:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786716610; x=1787321410;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2K5At7fprPT4jDsFrIMNWfmSSPrjIoeZgrQqLHV3c5Q=;
 b=U0NCEtoSrzjE5tD8wPlHTwRfx4XSTFMvkSQQ4E3vgLDx3W339q7hbY7MmYBidOcaxh
 7y3QKdvNc9m9sO/oT247cP/6M95kU60LQixyV3UdbnmDkaXxmLlbXqFHP9QQkrV9KIHO
 hv3PiFa0whvU+QO+8MR2pRtY3ZWsNsDcIoZnKIYJizkCG+VeZLDBJ98dBExroDqh0QSP
 qS7+s8rSMUgxE+fhqz39/nfqCD+tmrwTHQ16UVjm6MYNPmCWaCzgNC163XvBt7q1fzsW
 g9P3XH5FJRC51XSWrFtqGipde+7zemYhhqaTfRfQhBKZt235fimuraefRorAGWrwD1sg
 U98A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr37VACDZn+P6qPLJhzSBCtgmu/9+ANipjGPC9Jdhp8Fir7QrH2y4qmIHfYFo9/l+beWWvqVnGDTok=@buildroot.org
X-Gm-Message-State: AOJu0YxYzW8LEt0tAdm7m5eQ4tCgPpYIogMfTTIo0mn19o/rvm9xO3yg
 3MENO0xWIzehbRbRbejYf/r0FUEL945ef38lXQeiRP2GjAHRfc/jYdy1S5UZviDJkxY=
X-Gm-Gg: AR+sD11G8X/kMD3H2kLU5/uLS/uH29QenrThC3z2D8Clz5JGNwYiaVglnFHQ2WndFoF
 DJah45xYaGYUj2b/HGZwgoc8K2MJy0STaGG1wbs2foNoR0FNK5blKd6T32PIf5vfm5cg/lCszRZ
 0pWuc+FuSlCiP3oyp7ON8kaM1xvsICmXfuk32CH3xNOBE7ROEY1gfSaMWoBWuR8X4/YLbmjBsL5
 TG3E/0UfCb9PPhorNNOzWgad70JNUwxuLL9ojuYUbPoB7UcptlHum5+qn9y5XG+B5xNhiOthjIP
 fDnroqwAgAXptPkcvRJ6no0LP2XcRHtSpTE5OXioiBCTTArURJlChtXwP7pjy7JlwvKGn/f+4xb
 oayRcle+VrmCdGoqVYLaeRN/x6OnN8kKPzoSQfIFUE/RDFLzACPPeqqJpe13N4dJJnNSGQ1JSxG
 Zo9WWy03kj9L5aJ5skqOnvIwjkWmU+gU3pKS+88X4LTyzhxC1kdpRp0HZK/wGDPw/fAvRH+upvR
 EmnaVAzJQd8naueKXvSgBBEpCyM7W+diW5qnKW9F+4snf4Ztdsm3jTJS1c=
X-Received: by 2002:a05:6000:2088:b0:481:5bd6:82ca with SMTP id
 ffacd0b85a97d-4816071d01amr9590413f8f.4.1786716609749; 
 Fri, 14 Aug 2026 07:10:09 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f21a068sm8448239f8f.12.2026.08.14.07.10.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:10:09 -0700 (PDT)
Message-ID: <5d2880c5-aa58-418e-be99-fd78400568d0@mind.be>
Date: Fri, 14 Aug 2026 16:10:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20260606225120.409046-1-romain.naour@smile.fr>
 <20260606225120.409046-2-romain.naour@smile.fr>
Content-Language: en-US
In-Reply-To: <20260606225120.409046-2-romain.naour@smile.fr>
Subject: Re: [Buildroot] [PATCH 2/7] configs/ts4900_defconfig: remove
 defconfig
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
> This configuration for the TS-4900 was added back in September
> 2016 (commit 3138ab3fee7b0251e3cb3fba9a373bd3cf9d6424), and has not
> been updated in any significant way since then.
>
> This defconfig still use a 4.12 kernel that is no longer maintained.
>
> Remove its support.
>
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/14728914086 (ts4900_defconfig)
>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to 2025.02.x and 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
