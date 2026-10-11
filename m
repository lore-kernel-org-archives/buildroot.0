Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392FACA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A123E40345;
	Sun, 11 Oct 2026 13:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_ne9SCEWjZm; Sun, 11 Oct 2026 13:27:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1BFD340355
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791725242;
	b=eqSD/fq3u3xw7sO7p70C0vvDh/5PZIUeSmn8OwTnb+0Th6dXfM5SxHLly0fvNkfZmgWD
	 WlZ761ZP8DmB3HWc5e1pqxW/SSJbu8EXhhVJOpEkkgInw8c8cNdYk0ieDmNHqapKou+Se
	 wEQdARfr9iTf8MIB3/qfIf9FcIGzhCnEYYBNIHdMnvIlc4GmG2wbuujIAiHqLTRq3e7ay
	 3jAUcvmuWInn9FKY7bKXgoHQ0VfnJ0wX5SY2+I645Ew+6t8O71wfp8KsmgJsWJLJpvQ0p
	 QY4ai56Hyg+EgCU6COD7zzfH9K4R6HQKUrvQ3TGAyf+73k/qaPL8o2+CFWeurOLyWqg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791725242;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Gy71vBM+rgpe+5/i3QlX/FCGT5jvl/+MIMVIXW1GlL8=;
	b=gyy6yKdCdEzByJV/gd1rdHBwvbXrlMyguEMWvQzmYIYIbcCjBBRFRVkSfiAjSwTUIzDE
	 4WIp9c1UmjrCW7VN9NwFxHo9et5AV67XX+/McQl0n7GDczlEXDjKMBpaY+cK/JyapsRIN
	 32kAYpwbjNp+UOh45dyKMsydDtL6qfJuNMQUg+AoX9MtHJe9OzSv6ZhpC93plF5BZIRHI
	 w0hqpyP7zi5xTrKidaoaaGFq01JmkIXsQXYZ/FPpZh9HRP5EvxqYhOjhnvwSWRBWuRXlL
	 RZ6muma4mWELUIa65GhAZShOKlp4QW7AgkdCdiGOS/+7C7jUQ5nq7zR03OTMqrrENQA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791725242;
	bh=Gy71vBM+rgpe+5/i3QlX/FCGT5jvl/+MIMVIXW1GlL8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=f6M1qnNYeU4LPrGG68sM3B2XyGBehD2us/a/XOr6Hi7GVpd/pwrcUgLtpQ4IT5ZRC
	 P0tbZgmXMPKkpV1M8U37j5Hfn248vqTPaVeMv7wlCLm+oXceKZjEh97gGpawuIFEyY
	 eyh9p36FIg0Dj7P55oldZUZPkvFGS6exRNjjCXSZdfTZVWfyBDRzuVcslC/HQ2Uiuo
	 0nsEAWRA/BWVPQ4EaDitmuJK0RdQ2pWogpeeleBefGo8FdgyH2KRV/Tapf0ZBD+hpp
	 mv3SIoAO4agXISWsky2z5YMN/GO4qjDxufYIPlCmE7IMpWpsd8FzUQQuNaaoI4PgSv
	 05vYnT8sreKTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BFD340355;
	Sun, 11 Oct 2026 13:27:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 16CC41A6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1432C40071
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:27:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id utWpjlWPe6as for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:27:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8079F4002B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791725238;
 b=nSrM4fd167gFIqcV3rSrqFTbYwGU9L9kxB0/6Yu8W23ngjNuCu0LrjJpOEu6aV+uSW30
 Hq3uV/yImfgfZb5vC35EEum9xmoJcXrQmxhfW7Ry6rHpVQWSEU0hyLRturRKFdQrdilde
 2vsqlf27lTAp0CtciVWCvvy5t+OfTx/R8/ks68UuGdmXpQ0iDYh7hsHqOQK2u2Bc0nmps
 Gz6L/pgoXN06P1p+CBMbwVzOkb55TUioBouzaZDevSNZa5MN75m1DsFgTHUd1rV6X7bqY
 THzT5lnkVcyH9z6nfeAc05cmMZa/XrFk+nFUCI7VZwsXg9MEPhtRIEZTbTGtdJVFX4g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791725238;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=F66wzXFptlrX5UTLezT/bYhedGtjz9UcmyKoOWcvdNE=;
 b=T0zYmtmOV6KClAhNtyFfe8wUZdmybGs4Rw4di8fP4a7lazpIYLXxPqNqfXIpHeip24ln
 7qBWCY3KrUgt4V0CFnlfSiOFSaGKVRvsWaYdrUHKDjLC6VlJt/cnz9EKSQVX/UcCQtLxY
 8EKCfzv/iDKr9bpT3vG0iQMcF+xykQMz8UyhkZYlyx6Hc6xwxs92SwR+rfvlK2tWhjQ7h
 O5CKo5AniTTSZf5XvdccqM+y+eqiV8K7IhFScVPD0hc98tm6qwesOkmip9H8cBNz7mdKQ
 rNRGifCYyLqOfB74P/3us2+oDYj9QaBlikIyUXfjclfmEkVzCx29reRCHgeZNN2bJDg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=U+3wmH+t; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8079F4002B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:27:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D9F871A11E0
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:27:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A79B4605CC;
 Sun, 11 Oct 2026 13:27:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 01B6211D70C39; 
 Sun, 11 Oct 2026 15:27:12 +0200 (CEST)
Date: Sun, 11 Oct 2026 15:27:11 +0200
To: Vladimir Savelev <anykey196@gmail.com>
Cc: buildroot@buildroot.org, Marcin Niestroj <m.niestroj@grinn-global.com>, 
 Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <asuOrLDuwibWV9yI@windsurf>
References: <20260925165226.1502431-1-anykey196@gmail.com>
 <20260925165226.1502431-2-anykey196@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260925165226.1502431-2-anykey196@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/2] board/orangepi/orangepi-zero2w,
 orangepi-zero3: set the hostname
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

On Fri, Sep 25, 2026 at 09:52:26PM +0500, Vladimir Savelev wrote:
> Give both boards a recognizable hostname instead of the generic
> "buildroot".  The name is used for the login banner and sent as the DHCP
> hostname (option 12), so the board is easy to identify on the network.
> 
> Signed-off-by: Vladimir Savelev <anykey196@gmail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
