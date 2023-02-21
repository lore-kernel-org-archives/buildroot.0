Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC4FC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 20:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 714D4403C7;
	Tue, 21 Feb 2023 20:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 714D4403C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RnawkivuRZKj; Tue, 21 Feb 2023 20:35:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA0C840169;
	Tue, 21 Feb 2023 20:35:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA0C840169
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 422A31BF3F4
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 20:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AB8881D70
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 20:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AB8881D70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L6cqkMO29SRZ for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 20:34:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDE7281CA3
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDE7281CA3
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 20:34:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 805C75FFAB;
 Tue, 21 Feb 2023 21:34:03 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 21 Feb 2023 21:34:03 +0100
Date: Tue, 21 Feb 2023 21:34:03 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230221203403.GH2718518@scaer>
References: <20230221142144.1503123-1-fontaine.fabrice@gmail.com>
 <20230221154827.7e737960@windsurf> <20230221200857.GG2718518@scaer>
 <20230221212634.736f8d70@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230221212634.736f8d70@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1677011648;
 bh=+D/qYyXsFYNuVTAE1DoT+OHC/g9TlJnuupvzDl0VWJI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AhFKS6txyWm+Ropqi+/agw0P0yZZ31kQzNMGxunXzA7Nm34wHtNeMEvIwCNCm/YIf
 byaq0IBE/mFtpOd1aQ7m6Ayajj7tZAJMcVdEOSjAx2fwozCDnvkDuVlloMuVSWt5mY
 kAj0kL1NbY6F8WUTsQlRa3BZdzWTN/jmujyN4lSshbOzxdHHELiFk6zzxQkR94QLSw
 O4ToSlKZK6KZSj0DGeMnpytx5I0CF2y+5Dq2wxcWgyzHoA0aIY/LgeRcgx0yU8U8Um
 Az3PppUQy/r3W2CbydSwFYqbyivnjlG3Ai2MsXDjcubo827Egd9N3ieFR6xd9D+McB
 sa3Ag4MAmltwA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AhFKS6tx
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: disable with -Ofast
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
Cc: Norbert Lange <nolange79@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Sen Hastings <sen@phobosdpl.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2023-02-21 21:26 +0100, Thomas Petazzoni spake thusly:
> On Tue, 21 Feb 2023 21:08:57 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
> > Alternatively, as the upstream commit also implies, maybe we should in
> > this case keep -Ofast and just add:
> > 
> >     SYSTEMD_CFLAGS = $(TARGET_CFLAGS) -fno-finite-math-only
> 
> But the upstream commit causes the build to bail out as soon as -Ofast
> is in the CFLAGS, so even if you specify -Ofast -fno-finite-math-only,
> systemd's meson machinery will bail out.

The upstream code is (split for readability):

     if (('-Ofast' in c_args or
          '-ffast-math' in c_args or
          '-ffinite-math-only' in c_args
         ) and
         not '-fno-finite-math-only' in c_args
        )

So, if -fno-finite-math-only is in c_args, then the whole condition
should evaluate to false, and thus it should not error out, right?

Or did I lose more than my grep-fu? ;-)

Regards,
Yann E. MORIN.

> So your other idea of:
> 
> SYSTEMD_CFLAGS = $(filter-out -Ofast,$(TARGET_CFLAGS))
> 
> certainly looks very relevant.
> 
> Fabrice, could you give it a try?
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
