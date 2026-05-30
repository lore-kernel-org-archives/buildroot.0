Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85FBCD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 20:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7525B84D28;
	Sat, 30 May 2026 20:05:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fr5h8giEinJt; Sat, 30 May 2026 20:05:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99135852D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780171528;
	bh=B3OO1C0Yly4UzDNhDZZaWUumlr0d3mu9/2780b23miY=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=n3+FDU0EnW4iatc6wb/pohWZbvL3HuIy7P500ndUanMXPzdjmzlpXCZIdLRa1tbGX
	 lx2tABBzUTxkNpY1cpDQLEnxZpMKLF2A3Hsd5yiRpSkGHIMvFiZoSZsTqE9Bkeprd4
	 vH0gy7J4tiGizMas2BI9/+V/41VBjfUuGZKjl1UoZcPo2WVl/wIQN7zZyxAEMyIRb1
	 mkDLhC69SdvCpNaJb7/WYMOuCfYz/uUhUS3urt+9mVcGpSnVNYJY2ksVBN0Z7390pc
	 5f3DA2AoVS70KZKBjnTPbbuK0pE84uevJ/DCj1YSv5SA0x1deYyPMsyxwDv0PoChZN
	 Atg5t7vBWSwPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99135852D1;
	Sat, 30 May 2026 20:05:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FB7BD3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 109B2852D1
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:05:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b3fkHJPmDV0x for <buildroot@buildroot.org>;
 Sat, 30 May 2026 20:05:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E93ED84D28
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E93ED84D28
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E93ED84D28
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:05:25 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4904fd4f6aeso73323465e9.2
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:05:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780171523; x=1780776323;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VY82/nwyGl9VGgGeCwy/BCiI1xExwWWuqmzi85vrJQ8=;
 b=n32GQNVCEqzsk8rLdfpv7DpiBpaZoC/TkydBPIZgZ83CVP3EKmq/vZD2teUA+FSJlU
 br0RiJ7eEGZYGyHKpgHzGB03tJMx6Rir1VEWHa5B34Gqf2mh2Z/1I0QYHrxy4pfM0Rgs
 4eBWjS9sT5dOBbBWiImBGXFUAIlEhiGFR8xAwJMSwFpKnIiGBXBcbve+i56+8TdBZtxS
 2XI945QbrB9pzbhygbqwTrjG6EmGZf/7wjgnv9KjEobmLvxBfIlzyVmZdv8hkaX2cePa
 54uB1lHPFyvaZe/DiS+2JncHjj0dMRi8bM5a/pAvJW1ifM4QBUXwfq0PpUvVvIY5cWUS
 q7/g==
X-Gm-Message-State: AOJu0YyANckso7zS1+3fQis2aB1MVbwvhUrBjshcPrWRVymjipZ3QWNK
 HdEUzI+2bYdnmgs2c/KqvpHSWz64HBGTgETW1xph4SvlZ/VI5KWJGCXJ
X-Gm-Gg: Acq92OFTh4uIu0hG7LOplDDDj2ezj8f6/ZgT0NTS9nYwNyqyaPMS1WcbrbbyzBhvLI2
 pTUlcir5E8zkn7oZVCg28ThlaydFTbeLDbPmwT1Dnc5NQpYs5AkPAdWO2DEp5Qa/PdEIAa2pMuW
 ErpnsaA8IFDPSP4EUHUvIbxatuUEk9z81hfPdigR8Oc397KzpdzmyHMJcgH/Clc67omRMAfvzk1
 DzVgUnAWOqq4x8/9JTyzfGwzgNNJkuBcqASMu6v89M9FIMGcnd5vr69feF+HQ3JX4yHtOCZ7GBE
 NKV4eLchmrsVNY4RstCL2ahrCb38e2M/K6E3Qypye2tPnBPeqoHNU/u6Rr18b32Y1QoAXN7X2jd
 ySiDBygvRGRihPZs4tSBZ6LfukuhafGP/CXkuO4Xnv1FRWBkbNmor4z2kFSJSTSDhMBILseGYMj
 lEQ6sQshh/AdE5BHeew+oFZfdLb6HtNX5gV5xImc4w5LgLScc4xu4SgNaltsLC9/d4DEAlXL2gq
 YpOOQ==
