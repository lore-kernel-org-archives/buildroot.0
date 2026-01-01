Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B0EEED603
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 15:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D590407D5;
	Thu,  1 Jan 2026 15:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XxL8rVifMCCI; Thu,  1 Jan 2026 15:01:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 617024070C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767279691;
	bh=dk5OIkxtQ30NlhB8bfW0EENUiy7c00jJ27GkkjUvqaE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oAqGa5hdNvSFCzRnjPCKfbGtt6ej0x/tMJd3CL1GwhRGjReOfdn2CGpeKOpFwntOE
	 GGh+ZA+HgjWuciHI8Iq+BdGsbxtg4Vb7zrgbXuzGQ6dO3+mAC7+9j8iEZIhrYrUThO
	 XbKevPh2pLi4WIRtZwKq8zBymoKDTewfyWXncsCMwgNdEpwtZsWJ6+afaDODUJSRTF
	 x6IcMtI42E6x3T6AWqswjY9CHo2zGhQKMxWm9f1AD2a8RwF20a4ZnNjt7EpDUWYATh
	 +lD5HwY7PXOxbpHOWQY5Shf6ImYczzZXxdZek7T8xM1uh1Y1W9n8lv7UxhXJSnhSJ1
	 bT/XlTaaRUt9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 617024070C;
	Thu,  1 Jan 2026 15:01:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 30BD0351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B24A4070C
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2injc7S9vxbn for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 15:01:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2F658406B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F658406B1
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F658406B1
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:01:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3C8021A259A;
 Thu,  1 Jan 2026 15:01:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0A117606B6;
 Thu,  1 Jan 2026 15:01:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EF8DD113B029E; Thu,  1 Jan 2026 16:01:21 +0100 (CET)
Date: Thu, 1 Jan 2026 16:01:19 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <20260101160119.16a2ec03@windsurf>
In-Reply-To: <20251026143916.3901096-1-bernd@kuhls.net>
References: <20251026143916.3901096-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767279684; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=pMFTActX8i1J2s1bFyd1DesP17KgwxDcnLfqvikq3a4=;
 b=AreEcUeIP3vAQiiT4z7kjhZQ3uIsZhe0xSTufjX+T2/2bebScDEhTkHBzceZFFTazI3qr9
 rKPd9ipwXEq0Po1Kix8EhNkpGDfwOiHLaoy1qSn4JesGhc3yQJTMVeLVAyMhGZmxlXQjJr
 ynf9Vq3KJ3AtJeqNELWYQXEQcw/irXoWLlQNtLHGFG84zpK6CT62jEV8j6EOkfcpVCzOQA
 fpW8gAj/zrDvzuyqKcrOnlvE/SICX3e6IcB37Trw+04u2j0M/PAYrv67ipvFuS12RVXYwX
 MyV+SeTpYCTtpeSRYPVxnzC12hIlWgA8iYTtSH0izd+cE6bOz1a/T0QmDdMJ9g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=AreEcUeI
Subject: Re: [Buildroot] [PATCH 1/1] package/libdill: fix build with gcc-15.x
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

Hello Bernd,

On Sun, 26 Oct 2025 15:39:16 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Updated project URL: https://github.com/sustrik/libdill/pull/228

This should have been a separate commit.

> Adding -std=gnu17 was recommended in upstream PR:
> https://github.com/sustrik/libdill/issues/229#issuecomment-2865524080
> 
> Fixes:
> https://autobuild.buildroot.net/results/1a5/1a5e9d7df6c83a921cae39b4dc4b601be4d18e36/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I wanted to test your patch, but libdill doesn't build for me, even
before the gcc 15.x issue, I get an issue during autoreconf:

configure.ac:59: warning: The macro 'AC_PROG_CC_C99' is obsolete.
configure.ac:59: You should run autoupdate.
./lib/autoconf/c.m4:1662: AC_PROG_CC_C99 is expanded from...
configure.ac:59: the top level
configure.ac:210: warning: AC_OUTPUT should be used without arguments.
configure.ac:210: You should run autoupdate.
configure.ac:119: error: possibly undefined macro: AC_CHECK_LIB
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.
configure.ac:127: error: possibly undefined macro: AC_MSG_ERROR
autoreconf: error: /home/thomas/projets/buildroot/output-dill/host/bin/autoconf failed with exit status: 1
make: *** [package/pkg-generic.mk:262: /home/thomas/projets/buildroot/output-dill/build/libdill-32d0e8b733416208e0412a56490332772bc5c6e1/.stamp_configured] Error 1
make: Leaving directory '/home/thomas/projets/buildroot'

I would suggest to drop the package. Last tag in February 2019, last
commit in Aug 2022 (and it was following a patch submitted by Fabrice
Fontaine), and before that previous commit in 2021. Lots of issues
opened.

So I think dropping the package is the right thing to do. Do you want
to send such a patch?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
