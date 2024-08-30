Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B350BCA0EFD
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 17:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6615F605C5;
	Fri, 30 Aug 2024 17:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j4xWP2wNR5qm; Fri, 30 Aug 2024 17:46:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C61960653
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C61960653;
	Fri, 30 Aug 2024 17:46:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 196C91BF2A5
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 17:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06FD360653
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 17:46:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kZXRxpxaTV6J for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 17:46:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 77FC6605C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77FC6605C5
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 77FC6605C5
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 17:46:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4C86313F8E1;
 Fri, 30 Aug 2024 19:45:57 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 30 Aug 2024 19:45:57 +0200
Date: Fri, 30 Aug 2024 19:45:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZtIFVfVvWnm67wnX@landeda>
References: <20240830135546.906135-1-roykollensvendsen@gmail.com>
 <20240830190012.4ba5a5dc@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240830190012.4ba5a5dc@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725039963;
 bh=tujJCyNA5IuahJLUyVXGfQORdGy7PGkoMbRBjESxe0c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AHWFA2AjgnAFAAt2BEmtFPdv7NFo91gihfJkive9pcrHoLALilh4+XQe7R3spndZu
 KcOHK2+GwNsB/O+ro+Z9zeIjtTjN3YijDBTfwzFBJ7HIww179fdEjgmntq5Y9NmNsa
 hQajhJQI5MRgqp4+BsiZzYI3B18QBSyslrFNPIfrFhwEW4nC5ENHKqCVENKVnfvOxS
 e3JpU52YI969E8Li+voCW/4V9zXmMpWkASV3arHu+sxZjNj92hv0Avgvw/PC8MeETX
 DrlJ8ONTGEiXAhLwmmg+GnXvE3FdwT/r7uTMArD31J8TWf0kiXI5/ljdUcRkvATLCR
 9QZ+U1BHNP6AQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=AHWFA2Aj
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual: fix description of how to
 reply to <message-id>
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
Cc: Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-08-30 19:00 +0200, Thomas Petazzoni spake thusly:
> On Fri, 30 Aug 2024 15:55:45 +0200
> Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:
> > Patch v1 not set to 'superseded' when replying to <message-id> with v2.
[--SNIP--]
> I have applied to master, because it fixes a bug in the doc. But on my
> side, I am not a big fan of subsequent iterations being sent as a reply
> to the previous iteration. I know it has the advantage that patchwork
> marks the previous iteration as Superseded, but I find it a bit
> annoying on the mailing list.
> 
> What do other BR maintainers think?

I too am not fond of threaded iterations, and I prefer a new thread be
opened for each iteration.

If submitters are going as far as to use --in-reply-to, then can as well
reference the original thread in the post-commit changelog, or in a
cover-letter.

I also like to have such a reference, as I can go and skim over the
previous reviews to assess the changes. So, an automatically-superseded
patch(set) in patchwork is rather detrimental to my workflow, in fact.

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
