Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0E8C433FE
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 13:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B067740543;
	Wed, 26 Oct 2022 13:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B067740543
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sty5dZ3L_CyE; Wed, 26 Oct 2022 13:51:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD1134052E;
	Wed, 26 Oct 2022 13:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD1134052E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 508BC1BF5B4
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 13:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F339E81263
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 13:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F339E81263
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sMkteLSLtFQs for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 13:51:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C68C381251
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C68C381251
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 13:51:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 03F001C000E;
 Wed, 26 Oct 2022 13:51:29 +0000 (UTC)
Date: Wed, 26 Oct 2022 15:51:28 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20221026155128.104059e2@windsurf>
In-Reply-To: <20221009153521.12444-1-romain.naour@gmail.com>
References: <20221009153521.12444-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666792290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1vMlu+pCAvZHZGkeC81SqbUCtWovY5gNXaFTn9O+bYk=;
 b=hbydrTVuVF6RW8PPelbQEY+WzrlgA+1LCaOZ3X0HfttPvGnT/ANfmxxCaiTHtActQeBzPf
 DPl8eBnpRncdIXzThLLGuXBn7W8KMOJHQug70FSKZ747EUbp3nNnp/D+HsQumJY9uSN4kI
 nvgBZi++TEWqM1rMBIiY3Dk/eqSsTqVMCxjlSUGkKOlh0hpkCPp5slwovhE1/W2TQUYDBr
 ewiVxpg5XVsnTeTW68CDfQ8hUcY7p3fNedSGuaJqTlTJVSgssuXdvi8LBiNxFBw8fEjvxF
 62m3YV/0Ju0GDQr05EYqR6cKLUjYwF07PPfJIap9XATdk6xNHJhdbfyiIxCMAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hbydrTVu
Subject: Re: [Buildroot] [PATCH] package/glibc: Fix x86_64 builds with -Os
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  9 Oct 2022 17:35:21 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Backport upstream commit for x86_64 builds with -Os reported by [1].
> 
> [1] https://sourceware.org/bugzilla/show_bug.cgi?id=29576
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229902
> https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229956
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  .../0002-x86-Fix-Os-build-BZ-29576.patch      | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/glibc/0002-x86-Fix-Os-build-BZ-29576.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
