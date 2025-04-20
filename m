Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D78C369C2
	for <buildroot@archiver.kernel.org>; Sun, 20 Apr 2025 07:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE1B9606E8;
	Sun, 20 Apr 2025 07:12:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zhhsdxeNlIZe; Sun, 20 Apr 2025 07:12:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FF1A6072C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FF1A6072C;
	Sun, 20 Apr 2025 07:12:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CA8921C0
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 07:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFCD140182
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 07:12:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KY2FnvOiTTvL for <buildroot@buildroot.org>;
 Sun, 20 Apr 2025 07:12:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6FDD540180
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FDD540180
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6FDD540180
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 07:12:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id E343219F576;
 Sun, 20 Apr 2025 09:11:53 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Apr 2025 09:11:53 +0200
Date: Sun, 20 Apr 2025 09:11:53 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>, buildroot@buildroot.org
Message-ID: <aASeOQ0uDBNaTixR@landeda>
References: <20250409-fix_linux_tools_parallel-v1-1-14135d77acf1@rivosinc.com>
 <20250419233340.06021dab@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250419233340.06021dab@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745133117;
 bh=d3b4oy2Q508Toup0nNx+0BLAuT59WCUtdPJ14P5UFHY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M1ZNwFTjmiNwW8zVCU6sptNEYyDu6cqZeTJUMfhMOAwuJ/250XsyKbRezSlyvnZyF
 GcPgeuoP1HSZ0oke5HSagHxFa8wTXg0QZusuN+iAMptaL1djbX5Mi1XhdNP/j3y1R+
 ov1Ev6kJ7z1/la1YKOGW96j4ZehfKsyS/JgD/rAEqpm4qwfyd8xypxSMXUATgbiKhS
 jZp6c+sGR5Het6kZUYkAeA4Zsakir2RZnVJHYQ+9Uu1vVL8hImIwUXcNFkCmScIjSo
 tSQ82faSFPvtQHpu+a1nWm1SN/dYw0gmjreO4QTKBVlYoFLzW7Se7KpscR4Iwej1mh
 Va5bHgg5/qf7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=M1ZNwFTj
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

Charlie, All,

On 2025-04-19 23:33 +0200, Thomas Petazzoni spake thusly:
> On Wed, 09 Apr 2025 01:51:00 -0700
> Charlie Jenkins <charlie@rivosinc.com> wrote:
> > linux-tools opportunistically set linux as only a patch dependency. This
> > unfortunately introduces a race condition in the shared linux scripts
> > when using PER_PACKAGE_DIRECTORIES and using top level parallelism.  The
> > race manifests as the error "/bin/sh: 1: scripts/basic/fixdep:
> > Permission denied". This happens when the linux package and the
> > linux-tools package are being compiled in parallel. During the setup,
> > each of these tools ends up compiling scripts/basic/fixdep. When the
> > timing is correct, one of these packages will try to use fixdep while
> > the other is compiling it, resulting in fixdep being briefly not
> > available.

I am surprised that the linux-tools would use fixdep. As I understand
it, fixdep is there to '"Optimize" a list of dependencies as spit out by
gcc -MD' because (paraphrasing the description from fixdep.c) basically
everything in the kernel ends up icluding autoconf.h. However,
autoconf.h contains the configuration of the kernel; I don't see why
that would be used by the userland code...

And what puzzles me then, is that running 'make clean; make linux-tools'
would currently end up with a kernel tree that is not yet configured, so
fixdep would not have the necessary input to work with, but that does
not prevent the build from succeeding today...

Can you provide a bit more details as to what tool actually triggers
that call, or if any does, and why that tool would need to do that?

> > To fix this, set linux as a hard dependency instead of a patch

s/hard/build/

But otherwise, I agree that this is the best fix. As you said, the patch
dependency was but an optimisation.

> > dependency.
> 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

When you respin with a bit more details, and an update to the comment as
pointed out by Thomas, you can add:

    Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> > ---
> > While the timing of this seems like it should very rarely be triggered,
> > on my build server I hit this issue nearly 100% of the time.
> > ---
> >  package/linux-tools/linux-tools.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/package/linux-tools/linux-tools.mk b/package/linux-tools/linux-tools.mk
> > index 81b1fbc17605d6f003558d113143b64b5af6714d..a5d4a66f761fc44b156a92edaaf21774529f52d5 100644
> > --- a/package/linux-tools/linux-tools.mk
> > +++ b/package/linux-tools/linux-tools.mk
> > @@ -20,7 +20,7 @@
> >  include $(sort $(wildcard package/linux-tools/*.mk.in))
> >  
> >  # We only need the kernel to be extracted, not actually built
> 
> This comment then needs to be updated. Maybe it can be kept, but
> extended with why we're using a normal dependency, despite the fact
> that we only need the kernel to be extracted.
> 
> > -LINUX_TOOLS_PATCH_DEPENDENCIES = linux
> > +LINUX_TOOLS_DEPENDENCIES = linux
> 
> But otherwise, unless I'm missing something, it looks like a reasonably
> solution to the problem.
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
