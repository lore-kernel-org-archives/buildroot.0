Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB20C021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 22:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D47F460F1F;
	Mon, 17 Feb 2025 22:05:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KzG3nbIqs1YQ; Mon, 17 Feb 2025 22:05:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFE8960F25
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFE8960F25;
	Mon, 17 Feb 2025 22:05:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E2BDC8
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 22:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2172760F25
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 22:05:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FaMI6_oxoYKx for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 22:05:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1813E60F15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1813E60F15
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1813E60F15
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 22:05:29 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-38f3ac22948so982043f8f.0
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 14:05:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739829928; x=1740434728;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qa0nsVkT6MlOErIFjHkeH97MqdHtdHU83KxO2D8lIDI=;
 b=T4Po8wmjkTbB1HVxaHCh4RvJsSv5YKf3Vkx73whO+pi8Nyp3jXy5pK0ffAcXNZ7mAH
 SXuao8ygz0zfW/I35V3Vwq+mAsKlqRFJuKwZWfh3pQYhVWadxDztJPLbXulNAXtAB1nU
 hJn95Wwz8SqwyJxCaYyznqm5WdEpCfscMAtvKnTeIlE1Qerag6vc+rzHzO9v+EdBkAel
 jnQBPvGU0MZqkBSxQLegeYbkv0MgxSS1rVVVx3hLNLroB0Ewe6WHLtEI8COHjIzHmJaI
 2Zz9pQRv4NFvn17sBsqi3a99lxtrwc1q+JExa8rla25MfWusVHEy8oxBHJGGT8taH9dF
 qeQA==
X-Gm-Message-State: AOJu0Yw4HWzg6HKwxy0v5HwkxEYMDFrnS9PXLcKmqnfDYQFeL4Aum93q
 VWsQW/eGVQ7wWrkto6AveuHphmtTxJexyE2swY9rMewTtAw2bL3DO0jir6bexLo=
X-Gm-Gg: ASbGncsV0ZvKW3yvpHBnx3BRItmc0/QlL6uqQ7Ohex8BcQURy9i9MydII1PVdPJFrQu
 RNqugiMRvhkFIcMUKh0uAC5ar5MiJjxPJlmzwfhMvIvhZxIEcrli85/qmdt0nRUnNx4eO2nPe5w
 yBJRCE8UG4yq5VD3P9QtMoG792IMKlhurPAwZih+3cwRbxWyestneKzN3n5OTFUpP4eI2t+q8+Q
 MS/toxMsFONddS6loIA/UqOfy6gED/sQlMNJtV4rylMQ6oQ3WE1tDsqQGDqYgRhupPKVPiMAt3X
 5gb/hCqKAxQ29dy0YhnSO4lWzSLWRQrz+47uFzTUgxD+oeq3Sp+D/URh8Fm78F99kmLYctgEzOp
 4Z1Ldjq+S+nx19Ki/DAUdZE+KSCatiJ031i7fQzyDsdq0/A==
X-Google-Smtp-Source: AGHT+IGz2+ifGHUTmZa9nX+nfXefWv0ho3S5HyqGGUllDcgNPpgczMAY7a72B110yimbR9sJhkk9vg==
X-Received: by 2002:a05:6000:ac9:b0:38f:225b:3122 with SMTP id
 ffacd0b85a97d-38f33f52fcdmr10468954f8f.44.1739829927646; 
 Mon, 17 Feb 2025 14:05:27 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258b43d4sm13060853f8f.4.2025.02.17.14.05.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 14:05:27 -0800 (PST)
Message-ID: <4876bbc6-4a3d-4b07-9329-7f5d4e9cf3c2@mind.be>
Date: Mon, 17 Feb 2025 23:05:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>
References: <20250216170350.397879-1-yann.morin.1998@free.fr>
 <d0b96b79-52ad-4893-871a-025127a7e96b@mind.be> <Z7Ov6egJB6PjUBfD@landeda>
