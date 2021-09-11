Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E261BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 19:50:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B4D86113E
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 19:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B4D86113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66F23415C6;
	Sat, 11 Sep 2021 19:50:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bvtRNAWkYz2W; Sat, 11 Sep 2021 19:50:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8DAA415BF;
	Sat, 11 Sep 2021 19:50:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 767B11BF285
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 19:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 668F240802
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 19:50:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rY5dNTHQ4w0J for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 19:50:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A832404EF
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 19:50:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6c4a:f4f1:e14a:6e93])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 979E9B00548;
 Sat, 11 Sep 2021 21:49:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631389807;
 bh=iUkZ4ttvMrfKOuZI9grZnhipAlTWPzDJN71tRK2vrBg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rOj/jhGlXuY3D50aQTV9+G7kjoF4V1ZdRx7UKJBAViHYZsmG2iJH4YdeSBSeWavKL
 uPzDLFV8MUVLmnSq1ilKdX9i/To2TukkFZ249G2+MmLvzPIw8Jl3c0S5bWt20uZcq5
 XSSsOMOVUGXPkeIeX6iPULJjK2TxBgVYEaVqRdzwXGZi002yKevbUhcKOKgTGF+reU
 iGChCVFLBnY2SvGiqkcTAEIViUgPzuCIW7I4d189V9Ha4AyCE6vMyB+669zvWS13K9
 SB0Cczkt8fkqB+8gF6hqX5df3/NoC/dB866E6zlTc1++NddUdvV70V2tzDJLNvg+fP
 HgHSlJSM8/9VQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 11 Sep 2021 21:49:57 +0200
Date: Sat, 11 Sep 2021 21:49:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20210911194957.GV1053080@scaer>
References: <20210903162027.1935040-1-aduskett@gmail.com>
 <20210903162027.1935040-3-aduskett@gmail.com>
 <016fa6ef-0efa-030b-3e27-c2e7ff6db844@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <016fa6ef-0efa-030b-3e27-c2e7ff6db844@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH/master 2/7] g-ir-scanner-qemuwrapper.in: Fix
 shellcheck warnings, switch to sh
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>, Anisse Astier <anisse@astier.eu>,
 Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Arnout, All,

On 2021-09-11 20:57 +0200, Arnout Vandecappelle spake thusly:
> On 03/09/2021 18:20, Adam Duskett wrote:
> >   - Add double quotes to prevent globbing and word splitting.
> >   - Add indentations of continuation lines.
> >   - Disable SC2181 and SC2016 as we explicitly do not want the variables
> >     expanded in the echo.
> > 
> > Signed-off-by: Adam Duskett <aduskett@gmail.com>
> > ---
> >  .../g-ir-scanner-qemuwrapper.in                  | 16 +++++++++-------
> >  1 file changed, 9 insertions(+), 7 deletions(-)
> > 
> > diff --git a/package/gobject-introspection/g-ir-scanner-qemuwrapper.in b/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
> > index ec066062e2..5ece75d0a4 100644
> > --- a/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
> > +++ b/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
> > @@ -1,18 +1,20 @@
> > -#!/usr/bin/env bash
> > +#!/usr/bin/env sh
> >  
> > -# Pass -r to qemu-user as to trick glibc into not errorings out if the host kernel
> > +# Pass -r to qemu-user as to trick glibc into not erroring out if the host kernel
> >  # is older than the target kernel.
> >  # Use a modules directory which does not exist so we don't load random things
> >  # which may then get deleted (or their dependencies) and potentially segfault
> >  GOI_LIBRARY_PATH="${GIR_EXTRA_LIBS_PATH:+${GIR_EXTRA_LIBS_PATH}:}.libs:$(dirname "$0")/../lib:$(dirname "$0")/../../lib"
> > -GIO_MODULE_DIR=$(dirname $0)/../lib/gio/modules-dummy \
> > +GIO_MODULE_DIR="$(dirname "$0")/../lib/gio/modules-dummy" \
> >  @QEMU_USER@ -r @TOOLCHAIN_HEADERS_VERSION@ \
> > --L $(dirname $0)/../../ \
> > --E LD_LIBRARY_PATH="${GOI_LIBRARY_PATH}" \
> > -"$@"
> > +    -L "$(dirname "$0")/../../" \
> > +    -E LD_LIBRARY_PATH="${GOI_LIBRARY_PATH}" \
> > +    "$@"
> >  
> > -if [[ $? -ne 0 ]]; then
> > +# shellcheck disable=SC2181
> 
>  Instead of adding an exception, we could just do the right thing:
> 
> if ! @QEMU_USER@ -r ... \
>     ... \
> then
>     ...
> 
>  But since I wasn't going to test this change, I left it as is.

I also considered it when Adam and I discussed this patch on IRC, but I
side with him to keep the code as-is, but forgot to explain why so that
he could add that to the commit log.

So for the posterity, here is my reasonning:

    Continuation lines in a condition are ugly and make an if-then-else
    condition harder to grok, so we prefer adding an SC2181 exception as
    it leaves the code more readable.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
