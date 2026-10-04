Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82CCCA5FEC
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 19:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89D6E60706;
	Sun,  4 Oct 2026 19:17:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VSlTuCSGlVbu; Sun,  4 Oct 2026 19:16:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A7A49606D6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791141419;
	b=FLyrd1r/YYOniYc2pE6FYgBeQwss1Ku/fsCeZv2Q8MG4H3hnxXrPlnKiwek1MDRTFZP1
	 E7j1iX55Lg4TCxM4tveYASf4RbTAd99otz+1cwXxZz1QFPDC3S8/fMkTf5HsBeApeI0nQ
	 v69GZaHMQ05e4KPWhDuDVqmaeUaxvgzyDRsrEpuKgAfYyiwT+NvOi2yoh8lRuY3kjxP4v
	 Z+6SxYGPnCjQGgFMMrTlP7RAcLG5XNbqBNOlWQBxWEE2aLe/ayNOraVUKAuK5y1/L5o1e
	 iv+x4/RzVL0b7HV6Rj1m6LrRSiJzTog6uWbhFTjbkFg7x0L1y8TczEX2K8NzE+xm6Qg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791141419;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Date:To:Cc:Message-ID:In-Reply-To:
	 References:X-Mailer:MIME-Version:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/IwqEZ+bZ3fnt5C/ykzzZB3zLVAxIzVgMZw6zUjv7V4=;
	b=HOMoaq8cC1sYkU6N9vIxgvlvmCmsxLM0D8oNbpwDQJa1zNDYrpEyvJ3K600mAkPjHk53
	 MTRcedXU9ZqFYLoHIViLeCX4vzpUUJHXddRr6Mu88Ki8wkoUL+P1p/BZ6OaZL/Rf0Qwos
	 umIsiZaJ8GCySGMBYI+K29hlPOuLPADVmEkfCHNsJsh0iotkf2HgbWxOmvs+LWMYiM199
	 YK3zwQMNWjEQU7x6kxWOCVdMP/6NKDqX0IbogE5KlVlLvR1v/ArAm0HYPzGEZlW33ponN
	 fil7q1vU+xaklIc8W+fGFV0xR3TNLtEy8DxqyPjmuF9WwXHKiux1Ya8f2tH6StCxSaA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791141419;
	bh=/IwqEZ+bZ3fnt5C/ykzzZB3zLVAxIzVgMZw6zUjv7V4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PojgDTuEsAvYnMSBRebn4Jw8sWFeGwbyO4JAQyY4AsKE2VtjPz7mRWD0VkK19pm4i
	 PiSUmJIl6tjznHD75xXdWWfC7gRgZqWkXSaEdQ61UiT9WNRvmaljpsD6i3N4qv+JcG
	 ri2TIX4wT8lOhm6rK5PjrJbRYTuaWLu0K6GKwCT+pDe9Wv0o/TzBcW+Ha279BB7Tj0
	 ozd4mNB91xgJ6wL6jZrnGeoEVw1fjvRXfEqwFr+SantNR3JlUVyRRQ8YGnTg5ePByv
	 7tMg+IZW1D7sqvEgMOp2kicvu9nXs/VBoL+3z0PB4cr5M106dxxdz5750mh2Go8m9h
	 bERGHXZpjHg0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7A49606D6;
	Sun,  4 Oct 2026 19:16:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0068222B
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 19:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9EAD80D7A
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 19:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8AhtCpf6YAm8 for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 19:16:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6865980D5E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791141416;
 b=QWx5LV3rulEfmC/Qc1hN6JgPNtzzRicAdB+iIkk+YM2D2XCujhkMILrMGHxvCgIaQGsB
 Kd0xo/PwCFytNVYRVNQ6k6s0HTaNjdbtFQecsncxYV1x7By82AXX5pCtT6EZqMD5RDIRl
 OgugCa07TmsHJkg7EXvrHt5we9Cgw1xj5fHMvhMTWgEsBN4K8DqlJ/MEa9vUo0u2YSA+i
 sm0icog9J/oqHQ06ccyNTs/4mHFVwJT7yBvY5ZraNRWNsqg47p4hF9FAczmTeJFyLCrk0
 4FMyI9g0tq+Rd27KM8lyQTDLqprlUM8pbmaOAo2xfFqutewx6+f21QxzFMoO3R7FsbQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791141416;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Date:From:To:
 Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
 UI-OutboundReport;
 bh=Y64e2jJQnTY854v9cFYVs5eQVtXvudDEzwrLQ2BaxnU=;
 b=U3nUhF5ukCdj4TCP6pzeQNXLA3+/bx2VB0jCPrt8an/ThTJvU7jV9+m/b3hDinnM7YF+
 AEC/l0rm9vv0TR3UreluCramm/dOcoA1xZJcJL1mbdLm14KTmf50KK0bN5fTp0jRadsdg
 Zm9OFEoY7lxHecTGpSUVwBhAOZibYneFFJF+ZD2RehRTXcgooLZtGkU/mFYvgovR5BsoE
 VV9MqzfPXzmtiGgBbhpcGteQwoQRXkzhzC7uzAGMYSdbDqhHRWTSDbVBTBsKHeB9AxmUV
 zC96+A02pb+ngk3AEupeLHe4Gajl+5hiYeDKLXLlsq4WztPreHVMn4c18wbaiPF8trQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmx.net; 
 dkim=pass header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=as3uWkrB; 
 arc=none smtp.remote-ip=212.227.15.18
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6865980D5E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 19:16:54 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3se2-1wVLWe1HRQ-011DvL; Sun, 04
 Oct 2026 21:16:52 +0200