Content-Language: en-GB
In-Reply-To: <Z7Ov6egJB6PjUBfD@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1739829928; x=1740434728; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qa0nsVkT6MlOErIFjHkeH97MqdHtdHU83KxO2D8lIDI=;
 b=FTfV8AvE9ja+Owmz7ag+lbm4JOU6FoD3+jniXF8zzIdgMJBCG05hgLKdczmhys6gFy
 /JEq8zu8rg/l7KU/W8hdsL2FhVo/oxuS4CMWLYGwnvL0kFl0QfwOKQRtSPzOfr4MTazu
 WBSnlkMKKCAU9Z59GTv3jAXPCF6OpNEHY0GNyg7VQZs8iw1fb1lqF6sE327z4K+MlWad
 78rgIbaOUP9BWcftQm6ZJo+2ABQkDQbEuO0w/9yuxqrRas6d6OFn1dwU4PhBefs1CoiZ
 41SEDneP8kF9GCiUwk4ACldFG8aUIWLCKPCjvAtwF9SzWzyyGJaeYb0AahnoOYkesy+H
 fDbQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=FTfV8AvE
Subject: Re: [Buildroot] [PATCH] utils/docker-run: allow explicitly setting
 of docker/podman/...
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/02/2025 22:53, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2025-02-17 21:54 +0100, Arnout Vandecappelle spake thusly:
>> On 16/02/2025 18:03, Yann E. MORIN wrote:
>>> Currently, our docker-run helper will decide on its own whether it
>>> should use docker (preferred) or podman (fallback). s introduced in
>>> 9a629f5129d6 (utils/docker-run: allow running with Podman). In case
>>> both are installed, it is not possible to exercise the podman case.
>>   To be honest, if you have both installed, then you probably want to use
>> podman because most likely "docker" is just an alias for podman...
> 
> That is probably a false assertion you are making above: podman
> impersonating docker is an additional package, at least in Fedora.
> And indeed, I have both podman and docker installed, and docker is
> definitely not podman.

  Hm, perhaps I should do the same as you and install both... CI uses docker, I 
use podman, and sometimes they don't behave the same (because docker runs as 
root). In the beginning my muscle memory was still sometimes accidentally typing 
"docker ..." but now I do the right thing anyway.


>>> Allow the user to force the one to use, by setting the BR2_DOCKER
>>> environment variable. If that is set and does not exist, exit with
>>> an explicit error message (rather than rely on the failure when
>>> eventually exec-ing the specified command).
>>
>>   Unfortunately, in commit 8aad67f1575f1d8a9c90ccd70302e9a6823cf794,
>> _someone_ already introduced the BR2_DOCKER environment variable in brmake
>> to tell it to run 'make' inside the container... Its use is not
>> incompatible, but it means that if you set BR2_DOCKER=podman in your
>> .profile, brmake will _always_ run in the container...
> 
> Meh. Use of unbuffer was one of the stupidest things I did. Indeed, when
> using brmake, one is not very concerned about seeing logs as soon as
> they are emitted, so one can very well accept that the '>>>' messages
> be slightly delayed. After all, they are only bufferred for so much (8K
> in glibc, that goes by relatively fast with all the output of a clasical
> build...)
> 
> I think it would have been much more elegant to actually allow use of
> "./utils/docker-run ./utils/brmake", as this is a construct that is
> already advertised to run our checks, "docker-run make check-package",
> or even just basically "./utils/docker-run make"...
> 
> I would wager that "BR2_DOCKER=y ./utils/brmake" is not in wide use.
> Would that be acceptable to revert 8aad67f1575f1 and drop use of
> unbuffer? I've just checked, and that works (but of course, any
> still-bufferred output could get lost on Ctrl-C, but that's probably
> a non-issue while using brmake...)

  Indeed, this feature was only introduced in 2024.11 (and very late in the 
cycle), and it wasn't documented other than in utils/readme.txt, so I think it's 
OK to drop it.

  Myself, I anyway always have to look up the exact wording of the environment 
variable, so I wouldn't miss it!

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
