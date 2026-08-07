Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A05C5AC7A
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 11:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D9A38125A;
	Fri,  7 Aug 2026 11:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9lHQVcvBha1I; Fri,  7 Aug 2026 11:51:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96CE7811A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786103509;
	bh=10ZL9drHXwoI87jbULfN0AWGoVVZq98YWMW2Z4BEU40=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=h1erxcbiiKWUuFjL5En4DdCP5LLFEdYi0K84N4ggHiZkWM4rAGAjilNJtqvJev21Y
	 b6OzwA0nQQvG+FAoqkUoAh7Zh48r4MZS4YsKIY/VL1IpU8+6Q8ZjIHYF03Y0FOwCsu
	 nkGFV26J0VF9M5jY89uC8Vu9aJrvaUJy5+vFQskAlOgqNojEa49+CDPAvgkjlHszhg
	 USpzFyrwZflqxVWuEPn8cqJrOI5K5UiES/rBtsYf0DD7J8tnn+98UcUHT+yEJsQ1ym
	 fnwUeEAvIHb8U2Ad6D4ftZZMBIrtm/3qYHJaOqX5Ah9nNQWhcF7kfUujdm+2rpuXfg
	 GpO13MvCgP4Dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96CE7811A1;
	Fri,  7 Aug 2026 11:51:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B827D3
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31E1B811A1
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:51:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OgiSYRPbKnNW for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 11:51:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5C88B8116D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C88B8116D
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C88B8116D
 for <buildroot@busybox.net>; Fri,  7 Aug 2026 11:51:47 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so27461605e9.0
 for <buildroot@busybox.net>; Fri, 07 Aug 2026 04:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786103505; x=1786708305;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bEl2zchhXDzB/HNsrJMJwuWAiPw6N+3c+rkfBPd//NQ=;
 b=WKbOBbkrm5x/aH8J0NPCqsNE4WxhGq+s75sEE8jUNGVVrLHOCAAHDlpSJrz5/uBvOf
 Vy1Oeb8BUxi7gTRjVbrH8ys9qVM9BBfkV+U4tXPpjBgQNNLcqyxwD6+HtKEaEVKKJ/BU
 AwYFvA2BEibJ0yaauJLsqkViBF1a8zOaXUr5+u6RaAEFWEmlp7C8w1Y8QjWof+udfN4Q
 D4hNkYPPFujz7Mw8VSo18Kr0fCLYJD8124MFDRYxpaTSf9MneA8qIPLtiGlD+C7u6OFU
 x/55QF3nBtZCrwc6rwF+EKQLEmZVKETSkgZ4gmP7SLez69jmf9i0MvcavYbq9TYEnzk0
 RMvw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoW8lzT8COFmIc9kajKUrS1FIA2+DOGwSqxBbwKptAes0qB7L1Gx8cQiovrg7rJgkBU9AFB5Zc0Two=@busybox.net
X-Gm-Message-State: AOJu0Yw72FjFA+8LQAcPo1gk92kexJus35qisv5qSeUGRRRf2M7JNeDz
 jOsgpevSbiS908FakwJm1IlV70sPfVLwDJkGNuWb4N10hRHqyXmj5kXF9ULmk5k6jyI=
X-Gm-Gg: AR+sD11fyCIREtWTCPkc0nIMXHysl6m8lt2b1ao4dXUrSFPtOfFVr/+Hsf36hbGY1/E
 SEnMcfn/fwfXZC+EbxTc+Z7Mid9ANMhIMhu5SbUlesFXiWpslSyyjglLE/U3OUF1CyFKxGkGxsO
 TZfeyPD897L9/vV+lFTZLZlsJpA6ZzeFAlaJO/F5nGObmhNj/E8YQXQKQu4/m/1Ji1gPB/2YccR
 1pj4BHb85FtnxkqlnPxLpaP+3eXt4NEiXoKD1aRKc+Lef2PihWbR2l2kMVpIkwbrSyKT5OUzrqj
 fYp+b1xli4JmtPJ741wIIbuQtXfMy1dV+M31qgWbpxldRXHxMkUzCUgjBMNF+XfNKY9OcdIlkrq
 x7tumc+RDu/cYi9ol6DrUC3yT6BMWssi2ooq47vWwYl46SMivU+sF+cTYJOF7WzhatzL1O6a2w7
 P1q5Fb0Vd3/9DADEnSZK+UzDRVvKqjoX8lKA+/ghauxnKHPbFBXccA1LVaGmzFvQ+FdGHOwA4gT
 0UG5JauNMAUu9BMdxcOSDYbocF8VcQ6LL2RhVQrYp3g0xAi
X-Received: by 2002:a05:600c:c046:b0:499:491e:4b0d with SMTP id
 5b1f17b1804b1-4994e7d1ccdmr247197545e9.19.1786103505222; 
 Fri, 07 Aug 2026 04:51:45 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-480021457ebsm5074804f8f.6.2026.08.07.04.51.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 04:51:44 -0700 (PDT)
Message-ID: <b761688c-df89-4005-bfce-1cebb440547e@mind.be>
Date: Fri, 7 Aug 2026 13:51:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Francois Perrad <francois.perrad@gadz.org>, buildroot@busybox.net
References: <20260610064643.70497-1-francois.perrad@gadz.org>
 <20260610064643.70497-2-francois.perrad@gadz.org>
Content-Language: en-US
In-Reply-To: <20260610064643.70497-2-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786103505; x=1786708305; darn=busybox.net;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=bEl2zchhXDzB/HNsrJMJwuWAiPw6N+3c+rkfBPd//NQ=;
 b=JjvpcNNLww2BpYTEqXfN3Rtlbb2NAEBLOR5/reZgJUfIPyac/5Co6zTcVs9NKCuvfM
 xwkTON4K+GTRwIZIgjR7AJVSQBmGBVgjvu5KBl70/S4kXnZOY2BT9lZmXjt25HpwZlUe
 Pl5iBNrxS3xlN9rISGogo3yP0G3m5GI2Cd9yWz5E1gJRsC664+aD/DVA8A2qEnEwmWzW
 S3QSW259ELaEvGEECk9EVudNdp/mvZokqGtTVlbXHzgpOSIqPQAtwDlzTlZ2wPZspw0Y
 QfQDmG4tYdDzYZKiCDrAUZiwMFlFEYP28UtDota7yc7iUNKNCX8RYKyyHbDj99c4rAxd
 84YQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JjvpcNNL
Subject: Re: [Buildroot] [PATCH 2/2] package/argparse: remove it
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

On 10/06/26 08:46, Francois Perrad via buildroot wrote:
> duplicate of lua-argparse
>
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to 2025.02.x and 2026.05.x, thanks

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
