Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D73F3C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:12:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7706861359
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7706861359
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43BFC83D5B;
	Thu, 21 Oct 2021 20:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZbTcAIadepmA; Thu, 21 Oct 2021 20:12:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FE0183D52;
	Thu, 21 Oct 2021 20:12:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 40C871BF318
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F8EA60731
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:12:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2OMiIcLTjA6y for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 20:12:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC8766068D
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 20:12:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e8e5:5688:10fe:8b80])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 2F1C2780326;
 Thu, 21 Oct 2021 22:12:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634847167;
 bh=Bnp+5kCE25JxqJdayCfA0TYhSUzFWxKvwwzpOSzhGN8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c4Aoety6mbZ3q2mIFjZyvAoNy0rmUZ+S5DGxwxyLT9gYDdWDt0X5WzMJEBCPE+1NL
 XDEEGF0VthvZ+a90caSxZLZpyXQFl5qFOmql5/xhPpFMQW5B1zsyVcKqHao1n3iMYY
 vLw3RcNVuIzT3I6UoaLWdoWAf1NT9KtK/coh03DP2ZFGwegf99B/Oibiv0yv3GIEad
 /LRGgu9acT47G/8HQOZBWLYap8KoUJEMkm/jMleqoIzu+EQahXaEy/NiegcMn1GGpf
 /oqMHCyzjUEYgXdtGl/9LIXDrldfi53GTTm1IaIpH3ga7mRcyHfYBqYkT3AUWo1sHd
 2VUu5B0tRoRqA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 21 Oct 2021 22:12:36 +0200
Date: Thu, 21 Oct 2021 22:12:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20211021201236.GG2400@scaer>
References: <20211016093234.2477835-1-fontaine.fabrice@gmail.com>
 <20211016093234.2477835-2-fontaine.fabrice@gmail.com>
 <20211018220427.5971bba1@windsurf> <20211018201808.GT2400@scaer>
 <88c82aa8-d532-eeb1-bc77-796eafa0d06e@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <88c82aa8-d532-eeb1-bc77-796eafa0d06e@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] conditional assigment check in check-package [was:
 Re: [PATCH v2, 2/2] package/knock: add knockd option]
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
Cc: Michael Rommel <rommel@layer-7.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2021-10-21 20:43 +0200, Arnout Vandecappelle spake thusly:
> On 18/10/2021 22:18, Yann E. MORIN wrote:
> >Thomas, All,
> >On 2021-10-18 22:04 +0200, Thomas Petazzoni spake thusly:
> >>On Sat, 16 Oct 2021 11:32:34 +0200
> >>Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> >>>+ifeq ($(BR2_PACKAGE_KNOCK_KNOCKD),y)
> >>>+KNOCK_DEPENDENCIES = libpcap
> >> From commit 97f3ad7af3dd54a15a10aa35786e7fa08cf5e7b1:
> >>     Repeat after me: "Forcing the value of <pkg>_DEPENDENCIES inside a
> >>     conditional is the root of all evil."
> >>Care to repeat after me ? :-)
> >
> >OK, I missed that in my review of v1...
> >/me hides in shame...
> >
> >But seriously though: why is that not caught by check-package?
> >
> >Because it is not actually an override: the variable is not yet set
> >there, so it is valid to unconditionally set it.
> >
> >check-package should probably recognise that the variable is
> ><FOO>_DEPENDENCIES and consider that conditional assignment should
> >still be forbidden in that case.
> 
>  I had a look at this, and it is not entirely trivial to test for in check-package.
> 
>  Basically, this is allowed:
> 
> ifeq(...)
> FOO_VAR = ...
> endif
> ... $(FOO_VAR) ... # Empty if condition not true
> 
>  And this as well:
> 
> ifeq(...)
> FOO_VAR = ...
> else
> FOO_VAR = ...
> endif
> 
>  But this is not:
> 
> ifeq(...)
> FOO_VAR = ...
> endif
> 
> ifeq(...)
> FOO_VAR = ...
> endif
> 
> 
>  So basically:
> - after a variable is assigned, it can't be assigned to any more in the same
> conditional branch;
> - it can be assigned to again in the else branch (including else ifeq constructs);
> - it can not be assigned to any more after the endif.
> 
>  In addition, conditions can be nested...
> 
>  The only way I can think of implementing this is by keeping a stack of
> conditionally assigned variables. In the else branch, the top of the stack
> is saved en empties. At the endif, the top of the stack is popped, merged
> with the saved one, and merged into the new top of the stack.
> 
>  Wow, by writing it down, I almost implemented it :-) Let's see if I can
> still find the time to actually do it tonight...

Sorry, but I think I got lost somewhere...

Currently, check-package does not whine for:

    ifeq(...)
    FOO_VAR = ...
    endif

but it does whine for:

    FOO_VAR = ...
    ifeq(...)
    FOO_VAR = ...
    endif

And these two behaviours are, I think, correct.

What I am arguing, is that FOO_DEPENDENCIES should be treated specially,
where check-package should whine for:

    ifeq(...)
    FOO_DEPENDENCIES = ...
    endif

as well as for:

    FOO_DEPENDENCIES = ...
    ifeq(...)
    FOO_DEPENDENCIES = ...
    endif

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
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
