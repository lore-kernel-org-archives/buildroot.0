Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF74CCF2E3
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 13:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10B5980F8C;
	Mon, 19 Oct 2026 13:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mBHDT04vmYcG; Mon, 19 Oct 2026 13:48:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 51D8A80F80
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792417695;
	b=a6yWjGIRAEzTCEWF3w8KtkovVNWlRHtjnS/1f+Pl5hWjkvB74hpFoch/Mf/+FxPF3qhO
	 K+k8Vmikhy7YYvl6CeNoKw2zp1nAYX35L74Oa0edgFPgieO2NQ/YBIUR5VFDTbGDmSmIe
	 lc2MLI/rWu7IspJ8y+49XBciLBVqHmmzIqTFkY3gRuF4H1m79601yi7yUvqSDAq/aX2R0
	 vv248N9ds7fBmC2i9mSn6Qkq1Ei7CAgxbjHHFECf5f4uLw8dbLNezpowfL6sCuInHOALK
	 g6Irf4BPC2dgOEZVFqL273saib5mCgLJEW549J594ulzKr0SxrrXhZhmh9ceBZi2qaA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792417695;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6PEF7651upEVK09Eb4GXNdViTy2Zje+o0hNqTbqFS54=;
	b=hkgXMtn6xMlYhWInzCxKtLok2P/jiKbwmqPgscbvGgg68FpzxfFKSl6xboI9NbOcIkk0
	 Zj6chIM0Tj302xtxJXAH96lVqng5SAkaeqpiTwUcKjaRs9WT4eCex1l4dQklgPdcHJo+v
	 U/lCh0cs5uAQ7LrSvgUv8MQRCtgqNrPFWwfdT3drPpEvI2PuybCNfvWlxJAaXsXBM15OS
	 tJclil0NoEx5Ho+6njQm29PttKGFIEpZH52tDA21Qf6PKc619auF5rSZPRxP2Y/JEFN9x
	 ipE78yGy3hxNKhnN8wdKoOGYc0pbyQrL+s0+lOq+t7cZwsxxaxXztDTjzARPeu1QUYg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792417695;
	bh=6PEF7651upEVK09Eb4GXNdViTy2Zje+o0hNqTbqFS54=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Gh4Xc4BeouNQ27I0JTril2h88VfC5JihYzTH4zdePb4G6Qccxyu5IK1pHHYjIu9Ar
	 nj4cGgxYc3PYfEHxdDOLVQrLDJOCkRxsD5byyahUqMBJwV21E6hcCpTg1tDB0Sj3Jo
	 D0e8Rph6ellxYPPT4IyVolPRT3Rt8Cns0WEuM5nFOgVEIByt99nIB32oi/efZqxJ9o
	 KZn/qYGfpV0J6uJ8fCJg8Ajyoy/sA56kM05AEFl7QQsG8/vwArS9TGdJdh16yuEPjU
	 GrT48W525rCBLxrhccwXnc+ky3ZPAWMCauGPE+S01Jm9e3jfer6XScYggcHiUnWdMv
	 BmKCo6okAKRLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51D8A80F80;
	Mon, 19 Oct 2026 13:48:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 330C81E9
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24C506063F
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CEpbqlcbnWZ6 for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 13:48:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4CC6C60612
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792417693;
 b=tXtsEF70RbXhAALukvdNmQG1an9uwB/NNJ9LNn+KEyfFq/KGlbve/7HUOpbq/5l4nWqh
 1H6K4OVZ0sVhRImIbz2AUparnJuNQZvcYNesYNF2/5dH2EfSmslJT8rGrymOMT1HbDZBa
 a0ajbKtIRGvh0mewCQg9lleYbcdBjnqV0EjheVEUarsgNwZ7++kf92KnqMQJjdPBlC92h
 xqatszk4VAUEIf9ZSUKRAfpzXwXBFuXQcWWbLauLBOsw5vy54wwUaI7aglYToYDehWPYP
 S0iuvapyVpoveLabAYW9nUUarQ0xouv4w+XK2+OXcEZSNc4NgVbB+TvmcqDfKGxu9Pw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792417693;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Eb23Bf6rK0ERouNjGOI8zQtwl/OY8T4DW3QNdIcHsKY=;
 b=AwC6/24jdSZfuSzBwDOUTH5oANW7eqxhckb29dP8Y45Ni4Rwwoo5NZZEi62UwhTefHHy
 veYlYbUMZzsbNQkvx2CxXc+8TPhK5uf+rZvKON5lCzsBlWXuvLTp46bSSmKgOTBM/Ae3L
 bBm+B6JHYnGCt2e9O3HEyVeMX7eOlNhAnrL9HYLrmxzyCWLgqfcq6qIL5knbSfBg2KM7n
 bBKN6pzK3hOPumcK5keDlESP9irM35KQZPU24lo/UhkHbYvtMM56kY967rVBv7iP2ExK5
 kfx4FRd/HIb4cF7vXRNfnc12A/B6sT2IjLO/CVRjIfSVVsAZByyRXr0wJc8avihkpqg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=KNOIl0Kr; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4CC6C60612
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:48:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3159C1A1220
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:48:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F188560582;
 Mon, 19 Oct 2026 13:48:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 521C010328D37; 
 Mon, 19 Oct 2026 15:48:03 +0200 (CEST)
Date: Mon, 19 Oct 2026 15:48:02 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <atYfa40Xpbsq18Lk@windsurf>
References: <20260903114721.984785-1-yegorslists@gmail.com>
 <20261019060028.1078791-1-yegorslists@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261019060028.1078791-1-yegorslists@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/ncftp: fix cross compilation
 detection
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

On Mon, Oct 19, 2026 at 08:00:28AM +0200, Yegor Yefremov via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> ncftp still ships a configure script generated with autoconf 2.13, which
> determines whether it is cross compiling by simply trying to run a
> trivial program built with $CC, instead of looking at --host/--build.
> That heuristic breaks when the build machine is able to execute the
> binaries produced by the cross compiler, which is typically the case
> when building for x86/x86-64 on an x86-64 machine:
> 
>   checking whether the C compiler (...) is a cross-compiler... no

[...]

Thanks for the new iteration. But... which commit/change introduced
the regression? If you're not able to trace back the origin of the
regression, does it happen in 2025.02.x?

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