Date: Sun, 4 Oct 2026 21:16:51 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Message-ID: <20261004211651.40a998e1@pc-1>
In-Reply-To: <asJz0OE5k0gQODfW@windsurf>
References: <20261004145950.1387519-1-ps.report@gmx.net>
 <asJz0OE5k0gQODfW@windsurf>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.53; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:GaUdjia0fqeeSQmhlLDVRbaeejKKuGyHUeZ3bHoaq1rg0JDm1iS
 AqXRkR2W7UGBWFTPOteq8RjzgaEaJKjR+W1feeEnI7XmBEvZqE/0qohT0foX+ePlfKHJkMH
 keKiCujg/eHnT3vFrQ0eO4jMDmGfgvpksDll3SD9n+rmqqjizt3bpgSGhH+cUEKokeLfs+1
 Q1UiTymSGQx7E7Bl/ccbw==
UI-OutboundReport: notjunk:1;M01:P0:IV54EimQF5Q=;JP45/Lp10kPz2yyrvJ/fwxUe7St
 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
 1AwwD16n+pI0c7WcEjbI9cJyZw==
Subject: Re: [Buildroot] [PATCH v1] package/gzip: add upstream patch to fix
 build for aarch64
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 4 Oct 2026 17:42:30 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Sun, Oct 04, 2026 at 04:59:50PM +0200, Peter Seiderer via buildroot wrote:
> > - add 0001-build-avoid-failure-to-build-on-linux-aarch64.patch
> >   (from upstream, see [1])
> > 
> > Fixes:
> > 
> >   In file included from gzip.c:61:
> >   gzip.h:120:21: error: expected ')' before '+' token
> >     120 | #  define head (prev+WSIZE)  /* hash head (see deflate.c) */
> >         |                     ^
> > 
> > [1] https://cgit.git.savannah.gnu.org/cgit/gzip.git/commit/?id=b4ed8e73401968bcad749afb0e636dd3ec205ca7  
> 
> Which version bump introduced this regression?

The bump from 1.14 to 1.15 with buildroot commit

	fe21a5fe30 package/gzip: bump version to 1.15

Regards,
Peter


> 
> Thanks!
> 
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
