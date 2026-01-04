Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA32C2A06C
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 16:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63D2F806A0;
	Sun,  4 Jan 2026 16:45:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e52jAp_ZMsaA; Sun,  4 Jan 2026 16:45:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AF35806C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767545155;
	bh=zfEv9f0aIU+1ObvVHDI2spWQJWoNq1ZpxO70fZpV17s=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Stdrfr2do9x24/8uEDyJBvFYO3iGz6TWhShJ8SXKfT4YNNKVSxtJPeQ4gS/n+yc4v
	 jf4QlXckEB2xFxlXC8JR3kKIPH+czGWKcFqvuuKLXW29siDydrVzmfDqlj2LJ2GZ6g
	 V+ALff8mg+OQ2Lhmx70fHiYTppiuc0A9RvWpCs89K/kZJ1ZSdM6W+3HZ5muU/404kj
	 49a2DNjTqvWYQDlvarht9G+KVP8c29UUl1xP8+gxHhG1FFL1Dy8mNFruCJtYpNcroK
	 c7YBgTriFd1+kQL4TDJnWwKdBk9lOQxttbrPLwQKgVnAXu3/4fIpNfNuy4bInDq9XW
	 oT4NxjHZbseuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AF35806C9;
	Sun,  4 Jan 2026 16:45:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E241B249
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 16:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D43F8402B2
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 16:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 93onwd6TeQGP for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 16:45:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 100764019F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 100764019F
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 100764019F
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 16:45:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id ECE5F1A2625
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 16:45:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AB1D26072B;
 Sun,  4 Jan 2026 16:45:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0EE5F113B06CE; Sun,  4 Jan 2026 17:45:45 +0100 (CET)
Date: Sun, 4 Jan 2026 17:45:44 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20260104174544.1313e0d8@windsurf>
In-Reply-To: <20260104143240.4126891-1-fiona.klute@gmx.de>
References: <20260104143240.4126891-1-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767545148; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=m+/mTGbi/Nh82YCydEp3GaXfP0G1G/btDE4jsofcdC8=;
 b=ihmv0SXH8J2ZWZYNUWu7IGL+9nMbmlHI8Tv73PaqOwi8JstpzQPYreGtqByRJ3g10K+ytd
 8XG6S173PoWqYvxtJ5OAsK/H3+eQlAjn2NGz5aZuBTEjlcfeN6CdSOgHb2CqlbdQOEtrVG
 NnxqZyW3aQObrT8b9X4OgaO+j3fEplodqgGkgW162DwKViy5YDKZ/iE5hk5ffDQq1UFDir
 cPYlILnWDL03ZWdaawc5PhqfKOk3wsP5LMrtIsigVRmNBsFTGFxrtacdjv4pjrj/alv8la
 YZ3MPUpx61xr57JmNuggb+XmrNJ3HOmvFqn4iCIA4afWlugf3qaxP6f/074wIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=ihmv0SXH
Subject: Re: [Buildroot] [PATCH 1/2] package/python-rich: add missing
 dependency on zlib support in Python
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fiona,

On Sun,  4 Jan 2026 15:32:39 +0100
Fiona Klute <fiona.klute@gmx.de> wrote:

> This did not show in the runtime test for package/python-memray
> because that package already has the dependency, so the Python zlib
> module is present in the test.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Thanks for both patches. Since those are fixes, could you add in the
commit log the details of which commit introduced the issue/regression?
This always helps our LTS maintainers to figure out whether the fix
needs to be backported or not.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
