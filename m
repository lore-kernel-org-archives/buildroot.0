Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6274C5CFC1
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 832DF40E1E;
	Fri, 14 Aug 2026 14:10:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tdipdspRyTkB; Fri, 14 Aug 2026 14:10:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD5C940E34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786716657;
	bh=TTIuoFBrW+LU8wZUJVYgn39vmnX7zNtiFhn3ZWDg9N0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qmy2NnwAroHZkP9HBQFohqM/JDVa25L5nVeS5N6lmzOdlwGz8C7QIM365Su0wzBs9
	 kU9LtC//UYq7Vf/kBZ7jQdMIdhgr2rUgH6M/+xKTAE/dmC21R/PwbN7uuv+vA+UpvP
	 oSiVs01MCphjCJiCVIv7CSutSC2P5E8kJWnvb0qhY60g8ReBE11W1CxFjxq4MK9EYm
	 aOzOpY0KbHuWqhwua1wvPCWd9MGDho2yklP3XHntp+qXzKOME42s0JeNvs9dwtdMmc
	 8igJgY+pco7776rw6GeNLGGjtSLKO8QqU0tx7JNCyfY6ALPNgUx5js9kaLbqTz8vur
	 a9PmJchF6ZpmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD5C940E34;
	Fri, 14 Aug 2026 14:10:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 76A9A3DF
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C9B560621
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:10:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bXZd7Lj-4NUB for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:10:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4622060616
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4622060616
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4622060616
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:10:54 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-482938466a7so85819f8f.1
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786716652; x=1787321452;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nv8Atl4Irpdz3OjlUu1hD+CxdzIkPMA6QNATJUlqKZA=;
 b=seB0BeAICxICT6UGAfHl6pgdOHDs1+sq65SD5MSMbBFTicwZ22xos+C0e+Vkw9EZOu
 6QrAa60GIofak1T/UnMI83o3AlQc1cKKRLmKXuBqvjI4aMv3d8VCpo9qPzwLiHDSruuH
 GHOOezuCcmsyPVYGJM/I6TXwanRvCR96Bs5fiE84N646N1cqgUEW+yqBqLtFBY3gKzfr
 BZ+VNDTwIaifCRGGVm/SgBwzL4iL72Q3c6pj8mD06XYOtOON3Mx0/HtLyfd8dLeXGQjg
 iGA1/8j86elUzkKy6lHusGdNXYIXphys4PS/POm88pjsGWvBpYA8AgSqUS+baR9wdiyJ
 pEWg==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro4O7tPXnBo8JZ/G2N0DgLHIEz3HLRtth8RcPvf9RwhKKTRNy8tgSuCePYWxVm67HRRGudFGHs9ASU=@buildroot.org
X-Gm-Message-State: AOJu0YxCCxVefRTZXh4P/yfDR4QQGLqKadQKu1JiqXfR0P2czJBg5B0z
 nSzD2dQCQ5dGd8vUTQEcMrDZbbEf8mF4iYNoMqFKX6vJNSwQ8dZWvw0ff8S9kSQ76uU=
X-Gm-Gg: AR+sD13vkqlCZfAS971doSTU4vWfz6+6hmcj4Lbu4fN1o/VZ11Al3ZzTgMnzU7XnVoD
 LP3pauBVng27dYODLw/6/aCimlvL+lpS0XLq9L1+5eqhnuOiE7GanYcYxdUHxg0uU0Bu0/dwmwl
 iN28auaH1DJLmfLJkiLRveChEs9nbefbY8Rn6ehpPnlVsfgV2xePoot5z7ilMWrwz5BjqDAlDaP
 QRO4YQ6UiQyl11tmJU3wTdGALyQ2iEQIXKhoKaJD8WDc1zyjXg5C79+hHWeSoh9zOxOY8+vFwKW
 4iOpEI9jwGy+/WbpEKs741IIDQKnbuU4a4KqgMw/6Io382hOlzmeDWwm1OSupu8gai725RqN+z1
 x9jT4a4i324q2kKTTfMNeHknguxTfFQNXe9QdLEyPvX603QlYQUIpJyTzFWVvY6djb9UV0QQr9c
 KbWRSGRPgQFxgzXJfadxkAEOcarmOiOAics3mf8lUZuMogCJJ8sJDhlC1WAvpt/eMrs6sr9goR9
 hZun4pnYU+/jBtsrxRx75SpUpmYbD4RxbdpAYLh246BmGyj
X-Received: by 2002:a05:6000:29da:b0:47f:c648:e274 with SMTP id
 ffacd0b85a97d-4816070be36mr7341717f8f.5.1786716652287; 
 Fri, 14 Aug 2026 07:10:52 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f15b946sm8664714f8f.0.2026.08.14.07.10.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:10:51 -0700 (PDT)
Message-ID: <757e19db-fa16-4fc8-9d0c-660f7e88e124@mind.be>
Date: Fri, 14 Aug 2026 16:10:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Cc: Vivien Didelot <vivien.didelot@gmail.com>
References: <20260606225120.409046-1-romain.naour@smile.fr>
 <20260606225120.409046-4-romain.naour@smile.fr>
Content-Language: en-US
In-Reply-To: <20260606225120.409046-4-romain.naour@smile.fr>
Subject: Re: [Buildroot] [PATCH 4/7] configs/ts5500_defconfig: remove
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
> This configuration for the TS-5400 was added back in September
> 2014 (commit 483e3bef47b3f024e4181403b3665702101c03e1), got some update
> in 2018 (commit 6461d76992ec2ceffabd7a5ccb59bb707ea2cb0a) and has not
> been updated in any significant way since then.
>
> This defconfig still use a 4.14 kernel that is no longer maintained.
>
> Remove its support.
>
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/14728914087 (ts5500_defconfig)
>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Vivien Didelot <vivien.didelot@gmail.com>

Applied to 2025.02.x and 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
