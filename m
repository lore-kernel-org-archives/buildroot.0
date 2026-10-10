Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14254CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 17:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84E65408AF;
	Sat, 10 Oct 2026 17:50:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q_goVs4W7u0s; Sat, 10 Oct 2026 17:50:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5F712408AB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791654606;
	b=mVSsOaBGZYTyJRNCWA3wqj6vOR2Vld/y/z8lDsCsdIQ+WEv6lqPlQOgIrDBo2PXz39kF
	 r3jLzxWXIXxdEOd6xlB3VN3qN0+kdJWkohECs3fWmpQ9tH+vyF62EsK+S1a9P0aLv1a8b
	 K4Ton0f4L10UhJM7Au9Mfe8Y4FeMzqp1BumVbBU9F6QpRVWTc56Gd8YTZcEGiT5X0+D2K
	 VXu61/AllUl0cHdes1kUv8lVvZIScCDDKYRuuggcq117zn5ForIwxMaaQG3kyuBH19vLj
	 K/RuI4lNc3hIurZDlzdIx/d6uKgGAjp9v56E9xBxsxvVtROgLZKR8Kabodq/bHCEX/A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791654606;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2L2E/CSoNbfoxFpW3TrqN+fkQkU41oY7rmKaOpltrBw=;
	b=PJqmmbBdBQ7gLVGzBbD4tTja2NkG7ytVf/nw0JKPH9EUv85lPyZ1/sZhQ16oAm31Yc6R
	 PyTk2UfNCEr89dFN2hCojqxivErbuXhRrV/A9Eia73Gme6e7gZhrDVyZnN3Ac8E97wFd3
	 xVjvFjR6qO9kMrbsyWSJRXCQXvZvLl+aK3cGJa49THG+bBT3uc8j+IVs3B4oNq2nVd5vd
	 snhGwTgRidBBWoJMTIIGXrn2RGkTH2Zi2kgOdBpWSOLQa8zLup9p0CKUSX+puKVDEOl+G
	 ALSMGSHFYPcXfuIVP4/NGXEJAtLYsOninIEoJDZHhUyjZFpcDzm2i9gNlLV0TQC0LLQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791654606;
	bh=2L2E/CSoNbfoxFpW3TrqN+fkQkU41oY7rmKaOpltrBw=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=YqtJTYQ71EZIhP+EWMDebrVWpdGDzuCuAd+YuRVG1l4S2SBWQ+UDzGdbLw9Dj0tZI
	 GBrWnxhv4ykKoDNrS0yBEvkuLlpN25fdKnabN2gPq/I1w3ETdiZy79c6t2H2kzx0QA
	 BBiF2zOdn5FQFjRoLXyfMkjU9KAeXTa5v0boUmlQuIzqqBQZDKQMjxuWfYKnc15/HH
	 T6lYHUEsUwx82B0OKToC7WsWYbnYn5Uh/ilF6BNo5B8GySnZ2ZLtRh+ieTDyVauIRc
	 xKBDvNPg2PH6b+BYE3BrNPC1OXE/OKg1aRG3JX/1QkgIXsMbtvNx9rH4vPzDm6kRwH
	 o1BogpKsm9VPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F712408AB;
	Sat, 10 Oct 2026 17:50:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E51BB22B
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5F0F80FFD
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:50:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t2E_d9XOCXBm for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 17:50:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 03A7180C1E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791654604;
 b=nZLrRjpv8uzWQzvbL3EFw7CGafCmC4jCOe/v3ELlczI6Crp4wF0puTpW6U8lbyaZb2Uw
 yIYjI4bJdZ8z2h+LYMhIHCCjAXVcQZgkajindfOK8hmQVv6fP5QKka75qspzgOFlsxuKQ
 4K4uIN2iF5F3MXgrWr8BhD4oyKZDXehID5i1PslEHbUEdgsyxPFn1aF14kZxVW6AP0Nk7
 FzitVsfwUM/KpWvf4yw+QZ+Xx2zNgFCwX3KjbIikxP6OfKheqzarhdTlRgN3XlIlrU2sd
 TVJvNhIfjbpxSFhw63CzS2HXL6Glfsrm+j5uDAu51WYU+rnwN4CDIi9/nDPECeFtaKg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791654604;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=9on7AXIHMQdQPCiSfYWFID2SW4brx+L5IPnI1/qDKVY=;
 b=CFvrT4jRPiKIx7IV/XBkBVctJPk8mzHWdUeSoT5Se2e7O2dVKVlxTvyKz+fR1P/cXaeW
 ZXwHPABTYsBhTvHAWhcLZ+V0phvZE2crRMtXHDvCv1/xBjJ4pCyftmi2pQJOqKOy8/9+g
 /xC0lw9usPWF7NuN1rsALdwhavz/K0wvYDKl+DcHcUWqUgoy0/AWEUGqGx2YGeeW9vWfD
 itGGRawCm6n1+8IvQG54iKlTRhTaE6PE6qeqvZj/5kVAO71nwpixK3FEXStNdhfSiCna+
 d2jACsz79vs2s3D6jh0bf+wRyqW8wVLIql221LxFg0fySLr6cf4KcXx1yEWS99uPgzA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=neSDFgIZ; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03A7180C1E
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:50:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3AE154E411CC
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:50:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0F10E6075C;
 Sat, 10 Oct 2026 17:50:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0F63811D701FC; 
 Sat, 10 Oct 2026 19:50:00 +0200 (CEST)
Date: Sat, 10 Oct 2026 19:50:00 +0200
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org, 
 David du Colombier <0intro@gmail.com>
Message-ID: <asp6uFDt2rqe0Gfe@windsurf>
References: <20260711111744.877250-1-bernd@kuhls.net>
 <aoHTZH3WR_g_sivk@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aoHTZH3WR_g_sivk@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/x264: disable asm on i386
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

On Sun, Aug 16, 2026 at 05:12:55PM +0200, Thomas Petazzoni via buildroot wrote:
> On Sat, Jul 11, 2026 at 01:17:42PM +0200, Bernd Kuhls wrote:
> > Fixes build errors
> > 
> > In function 'x264_predictor_clip_mmx2',
> >     inlined from 'x264_8_me_search_ref' at encoder/me.c:231:30:
> > ./common/osdep.h:455:13: error: 'asm' operand has impossible constraints
> >  or there are not enough registers
> >   455 | #define asm __asm__
> 
> Is this a gcc bug, or an x264 issue?

Gentle ping.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
