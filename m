Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD953CC6B1C
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86480406C9;
	Tue, 13 Oct 2026 17:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mM-TtNfdSL5B; Tue, 13 Oct 2026 17:55:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 87B90406D4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914143;
	b=FvuPzjaAeQcdd0hJ4bNQwWSW0NzB33o5LQMPLGcPT1lxo8nWJA6dWXKo6HuJnpBI9xaj
	 qpUbnnzfoeHNQ1M5pbzZMsTlJYdGcezGzmVQyW7+U+T/2PgyuNPOHuCUhZ1AdK+IIA8HK
	 jQlg70rIhOGnenToXSmCcZuhc0BdQSCujwwCYjVI4KNKBY12U/1Dm4NYP5aXPXUId+PkF
	 jl8CycnZFIgObp8dbgN9BlAOPI79Q5bIxuThg7Gg8L/n7DLOCRQaNmzQRSzgEHdPx2mFB
	 6JRgfEyTDNb8EfYaTp0kge/kPBCHxyH2Rgs1T8nm9o+rm8XBDUluRUj/GgtMIzAvTqg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914143;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7oTzgJU7GRpQpAnqIGg+oikXXJ0wM85aCWoLY2UMBU4=;
	b=KPNP97aiY9Deu44kARhhaiOEA+g8VtpIWd25RfzSlofR5OhhBZNc6VE/41T9PNBZxrJp
	 f4gT19aRhd+wjDvy7A/nhMpnegQsqsh1EZcl6q8/1zjZ5l6c/71HLg9bxQPSvPSc8QkGH
	 5UmKe5EQnLcKxG24ZeVDUbbwxbc1XlYcbz55PuAB5Tm7Lm7oT1vdC6SM8Gklh3HWrvDGi
	 IoPwiIdQXtMrQ0hh85NTo5nWCts+xS1kYYMReFjh75rEi167hmKX0PcEkgPhneZbuxBZj
	 83YIL+pThp12MnoQcLE+3WubmJ2sGapRyBEf/V+oXbhtNbelC67N+jCFdj+Mv0hSFnA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914143;
	bh=7oTzgJU7GRpQpAnqIGg+oikXXJ0wM85aCWoLY2UMBU4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FUka/x7U+QZ3mBST4SW8vcH0ocATAgs0iD4FSHEfLmCIvXgZRVbxhKHj8E23oNLyt
	 TYEuf1pi/hqR+l2lkGJMm7D6TmNHebJFzVIOCYuA0wWKLj6cAO9cpywHjliA8J+9wN
	 zpjbZ9oKfURMhaLjDz9g8MyD3rLd707Fc56ME5V22e9RTICgbxCR9Mn7t0pLzG9KZY
	 Je8143u2T1xa8A6ZkzZtadcSeynQVI6fjJsQsVaZX2RkjTUObCl8GP/p46nHLWXvLM
	 Wv2S5zMG5QDabhaC/iejMdJ5wPGA44LZQhIo1GYVG14z6EpIj9Voz4Fpt9iBZjUN9G
	 CwyZPPBVAmaKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87B90406D4;
	Tue, 13 Oct 2026 17:55:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15A91788
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFB1580AC4
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id poLPXf-1r-kq for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:55:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1009580BD6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914140;
 b=cYNXT6HXXL2zFt1z0nnBvfbpKPHlp04kUhUl6cVRXpoEiVEYxN+isarnxQ2bVRIYmAP1
 BBydaoOxr6WhnvGvYBPKoXljpg9l8+Vk3HO5jv1AwuySfVXUKlKc4218npNi5E/GRq/OR
 QB7f2GES2ATdBMnnadXDMbsRUja8BXGbK2hBTi+sM4qMh516RJPmtjBLgNJE4f/ewqHNX
 B3UdsV43ay0S8GAGm1uFMCHmwiArcNa7ZcLuVg+d5R2krPGXfbG64MxibdjTRLeJQmO7j
 lpJVl+cBBSZw+xowkpnrOSqv22egRZNyPY/2h9BD0driyTuRYPaPGFdCbj87AmMxx3w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914140;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=/GXDhaXl9d1HnWUxdWQnsVB7gVpCIuaQrF+/YmJsVhY=;
 b=gJLT49jJFKNOV6m5Aiq85eetHK43ul8GpTvchUFBOHC8eZdKym/pIaickajEYzWLX6I1
 GP1bNd1J1p2EDDJcEdHSYKMe8lyxZygEYHWeIslgPhhHd7zTECuXYbYoGl4FoVfr5r2wE
 ABz9KMRjr2fosz6pbEU7QzdojB/8XOoSr+Z2bkCVxtKULhcp2lbTdZqifUUjWD8kD7xrr
 l3tWtw+1emO//OtxrkQvl3Mba0ZdVKXUAyuHJ4PeZXS8ob2mKaKOO4bjQmsrxIa+/CCSk
 GKZe5vUpk96WFIGVAzlor1DkpVMNCcVS6QRNkhBpDLtfoGiSx61L27QC5pBXbxpiuWw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="B8zWR3+/"; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1009580BD6
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 792F41A1216
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 469AD60362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:38 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id C75F511D71892; Tue, 13 Oct 2026 19:50:46 +0200 (CEST)
Date: Sat, 10 Oct 2026 23:06:19 +0200
To: James Knight <james.d.knight@live.com>
Cc: buildroot@buildroot.org
Message-ID: <asqorJht4G52fJQL@windsurf>
References: <CYYP221MB114031C1D7D4EB72E8EDBE56A04C2@CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CYYP221MB114031C1D7D4EB72E8EDBE56A04C2@CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM>
X-TUID: eCcRsPmJ8q/d
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: C75F511D71892
X-Spamd-Result: default: False [0.74 / 30.00]; DATE_IN_PAST(1.00)[68];
 BAYES_HAM(-0.66)[76.72%]; MID_RHS_NOT_FQDN(0.50)[];
 MIME_GOOD(-0.10)[text/plain]; MISSING_XM_UA(0.00)[];
 FREEMAIL_TO(0.00)[live.com]; ARC_NA(0.00)[];
 RCVD_COUNT_ZERO(0.00)[0]; BCC(0.00)[];
 NEURAL_HAM(-0.00)[-1.000];
 DKIM_SIGNED(0.00)[bootlin.com:s=dkim]; RCPT_COUNT_TWO(0.00)[2];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 FROM_HAS_DN(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 URIBL_BLOCKED(0.00)[localhost:rdns,localhost:helo,gitlab.com:url,bootlin.com:url,live.com:email];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; TO_DN_SOME(0.00)[]
Subject: Re: [Buildroot] [PATCH 1/2] package/util-linux: explicit slang
 dependency fallback for cfdisk
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

On Fri, Feb 16, 2024 at 12:57:56AM -0500, James Knight wrote:
> The cfdisk utility (under `fdisks`; defaulted by `all-programs`)
> provides TUI capabilities from either using ncurses or slang. This
> package provides explicit configuration of enabling ncurses support, but
> not for slang. Updating the package to explicitly enable slang support
> if the slang package is available and we are not already using ncurses.
> 
> Signed-off-by: James Knight <james.d.knight@live.com>

I've applied with some changes:

  https://gitlab.com/buildroot.org/buildroot/-/commit/2e6f9749b17c220afd6f1dcbdebb037106a193ad

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
