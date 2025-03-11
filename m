Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D614EC282EC
	for <buildroot@archiver.kernel.org>; Tue, 11 Mar 2025 11:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 874E24071D;
	Tue, 11 Mar 2025 11:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IbHRZ_JsXa6G; Tue, 11 Mar 2025 11:01:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 532554074D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 532554074D;
	Tue, 11 Mar 2025 11:01:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DBB31DA
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 11:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 365384074D
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 11:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tr22K0JzxC5N for <buildroot@buildroot.org>;
 Tue, 11 Mar 2025 11:01:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=daniel@0x0f.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 11A454071D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11A454071D
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11A454071D
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 11:01:13 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-22401f4d35aso93221825ad.2
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 04:01:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741690873; x=1742295673;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HAKbPG5neTtJ2DM8wJqpY9fPa1QvA6Z/aSga7XVeaHI=;
 b=Gk+LaLp6NMf7+fQWRZwyymr2w85jE90dVBKrS/xxcIn6x/DLrfRl6/Lyc8rjiiPuU0
 ZcuD95J0mgpJR3bDMZK5Xg+IhkawyqQUmmSElwPi4RkMFW0QDjbGTfSIGjTw3i9PZWs3
 TALPXyblUGm8cmA9rF1BAHWQKErOXO5rEfMtmjQTKT3ciyNnA3DrmzC5B7yAyF6T/gid
 +l7ndFUfxsi5ZgG0aBj+cZKX/jLPutDUvlUxX7iYl126tl/uJFvGe32Zy2AhqX/gJoH7
 PrrxdFWKK/oYo1JmEGx0lh1yeNMCflsOAdJRFcRivQ1xGRo4igV5sIZTzUEHnhzot2jD
 OlmQ==
X-Gm-Message-State: AOJu0YyewCt5jEwjvusg2fKwjR30wBlgpZ7m7a+ShX/cDdogSilm03pF
 dy4GwzyxlAKFYWECG7Ik1l01iXFCnvIk/8s2DUQ+G8AhUQzKJfrc8PAyrBMt2HwKCAy8/PI7hNX
 SDK0fYQ+V/FqT7dDbxqsL05dQYBMWCF+E58aLb5ZKTjPJlNajha8=
X-Gm-Gg: ASbGncsrqsBRaSycuTWJ8Pv1h6u/c5SI6cDQmD8yLcvQyBQZ6OyDpQLThNmofLvySJs
 wOIARYXoHglaUyi08jiTsllHwlZmvticnYfpnQV30TdIA0kVu3ToLT5/Xsnduym3IPdfMlTS605
 L4TEm2iU6ss/D7iSh7u7LMWXYsiPdY2sbgzx0w8DKuqdtirPMtFnqvrJuFhUc=
X-Google-Smtp-Source: AGHT+IF9THfaWPCfZxZomwU40oAZsggMogXKc1OIonAn/Cd/sFin/61OXmzkNX5Hv2GLRWJLFHeukGslmheYQ1ZL3k0=
X-Received: by 2002:a17:903:22cf:b0:21f:522b:690f with SMTP id
 d9443c01a7336-225931ad4famr54762045ad.46.1741690873180; Tue, 11 Mar 2025
 04:01:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250311101153.3567108-1-daniel@0x0f.com>
 <87ikofamtq.fsf@tarshish>
In-Reply-To: <87ikofamtq.fsf@tarshish>
From: Daniel Palmer <daniel@0x0f.com>
Date: Tue, 11 Mar 2025 20:01:02 +0900
X-Gm-Features: AQ5f1JqcvebeXk8cDKZIK9_zX_6S_rtkVTQxgLR5gA9Ugl0zLtQGIi9ehd_AD08
Message-ID: <CAFr9PXmah3aNpH_LNf34QpkYxF7r2YD4yYRosFRid+5B8S4YTw@mail.gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0x0f.com; s=google; t=1741690873; x=1742295673; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HAKbPG5neTtJ2DM8wJqpY9fPa1QvA6Z/aSga7XVeaHI=;
 b=BzJxul2ANGRhfw686dozOBXngdgqd5+Cvaa+S2+zy84WAoLMeRE5caFrWhvXaT6G25
 EUm8yAKXbEEluCcCVun5DC3joXf1SgbzPT6NFCw9jEQn4OiGvxRz6bcLjR9kb1KTW8aF
 AJ10L/596p2zDSt9cAB1SfvFc2boEBKBkxHs4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0x0f.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com
 header.a=rsa-sha256 header.s=google header.b=BzJxul2A
Subject: Re: [Buildroot] [PATCH] package/musl: Add upstream patch to fix
 building strace on m68k
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

Hi Baruch,

On Tue, 11 Mar 2025 at 19:22, Baruch Siach <baruch@tkos.co.il> wrote:
>
> Hi Daniel,
>
> On Tue, Mar 11 2025, Daniel Palmer wrote:
> > Currently it's not possible to build strace on m68k when using
> > musl because the version of musl in buildroot doesn't have the
> > m68k specific definitions of POLLWRNORM and POLLWRBAND.
> >
> > This is already fixed upstream so manually apply the patch
> > until the next release.
>
> A link to autobuilder failure is missing:
>
>   http://autobuild.buildroot.net/results/ec3de790a66373f270f731519e2ef51c293ba683/

Interesting. I didn't know this had been spotted by the autobuilder. I
just noticed it while building strace to debug another package.

> > Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> > ---
> >  package/musl/0006-m68k-fix-poll.patch | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >  create mode 100644 package/musl/0006-m68k-fix-poll.patch
> >
> > diff --git a/package/musl/0006-m68k-fix-poll.patch b/package/musl/0006-m68k-fix-poll.patch
> > new file mode 100644
> > index 000000000000..45d5dcede459
> > --- /dev/null
> > +++ b/package/musl/0006-m68k-fix-poll.patch
> > @@ -0,0 +1,25 @@
> > +From b09e3174a695d1db60b2abc442d29ed3f87f0358 Mon Sep 17 00:00:00 2001
> > +From: Baruch Siach <baruch@tkos.co.il>
> > +Date: Wed, 7 Aug 2024 08:51:03 +0300
> > +Subject: m68k: fix POLLWRNORM and POLLWRBAND
> > +
> > +As noted in commit f5011c62c3 ("fix POLLWRNORM and POLLWRBAND on mips")
> > +m68k uses a different definition.
>
> You should add your sign-off and an upstream tags here.
>
> See the manual:
>
>   https://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches

Ok, I'll look into that and resend.

Thanks,

Daniel
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
