Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B961C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 20:47:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0037160EC0
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 20:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0037160EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B68D783668;
	Sat,  7 Aug 2021 20:47:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J-dxC2QqETPe; Sat,  7 Aug 2021 20:47:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13D5683640;
	Sat,  7 Aug 2021 20:47:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 59B9A1BF3F7
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 20:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48D0B40342
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 20:47:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AfOka3m8YOJP for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 20:47:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A93C740335
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 20:47:22 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id e19so21609355ejs.9
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 13:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=lG76DqkjYxi8kzTB/ky5C0DbXgTmK+LyB6UAIvx7VPg=;
 b=Kr/IA8ZCzm4NFIOsZHie3c0+k5eE5npOm4MZvsp5QKDidOOlXb4UkI0AZT/0PwYN0k
 1XVAOxgXlWR0PIfWJC5GmcEXf0guGgvpG4gdS7kZBP4M7JZV23fxAYFW4F8cLIHbPCQh
 AI2AQvpYvQt+LWcXJT9J85EJGqEk3jb5fMAu4CuQqJGQgavcVFHK35Y1UJEtjh/sxEr2
 s63tByf41/cz1i5TTY8NCvOvMoOailRuEmyZEpK0C/Oa8wS8MrS555fQVzAYSqaY3QOG
 NQh+OXlAOAdRX0ik9aZUdVyJxCiJstukvjexKFRO7f3oG8wr8Y8LqZDNNsJS4RwS7Y0f
 Hodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=lG76DqkjYxi8kzTB/ky5C0DbXgTmK+LyB6UAIvx7VPg=;
 b=HdpeT+NBeM/qME8QleJXsSRV00UFjKMuVx76lF8Qz5SxMX7CcIG/UViD+FCquQJYHn
 xyFtc1ZBwQt+8GbsV6flqqfqswkxestkh18duYt/bGs04Bs0CnjMKQnB0zA5crusIAhT
 LIY5AdQElUZVToTH+ESr3MmIt4Pg13Z0OjHiFymSGpj31N511o+1v3Wd7HJA5Av/P+Kw
 LJ/ZPJ0u+mh/sZ6ygfhO0zARNOnk5kWm3G5sN7dcGlvlO1hR/x+DDRI/1IAKvbMJjx+P
 irthlDKyxi6dn4EF1Bk4k3/LkHjjjIwphQOM7ET2hVWBY0MQ0CcI97T6uQxx5CLC7Q+r
 hOhg==
X-Gm-Message-State: AOAM5339kOHn2kCn7tDdC6scB+Kg/0NhE4y9jvd1KEeoN8Sz+feE0zCg
 aBLUJZO6hhw0IUH7LEYWIyxtBNcDYOavIw==
X-Google-Smtp-Source: ABdhPJytEpRoHiEkXSVONOQZWUgauliuW5TzLdAdO2oy9ed6b2tWrAbGSt6jlFoFeNN8uHY2R0CtFA==
X-Received: by 2002:a17:906:4b01:: with SMTP id
 y1mr15649046eju.186.1628369240748; 
 Sat, 07 Aug 2021 13:47:20 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id q8sm5583779edv.95.2021.08.07.13.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 13:47:20 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCTDz-0006ZB-IO; Sat, 07 Aug 2021 22:47:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210801214601.566970-1-fontaine.fabrice@gmail.com>
Date: Sat, 07 Aug 2021 22:47:19 +0200
In-Reply-To: <20210801214601.566970-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 1 Aug 2021 23:46:00 +0200")
Message-ID: <8735rldlt4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/irqbalance: use pkg-config to
 find numa
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Karoly Kasza <kaszak@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Use pkg-config to find numa to avoid the following build failure when
 > checking for numa_available:

 > configure:9667: checking for numa_available in -lnuma
 > configure:9692:
 > /tmp/instance-7/output-1/host/bin/microblazeel-linux-gcc -o conftest
 > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
 > -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
 > -D_FILE_OFFSET_BITS=64 -static conftest.c -lnuma >&5
 > /tmp/instance-7/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-uclibc/9.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld:
 > /tmp/instance-7/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libnuma.a(libnuma.o):
 > in function `numa_node_to_cpus_v1':
 > (.text+0x2a80): undefined reference to `__atomic_fetch_and_1'
 > /tmp/instance-7/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-uclibc/9.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld:
 > /tmp/instance-7/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libnuma.a(libnuma.o):
 > in function `numa_node_to_cpus_v2':
 > (.text+0x2ddc): undefined reference to `__atomic_fetch_and_1'
 > collect2: error: ld returned 1 exit status

 > Fixes:
 >  - http://autobuild.buildroot.org/results/577a63432fba2f9ae1ed2c6c2a77c5ce54ac5521

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
