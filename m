Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B30EE9D40F
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 16:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49D9540288;
	Wed,  4 Feb 2026 16:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L6MMNAdakQHQ; Wed,  4 Feb 2026 16:31:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AFB040308
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770222674;
	bh=oJOk40HjZcZByMt68ku1BQcdyhkM/cZuFTRSI5s8wvI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LEb7hUCv+uP6MEbBlCTfguaQyZaP5B2G3JYeL4QcT3uNP+zjd994KaqgNUAOcRt5L
	 aZlh9o+zKCa2SWAaeRugIcbwODDSdi348Kp+9iyTVf5RzFlnT5NI+BoPpzyhhgpIVQ
	 223KsRZrr7oYXN+DQGBcsZpOIbvw3fHMrYVBahghqycUtkWI4H7P2mlY2FRt2Y6q/+
	 i8ENAkndvbGfPm0QXxFU84Bk/mzSQVC9TbY8mar+2cPVkKmLb05CEC5PTZrgZPGEzh
	 hy0fKJfyn9zGuhq21VK8dgqs5LCXYfe9teGWNVrzFKqUf8Yk6T48kKmSJbp1OVn0/S
	 OHcCwVHRfsUWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AFB040308;
	Wed,  4 Feb 2026 16:31:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 080C6F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC48A405B2
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:31:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i7tJMoOSZTEe for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 16:31:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1E576402DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E576402DB
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E576402DB
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:31:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 67572C24381
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:31:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6FBBD60705;
 Wed,  4 Feb 2026 16:31:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 03430119A865B; Wed,  4 Feb 2026 17:31:06 +0100 (CET)
Date: Wed, 4 Feb 2026 17:31:05 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Steve Kenton <skenton@ou.edu>
Message-ID: <aYN0FCJgVOBGkRxA@windsurf>
References: <20251206214415.2307196-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251206214415.2307196-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770222668; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=vpflxs+bdi1oJC4frFKNLRLGh27k9mfb3gKxV6JF+ok=;
 b=178oq4rWkP9Kd55STyIgR6rI6jh1EGgt6jdKi4Kx8zhNsw1jNkzidg7ZFwvgib4U7nwq5g
 St4FTdQlI2MdVqQQQSip7doUMJTiaS9V71mE+OW+EC4RfvVc4C5j23N4qZB+eyTt1KDaL1
 vb0aonnoCU/VwAZOH+2Er5Zie44zfDycSu0MdhZF0ZDIgi5dwSWHatJ3TI4d/1sax7gw4R
 k9VNyhOK45KD/hhsNqgOJvEjdhsc+JDwrPTXdTnu63jGCq1JbmylcxlXTLpb8AIP6Mv8MC
 dom7mRBfqfRlIespr3m7VW2hoLK2MtNM9pqP+EHdazeDUj+cql37iiBKnZHzXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=178oq4rW
Subject: Re: [Buildroot] [PATCH 1/1] package/dvdrw-tools: switch SITE to
 snapshot.debian.org
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

Hello,

On Sat, Dec 06, 2025 at 10:44:15PM +0100, Bernd Kuhls wrote:
> Original site returns 404, according to archive.org since June 2025.
> 
> Fixes:
> https://autobuild.buildroot.net/results/94e/94ec9719b33a1b3a406f2e41dc3ad8f443bf2dc1/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks for the patch. However, when you have to use web.archive.org
for the website and Debian to get the source, it's a sign that the
project is really dead. And the use case for dvdrw-tools in 2026 is
pretty dubious, so instead we've decided to drop the package, which
was committed a few seconds ago.

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
