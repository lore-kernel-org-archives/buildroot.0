Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE36C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 17:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 566E54010D;
	Sun, 14 Jul 2024 17:02:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jS08to0stEK5; Sun, 14 Jul 2024 17:02:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B7F2401F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B7F2401F6;
	Sun, 14 Jul 2024 17:02:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 64EA91BF32B
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 17:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FEEA81184
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 17:02:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b8WZ8eur57mR for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 17:02:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3478881183
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3478881183
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3478881183
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 17:02:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 62A231BF203;
 Sun, 14 Jul 2024 17:02:02 +0000 (UTC)
Date: Sun, 14 Jul 2024 19:02:01 +0200
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20240714190201.589e7b3e@windsurf>
In-Reply-To: <20230208100704.68093-1-angelo@amarulasolutions.com>
References: <20230208100704.68093-1-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720976522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8evi5A6r3AUl/ILqasglMaAjNkSCsaPsDxMca0v5BNU=;
 b=oLSfhgzTkWi3M2vJIFr1sqKEzrIu/osQNDHPcImKM3n6+MXg52vHkeEG0R30Cv8+4zhs9V
 Bf4JZejGS5aUJRPLn85cdRk1yecgzFa8+3h4LZe5rjdsQLVj5Hxg/glRUr3cn2by88TzZG
 O+Zoa87lwgNJuFKtRBMakldRib9JA9mH05isSmAWQTk7/3aalzsG+AVE0K9uxQCDUFxMIF
 woSBQhyVlPx9TUZNQNqPWRO3EPBxFjSL4EOCvroTXpN44cy4l4bePYELcnqDMKWA1lZyu3
 bnX+4tJqV2TIpCXP2moiV9RgX9ZJkcysKIi38oMYB4sbpSWPdwzqAv6NyzWs2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oLSfhgzT
Subject: Re: [Buildroot] [PATCH v6] package/gtkiostream: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Matt Flax <flatmax@flatmax.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Matt, Hello Angelo,

On Wed,  8 Feb 2023 11:07:04 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> From: Matt Flax <flatmax@flatmax.com>
> 
> This package provides many useful software engineering and signal
> processing libraries.
> 
> Signed-off-by: Matt Flax <flatmax@flatmax.com>
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
> v4:                             
> * Bumped to 1.8.0                                                
> * Added myself to DEVELOPERS                                     
> * Added dependency on octave when enable instead of use
>   --disable-octave configure option                                                                                               
> * Fixes from check-package                                                                                                        
> v5:                                                              
> * Fixed wrong syntax (Romain)                                    
> * Added optional dependency on sox (Matt) 
> v6:
> * Fixing fomatting (Thmos P.)
> * Adding optional flag for openmp
> * Adding patch to disable testing compilation:
>   build wasfailing for some incompatible linking option in one of the
>   tests. Tests are not useful for the buildroot usecase therefore they
>   are disabled.

I have finally merged this patch (yeah, sorry for the big delay!), with
quite a lot of changes:

- Made the patch upstreamable by adding a ./configure option, and
  actually submitted the patch upstream. Added the Upstream: tag
  pointing to the pull request

- Adding "threads" to the Config.in comment about dependencies

- Handling all optional dependencies, since they don't have any
  --disable-<foo> option.

See https://gitlab.com/buildroot.org/buildroot/-/commit/fab48302865e5c0c98d91b696bc90e75e38189bb
for the final commit.

I've seen upstream has a lot of commits on top of 1.8.0. It would be
nice for upstream (hint, hint!) to do a new release that includes all
those improvements, so that we can update the package in Buildroot.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
