Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5F1D5AE73
	for <buildroot@archiver.kernel.org>; Thu,  7 Nov 2024 08:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 718734197C;
	Thu,  7 Nov 2024 08:04:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AVTSOKDh3bsn; Thu,  7 Nov 2024 08:04:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80ED141E91
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80ED141E91;
	Thu,  7 Nov 2024 08:04:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 44546C1
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EA9E41C9C
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:03:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9kOaqR9SM7qe for <buildroot@buildroot.org>;
 Thu,  7 Nov 2024 08:03:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C1D7741CA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1D7741CA4
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1D7741CA4
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:03:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B03560002;
 Thu,  7 Nov 2024 08:03:43 +0000 (UTC)
Date: Thu, 7 Nov 2024 09:02:57 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241107090257.33c56c66@windsurf>
In-Reply-To: <20241105182647.1428325-1-james.hilliard1@gmail.com>
References: <20241105182647.1428325-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730966623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zUiEvHCLXpK2QtBp/tRShE1Uqu5VrVh8sxz9TISAdY8=;
 b=ZQsBXkUEjOcvU6MUdCv4JtDuWQYWhOwAmirhJZeylH9QAS3o+HzsxDeBTe3q4inYkBoJGq
 wduuoPmwFGTQQ187+HGoeVa1NSnpwG0acBXWaJTkDYWzqhY4YMFfsxWqCMSRVhZmnGC3mA
 MTHeqt2RpJr/71AdD9ZEfOIHRxYyK2De6bwATFR1v0Qc557PmI94YtwcqbOUF2Xe2nuLYg
 rcQXVadpwU8xoXcPtszFbb3me8bbARvQLG0Vd0WYovzppSo2AnJ4oNWmUgpx2ZnAfGBscY
 gmGejC/NOlLVRdgcwAAdX2TvwdnV7ibmKebaWWgcwadr/uITVwZK+59aZbFJyw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZQsBXkUE
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiohttp-remotes: bump to
 version 1.3.0
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

On Tue,  5 Nov 2024 11:26:47 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop no longer required patch which is now upstream.
> 
> Add new python-typing-extensions runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .checkpackageignore                           |  1 -
>  ...Fix-flit_core-build-requires-backend.patch | 32 -------------------
>  package/python-aiohttp-remotes/Config.in      |  1 +
>  .../python-aiohttp-remotes.hash               |  4 +--
>  .../python-aiohttp-remotes.mk                 |  4 +--
>  5 files changed, 5 insertions(+), 37 deletions(-)
>  delete mode 100644 package/python-aiohttp-remotes/0001-Fix-flit_core-build-requires-backend.patch

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
