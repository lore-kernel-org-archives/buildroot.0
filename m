Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA23EE498E
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 17:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EBC34060B;
	Tue, 30 Dec 2025 17:50:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p3ThW-aCDk9D; Tue, 30 Dec 2025 17:50:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72BFB40637
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767117006;
	bh=9xQW7ZvCWwuz1+kMXFAwdNUwpgHSM6evgwgD4oocAe0=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=eNkuuq1algO8x9ZCybwMzP07KsZbl1PUX9gQ3oOxqkRD6EjEwPtsjL+NK8qc89CfF
	 0MdZKsoX+y9TijvGDwpbVaIKePaJ8Sc+R7WgfS+EvSiQUzkBNTmdoP04sthah8502v
	 xnsz5NQQ5eXgg8cOEaHKJLqCeJ0D32Q8pirMeyYhmXSsrmxqOiytMgsmwclMAhX0xT
	 Jmdyz7t765gY7m1vYYzfof5LQHfYh3PHI3dk/1U8/ie2Vsb49hrSyDaoPwQJxlkqQ5
	 U9Z0XKWGhrTTUap3+bzkNNeqUgC8whyBnHF2r86pVoVcdzGsn0Hy3KSAUKQ02POI+N
	 nGA4rfYylFYVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72BFB40637;
	Tue, 30 Dec 2025 17:50:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F07AD8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6427840637
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:50:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HB3DtYq2ADQv for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 17:50:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 51EEB4060B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51EEB4060B
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51EEB4060B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:50:04 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47d59da3d81so7843125e9.0
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 09:50:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767117002; x=1767721802;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QNJj5RcGyvSbfsWZDut/c9Q4+JMp0Twar1Wa8cFtPEQ=;
 b=qHp4neXPnuNUjQSTHarqJJhejY3DWr1ap//2DKhsS6csiDP/K8nLK20HilzyEYkuly
 XfGnQkQxr2et1tVOXblYkqf075aXDpdfKyCuCZVoXs8hmeZSbAAi/o+hA8BH54CHQ81P
 +yTRafcsru/Z9WhRxRYCIWHVdZj0RN8J1txgStjtoiZPwpXB34LlsWhqVXt6PbGeoDGm
 8lOtMq+ejLyza16jyldf0x5s4U1iQq4eulWQn9vadVF4P3Gs6rN42tfdjR9lW3qBt6PM
 Bl2wsG4FKce12xDIZUTUuv8bbDbJ6Iutfotdw1gJ9/vnlS2fUQanjwq8ytdKzNaONP1+
 lZHA==
X-Gm-Message-State: AOJu0YyPrMtVi9DH0WAz8bGu/LNg8KrZNcY2XJ9WoPDU1Eiwgw5EeMuY
 ykObn7SILeWqls4KNvEHii2ThvZJSQOo9PXLo+0xri8E7N0nx/syiozHQxLUkA==
X-Gm-Gg: AY/fxX6VzY6FC4E8+vFbqjxBuvunbiD+ZDx7qWNqsm8S1QBI8WOh8ydho9wpp0aAkyI
 AVlmpXDIbbCzOjuQIzeIN5qsr7nRKa20nwZnLtG4/ypmvMFVDwMZw1b8lIl+aNqQXLlf6ughTP3
 hTmrIFOVfg6d8csG4EQoEflhqSIT449eQVbYPzJ6IthdnFsQOJRcq13faJxXVvROzorjdqkDsxE
 rey1QTSx80DL0yi4s4jxsDIM/e9cRxXOd1UQ5OIpIDmhtHIJIMBqooFCPlzPcC+IpHUESdAscgc
 Q7a92Hpv6DRXJXO6mKLRO3I/RYmlhZkGVSu7dEKZLT/T8kznKASVLmZr0BXsRntPSChxW32FlRr
 3QWiNmSRvVziJ6wNXXO88LlKJFZkEnuxt4laS/abB72v9KAvg5R6NwC8w0KxibwKiHeGcOGRgMy
 XIoKxVnSKmHbMVV68kK3Cc6WOkKz6kwaIyygOnfRhafC6dUqHj
