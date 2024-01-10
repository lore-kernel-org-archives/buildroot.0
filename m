Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0626EC4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 18:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91EB440482;
	Wed, 10 Jan 2024 18:16:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91EB440482
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UEAv8UE1sz0g; Wed, 10 Jan 2024 18:16:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B0A4435D5;
	Wed, 10 Jan 2024 18:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B0A4435D5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3B2551BF85D
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 18:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13FB28348C
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 18:16:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13FB28348C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mUPQR_tMY0Ql for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 18:16:42 +0000 (UTC)
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F17C83396
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 18:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F17C83396
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7bef44df5c6so30103039f.0
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 10:16:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704910601; x=1705515401;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lo1VQ4EJOV7cREJOABitf1hSk8b65EfBHPgIFVrB/OQ=;
 b=V250t8F1wUybUL27tcr9EMDDgFvDOPAkgW2MUBnQJtXSNsgGS5AQR7ZbkjM3vyDLF/
 fk1l0/yT5DkadFlpCCYx0zpZwlRoK+Oz/xcl4CAn0BoA7HDJouVQM8qdrxHv+apCYD4r
 2b8WkbknfHMNu61iXEnjC94TxfBSd7ylMUMYOr7Vhi2bcuGvxADqYNgNWLe9h1Ug75TN
 9qD1tpOGQdAYQLA1rUssNzmr28UGn9EuiiTtpen82a3PqA+w7gBfYYDn8nqrXlhPOzQR
 EYRpRmbjqxNmTJhayQ7YoVRQ3dVhCavXjBzP/JSCkGvXfnp5ONX+G2bPBuX+RD7cjCVA
 /RCg==
X-Gm-Message-State: AOJu0YySG+mnEjhyBhP7aip4V8rO4dzcUNstgtpP7npeYo4k6yxaKEId
 PlXkv5EUpSXYHr0P8k6lsxWd0l0HZlRy7Q==
X-Google-Smtp-Source: AGHT+IE4EzhYPa/LzL9jotCAfZZS/ofuHIbVxibF33Hm19VsMiO5K5RqGzW8lAvCC04sDZHn23tGgw==
X-Received: by 2002:a05:6e02:1c0e:b0:35d:4463:5dd2 with SMTP id
 l14-20020a056e021c0e00b0035d44635dd2mr375930ilh.16.1704910601268; 
 Wed, 10 Jan 2024 10:16:41 -0800 (PST)
Received: from [172.16.32.83] ([198.232.126.202])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a02c9d5000000b0046b4a8df4f1sm1423121jap.75.2024.01.10.10.16.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 10:16:40 -0800 (PST)
Message-ID: <c065bbb0-e5cb-04ae-cedc-258264162405@landley.net>
Date: Wed, 10 Jan 2024 12:23:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Petr Vorel <pvorel@suse.cz>
References: <20240103015240.1065284-1-pvorel@suse.cz>
 <CAMuHMdXGwyS-CL0vLdUP4Z4YEYhmcmDyC3YdGCnS=jFkqASqvw@mail.gmail.com>
 <20240103114957.GD1073466@pevik>
 <CAMuHMdX0s0gLRoPtjJmDnSmZ_MNY590dN+JxM1HKAL1g_bjX+w@mail.gmail.com>
 <ZZVOhlGPg5KRyS-F@yuki> <5a1f1ff3-8a61-67cf-59a9-ce498738d912@landley.net>
 <20240105131135.GA1484621@pevik>
 <90c1ddc1-c608-30fc-d5aa-fdf63c90d055@landley.net>
 <20240108090338.GA1552643@pevik>
 <a3d7f5ae-56c6-9cd8-2cda-2d50d12be9c4@landley.net>
 <20240110133358.GB1698252@pevik>
From: Rob Landley <rob@landley.net>
In-Reply-To: <20240110133358.GB1698252@pevik>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20230601.gappssmtp.com; s=20230601; t=1704910601; x=1705515401;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lo1VQ4EJOV7cREJOABitf1hSk8b65EfBHPgIFVrB/OQ=;
 b=IW1kIuPUO1Arsu4Mthcm9sLKUg7u1c+KUioxPrl4ofWpD5PSnGiHSoc61FOKAjir28
 Vp6CVl2GnwtHDm1lolCcnYjYEZXkt2aLzjnBAkTUZQe1zN601Wi7sNP38F00lGYKHZ+V
 g/cdUmpQUpPDLJo7/QUSzqlHsJ+GfudOOv4yMh8oh5JaAil9BaS+LmoiEGwA+Zpa+W9u
 2tIm6eozPhasDY/gXyCYImQJN9KlIaTzgJ3rmYHRKyJMsFIe6HZhLrTtqs9IEqmK4U6O
 xrtxduizNJeZO26PgsoUo+5X+VEvDEDOlcApJcm2aSYWDveDF0ylMz1ReL3ChyrxmH0d
 O/og==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=landley-net.20230601.gappssmtp.com
 header.i=@landley-net.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=IW1kIuPU
