Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF108C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 09:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83C5F80A8E;
	Tue, 16 Jul 2024 09:10:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xK650vEUPNQx; Tue, 16 Jul 2024 09:10:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89F3980531
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89F3980531;
	Tue, 16 Jul 2024 09:10:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F4871BF870
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 09:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B4A24021F
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 09:10:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z4pQgG7AqEaX for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 09:10:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 253EC40205
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 253EC40205
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 253EC40205
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 09:10:09 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a7523f0870cso563039966b.3
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 02:10:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721121008; x=1721725808;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=elY3mW1r/iuh1nS/AwkiuDJBJ5R3xoTffeEK4Ua/LME=;
 b=AUyHJWuVtlxpHExzYfR0toZ7L4Vd693l3zeskJKZCQHn4i6x33EV62eUaJ2qIOcsA8
 CrIxBdMv6e4HMCvpz9HdetPYflS66r2joKBKZopdedixRHxbh+ZfotHA/Sz4CVHyyJ2W
 1dAY60qqPMvP3uzNZwRmdWAswXRX8E0N6cJSLWsOzyOfqTYCuvIGeDU18MN06yoLMktt
 6TNploWp/xiVhAHCqNSQAalE9gTpAi/q9yB4ZwlNvX8aLNY5fMAKZPHepbi9yHTaI85X
 70HyR5We9BLJI5gT02OEX/A3mjP2/+OJ1Z55jn6qo+a+xq/k3aQZojLeylsg2RDYoe96
 qlfw==
X-Gm-Message-State: AOJu0YyQ7+3MguO+n63tMq4R69UyYvI7waYoJXbNqAsnPltSD/7GmiYV
 mxOsqL2bIK9n1NImKBrPhUKK8RBspRFMVpZaLkUPR08poY2Zpb9jNUbaxQBU
X-Google-Smtp-Source: AGHT+IH3y/paYwE1JaKDl2Z4K0o4ocCcPQ8kw6qV7PWYJ70stkg8zXlpkDDkMlUriMNMT06ikt9Y7g==
X-Received: by 2002:a17:906:fb07:b0:a77:e2b2:8ec with SMTP id
 a640c23a62f3a-a79ea3e8ea2mr93494866b.3.1721121007738; 
 Tue, 16 Jul 2024 02:10:07 -0700 (PDT)
Received: from gimli.local (h-79-136-22-50.NA.cust.bahnhof.se. [79.136.22.50])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc5a38d9sm285188466b.25.2024.07.16.02.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 02:10:07 -0700 (PDT)
Message-ID: <cb3adec204d2306b78347de3d5e5b9185103fc1c.camel@gmail.com>
From: Joachim Wiberg <troglobit@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Peter Korsgaard
 <peter@korsgaard.com>
Date: Tue, 16 Jul 2024 11:10:06 +0200
In-Reply-To: <20240710231351.32389974@windsurf>
References: <20240709202438.27298-1-heiko.thiery@gmail.com>
 <20240710231351.32389974@windsurf>
Organization: Addiva Elektronik
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721121008; x=1721725808; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=elY3mW1r/iuh1nS/AwkiuDJBJ5R3xoTffeEK4Ua/LME=;
 b=m0o+NSRpEsWvPLz2c9QyP835XT2kiKEsjcuDQManEf5r984E+LvJvM+KIGJgJhF2PL
 DvNCa6wBAB9GOowQP3wFFn9n8HMm3VYYkdd62D/JwCApzO4Z65MI4BZfG/et5rtQlnLY
 2Iv1hKe0sI5e4+FYzJ2NBazJ50g55M5VSBr1KvKlRH54DZVDAOcD69zhlBs6GIXm4n7C
 1VhoJJ7a7172vwqdrbfT4n5//xe3e9JTslKcsFGn5jxF4ixI88e5v5aqD/jcnGmQ85kh
 FbQ4Kr7Tog/fnsBg4lsG7RxP1SvbwzlVjA39gvfmdOOR1ZdoyuGY8kWIM5Vp3iuNf1aG
 m8lw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=m0o+NSRp
Subject: Re: [Buildroot] [PATCH] package/libssh: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

just a friendly reminder.  Maybe my initial reply got lost in all the
noise and summer vacation.

On 2024-07-10 at 23:13 +0200, Thomas Petazzoni wrote:
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
> > This fixes link time errors, undefined references to various
> > ENGINE_* functions in case libopenssl backend is used.
> Applied to master, after adding a reference to the autobuilder build
> failure. Thanks!

We have the same issue also on 2024.02.x, as of 2024.02.4 builds with
libssh break unless you update your defconfig.  So it would be great if
62103be918e7a155749b1b3b680a9e4ecba6af87 could be cherry picked for the
next LTS patch release.

Best regards
 /Joachim

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
