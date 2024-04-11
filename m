Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C64CD1292
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 05:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 875484154B;
	Thu, 11 Apr 2024 05:02:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TnKn7_IykBr4; Thu, 11 Apr 2024 05:02:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 404BF407DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 404BF407DF;
	Thu, 11 Apr 2024 05:02:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 25EFB1BF396
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 05:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D4E640253
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 05:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D-rm0rJcX_Ca for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 05:02:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 218AB4018E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 218AB4018E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 218AB4018E
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 05:02:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 012D213F88E;
 Thu, 11 Apr 2024 07:02:39 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Apr 2024 07:02:39 +0200
Date: Thu, 11 Apr 2024 07:02:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <Zhdu7zT3FZl7sk1q@landeda>
References: <20240403121807.2087547-1-robimarko@gmail.com>
 <20240408223621.39b37892@windsurf> <20240408213807.GA44146@pevik>
 <20240409214656.721dc7c3@windsurf> <ZhWp-ftUZj1_npHh@landeda>
 <20240411001504.GA283218@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240411001504.GA283218@pevik>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712811764;
 bh=f9g+DW7JhK40DLYntPE65ziwtHgxfrmzoygA3N3HYuI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d/D6E0hlvBKef1A5ZGgWQzrNzC958A1undS5Ue/Ffw50uDJ+armosXsxKXc+KfEzu
 bFS8KI5SBWsPmGR2FIHYKLgXbGT15jhGm5LkmeccX5/JoXJtcLnPwgC3Q0K5jlTUiY
 CfiZ/t2854hadCoMm13uuPHOcJrccNESaYoWXOJPYpdi5vdOhxEueu7bkhS9K5ZFHi
 4q4bol1uWHSFcJjxlv8/EK7ye/2rDZxDzD35HswyA/V9G1sV6br95pcHCgF5eNbq8B
 YNshHpFB1t68cBC4AFOPgvPkSNT8K1Lom0icFJnGjg8C98ztytlxyMiIeFXEvSLRnr
 7LNg9zRaoWSJw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=d/D6E0hl
Subject: Re: [Buildroot] [PATCH 1/1] kconfig/lxdialog: fix check() with GCC14
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
Cc: Robert Marko <robimarko@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Petr, All,

> > The kernel's kconfig has dropped the possibility to include files from
> > within a choice, so what we're doing now in a few places will not work;
> >   - toolchain/toolchain-external/Config.in
> >   - package/openssl/Config.in
> Ah, you mean choice within choice .. endchoice.  Thanks for info. That's
               ^^^^^^
s/choice/source/

Yes, "source" in a choice...endchoice block.

> unfortunate. Any idea which commits reverted it?

That was commit in the kernel, 4 years ago:

    09d5873e4d1f7 kconfig: allow only 'config', 'comment', and 'if' inside 'choice'

> I'm not sure if it will be
> possible to easily revert it back (there are many changes in kconfig).

Indeed.

> Also replacing 'source' with some placeholder and using some preprocessing
> in extra make target (dependency for gconfig/xconfig/menuconfig/nconfig/config)
> might not be as trivial as it looks like.

No, it is not...

> Do you remember any other problem?

Not right now. There were a few other major changes, but AFAICS we would
not be impacted.

> Also, maybe slightly easier way could be to use init-kconfig [1],

init-kconfig has not been touched in 2 years. There is no point in
switching from our mothballed copy, to another mothballed copy...

And in any case, they advertise as being "a passive fork of Linux
kconfig", and their "goal is not to fork kconfig and evolve it
separately".

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
