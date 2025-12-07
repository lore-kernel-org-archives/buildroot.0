Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A0DD1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 17:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88FA081338;
	Sun,  7 Dec 2025 17:00:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6vELX2-XjTOq; Sun,  7 Dec 2025 16:59:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A75078133F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765126799;
	bh=G6lPtmsuKdG1bKyGcJoHFSdMxn1wukHrTgKm80pnF4E=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=osGqROZp5CdNA7wNvYNM74Dg0VejA8DMST85zUugqSmUDaPkNvJVaLyWRpa7lTc0G
	 m6dgFi6MVt41oD5fW964uskqJGU7hqrVpN4DkpOZ4KqCCMqYI+pawLWBxbYrGuE4IJ
	 uDJAXAi5O+82PzuiYt5qRP/AmHhEN6xxTvWVA3lYGQ/NDFFQQH3GyKo+qLcFr7CvYi
	 Xhp7M1sW+ZcPbRxNMj2h0I/NsijNbe5ibEd2MYv6a6WC9qq95ARhv4BDeUelBz5IpE
	 nkj5sMh3nq92fRR2Pxdo3UI7xscKZaqWtSHnnxid3AWGxC2fjyxkcy0Ys4I8BZy4k3
	 mkbASrdLtmY+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A75078133F;
	Sun,  7 Dec 2025 16:59:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DB552CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 250FE40584
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:59:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qVLtWLMcqTTa for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 16:59:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 35F834063B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35F834063B
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35F834063B
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:59:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 844894E41ACA;
 Sun,  7 Dec 2025 16:59:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 558A1606D3;
 Sun,  7 Dec 2025 16:59:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F05DC102F244B; Sun,  7 Dec 2025 17:59:52 +0100 (CET)
Date: Sun, 7 Dec 2025 17:59:52 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Christian Stewart <christian@aperture.us>
Message-ID: <20251207175952.1c5ee06f@windsurf>
In-Reply-To: <20251127194225.2405068-1-bernd@kuhls.net>
References: <20251127194225.2405068-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765126793; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=QQMJxqv2Mmz4HgxlX0/2m+Pki7FtbpzIl2sXVFA4Xw0=;
 b=fRfMxP8pU9boTXZBDC/P1qantk+3UY/Bk2vMSqyd8VTiO35CDPNefDEFcnuUTstrwAV5u3
 ztQgJMNvSYbfK0J59o7jERwNqjjK/9qmCBboKZl0spDJHYpGwEqF04ztpuqCVdoGfbifez
 nGfhLDbAn1n3HaGnj+IML+aPtritDnrYv0MNHrkC2aP3tDE6ielIIGC6OLSGS86paalvic
 KfG3OphVOHU2SH7t4/FDa3onsItspr1Kq1aDdXq23hprVUI90kJmLsLh7huYJT2pdxlUod
 bMq0h54zDRLTTKIt0bXf22t/lmr3VLaMgNNdzNla/1CEMKfWFRovw0BVgUT72A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=fRfMxP8p
Subject: Re: [Buildroot] [PATCH v3 1/1] package/unzip: bump to Debian patch
 level -29 to fix GCC 15.x issues
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

On Thu, 27 Nov 2025 20:42:25 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> unzip currently fails to build with GCC 15.x. We're already fetching
> from Debian, using patchlevel -27, and it turns out that Debian
> patchlevel -29 has the GCC 15.x fix, and very few other fixes:
> 
> unzip (6.0-29) unstable; urgency=medium
> 
>   * Ignore invalid "Total number of disks" field on Microsoft ZIP64 files.
>     Closes: #661956, #1064000.
>   * Drop conflicting declarations of gmtime() and localtime().
>     Should fix build with gcc-15. Closes: #1098043.
>   * Fix zipgrep handling of escapes. Closes: #1054628.
>   * Stop using update-mime. Closes: #1072396.
>   * Add debian/source/lintian-overrides for *.a files.
>   * Do not trim Debian changelog.
>   * Add debian/salsa-ci.yml.
>   * Add Vcs-Git and Vcs-Browser fields.
>   * Update Standards-Version.
> 
> unzip (6.0-28) unstable; urgency=medium
> 
>   * Drop debian/source/lintian-overrides, obsolete since version 6.0-18.
>   * Update URI for Info-ZIP license in copyright file.
>   * Update standards version to 4.6.2.
>   * Run wrap-and-sort.
>   * Update Homepage.
> 
> So let's just bump to this patchlevel version.
> 
> Note that the .dsc file link in the .hash file was wrong, it was still
> referring to patchlevel -26.
> 
> Fixes:
> 
>   https://autobuild.buildroot.net/results/d81cb9d7c9e87dd233dde350d15cb03427ba2036/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Tested-by: Christian Stewart <christian@aperture.us>
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> [Bernd:
>  Updated _SITE from /debian-debug/ to /debian/ (Baruch)
>  Updated comment of UNZIP_IGNORE_CVES to reflect bump.]
> ---
> v3:
> - updated _SITE from /debian-debug/ to /debian/ (Baruch)
> - updated comment of UNZIP_IGNORE_CVES to reflect bump.

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
