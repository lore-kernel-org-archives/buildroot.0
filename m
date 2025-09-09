Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D677CA0FED
	for <buildroot@archiver.kernel.org>; Tue,  9 Sep 2025 05:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28B8240BEA;
	Tue,  9 Sep 2025 05:08:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OC8i_j6ROfP6; Tue,  9 Sep 2025 05:08:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4185D40D47
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4185D40D47;
	Tue,  9 Sep 2025 05:08:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D7D011D9
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 05:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE0D7407ED
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 05:08:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vqI1zpyAM-ZX for <buildroot@buildroot.org>;
 Tue,  9 Sep 2025 05:08:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b129; helo=mail-yx1-xb129.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D632D407D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D632D407D9
Received: from mail-yx1-xb129.google.com (mail-yx1-xb129.google.com
 [IPv6:2607:f8b0:4864:20::b129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D632D407D9
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 05:08:46 +0000 (UTC)
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-6032c696bd6so952398d50.1
 for <buildroot@buildroot.org>; Mon, 08 Sep 2025 22:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757394525; x=1757999325;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8v83NhoMV3/Set65PIGiCZnF+wEhzRaTeeF1y4TM/iY=;
 b=CZVPqQBIPDL68g/6fZXNvBL1ndaLFLbtwC/p8W2Oft0QhRxHvNg0xRy2JbVi71MiaV
 naSh2eO7O95UDbkbg3Oe7eJulhCS336VCvBgya8AU66RzbgVFf2auTphRgqfexzX7wP4
 hFbDIcFLnN2/yqAdBwaLX2oeCPxq580JkMfY2DTq5IgOfQg8XJYXvKKir00sU1J/Nd/G
 wjU4Gu0Rk1nHtNlqdVUOvMKLZMXvzX+Lf39X3/9j7Xax0ifsYxvzvcwExchlDXtXybJY
 A8ARdTfeMNFB5C64Duvfvsur7Zf8lapQzSznVEv2SlDZjEECUvxKNmuQ2Vwk2idvBLM0
 OKvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcBReL2vlm1izNoxTAxTwHkBHjYNM1QpV85eUFP0+BM5BWrJu4Kzozbv+jLFS27GgiuHOA0RATkdI=@buildroot.org
X-Gm-Message-State: AOJu0Ywiaz0j9cDoYO9IzROANs5/CnTRl1fhmgBsghfXbI3Ty3SX4Heq
 VrvMLDBGcQfZniP0styw7q0HQF2zMb05M1LXKJFt+v9XT5e3ulbRMuvjJFV4bdU8axeM/lfk2WJ
 VHXaqedyHOBTI33iulWyYlcyUuXgO/2s=
X-Gm-Gg: ASbGncvfKotzmLLYm0IKkH9Xa5GgAsjVcHLMJB5TTD4oNZeRda4j8yZrajHfo+0ONrh
 ACx2e7qyEfGWwooj98qSgdDP9KNObYfppJJttQ6Yw+fGrDRfKvjXfSGtWUUn5TgH9pOSN2hkCJw
 RNjTGQO2021NarBUm3X38q+50bPrTZgxE7sW05y8v2Bf4LknvSGJDsDSt5eA5k9gz8XZz6tIrcU
 H2//hxiLg/fBXO0eA==
X-Google-Smtp-Source: AGHT+IHkUFM3tIDPd+HCHUsiQaSV2Uumae9Nz9ns0Y9dI67zYpHeBh+7GAWmWM5/jnTI8MgQRVzuAyjRsDPU3DiDOWk=
X-Received: by 2002:a05:690e:250d:10b0:5fb:78c2:b71f with SMTP id
 956f58d0204a3-61032fe7a13mr8005880d50.18.1757394525330; Mon, 08 Sep 2025
 22:08:45 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XddfiKcS_-pYwG5b7i8pwh7ea-QDA=fwZgkP245Ad9ECQ@mail.gmail.com>
 <20250904-11ba6fa251f914016170c0e4@orel>
In-Reply-To: <20250904-11ba6fa251f914016170c0e4@orel>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 9 Sep 2025 14:38:34 +0930
X-Gm-Features: AS18NWD7IqIrRLFAZ974tA0j1eH-dJLYx1GRysFMdqkPB52xRhZMNwMvKB_OEak
Message-ID: <CACPK8XcV_zCy7sVeSg+muCQ89ZxuhPPXJPMztSisi_oHgMK_Sw@mail.gmail.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvm-riscv@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, 
 Buildroot Mailing List <buildroot@buildroot.org>, kvm@vger.kernel.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1757394525; x=1757999325; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8v83NhoMV3/Set65PIGiCZnF+wEhzRaTeeF1y4TM/iY=;
 b=FWVpK1XM/kipF8yp9Yg8RVaVWRnRNHv8OPho8F36GI0aLZJM2PS65N830VZc9gsHUw
 lrsBOnFpyZyfQIfLDAJ2PQXkcj11bhbLWC9eqodstHJVBNy0RgPptr47PUGTGqzSFHU9
 OZEro1K+YfTz4Es0K55xUHn3gjj7gQPo+FMTs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jms.id.au
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=FWVpK1XM
Subject: Re: [Buildroot] [kvm-unit-tests] riscv build failure
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 5 Sept 2025 at 07:54, Andrew Jones <andrew.jones@linux.dev> wrote:

> I applied similar steps but couldn't reproduce this. It also looks like we
> have a dependency because configuring with '--cc=/path/to/mygcc', where
> mygcc is
>
>    #!/bin/bash
>    for x in $@; do
>        if [[ $x =~ sbi-asm ]] && ! [[ $x =~ sbi-asm-offsets ]]; then
>            sleep 5
>            break
>        fi
>    done
>    /path/to/riscv64-linux-gnu-gcc $@
>
> stalls the build 5 seconds when compiling sbi-asm.S but doesn't reproduce
> the issue. That said, running make with -d shows that riscv/sbi-asm.o is
> an implicit prerequisite, although so are other files. I'm using
> GNU Make 4.4.1. Which version are you using?

As Nick discovered, it was the older version of make that was causing
the issue. Thanks to you both for sorting it out! I'll send the patch
along to buildroot.

> Also, while the steps above shouldn't cause problems, they are a bit odd
>  * '--endian' only applies to ppc64
>  * -j385 is quite large and specific. Typicall -j$(nproc) is recommended.

This is a curious number. I went digging, it seems buildroot does a $nproc+1:

PARALLEL_JOBS := $(shell echo \
        $$((1 + `getconf _NPROCESSORS_ONLN 2>/dev/null || echo 1`)))

Knowing how these things go I'm sure there is some reason they do this
instead of calling nproc.

Less counting perhaps? getconf ends up reading sysfs:

openat(AT_FDCWD, "/sys/devices/system/cpu/online", O_RDONLY|O_CLOEXEC) = 3
read(3, "0-383\n", 1024)                = 6

Whereas nproc calls sched_getaffinity, and then depending on how new
the glibc is will loop over all the CPUs to get a count:

sched_getaffinity(0, 128, [0 ... 383]) = 48

coreutils has this to say:

  /* On systems with a modern affinity mask system call, we have
         sysconf (_SC_NPROCESSORS_CONF)
            >= sysconf (_SC_NPROCESSORS_ONLN)
               >= num_processors_via_affinity_mask ()
     The first number is the number of CPUs configured in the system.
     The second number is the number of CPUs available to the scheduler.
     The third number is the number of CPUs available to the current process.

     Note! On Linux systems with glibc, the first and second number come from
     the /sys and /proc file systems (see
     glibc/sysdeps/unix/sysv/linux/getsysstats.c).
     In some situations these file systems are not mounted, and the sysconf call
     returns 1 or 2 (<https://sourceware.org/bugzilla/show_bug.cgi?id=21542>),
     which does not reflect the reality.  */

Anyway. That's how we arrived at 385!

Cheers,

Joel
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