Subject: Re: [Buildroot] Call for nommu LTP maintainer [was: Re: [PATCH
 00/36] Remove UCLINUX from LTP]
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Andrea Cervesato <andrea.cervesato@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Christophe Lyon <christophe.lyon@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Li Wang <liwang@redhat.com>, linux-m68k@lists.linux-m68k.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Cyril Hrubis <chrubis@suse.cz>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-riscv <linux-riscv@lists.infradead.org>, buildroot@buildroot.org,
 Greg Ungerer <gerg@linux-m68k.org>, ltp@lists.linux.it,
 automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 1/10/24 07:33, Petr Vorel wrote:
>> I'm a bit weird in that I try to get CURRENT stuff to work on nommu, and a lot
>> of people have been happy to consume my work, but getting any of them to post
>> directly to linux-kernel is like pulling teeth.
> 
> Interesting, thanks for sharing this. BTW I'm not saying anybody is using nommu,
> but I wonder if anybody really test it with LTP. And if yes, I wonder why we
> don't have reports about tests broken in new API.

I don't expect a lot of nommu users are aware you ever _could_ run LTP on nommu.

But I'd like to get nommu more regularly supported. You _should_ be able to
build a musl-linux userspace with busybox or toybox and be able to build a
recognizable system (even an alpine-alike) which could then get the basic
plumbing regression tested on qemu even without access to nommu hardware.

>> > But as I said, if anybody from nommu decides to maintain it in LTP, I'll try to
>> > support him in my free time (review patches, give advices). And if nobody
>> > stands, this patchset which removes the support in the old API will be merged
>> > after next LTP release (in the end of January).
> 
>> What does the API migration do? Is there a page on it ala OABI vs EABI in arm or
>> something?
> 
> New C API is documented at our wiki: the API for using in the tests [1]
> and the library itself [2]. (We also have shell API, but we can ignore it for
> nommu.)

I'm writing a bash-compatible shell, which (thanks to Elliott forwarding
questions) has involved surprisingly long threads with the bash maintainer about
weird corner cases neither the man page nor my testing made clear:

http://lists.landley.net/pipermail/toybox-landley.net/2023-July/029631.html

(Alas I try NOT to involve him because when I bring stuff up he keeps FIXING
BASH which from my point of view just makes it a moving target...)

Anyway, running the shell API on nommu doesn't seem out of the question, but
probably not any time soon. (The fact the shell isn't finished yet is one of the
big REASONS I haven't got enough time to take on LTP. That and I haven't started
writing "awk" and "make" yet". And I need to cycle back to
https://landley.net/notes-2023.html#12-10-2023 . And after that debian, ala
https://peertube.debian.social/w/chzkKrMvEczG7qQyjbMKPr and
https://peertube.debian.social/w/45XroN9CnbYLNLKQH3GD9F . And follow up on
https://lists.gnu.org/archive/html/coreutils/2023-08/msg00009.html . And...)

> All files in lib/ directory which include tst_test.h are part of new C API. Main
> file is lib/tst_test.c.

safe_fork(), safe_clone(), fork_testrun()...

> LTP tests, which has been rewritten to new API include
> tst_test.h, they are in testcases/ directory. Library has it's own tests (for
> testing regression in in lib/newlib_tests/*.c.

Library meaning... libc? Or does LTP have a library?

> The reason why Cyril wrote in 2016 new C API was that the old API was buggy
> (tests randomly fails). Tests which are still using the old API (there is
> ongoing rewrite) include test.h. The old API is not much documented.
> 
> Feel free to ask any more question.

My standard questions are "what does success look like" and "how do I reproduce
the problem".

For the first: if there previously was nommu support in LTP, what's the last
version that's known to work? Is there an existing build/test setup that can be
reproduced?

For the second... If I try to run LTP on sh2eb (my current nommu test board)
with the current LTP... do I get a build break? Additional test failures at
runtime? You talk about "removing nommu support", but... what's the current
status? (A subset of tests still use the old api...?)

Yes I need to read https://github.com/linux-test-project/ltp/wiki/C-Test-API but
I also need to know how to build LTP from source. I'm looking at the README's
list of "autoconf, automake, m4, pkgconf / pkg-config" and wincing
significantly. (What does gnu/autoconf DO here? Disable tests? I never
understand why anybody uses that giant hairball of complexity. Half of cross
compiling is figuring out how to lie to autoconf, and my normal workaround for
that is to bootstrap a target system and build natively, but while I've gotten
gcc to run natively on nommu systems, I never _tried_ gnu/autoconf.
Bootstrapping some subset of LFS on a nommu system so it has the dependencies
LFS needs to natively build seems like the long way 'round...

(I am not the right guy for "make it work the easy way". I am the guy who will
step on every land mine between here and there. I code by debugging an empty
screen. If I don't start from "known working" setup... it would take a while.)

Rob
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
