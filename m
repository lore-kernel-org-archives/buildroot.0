Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0BDC369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 18:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDE58810E0;
	Mon, 21 Apr 2025 18:23:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GZqbPcljxFaR; Mon, 21 Apr 2025 18:23:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E37080DD1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E37080DD1;
	Mon, 21 Apr 2025 18:23:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 956DC68
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 18:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AB8C60723
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 18:23:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sdGJKN8ZiQ-v for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 18:23:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C672C6067F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C672C6067F
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C672C6067F
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 18:23:01 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-aee773df955so4243221a12.1
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 11:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745259781; x=1745864581;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wIuop4UuGsmkN6ERWru0ZrXWWlbv6kTU5K8r2E1tIDo=;
 b=tleC3zNdodG525OArhqlfx+d8cYpsGMQDmLgMukV1UE9P6AtfebB9P5Db8ovZXh0jB
 SKZ/sQOrwh6AX3eXRcKbeVQ2UuLYEff5I6DwjSOa6WNT0kNygsVlZ+WFxh0wAON+8bQG
 V9uJD/6pbjJH1xA57F88N5SL9ZY2Z7BjTh6NY37s9E8QTNup+Wdm0L80iG5dy72xbe1g
 qVcFxjIkoF9inQgKgE0dIy4gMDOJm/upqlbFaK7Fv2AV+uoTRLyCoGRBjqlemV4AjtbJ
 tkTApQMW6hh3NUiS/oZh+MxK6GGtea1bIYzxFLg0p18ucNorGdgMCeapDGPiBg0K443T
 mx0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+jh8MTUdHsR6Jr/3KnMcTNm4L2EnUH/7dPWWiL5L5stZ9ZTe2Y+TUK0BlkEmjIvsRxpklIqTJGnY=@buildroot.org
X-Gm-Message-State: AOJu0Yw7K9vtXXCPwoQBSOYq75Sa/nNexjSaZQkjxIbGBIRyyFQ8yaPk
 0IYCs+OJEDrcynBgSZOBbrXdBd8Z46ptX8i9yb4kP7SN81nIcGJgqEVXeJG7mNtfIeMaVUmzfUd
 39xk=
X-Gm-Gg: ASbGncubKk8dVlhv4O6kbilXMiLlmHVF6sX7vvPi/W/P0+pk3q/2Am2ZOHdLLQ9qdtX
 EXb0YJMWEyVabtPYbpP51O5D3T0M/dGxEAaosOEuGW2MYCqJVzd3w1268rxsqGBPnNZtoDwYNdf
 9aVuCka954V5Ef6Vt4dvrNwb1SWr03NuoKiCgZ0zbI95lnWqCPwqw8UEBC6nA3hzsvZtfQKKT+1
 iKV8CobYf/1+BOyFvx+KHK461f2GH+Ezwi/30FGAR30ko6R5rtukDJ1jyX6v0laNpgHITwg+Gov
 KSCcmbqWZ5sCbklX5itp1SltAhWqUHlqcPbgZC2s+TG13w==
X-Google-Smtp-Source: AGHT+IFZ8ze/+Wnms0gAZ0ZYCcEuG0YE2kNeQxz1RMIUs8JKrQlZGNGNPu9eqGAVLKpUplxmF5HumA==
X-Received: by 2002:a17:903:1aa4:b0:221:1497:7b08 with SMTP id
 d9443c01a7336-22c50d643e8mr208395445ad.23.1745259780821; 
 Mon, 21 Apr 2025 11:23:00 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:582c:6fbb:25b7:248])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73dbfaad423sm7195301b3a.149.2025.04.21.11.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 11:22:59 -0700 (PDT)
Date: Mon, 21 Apr 2025 11:22:58 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	buildroot@buildroot.org
Message-ID: <aAaNAk4oCHBf-Q7d@ghost>
References: <20250409-fix_linux_tools_parallel-v1-1-14135d77acf1@rivosinc.com>
 <20250419233340.06021dab@windsurf> <aASeOQ0uDBNaTixR@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aASeOQ0uDBNaTixR@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745259781; x=1745864581;
 darn=buildroot.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wIuop4UuGsmkN6ERWru0ZrXWWlbv6kTU5K8r2E1tIDo=;
 b=EkpxYR7/R1ukavm9fvEjP6sJ7idAifErXBYYy9SHhZQcn8YtILd8oUqTb3xG6RVM9c
 Gm9hkE7cdKjz/fzq1pH8IOiCNfQnixJPbZoRral44zs4TCNIuWBCmfVMn/tW1mcDmm3g
 R8mWmyatVj4WgZHWOsrJ3DCrpdtfDpdxxCs58pS20SERJzFSmNYUGvEBsexKUh2yTED2
 7y8pG9ZXiutL+MaBP65LhL+mZg0w7dSgyOAULxZA+L5xwgq/h6ue70e2aQH7/xmHwcOu
 tPD5kzgTCvPdPqf4gqoLdK7/vXlApnsJjJwd8vvBrWf3UJv7S2YoQ3kMrP9GRwsORUnM
 k20A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=EkpxYR7/