X-Google-Smtp-Source: AGHT+IFac5oBLuy5TcLaJ49RMeJG0iDgDswYMklOt9bCklNz80IWXb7si1viNCEDcLwOr5Dfi2Db4A==
X-Received: by 2002:a05:6000:24c3:b0:431:1c7:f967 with SMTP id
 ffacd0b85a97d-4324e4172camr49104632f8f.17.1767117001756; 
 Tue, 30 Dec 2025 09:50:01 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea1b36fsm69146563f8f.5.2025.12.30.09.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 09:50:01 -0800 (PST)
Date: Tue, 30 Dec 2025 18:49:58 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Julien Olivain via buildroot <buildroot@buildroot.org>,
 Julien Olivain <ju.o@free.fr>
Message-ID: <20251230174958.GA496221@pevik>
References: <20251221180810.3770181-1-ju.o@free.fr>
 <20251228232021.4d4e70c9@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251228232021.4d4e70c9@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767117002; x=1767721802; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QNJj5RcGyvSbfsWZDut/c9Q4+JMp0Twar1Wa8cFtPEQ=;
 b=hv/OMb5Lcx6ADz0Ug5aAu52qn6++87Qsf+ROgWGJV+DwdQbAPTynRkOiq4w2O0iYxq
 nuaLo42Sru9kySq8J6od6sCIrK8XfTaSThHhOwabz4ySEsbI6gNCkVjOJT2OKd9uMd80
 nWknEK6wR7/kFvycQs6NmPLZRVJRyaZz7HdIfL87+ygB7NknHTIWGN6b3wcy0KBCAxQ2
 DjtnBSpR8S5zWtt9Ug2h/9D2XRDqtStYb/Mw95XaG7fA5XKEjOoWrAX9XwAKq72o3x3X
 vRmFSTu5nSvF1opfkQ0ygOB+ZXWKe6GCeCt6gPo/CONtOzyTzNTWRO1chEnJCOT5MIHE
 2SZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hv/OMb5L
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: ltp-testsuite: replace
 runltp by kirk
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

Hi Thomas,

> On Sun, 21 Dec 2025 19:08:10 +0100
> Julien Olivain via buildroot <buildroot@buildroot.org> wrote:

> > The run log of this ltp-testsuite test shows:

> >     INFO: runltp script is deprecated, try kirk
> >     https://github.com/linux-test-project/kirk

> > This commit updates this test to replace this deprecated runltp
> > shell script with the newer kirk Python script.

> > The logic of this runtime test remains the same: it runs a small number
> > of 'read' system call tests, and checks there is no failures and at
> > least one test succeed.

> > Cc: Petr Vorel <petr.vorel@gmail.com>
> > Signed-off-by: Julien Olivain <ju.o@free.fr>
> > ---
> > Patch tested in:
> > https://gitlab.com/jolivain/buildroot/-/jobs/12510635102
> > ---
> >  .../tests/package/test_ltp_testsuite.py       | 33 +++++++++++--------
> >  1 file changed, 20 insertions(+), 13 deletions(-)

> Thanks, I've applied.
+1, thanks!

> However, it's a bit of a pity that now Python 3
> is needed on the target to run LTP.

Yeah. I don't like it either. Specially LTP tests themselves does not require
anything (single test is either binary written in C statically linked LTP
libraries, we also have few POSIX compatible shell based tests which require
barely minimum of external dependencies), it can be run as is.

ATM we have list of tests in so called runtest files [1], which contain list of
tests (each line is single test: "test_label binary/script optional_arguments"),
therefore anything which can remove the first parameter and execute the rest can
be LTP runner. i.e. Buildroot custom script could be really minimal.

runltp does quite a few other things but these who need them should really move
to kirk. Also we plan to implement in kirk and ltx running tests in parallel.
That will save a lot of runtime.

[1] https://github.com/linux-test-project/ltp/tree/master/runtest

> One option would as suggested by Petr to use kirk in its intended mode,
> with kirk running on the host, and connected over SSH to the target to
> run tests.

> On the other hand, it was a lot more simple/convenient to be able to
> just run a simple shell script on the target to run the test suite.

Would it be possible to have both? Vendor runltp for local use and package kirk
as a host package (+ ltx as normal package)?

Kind regards,
Petr

> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
