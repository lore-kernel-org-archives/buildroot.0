Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EFACD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B44861681;
	Fri, 29 May 2026 18:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ExePBxQcZ-XH; Fri, 29 May 2026 18:59:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B03946167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780081157;
	bh=gTRRaJ3f7HGAN4K7c5yA+7i1LWrWmMeu+e3JJJbrdhw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qIP8GaylEgTUje2U5Q0A3LRYYFZfGa3ibV6j2Nq4H9xVBmD/Yc0GK85c4bBu62WbG
	 B15qQO6sLD4pT68caCRHq65kqNwtpw5sCtBibMopFsO+RY5uhUSeaoK8Ms4zZofCtL
	 hwNA8fYrsbOLQ1c3vCDrRGFjUtGVBOMgHSLn2nKgKR8jOSjqYiIckAl6Z37/VwJATh
	 2VRHDgP/xUeb1DfZWECwr9AWTq+RP1KEiRdNWX4detf8nAaIeXTkASuF+saq05LqzX
	 zSrmhUHr8W3JGKL+TEH5gCbDl363iHYvjD6p846sx/l3rrrf02oJc4GQs4eljFEaVx
	 3ygsRt4i6gQ9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B03946167D;
	Fri, 29 May 2026 18:59:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BEBF7D3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9A83846CB
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EXZFdgnz3xGJ for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:59:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C303B846B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C303B846B3
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C303B846B3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:59:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E2F1C1A373C
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:59:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BA36A601FA;
 Fri, 29 May 2026 18:59:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 181D910888650; 
 Fri, 29 May 2026 20:59:11 +0200 (CEST)
Date: Fri, 29 May 2026 20:59:11 +0200
To: Daniel Palmer <daniel@thingy.jp>
Cc: buildroot@buildroot.org
Message-ID: <ahnh6Z__bUk8a5Uh@windsurf>
References: <20260419054645.2019170-1-daniel@thingy.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260419054645.2019170-1-daniel@thingy.jp>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780081152; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=SB7F3W6Vs4887QKIh0rQnjcGavBPvqOc5XfDyUTpqYY=;
 b=fj4GmrqRPwDAl3+etWitKvKA4ZkvxJQ19ypSUEik87JWTgtoREudrheOWgyYjXc/LAJLgA
 FHH8pb7DTJZhep6MEjAM5X7PTa1YqnxmxruLsXXbbNr4mjeXVWaSOHWNmeGswasMljsPmV
 N0aRK6iwWxwsgaza/8ocQzMQkC9Wa81qWUdVnD7nFtTkhaOBt44EkALCwJcPMb+s22lTas
 aSoC4YSTXNJJZ5QVCAeYHVE+UzlQKGMWxYIHGiAXdBBtDvh0asyeXGBoBuoW7eI3F0iEC3
 dVUDZ6y0mFxkFiF9U6qezpkYOl+PmcAdpYdab9m37ESPOXknOJupJ0Dg+czleg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=fj4GmrqR
Subject: Re: [Buildroot] [RFC PATCH] m68k: Add 68000 nommu support
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

On Sun, Apr 19, 2026 at 02:46:45PM +0900, Daniel Palmer wrote:
> Everyone thinks they like ARM but secretly they want to run
> Linux on their Megadrive[0].
> 
> Building a working toolchain/userland for nommu m68k is a bit
> difficult because of the bitrotten tools all over the place and
> one big issue is GCC generates code that uses unaligned
> accesses that will cause an exception on 68000 machines if you
> aren't careful.
> 
> Buildroot can easily create a working toolchain and userland
> for nommu m68k so why not?
> 
> 0 - This isn't a joke, I'm working on this. I have u-boot working
>     on the Megadrive, Linux is already working on a bunch of 68000
>     machines and I just need to get everything a little bit smaller
>     to get into 4MB of RAM.

Have fun! :-)

> 
> Signed-off-by: Daniel Palmer <daniel@thingy.jp>

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
