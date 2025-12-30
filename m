Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19ED2E95A8D
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 13:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2CD781E2D;
	Tue, 30 Dec 2025 13:05:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LtjhUX7KYzjh; Tue, 30 Dec 2025 13:05:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C516181E9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767099921;
	bh=+gCYBcno5LJbaAQyGuSPNhAD+VRJYjtXHxFfEWHRepg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JoWR+8OBlp5yh1wWdBashJgKynPgnmEb87aLBbgkICie5YZRGEaEdPG+LC0nBBPSl
	 NX8FJ95FlupzHCDUGbUL9Cdgwbd/NVVc3Qs4AeFp5y04HabX1WxywtT92ekFgB3c0k
	 uujQomZz4d/y/a60q5m/Tm3bv+G6lKDRGFDnoIh8hMBzibEReoPeN6mwUf1II7XZ1h
	 gGAYjBSMd7GSynlRvHzlIxQFfNm5/UOJpGEnIS0PYBexhPfTosyWAfFSoKymbJsOPW
	 FWlpeCSYq1k8jLJEtsYt11fJYl/VQhqqjQzqgTvPvoTiD6J93XJZ1bC7T8FHk3i+Nu
	 nJUOZyIocoYTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C516181E9C;
	Tue, 30 Dec 2025 13:05:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 59414372
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B69E4013F
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:05:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sc3fGAU8s8ir for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 13:05:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3E1524013B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E1524013B
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E1524013B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:05:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D5877C1D734;
 Tue, 30 Dec 2025 13:04:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6D90B6072C;
 Tue, 30 Dec 2025 13:05:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2449F113B0643; Tue, 30 Dec 2025 14:05:15 +0100 (CET)
Date: Tue, 30 Dec 2025 14:03:46 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20251230140346.27360e3c@windsurf>
In-Reply-To: <20251229010718.3139818-1-james.hilliard1@gmail.com>
References: <20251229010718.3139818-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767099917; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=FFo3Yz2i71rhw9VcMue+S7lW2huzAHxyyLpOUwkD7hk=;
 b=mN9dibJedwzmOnbj+9C5mHWkHxIe6KuX1KvNvoH+uOPHQocqBy8knwbb7ovPF3Kf0JRk9j
 69nInDfpWJz/opb9VWfSa4/ZUD9wSqBcsyJ6YsGxF3cr8o4GSS8TeCCHo7uTW/Th11GrJv
 f046btmPMzqlG17TNIiaOlSRAvUEs4ZaFYvlJ6/erNSeaFdlYdYI27NV6E/N0JQ+aw+sef
 MC5dJjZxAJcBTKGqxU3zalj7DUYbpjj4bGMGCxIzUGjs3kxjyTzVzBO9Li+Fltk1twMpsx
 WjjrFym3gEiCNNoePImx2PF0TnkfCsHhEViojNdg6H/OaSiJELhmIykHaAo5Rg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=mN9dibJe
Subject: Re: [Buildroot] [PATCH 1/1] package/python-tornado: bump to version
 6.5.4
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

On Sun, 28 Dec 2025 18:07:18 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-tornado/python-tornado.hash | 4 ++--
>  package/python-tornado/python-tornado.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
