Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A579CD8C90
	for <buildroot@archiver.kernel.org>; Sun,  7 Jun 2026 21:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C99566115D;
	Sun,  7 Jun 2026 21:54:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n8IGaM98lLGf; Sun,  7 Jun 2026 21:54:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EDA86112E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780869296;
	bh=VjsHW1At0dM6vF9W+QloG9mjZPN0RQhy+G05piZtuek=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DakZO2pFSCIeJcNOROse2cf3wIXEDrqhfsDsZkOo6pNcepltevSnzbAqjYF+oLkIC
	 2LVk225Ch1bEpcylzggFwdFUIyuU5RylH3Zpc1jRrIzYZiMS+WCgkU+gm3jHIRBYRk
	 gE4QSiG2Ea6KULbQSXlqKxWeOSs24gN2fUF4OVrNPDznqHEPIn+8yc9rpCwmHeEJVY
	 UFolvFNkR/yG28Gx5zTcL7lnIe79LRsvciiy4ZfdBkMTASsZXIwwArwI7ipW9/yPpM
	 h2rUijKc4qH/+15ZmzLkj/d9k9FHSHNLcMSPPVnSzpuLOLwwiHcKlvBPgVbfmPixxd
	 d3hxWStuUkk7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EDA86112E;
	Sun,  7 Jun 2026 21:54:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 70B1B2C1
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 21:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62C1A422D2
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 21:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nurlc3D31CNh for <buildroot@buildroot.org>;
 Sun,  7 Jun 2026 21:54:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 75FE64036E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75FE64036E
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75FE64036E
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 21:54:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 387DD20039C;
 Sun,  7 Jun 2026 23:54:50 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 07 Jun 2026 23:54:50 +0200
MIME-Version: 1.0
Date: Sun, 07 Jun 2026 23:54:50 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260605231546.2876989-1-romain.naour@smile.fr>
References: <20260605231546.2876989-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.16
Message-ID: <9d7d98b70f67f93c137c8f97457fc4eb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1780869291;
 bh=zNYFRxxXziUZFYceYsrWM4hdYWaefspBbhWOShnhikA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Tg1QzQvvz07lrH2VxJ1wOtRYluOwgLYO5qVGvxuqCcfLfxjxjjRtvYRfJtuM5107Y
 0srl9nzFzUiIREpTy9OeALEcD0423ra5zqLuTMyVBM7N+/ORQ9iWA3F3ebVRUUPFXQ
 4pxz/2Za/FYOFl3n+6IfGatAv0emyqoXugonvdXNRcsNGaqdIzLinnKAa9mhErdRtL
 p0A3alixmrfxSuI9/SH2uxpxSmUuvDUVI79H3IGGjuDrtDEmgCsszfZGUZz46rjFK4
 Ik6txfp4RfkkHXsFsFDVm7vp25JkzL9myGBa7vu9DfQbLkzqEhfpDCgnWcmP+S96td
 bipRHgSCOzvBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Tg1QzQvv
Subject: Re: [Buildroot] [PATCH] support/testing: TestOpenJdk: fix test by
 using bootlin toolchain
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 06/06/2026 01:15, Romain Naour via buildroot wrote:
> The OpenJdk runtime test doesn't build since the last ARM aarch64
> toolchain version bump [1]. Indded the OpenJdk 21 code base is not
> yet ready for such bleeding edge toolchain using gcc 15. We need
> to add OpenJdk 25 [2] or use the latest OpenJdk 21.0.9 release [3]
> to build with the latest ARM aarch64 toolchain.
> 
> As a short term solution, switch to the Bootlin Glibc stable
> toolchain.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/14696526185 
> (TestOpenJdk)
> 
> [1] 8d413d61792724877bfd886fe3ba519fb5259566
> [2] 
> https://patchwork.ozlabs.org/project/buildroot/patch/20260221164020.318115-1-thomas@devoogdt.com/
> [3] 
> https://tracker.debian.org/news/1661321/accepted-openjdk-21-21095ea-1-source-into-unstable/
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
