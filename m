Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067B8CFB440
	for <buildroot@archiver.kernel.org>; Mon,  7 Oct 2024 03:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CB4860719;
	Mon,  7 Oct 2024 03:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jKvXf0KTfg0W; Mon,  7 Oct 2024 03:45:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 502476071E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 502476071E;
	Mon,  7 Oct 2024 03:45:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 132421BF295
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 03:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 014B56071E
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 03:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wSLrU2AK2X0K for <buildroot@lists.busybox.net>;
 Mon,  7 Oct 2024 03:45:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com;
 envelope-from=f.fainelli@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1904E60719
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1904E60719
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1904E60719
 for <buildroot@buildroot.org>; Mon,  7 Oct 2024 03:44:59 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-7ae3d7222d4so3449583a12.3
 for <buildroot@buildroot.org>; Sun, 06 Oct 2024 20:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728272699; x=1728877499;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X1L7DvUJxJ0U5nfbPqPn0qua1s6YaFY4jU2R1BVk270=;
 b=lSxqghFBl0oaC5s0TFbfhLsf69+ztOyNpE8/WieBEvCQAVqZYbg/K2yWTiUWB+9NR9
 Xy0Z/aBwwxdAbLFCOa6AHHLXAlDpZ+3sbOnITbcrKlCVqkkGdcN1n9epq3arnZyeNS70
 CehkReAYng7uU1pV0E9unByHzzXAoe5w5yIFiiyoNaDd6QVqpSrDZwjMN3jGPaZW/4of
 ysYrd5aZlYUnH4kNLveAPEc7gazGKUbB/6xNvf2fZwuyc9Pn13FmSVpRBBdAH9T+ylRi
 U2khv4GY+qsWDMy5xeXSUdJKZXFQIqpU1d3WIfh4OfhOddugt7G62ULub/ievvtaHnn0
 kTJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW67KFSxOe7sueEGtExcqyXKuAD2SHzOFK2O6McoA2z8nj/xTgCB/Br5C0UAQxRHa7d0jsNCWDbGYI=@buildroot.org
X-Gm-Message-State: AOJu0YzIJDkq/tjdP1Gq937YqagUwYSe8yKQ6n70uq2GGxtNE0CnuURC
 wcxRRwcxnI908WAT2YTLVR8C2hmxPAw2Zj23YzX2s2C0yrc9hulD
X-Google-Smtp-Source: AGHT+IHLcXL2J5jl9YuiAIGMhoLrMxlFQ+uL/dwYSVRUn1fVhTmjLNt7UfMqy8VeBZAtdDR74LwlHw==
X-Received: by 2002:a17:90a:7086:b0:2de:ec70:837 with SMTP id
 98e67ed59e1d1-2e1e620da62mr13193343a91.1.1728272699205; 
 Sun, 06 Oct 2024 20:44:59 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e20b14bfe5sm4154401a91.56.2024.10.06.20.44.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Oct 2024 20:44:58 -0700 (PDT)
Message-ID: <9b6fa6e9-d920-438b-ad7d-15edb7ee7ebf@gmail.com>
Date: Sun, 6 Oct 2024 20:44:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20241004172707.3662311-1-james.hilliard1@gmail.com>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 HGuUuzv+GKZ6nsysJw==
In-Reply-To: <20241004172707.3662311-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728272699; x=1728877499; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=X1L7DvUJxJ0U5nfbPqPn0qua1s6YaFY4jU2R1BVk270=;
 b=SvgBiJgekAohu+KpxSpTpFLsej7x5C2uJf9Hv/mtJlNMHHsGW5OYoQ/eLa3qsBoQXV
 xUmbfVnbmV1uYFr6uTio9hqZtqz2zAQ0+pb6mxS8jzgkIPcPRtsN6GV2OcCRDeg+rzNX
 f6OwfqCss034qTmJta620ekrA8y25WODcFysW8iZBlu+YllnVxH5tagLqLKmp5LsndC0
 l9IXVNlfmj5FxAOuNXyVEKUpOJU1de5GDvCUJ0EM0qv1TEkSgE99FWO5evbihQE8kM9S
 OLed35menIQ9Tjgj+9gdTesrBTS5HrhxflmSQIt7ZvdnjM/1/sy2IRSd+AVoSnWS0+IC
 kZWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SvgBiJge
Subject: Re: [Buildroot] [PATCH v2 1/1] package/bluez5_utils: enable
 asha/bass when building audio plugins
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
Cc: Frank TEO <frank128@ymail.com>, Marcin Bis <marcin@bis.org.pl>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/4/2024 10:27 AM, James Hilliard wrote:
> Symbols from the asha plugin are required when building a2dp
> support as part of the audio plugins, so always enable asha
> when audio plugins are selected.
> 
> Symbols from the bass plugin are required when building bap
> support as part of the audio plugins, so always enable bass
> when audio plugins are selected.
> 
> This issue appeared during an attempt to fix a related issue in
> ce4e5fd129b557ac0411d0a0704be43717310d6d.
> 
> Fixes:
>   - http://autobuild.buildroot.net/results/5a3/5a306356f5f190a14a0a2294a4428544b1a018bb
>   - http://autobuild.buildroot.net/results/353/3539c83deaa45a3548bcd488659148c62af3fc73
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

This does fix the build failure I just got that was identical to the one 
reported in the above two links. Thanks!

Tested-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
