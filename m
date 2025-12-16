Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980F8D609C3
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 16:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 389FF40BCD;
	Tue, 16 Dec 2025 16:20:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5cMojVIwU1lL; Tue, 16 Dec 2025 16:20:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7D4640BBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765902012;
	bh=BZLS0TcuB0f0p1zGiOxsb4k1mFUKqCe9gX6VudGJvkA=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=BDo2b5l/i1VwH8nfjuq50LjC+rv6TB2pgMY4d4YRo5CT7MOcIdG+tZusP57HAOkRs
	 djBh5hPoDJcaiwMO41eWhf//ydBo7XbaQco0x4DohRJ89jJB3lW2KJ1SlsaIat+2jJ
	 OTS2BUosSY5/rPp5ld1bI6PhotXyJVoGdCn6MmrdpqVzSPtHiKh4mdtg6cqkA1QdZD
	 0fw6rE+ql7OCySn9+gGxrHM4SAXoq9sPLJKVx9fcRwGzFcjE3w5WSV+2BLcgeckGlL
	 3weBIhCBtOuQKOdEcLspbx0fne212SmGmjn6U7LuFdI1xaf8zYKRyu5HZVXABR3HRk
	 zOWFgE/kZVQGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7D4640BBB;
	Tue, 16 Dec 2025 16:20:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 77A3B151
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 16:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 691F780FB3
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 16:20:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qXx16VtLy1X6 for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 16:20:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6444480FAA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6444480FAA
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6444480FAA
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 16:20:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 333324E41B69
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 16:20:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EBADF6071C;
 Tue, 16 Dec 2025 16:20:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 12F85119A9006; Tue, 16 Dec 2025 17:20:02 +0100 (CET)
Date: Tue, 16 Dec 2025 17:20:02 +0100
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20251216172002.416d7d20@windsurf>
In-Reply-To: <87zf7i5vg2.fsf@tarshish>
References: <20251216135633.1413876-1-thomas.petazzoni@bootlin.com>
 <87zf7i5vg2.fsf@tarshish>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765902003; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=8AI37bHtI9KvubUz4Fy2urRFsmTvfJa+L83cn8h6vxU=;
 b=SPplR7N23M8m4/sjJVXUe6Ch8K95Uzxvnx7wvRHMKwtFLkijOaAWBV3RD36mwOe0MZGkvk
 yr+79xhYg4VDg5zCSDlhGg3TOTjnxQL72lRwAMj8LhoR9/43sBIivhsJcMG4DusqWj746l
 T+VCmdDsBoyS1CjIw89BXh1U0jEt1axggJSikDlEayhBbHXK1vJbgaFwZVH+fHfeWCKDJc
 mGgqqfmdK8UXzQfEPQsEtahkMFETfpV9Hml7siUwJlUW8YWH077imzzxjCk05mzlAu0zpQ
 cAETcDfUovZXtIR/LNaxiBZSbiTOP7ETJyVKnuLGlH1CDHfMgBAo9AcO8EP/KA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=SPplR7N2
Subject: Re: [Buildroot] [PATCH] package/connman-gtk: remove package
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

On Tue, 16 Dec 2025 16:54:05 +0200
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> Bernd posted a similar patch a few days ago as part of a larger removals
> series:
> 
>   https://patchwork.ozlabs.org/project/buildroot/patch/20251213202503.1348845-4-bernd@kuhls.net/

Ah sorry, didn't notice. Will mark my patch as Not Applicable then.
Thanks for the review!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