X-Received: by 2002:a05:600c:3b08:b0:490:601f:d788 with SMTP id
 5b1f17b1804b1-490a29e422cmr83560485e9.5.1780171523393; 
 Sat, 30 May 2026 13:05:23 -0700 (PDT)
Received: from pevik (94-40-87-20.alarmadi.pl. [94.40.87.20])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d68980csm146537155e9.1.2026.05.30.13.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 13:05:22 -0700 (PDT)
Date: Sat, 30 May 2026 22:05:20 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Message-ID: <20260530200520.GA447279@pevik>
References: <20260530143523.438058-1-petr.vorel@gmail.com>
 <1151af2a7192b4aff21a37b51c2b5592@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1151af2a7192b4aff21a37b51c2b5592@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780171523; x=1780776323; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VY82/nwyGl9VGgGeCwy/BCiI1xExwWWuqmzi85vrJQ8=;
 b=I/8KstKnXX/2wi2PbE0Huu2OaBgpJrs7zOHq1wwZZsSLj6ZuPIFAbKwJfVmH+PvQXh
 pXOxtYcrXPyWtJN1Lpdc1tm3qvXWM3YlhcubypmJLZgllp9MvmI/2LLMQmBkmJDKvP8D
 l0ooWguf2GqruQO+DEuOVM2ArXvF0pZqh2wlwv6gBwQkQlkHD2oTFMDnuZEj5JZZ0P7W
 IkvKppbvEa+Ixidf2WEExlUT8oesWvPY44q3eLo0N9zhCKWjsIrYpvIt7TMNtNHIztaA
 SpyAd5OTF+GhVk7WCyCyZyTfmG35ba6+4TG3OMIsvzkHIRofwQ4na1+kntVDeOXM+EVN
 kRUw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=I/8KstKn
Subject: Re: [Buildroot] [PATCH 1/1] package/ltp-testsuite: bump version to
 20260529
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> On 30/05/2026 16:35, Petr Vorel wrote:
> > Changelog:
> > https://github.com/linux-test-project/ltp/releases/tag/20260529

> > Removed patch backported from this release.

> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

> Applied to next, thanks.

Thank you Julien.

At least partly tested:

                   bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: SKIPPED
                      br-arm-full-static [5/6]: SKIPPED
               bootlin-aarch64-glibc-old [6/6]: OK

                             arm-aarch64 [ 1/32]: OK
                   bootlin-aarch64-glibc [ 2/32]: OK
               bootlin-aarch64-glibc-old [ 3/32]: OK
               bootlin-arcle-hs38-uclibc [ 4/32]: OK
                    bootlin-armv5-uclibc [ 5/32]: OK
                     bootlin-armv7-glibc [ 6/32]: OK
                   bootlin-armv7m-uclibc [ 7/32]: SKIPPED
                      bootlin-armv7-musl [ 8/32]: SKIPPED
             bootlin-microblazeel-uclibc [ 9/32]: OK
                   bootlin-mipsel-uclibc [10/32]: OK
                bootlin-mipsel32r6-glibc [11/32]: OK
                  bootlin-mips64el-glibc [12/32]: OK
                bootlin-m68k-5208-uclibc [13/32]: SKIPPED
               bootlin-m68k-68040-uclibc [14/32]: OK
                 bootlin-openrisc-uclibc [15/32]: OK
           bootlin-powerpc-e500mc-uclibc [16/32]: OK
        bootlin-powerpc64le-power8-glibc [17/32]: OK

@Thomas it'd be great if bootlin musl toolchains could be updated to have newer
kernel headers (requirement for 5 years old v5.11 is not met).

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
