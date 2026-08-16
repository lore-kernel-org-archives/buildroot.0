Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B250C5B572
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 15:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07E8F6066F;
	Sun, 16 Aug 2026 15:13:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dG2mZLdT7Cxh; Sun, 16 Aug 2026 15:13:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93B2E605FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786893187;
	bh=q/nn+gUs7GNPQpjfSiLKv4bf4rY1EcpeLGKOq3u9JF0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Gq5jSYwDyP4CXRLIuZBaaynbqjJA7MF79ZlcTsevmX0H6jhPy2Lk58nCY5x43I/6s
	 xrQ5mAMDGi0BNvllsmFuAJSmopsD5FF7AoY9O6LPOouWZBvK2BALT0YW9QT8gfe2IL
	 75Q8+NOPnpx9BMZAH1XyKLSQcPjknW+0/gVPBv3SCrwNZb9UN3/uPunPYfV7/2hgMX
	 5kbQL3MawHmtODyOCK6URGz+l5cJwiZSVmlUXG9z/YaNJKsfyAWHXqs8B9kMHxepBB
	 ZdV6fVzCq36Zqlel6OiKdzZTdLkU2WCaYjjg9DA899z666T7uKMYWCEnbP3STrYnFE
	 6k9j1KNGrqCsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93B2E605FA;
	Sun, 16 Aug 2026 15:13:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 95A4B336
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 15:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BEF940077
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 15:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nqB4APk1mCSi for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 15:13:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D6B234005C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6B234005C
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6B234005C
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 15:13:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 95A904E41263;
 Sun, 16 Aug 2026 15:13:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5A83160355;
 Sun, 16 Aug 2026 15:13:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4F64E11C4F9A4; 
 Sun, 16 Aug 2026 17:12:56 +0200 (CEST)
Date: Sun, 16 Aug 2026 17:12:55 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, David du Colombier <0intro@gmail.com>
Message-ID: <aoHTZH3WR_g_sivk@windsurf>
References: <20260711111744.877250-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260711111744.877250-1-bernd@kuhls.net>
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

On Sat, Jul 11, 2026 at 01:17:42PM +0200, Bernd Kuhls wrote:
> Fixes build errors
> 
> In function 'x264_predictor_clip_mmx2',
>     inlined from 'x264_8_me_search_ref' at encoder/me.c:231:30:
> ./common/osdep.h:455:13: error: 'asm' operand has impossible constraints
>  or there are not enough registers
>   455 | #define asm __asm__

Is this a gcc bug, or an x264 issue?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
