Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06ABCE8305C
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 07:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1CF440B13;
	Tue,  3 Feb 2026 07:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q2t-VretXdOG; Tue,  3 Feb 2026 07:54:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D543140B16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770105275;
	bh=XgYiCObe8SEdl+a97S1Fe/UO6Wnxw+YLgDtrwKIpR44=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LeC2qOY4aIVhfinxghq4C7ilxjun2XJi+lAZpp/rkVo4pPsujoF6odHiRkIePsGEE
	 odhUQolYZJDaKUYnEM1Xtcvr9EkagF5IGV7VGKNxgwYLEc5mbZ4cuWKh88tBYaPHGx
	 NY2Ft6ixMY7LcCQ+eJ1nMp3SR2BIB2FALX+RrY2nGvwcdxhHYNdPTwd0I9XjfGI4Oz
	 MoVt5IVv0fTJCdPWKDjgbd2/S2NqhbgxSeZOVFNLyQ7P6FrXhQPRvis9np/NPBKa4e
	 7pJ00kV0RqiJNKOW/mE2k4uxqPNJ+QYsV8bgPFB7wfjcJsPgVzAfglFd74N/fGCFdg
	 +jiU69lZBXrzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D543140B16;
	Tue,  3 Feb 2026 07:54:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0869EF5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 07:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEF0240248
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 07:54:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nRG6u4ujBqdx for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 07:54:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C24F64024F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C24F64024F
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C24F64024F
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 07:54:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id CA5011A2BB3
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 07:54:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9F48C60767;
 Tue,  3 Feb 2026 07:54:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6F292119A8888; Tue,  3 Feb 2026 08:54:29 +0100 (CET)
Date: Tue, 3 Feb 2026 08:54:28 +0100
To: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Cc: buildroot@buildroot.org, guenther.harrasser@mobileye.com, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Message-ID: <aYGpdeovUesgfL1c@windsurf>
References: <20260202151908.1203336-1-jimmy.wesolowski@mobileye.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260202151908.1203336-1-jimmy.wesolowski@mobileye.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770105270; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=AQumK9jKhqsclsFxO0gzCvq6hS4/ItmeF9U79Vnp364=;
 b=nQL+D/9jE2zAS0Tg85ethZNQ0clE8tGHxT5MZ1nE6bVNYulYhDnCTNHNKrrzGU+uOunIrz
 WFOYPxS+53TTBJd+yduYj7OzhsbP+VBw3gBGSu+B7+HbJH5GCoWkIvg+xUNq+RDXemTu0Q
 TBA6Wy+bP8Jdb2n3ZuPRUXo7nvCmUr5yjy4KK5dX+Fh5G5urCt2+ZXqsRCJS8sD6VR39c7
 bZiv8gbnESPFVApitGRxQTx7c87eRooP2xifQX3wPIOMmaJxFROHtVbHEQjRQ1gt4zaxw5
 8pdLULkrdmuX/fwu1ho1LiV4R2QXQlF9mGrOxaZl1Yk44yPBgx3uPCKESKyqVQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=nQL+D/9j
Subject: Re: [Buildroot] [PATCH] package/libunwind: enable on riscv 64-bit
 glibc
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

Thanks for the patch, but Vladimir had already sent it, and it had
already been merged in Buildroot master. See more comments below
though.

On Mon, Feb 02, 2026 at 05:19:08PM +0200, Jimmy Durand Wesolowski via buildroot wrote:
> From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> 
> Since version 1.8, libunwind supports 64-bit riscv,
> at least with glibc
> 
> Change-Id: Ia06dad0215baa34bef33f7693bd76ffb66f3a32a

The Change-Id shouldn't appear in Buildroot commits, as it's not
relevant for the Buildroot development process.

> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> (cherry picked from commit 180117f1ca693725f3b937341ac243a863f6746c)

This cherry picked message also doesn't make much sense in this
context.

> Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>

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