Subject: Re: [Buildroot] [PATCH] package/linux-tools: Fix parallel
 compilation
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

On Sun, Apr 20, 2025 at 09:11:53AM +0200, Yann E. MORIN wrote:
> Charlie, All,
> 
> On 2025-04-19 23:33 +0200, Thomas Petazzoni spake thusly:
> > On Wed, 09 Apr 2025 01:51:00 -0700
> > Charlie Jenkins <charlie@rivosinc.com> wrote:
> > > linux-tools opportunistically set linux as only a patch dependency. This
> > > unfortunately introduces a race condition in the shared linux scripts
> > > when using PER_PACKAGE_DIRECTORIES and using top level parallelism.  The
> > > race manifests as the error "/bin/sh: 1: scripts/basic/fixdep:
> > > Permission denied". This happens when the linux package and the
> > > linux-tools package are being compiled in parallel. During the setup,
> > > each of these tools ends up compiling scripts/basic/fixdep. When the
> > > timing is correct, one of these packages will try to use fixdep while
> > > the other is compiling it, resulting in fixdep being briefly not
> > > available.
> 
> I am surprised that the linux-tools would use fixdep. As I understand
> it, fixdep is there to '"Optimize" a list of dependencies as spit out by
> gcc -MD' because (paraphrasing the description from fixdep.c) basically
> everything in the kernel ends up icluding autoconf.h. However,
> autoconf.h contains the configuration of the kernel; I don't see why
> that would be used by the userland code...
> 
> And what puzzles me then, is that running 'make clean; make linux-tools'
> would currently end up with a kernel tree that is not yet configured, so
> fixdep would not have the necessary input to work with, but that does
> not prevent the build from succeeding today...
> 
> Can you provide a bit more details as to what tool actually triggers
> that call, or if any does, and why that tool would need to do that?

It's perf that is using it. perf uses a constrained version of kconfig
-- all the configs are detected at build time by figuring out what the
system supports and looking at environment variables instead of being
selected by menuconfig. Since it's using kconfig, it also needs to solve
the autoconf.h problem and so it uses fixdep.

rtla and bpf do the same thing.

> 
> > > To fix this, set linux as a hard dependency instead of a patch
> 
> s/hard/build/
> 
> But otherwise, I agree that this is the best fix. As you said, the patch
> dependency was but an optimisation.
> 
> > > dependency.
> > 
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> 
> When you respin with a bit more details, and an update to the comment as
> pointed out by Thomas, you can add:
> 
>     Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

Thanks! Yes, I will add the perf details.

> 
> Regards,
> Yann E. MORIN.
> 
> > > ---
> > > While the timing of this seems like it should very rarely be triggered,
> > > on my build server I hit this issue nearly 100% of the time.
> > > ---
> > >  package/linux-tools/linux-tools.mk | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/package/linux-tools/linux-tools.mk b/package/linux-tools/linux-tools.mk
> > > index 81b1fbc17605d6f003558d113143b64b5af6714d..a5d4a66f761fc44b156a92edaaf21774529f52d5 100644
> > > --- a/package/linux-tools/linux-tools.mk
> > > +++ b/package/linux-tools/linux-tools.mk
> > > @@ -20,7 +20,7 @@
> > >  include $(sort $(wildcard package/linux-tools/*.mk.in))
> > >  
> > >  # We only need the kernel to be extracted, not actually built
> > 
> > This comment then needs to be updated. Maybe it can be kept, but
> > extended with why we're using a normal dependency, despite the fact
> > that we only need the kernel to be extracted.
> > 
> > > -LINUX_TOOLS_PATCH_DEPENDENCIES = linux
> > > +LINUX_TOOLS_DEPENDENCIES = linux
> > 
> > But otherwise, unless I'm missing something, it looks like a reasonably
> > solution to the problem.
> > 
> > Thomas
> > -- 
> > Thomas Petazzoni, co-owner and CEO, Bootlin
> > Embedded Linux and Kernel engineering and training
> > https://bootlin.com
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
