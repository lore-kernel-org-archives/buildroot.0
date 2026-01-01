Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4E6EED609
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 14:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 060AA60AA1;
	Thu,  1 Jan 2026 14:08:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 27Xsmffiw53Y; Thu,  1 Jan 2026 14:08:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A355C6070B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767276517;
	bh=jbS3EK/mXNZj3KEbSVzHUqPbPVeBr0UF4lM1N0u9djc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=amgIXCPztfNnnaVfokPHW/GjLGoyI4+YYv+7vY/GO34r4smHcuISZNrAjtHJqOnbS
	 QnOz2hgx1QlKVq1+SVlC5+4Z5XqUBzA9ZxXRwPwmeUaOYnlvtGCIEocprxV5wMAH3F
	 WLiRI79Y8GRArAEqJoi6s1fKZnSlH9b8VhCorpoybqVK+8RHw2L0e6GwQHEKdBF5H2
	 jMHY1nQtG+19dmV0bQ4OHQsGGfSRofbJO50QiMeqUtNviPivpWc5Ia9ij3D8bTWR3P
	 ukFEMPK+dZ9Ll1rXtC4m6jpzdzr9aLiQKyboQQVTYLZeD/KLYk2rzVsP6V7krHIgBK
	 +8YRbwAxEeFmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A355C6070B;
	Thu,  1 Jan 2026 14:08:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B8ACF351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 14:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FCC74032C
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 14:08:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxom8N651MoH for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 14:08:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9C6B440060
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C6B440060
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C6B440060
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 14:08:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 345774E41ED8;
 Thu,  1 Jan 2026 14:08:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DEDA5606B6;
 Thu,  1 Jan 2026 14:08:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 611A5113B029E; Thu,  1 Jan 2026 15:08:30 +0100 (CET)
Date: Thu, 1 Jan 2026 15:08:28 +0100
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, buildroot@tudorholton.com,
 thomas.devoogdt@barco.com
Message-ID: <20260101150828.20c47d75@windsurf>
In-Reply-To: <20251115154030.1746780-1-thomas@devoogdt.com>
References: <20251115135734.1532379-1-thomas@devoogdt.com>
 <20251115154030.1746780-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767276512; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=yS5TXZBnxu9XNjJOHMqYRM6KZCmnMwGAeyjtS/PJvps=;
 b=tfVyOPCrSmagRv3nKihtk0usN1KoYZUHeHv9X7pPRorYgI+NTPiZRE8gifYcNcW6N6j129
 JPKPdUHd4ORVsiXNU7yvKMykyMPBKOB8voklMlhIkoDs7blwMr3KNTPpkc+0HNJ5qwf0ux
 l9rYcBZr/wpvTkrl5SHskVv/Ev10smwDT3vGOWaBP+JFVhXOoNUuhBd8VtOhS1SN5XFldD
 GsCtX3qJOWXNN8hkijDEaPZP9PxMNvu+22EqxE7oBLC+DcqTfDmB2uRmYGg1+wFeOTq1fk
 J42ROfmLIauKaOX/7ISROO6NiUk70MSVW6pUkuR6HymGog2xh5O1OsgyqlIOog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=tfVyOPCr
Subject: Re: [Buildroot] [PATCH v3] package/openjdk: allow compiling without
 X11 support
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

Hello Thomas,

Thanks for your patch!

On Sat, 15 Nov 2025 16:40:30 +0100
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> 
> Added patches (17.0.12+7 and 21.0.4+7) to allow compilation
> without X11 support.
> 
> 0003-autoconf-libraries-drop-the-need-for-X11-in-headless.patch
> is only needed for 21.0.4+7, 17.0.12+7 has already this commit:
> https://github.com/openjdk/jdk17u/commit/f97ec359ec688346956c29002edb28703d3ba032
> 
> Next to that, add a new option BR2_PACKAGE_OPENJDK_X11,
> to allow compilation with both head and headless support.
> 
> This commit also fixes the wrong patch folders which
> should have been fixed in commit 475c79d
> "package/openjdk{-bin}: bump versions to 17.0.12+7 and 21.0.4+7"

This point should really have been part of a separate commit. Indeed,
this point is a fix for an older commit which is in our LTS branch, so
we will want to backport the fix, but not the "build without X11"
aspect. Generally speaking, don't mix up different "topics" in the same
commit.

So I've split your change into two commits, and applied.

Could you have a look at support/testing/tests/package/test_openjdk.py,
and see if BR2_PACKAGE_XORG7=y can be dropped from the test
configuration?

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
