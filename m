Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920E1CD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 10:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F82742CBB;
	Sat, 30 May 2026 10:53:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EFzNjv-V4BI8; Sat, 30 May 2026 10:53:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13CB742C9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780138435;
	bh=9uxGJ6FHRgNibbN6nYHsL/QQS6bRYOnLUAKq/WDRSWw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W4UBKUpXpSfzcV5tKfAa40E7AnnxOuL1lYyzq8ufLRZhJg2gwebZYUOoywmUl3NdC
	 QnCxAlrRWpttezdzhhyAb0zpubA1XVT4+SGAqY/rtlZpoQpScCNU7WqqcUQa4vP5r+
	 fJLuWbY3xHYgbefDx/Ha/zUYJyOnslv8bqVyHxdh4r7wSjc3o0+C3sj8Rj6Xv6GR/i
	 3E1g3kNAnKc0oyUhcP3+z1H8QFud273WhV22S+NicCCuRpYSX8NyTNqy2MWVE4WsJe
	 SzSXvkzInu1CLuxoWiJ0EyH2Mtv5z1G/LlIPHlZwfl/zcISICb1QK8lNiG/q79LJsX
	 tVnv5uGQl/Y5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13CB742C9D;
	Sat, 30 May 2026 10:53:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1226812F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 032EA85178
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:53:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s8vzpJWkxbgN for <buildroot@buildroot.org>;
 Sat, 30 May 2026 10:53:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 290BD85173
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 290BD85173
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 290BD85173
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:53:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 37F1C1A3746
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:53:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 075B86073B;
 Sat, 30 May 2026 10:53:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1042210888650; 
 Sat, 30 May 2026 12:53:48 +0200 (CEST)
Date: Sat, 30 May 2026 12:53:46 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <ahrBlxVTN-8GtJpY@windsurf>
References: <20260116232717.937891-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260116232717.937891-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780138429; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=hmAPo09aYsAN2QFTwecKn7/aRVv29WQD/1bPWcEQ1GM=;
 b=nQjB09J4F4z+c3FPlxUZTRusNL17+R1+xGCV4OnuQ71ZO8kVrBoDcXrZM8unMwGGoAuBBi
 ieMBVxozTiUNcDPRVOMJeVKYUtmy84zhMOIXrhOrBSs/MFfcbLjouBp7n9xbe9Ij/ISJwx
 8qxri0g4OVuf9kdM1+hoxx7xpCeaJdVT0ODbdi+eJmI+Eugrus6pzZwx/oo2lydUFI/ifi
 pnmrBuYABocBXX8Qev9Fqmvac6fCptq1ShtSMScp/kEtaviPE0M0MsumiwK2pBh/ABZtAj
 tiPSx9t5KA7uyq8aKeKjxJxl0346Xgg4641A3v0sjycVYflSzUALbyoMaNsVvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=nQjB09J4
Subject: Re: [Buildroot] [PATCH v2 1/1] package/util-linux: optionally add
 libpthread to uuid.pc
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

On Sat, Jan 17, 2026 at 12:27:17AM +0100, Bernd Kuhls wrote:
> Buildroot commit 31af509b4f4fe52f67bd9109b8732a55b8f9cd2d bumped
> util-linux from version 2.40.2 to 2.41.1.
> 
> Upstream release 2.40.3 contains
> https://github.com/util-linux/util-linux/commit/e143539d30fd18afb3ba6d3c6e50a260d4219895
> which unconditionally adds -lpthread to uuid.pc causing build errors for
> other packages using non-threaded toolchains like erofs-utils.
> 
> Fixes:
> https://autobuild.buildroot.net/results/582/5827995db2a805e0c8a04fde8498eff6f28aa6d8/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks, applied to master, after renumbering to 0002, adding the
proper upstream link now that it has been merged upstream, and also
adding the patch for util-linux-libs.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
