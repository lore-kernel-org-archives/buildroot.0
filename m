Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B3FEFCD61
	for <buildroot@archiver.kernel.org>; Mon,  9 Mar 2026 09:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B82D483281;
	Mon,  9 Mar 2026 09:14:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7VfNVKLrAt70; Mon,  9 Mar 2026 09:14:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2253812F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773047653;
	bh=5vZZT1c+KwwzhOnQ4tOH7lcSdgvQSloZWvWEORKdZkM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KxPAJB1fYVOAVqBOvmuU9cBMM2EVsl3uZwmd+qjg67z5Kvruxn1NK7vzcYKKFSXiU
	 pHUihGeByv3rdpZ5Q9pisS4bKqbghr11ctRh4vBOVwp3PlfNcJQ+aYIjmswyRklRkK
	 rZOWQzGCs83G3o89b6L6UnD49K/hRWdqWYdPD0cz5nTMDhfaea5v28B/1wJodVv7qC
	 QbVHkZeuM4mRuxhkAZ4RSJfI38yTo3TP7CX2IUpsX8CxfufZwOT8s5Tqo9atKr3h40
	 IULpzefm0sDmSkqB/sdE/LU76Alpd1F3yxLw32X5kLGpMrwUcynTAs3nrNjIo6Okf9
	 B9cO4BOJKvnMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2253812F1;
	Mon,  9 Mar 2026 09:14:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 04D3C358
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 09:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC484812F1
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 09:14:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V0om5bf9fr2b for <buildroot@buildroot.org>;
 Mon,  9 Mar 2026 09:14:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 09F5E80C97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09F5E80C97
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09F5E80C97
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 09:14:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D6D164E425DC
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 09:14:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AD9625FFB8;
 Mon,  9 Mar 2026 09:14:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 42F29103698AF; Mon,  9 Mar 2026 10:14:05 +0100 (CET)
Date: Mon, 9 Mar 2026 10:14:04 +0100
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <aa6POBcIqxvNmWDw@windsurf>
References: <20260309070741.34152-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309070741.34152-1-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1773047647; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=MVoMbZQ8TjAkqYrpKzEeXrsa0Eh4rtP2e92QuXWrPsM=;
 b=F7p/Www8wV+lWWVElIQpCuJEXnZmO/SBvC5X58oT5sSw6Tm9FEfzZ5IHp8gYwd+PQh2spr
 sV35Wt3vQLYuI71AEqrXxRf+IVPfva4Kh7F7wU7QtfE6RONhem+gOf4p0PcLT6ORl2oHvS
 u0BpZ+vE7VacIZFinbXbPfTvt+I20tkdCiHDGpylttslbDLTswFmZTcqohuWLDLYAvRvVR
 2q/ifVPNqTNb2B5I3Tl4wyxDjQwKYUuEHxaPp1s8cZIcmaIaimq4302JCqPiwPzGRYeYfp
 pWLExJB/ZSK0HZmJs6GYUdBz2G6VwvcZnENSCzPM+wPzmoB63SlqQM3iSWiYvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=F7p/Www8
Subject: Re: [Buildroot] [PATCH v2 1/2] package/which: fix getopt implicit
 prototype conflicting with system headers
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

On Mon, Mar 09, 2026 at 12:37:40PM +0530, Shubham Chakraborty wrote:
> Older C standards allowed empty parentheses in function declarations,
> but modern C (C23) treats extern int getopt() as equivalent to
> extern int getopt(void), which conflicts with the typed prototype
> provided by system headers (e.g. musl's unistd.h).
> 
> Fix by providing the full prototype in the non-GNU fallback branch,
> matching the standard getopt() signature.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Which gcc version broke this?

> diff --git a/package/which/0001-fix-getopt-prototype.patch b/package/which/0001-fix-getopt-prototype.patch
> new file mode 100644
> index 0000000000..af9597242f
> --- /dev/null
> +++ b/package/which/0001-fix-getopt-prototype.patch

You didn't take into account my comments on the patch formatting.

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
