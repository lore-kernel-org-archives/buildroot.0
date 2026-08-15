Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E15C5CFC1
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 19:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C12680DF8;
	Sat, 15 Aug 2026 19:38:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jofDYJh_fDVU; Sat, 15 Aug 2026 19:38:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3648880E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786822726;
	bh=uCjUrSCrKEfUbVDzYKXL6QfHz+59HwFhFfwnoQFmH+U=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OlBoFMafal/k3h0ZX9MFRl4p1cZAekG/pnu+f0tbHwH3GIQZ12jpvTV+2TldFjFbM
	 j9heE5VyDA80EuK8icFVQXZUCZLEcCUUx9zHeut4020w8k8P2qLp/0ELskfnHNQ0ea
	 z0w1ltlrvmbQluJWlHrTWUdY1TnYEGXeoZeLBwZH8B+EV8pyOzLL/bvYF6DWSc/Fkg
	 liDOneOsO3AiowpsxoW6c+sDMVsHjWQgVyPpWzzLIXwhmi3FvexcTLidxfHjxE/NpJ
	 uTuwBHvX0NbIijMmwwxzFdvFRptuSpmOXgJo7DE1o6aTaDt0Vs1LFICzL5/uobR6xw
	 mbiUbxbz6Fa2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3648880E0F;
	Sat, 15 Aug 2026 19:38:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B5D47333
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 19:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BCA64008C
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 19:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pWFOVqsHry6H for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 19:38:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A91024006F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A91024006F
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A91024006F
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 19:38:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D0C3B1A167A;
 Sat, 15 Aug 2026 19:38:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A465A604AA;
 Sat, 15 Aug 2026 19:38:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D9E3111C4F661; 
 Sat, 15 Aug 2026 21:38:37 +0200 (CEST)
Date: Sat, 15 Aug 2026 21:38:37 +0200
To: Andreas Ziegler <br025@umbiko.net>
Cc: buildroot@buildroot.org, Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <aoC_7t65PJ5NLjlc@windsurf>
References: <20260709110822.305873-1-br025@umbiko.net>
 <20260709110822.305873-4-br025@umbiko.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260709110822.305873-4-br025@umbiko.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 03/11] package/mpd: reorder config items
 based on order in meson_options.txt
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Andreas,

On Thu, Jul 09, 2026 at 01:08:07PM +0200, Andreas Ziegler wrote:
> MPD has 99 configurable options; of these, 44 are exposed in Buildroot's
> Config.in. Sort order and grouping of these options are different within
> the MPD project and Buildroot, which makes a comparison difficult.
> 
> Reorder entries in Config.in to reflect their order in meson_options.txt.
> Also update at least some of the help texts to more closely resemble what
> is published in the MPD manual.

Thanks for your patch.

The Buildroot policy in terms of sorting options in Config.in is
rather "alphabetic ordering" and not "whatever order is used in the
upstream meson_options.txt or configure.ac".

Note that it is very possible that alphabetic ordering is already
broken, in which case it would be totally OK to fix. But we will
prefer to keep alphabetic ordering vs. meson_options.txt
ordering. This is most notably to have a consistent policy between all
our packages.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
