Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA0ACD343F
	for <buildroot@archiver.kernel.org>; Thu,  7 May 2026 11:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C123C83B99;
	Thu,  7 May 2026 11:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vg550vOtsBF2; Thu,  7 May 2026 11:55:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD8A483B96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778154944;
	bh=XFKqggLvZaPnNGlp3GeTN+iVgcMWDM4Ba1Qug/snHGI=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=brT5Sr8BH2DbzGCnabd1nl3k+SiTAgKuaUtLpKQtL6wwVcHTgGrJ/dA7t4kL7NP0S
	 7BvaDx/7EqxvyRplaulhEh3rD6tl+Jvsuap1jsSOozQfIBy1L7mNCbnALnKKXGy61N
	 dcbR57C8feg8zICa/tsa4LHnBwLcOkAsn+oN6Yb4/7wgEG59j2lwx35REs/6/8a3JS
	 lDUnat+YSP9unIiQ8/8/weHwWnsLxfMn1uXX7cx+e6CraE86rnMDmiYxH/SCc83SSJ
	 w4soLl7iE1Ekue5fQPyrJJ4ABVk/6R9vwQ+MnK/6CZd9PdmgeCK7XHN8oeHxNxPlbe
	 SJkfI0YGlFzpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD8A483B96;
	Thu,  7 May 2026 11:55:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AB7A280
 for <buildroot@buildroot.org>; Thu,  7 May 2026 11:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 089584106B
 for <buildroot@buildroot.org>; Thu,  7 May 2026 11:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TBkfMiCpW-Zb for <buildroot@buildroot.org>;
 Thu,  7 May 2026 11:55:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 18E4F41068
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18E4F41068
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18E4F41068
 for <buildroot@buildroot.org>; Thu,  7 May 2026 11:55:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 55E61C5DC5B;
 Thu,  7 May 2026 11:56:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9179D60495;
 Thu,  7 May 2026 11:55:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C94FE10819483; 
 Thu,  7 May 2026 13:55:34 +0200 (CEST)
Date: Thu, 7 May 2026 13:55:33 +0200
To: Arnout Vandecappelle <arnout@rnout.be>
Message-ID: <afx9objSQO_30MhE@windsurf>
References: <20260426153334.1026982-1-fiona.klute@gmx.de>
 <5db0b73a-7fed-403f-bc7d-22411a71735d@rnout.be>
 <325e5bfb-48f8-40e9-b1c6-6081dfec116a@gmx.de>
 <b8636103-f323-4345-9e10-ecc8c976497b@rnout.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b8636103-f323-4345-9e10-ecc8c976497b@rnout.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1778154937; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=hJQICkW5+uMXNOMQiP1cyFJQCAsMXRLZhCGjMtMSyDs=;
 b=dLI7NLJm/zJIYqZ8FV7hH9veHanbqpLI1FNUL97rH1ayLYm40U7MzZ/UilnK1Yu3SgfS40
 5TgifKTF8+TrxWSGHDXwQOwpf+2Mp11ypM8zsdiplDWR4klAXhUgkrlZEtZaRQ+KnCduwi
 KUL6I8S6H2n0T61wkLn0x4YPoXiKpf1TYVmUWmwV2GILvXCx30UdvGFHR/DHUTMyYueGeO
 1bH3RAxrDvHIGnhtcTU0joeU227WmHM24qU2+rYZsp+pYgbNbrkn0E8R1R4WioouqEVqlx
 Fz3UtyJdEfRkB+uRnF5MsoChZw2eXvdGX7VtgmDc/ytMxvm/eGOu4Ogj+QEgfg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=dLI7NLJm
Subject: Re: [Buildroot] [PATCH v2 0/6] Bugfixes for pkg-stats
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Julien Olivain <ju.o@free.fr>, Marcus Hoffmann <buildroot@bubu1.eu>,
 buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, May 07, 2026 at 10:34:35AM +0200, Arnout Vandecappelle wrote:

> > I was actually wondering if it'd be possible to apply for a grant for
> > Buildroot work, e.g. with NLnet NGI Zero [1]. It would be easiser to
> > tackle larger changes that way: There's this, maybe kind of related SBOM
> > stuff I was involved with before for a client (left unfinished/pending
> > because the project ended), and I have some ideas for an overhaul of the
> > test system.
> > 
> > If that's an option (as in, maintainers approve of the idea) I'd like to
> > collect requirements/ideas/issues as base for a possible grant
> > application.
> 
>  I wouldn't say no to that! We actually also have sponsors that could
> contribute more. I guess it would have to be routed through the Buildroot
> Association then.

Totally agree: it's a great idea!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
