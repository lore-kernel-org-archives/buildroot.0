Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F186CC636CB
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 22:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C99540583;
	Sat, 28 Jan 2023 22:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C99540583
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QPQquyNbQF2I; Sat, 28 Jan 2023 22:36:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5BD3404B9;
	Sat, 28 Jan 2023 22:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5BD3404B9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C0C8F1BF44C
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 22:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8DCF408AF
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 22:36:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8DCF408AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WCgoBhaR2zTL for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 22:36:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2F7940498
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E2F7940498
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 22:36:20 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id y11so7765815edd.6
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 14:36:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dXShYrkqx+RYyeK4v2ivYHP03RlonApQ3RBAIynXd/I=;
 b=GFQxhO5+ue/qa+mTR1mdj4mwNohX322RgzH3TyigP1xQJWy9rjiqs/c4fDZeCVyx9/
 iqC15MWhcIBBmXl42IpqxVmrnVBo8hUUDfQOkUv+WeSWmfSIIIBCHgwmPzSFNi5s3ZyV
 6m1CiEEzNFYTm+RTkgKTJJTJK7T52ZNuaCWbtcpkiGRHkV/6AXncXSWIBcU4/Gd+iW9V
 X9Y8C5C/dBTfu3f4Q3M2uIfyh/XbhHLHBxJ5E/5U12WlfW0cBL62qWsTZHMs9/WqpuaN
 +RT6m77oImiFPvZ1RxZRHFn9qUqaHpbPQM9hZnSKJ2mCO9qnSUCjhZDwgLkXkb6HUSYc
 jVEA==
X-Gm-Message-State: AO0yUKVT7g1LZp06HH+UCfQCU0yZtcu+4qR0GXrZR8XBD35HIW0FcUkj
 3yBYbTy6H0DC/7SACh4v6RasDXv7ebXj+8UhFVE=
X-Google-Smtp-Source: AK7set8o2KFghEWzf5zkriLy5uNaCLuCmlb1rug/cYujEXuDZ0K29u29qDxjMK+9Qa0ObMTw3FTPIPrvNe5WecEEi3w=
X-Received: by 2002:aa7:cd85:0:b0:4a2:ea2:4f38 with SMTP id
 x5-20020aa7cd85000000b004a20ea24f38mr1730966edv.20.1674945379102; Sat, 28 Jan
 2023 14:36:19 -0800 (PST)
MIME-Version: 1.0
References: <20230127223256.132401-1-pevik@seznam.cz>
 <20230128225543.16657dc4@windsurf>
In-Reply-To: <20230128225543.16657dc4@windsurf>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Sat, 28 Jan 2023 23:36:07 +0100
Message-ID: <CAB1t1CzS__mCJcEwQXV=SrLE9aaq_z8heOfygx6u6G620UynBg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dXShYrkqx+RYyeK4v2ivYHP03RlonApQ3RBAIynXd/I=;
 b=pqRTCsXRwJd9ff779EJkqlpUUa7kM90Qa6WRrt1gIIvL4rLQnk5JBO4xbj8I/HPJqu
 MUU6Mqp5ySWXNpUxj0xijCDlc8KgSlt4aYoyIV0PpKciGMKlPZNNxNEIvB/lYm57plTZ
 I8RNQxUFYynLBHLThliwYjuKZbw50XW2hTFnbdAvxi25h04ge4jBdpV8L6v229lPzMkp
 wGibm/mpZF+TGDPUwVbnY/Lb8Tu+Cq1Ag1kj2zMKngygIMyI2eRhCCUZ6ZPJP9DIqMOD
 VSKWwF866Jx/XQqj5Y/CtmbtZf/Mnp4NzJzBRAQ7VkxjvlCrqeew6A0zrjv+/HdVrnX/
 9IHw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pqRTCsXR
Subject: Re: [Buildroot] [PATCH 1/1] package/ltp-testsuite: bump version to
 20230127
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
Cc: Petr Vorel <pevik@seznam.cz>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

> > Remove musl related sysinfo.h patch. This Buildroot specific workaround
> > is not needed any more (kernel got fixed in a85cbe6159ff ("uapi: move
> > constants from <linux/kernel.h> to <linux/const.h>") in v5.11, some time
> > took to rebuilt Buildroot toolchains, but even that was more than year
> > ago).
>
> Sorry, but this explanation is not entirely clear to me. Do you mean
> that only toolchains with kernel headers >= 5.11 will no longer have
> the problem? We definitely need to support toolchains that have kernel
> headers < 5.11.
Yes, IMHO musl toolchains hat have kernel headers < 5.11 should not be
able to compile
LTP without this custom patch. But I tested building LTP with
utils/test-pkg both the default
6 toolchains + the others added via -a and everything worked. Do you
use some other toolchains
with older headers? Couldn't you backport a85cbe6159ff to it? I'd
prefer not having to
carry this patch forever, but sure I'll do continue if proven it's needed.

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
