Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9177AC43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA57860F27;
	Fri, 26 Jun 2026 14:11:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gA5yH5Kv1WGJ; Fri, 26 Jun 2026 14:11:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1382460F25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782483103;
	bh=zuBQqJWwrdIimd0vyDL/17G+YFp5ARJXQymx5p9axWg=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=PkiQjvt/YW2hJm5uIFpBUEAisH+JXPYxnD4bvDYrE2A/vho4quiDflnzfb3xFqzsI
	 Dz2Oa+dibNTEUFs2m+42xTttgas39UK+gNAd3fQ9AwhhnOsjJCugzyumzwXbKbFpsB
	 yGq6XIVYq1gH5NyRXHsRTfzM0efVlUTV5zcHHKF6gVrOA2CuHj7a4H3AJR0iGqzeDo
	 XhWANCpt6dOZIOX5sG4R0Z6yffBKdPFkueyBri88x7GWJlsPwRT0hQCrq1LrJSwquU
	 RX+UlwfUieg3QvzjEhy06XOjn1FJGDzrVHQSpeu5dca2bdIymgnNDJvkARzF15AVZm
	 4p2kZs91zO4lQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1382460F25;
	Fri, 26 Jun 2026 14:11:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FD8F231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4621B80E4D
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:11:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S2YEX8tBf7-5 for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:11:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 53E9B80E19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53E9B80E19
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 53E9B80E19
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:11:39 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-4629051c946so674549f8f.1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782483098; x=1783087898;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9jZ++0hiwNxZ1MqGOc8ed6F79yqcETICwl/K/w9i4mI=;
 b=nZAQvnGEeHr9xVEjqmwFj9vqsoXm0sBMG7LYr/U2uBTctur1RxsvcIfuW/6bqmsnaS
 lTsCuiP2BZKsevNcDAeUMhrsqoP18hj/Stv6Q38PD/ukbYv9N9NLGoKZ1TUmHtqDMt3m
 n9THapJu4zBB5vCuIja0SveJA1jzAZHnv586FShap5gjYq+INbhfU4PoIreJlu6jvyaL
 XMnEUQ3gmar90Dwm6NiDLdtJoavkH30RqMLI8ORLzaVzH3d+egNQQu2GqKYsVWH5CbK0
 KUQoXeyT82zm776Hi9nlcljqLPIpWmXMnr3Jq3Xapvn7FkTqoj75ES0yup/awwZb129r
 zefg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpf5JH9S/4k25aCXVFyWi3IQS7M4+bQhuJsKREU2h967txg72Uoc+Za8FW6uVd5uF06KGuQOyxQAh4=@buildroot.org
X-Gm-Message-State: AOJu0YwQ6szwpWqsJVaNQLpbexLg+4hW1WXGwmuZvH0ee+ZU4D0m34gH
 GJsMWXOaID9X5oU3c5kBUrw/vCZvT7Ruc5wLai7Gb96JEzhmW7B7+cT8jMeyGN4u9B0=
X-Gm-Gg: AfdE7ckaykgAfI+4L2U6ODhpfxZQBJLjjLwIXjkSfhPuSDZb1bhHTsO5zXvzXBvX6qV
 YY8bIFi1jzewkitXj/OpYO/l54IDOt2LbkoGe/cdo2JT8apIWzsl12PEX6TSJjlaIn6DoIBzBJL
 ZXR8eu1/30SQ23TtCzNLg7wkebz51naFyNzfglJN7ebRF/+4Fd4kilwqON59MKhh7fvZlY4DW7E
 N+hISs0pU4Nvn50iV5EEiazYIkltl+ET4p0xJVDkENz3McGXn6wn+BE6gNDiIEcguwOLP95U2M6
 2Rnfw9mnh1u7nf6lqHnwXSvTzXwIxYYgvuzTh3N9904RZxtQikRB8N2Kh4u9WJsrnPbHdvgjwET
 IM8Nf6tZ6jCaNqkJAD1k5EyzQUi8VvIeYCjSq6hWu3JdwH24UdP06K8SpxOFiMreAmrGX+qeeC4
 tiRHYx11C2VuUkg9vIueJnnbA5tBxevlmEZcEytVa7nlvTXnCf9UX5CFOc5b4Xo6lL7Js59v1NV
 80sL+E=
X-Received: by 2002:a05:6000:993:b0:43d:7606:5a47 with SMTP id
 ffacd0b85a97d-46da706dc66mr11372586f8f.2.1782483098055; 
 Fri, 26 Jun 2026 07:11:38 -0700 (PDT)
Received: from [10.5.90.81]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c1b754471sm24476238f8f.0.2026.06.26.07.11.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jun 2026 07:11:37 -0700 (PDT)
Message-ID: <f3d370e6-5cb6-4f54-99ac-883afa561379@smile.fr>
Date: Fri, 26 Jun 2026 16:11:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: chakrabortyshubham66@gmail.com, buildroot@buildroot.org
References: <20260430121520.2565804-1-chakrabortyshubham66@gmail.com>
Content-Language: en-US
In-Reply-To: <20260430121520.2565804-1-chakrabortyshubham66@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1782483098; x=1783087898; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9jZ++0hiwNxZ1MqGOc8ed6F79yqcETICwl/K/w9i4mI=;
 b=VnACSLXf0gdeiANiEJ57tR1wkYjjsjn7wupjqOhRDI44LQayJcYFrhoj13ER54maNZ
 uXJuQe84hZkOH8844QS2Q7j4ZqZG3rt80wCoy+zgi6DGyeANVjNqXReAJ5so4wQNn02K
 w7PUmBWXiOvjXch+bm5tevjn6HsmhB6LAKt34=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=VnACSLXf
Subject: Re: [Buildroot] [PATCH] package/bash: bump to version 5.3
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
From: dowan gullient via buildroot <buildroot@buildroot.org>
Reply-To: dowan gullient <dowan.gullient@smile.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Shubham Chakraborty, thanks for your patch.

> +Upstream: N/A
I think that marking these patches as "Upstream: N/A" might not be the 
best. Since these patches fix legitimate build failures in the Bash 
source code, they are relevant to the upstream maintainers. It might be 
better to also submit them to the bug-bash mailing list and provide a 
link to the archive, similar to what was done for patch 0002.

If you think these patches are Buildroot-specific, or will not be merged 
soon to the Bash project, then I have nothing more to say, this patch 
seems ready to be merged for me .


Best regards,
Gullient Dowan.
Assisted by Buildroot Review Assistant (used openrouter).

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
