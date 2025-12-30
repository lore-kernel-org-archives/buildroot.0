Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E918E95A8D
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 13:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA34581E4F;
	Tue, 30 Dec 2025 13:04:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qZwB8YxYi42P; Tue, 30 Dec 2025 13:04:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E62A81E4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767099863;
	bh=9yfpCumdDGz1/SFcQNsM1p9BR/frXJcXjrfCoeywzgA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HOt3YhjGXXMVpbeKIt/wWySGvrjnAB8WkAryWj0s+jKQOnlL4NZwu4sDf3ygKc2Kp
	 nJHObFFWg771+sLH1z3Twmf/23X6rGgELCTfRq8he3Zcf4sKnteHJaJj/sC1j0rFI8
	 jMpi23AgfoNoo6mwHNBJ1xYaJfJuBmA3yAhjhWXWxHOBNzCBwNl/JTNwZRGU1kGHYa
	 JY4n7I/ctliz1zdFbAo5j88QbapLIMLP/pxCG6W4pVF+azdHJHxgbu4KM39QDwRXsC
	 RnnhnfsxDE8OK4pp0kJHtmekerIZYk4kQVM877azCXkhBtxvGlnpyTgajOECguRbSO
	 YcXUlNijrND0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E62A81E4B;
	Tue, 30 Dec 2025 13:04:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 96D05D8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 893F24013F
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:04:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zlcmur5-m2XE for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 13:04:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 82E164013B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82E164013B
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 82E164013B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:04:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9B4534E41E82
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:04:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6C9A76072C;
 Tue, 30 Dec 2025 13:04:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6B063113B0643; Tue, 30 Dec 2025 14:04:18 +0100 (CET)
Date: Tue, 30 Dec 2025 14:03:35 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20251230140335.4a58a9a0@windsurf>
In-Reply-To: <20251228235209.2900894-1-james.hilliard1@gmail.com>
References: <20251228235209.2900894-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767099858; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=j1hLYETOB80EFdutxsfmaye71jM0He6fbP96MznTdJY=;
 b=QfnjYZ2ewrQnG20oClyjiN0XnM1hP/Xm/vQNvb8qKGM/liiuHhZxB/Uw2WWaG1WW1HgICz
 FB/9jzgKsJueIObYx65BcScXDChuXzrRvoTGvwtsV5k3rYlSbHCxU2uUNVhYFiVNW5yNfZ
 cswNe7wP7SRxVjalP/i5UY/wTT/y2gg6v4qM51mCRZlCpiCOu3uJqwx/AMkIxb8s0nD6dM
 6GRlnVhUPZw3xMpF4A7ClnDJaMMyMfItV7SPYe1/PmrAWXYXD2NUmkQNNK8XxvFC6lteSb
 JsAGfiuc4Uihijb28Il9GQQ+5CG7FkO5M/k315MGeTZbnJjE1AcHsSbaVKmS2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=QfnjYZ2e
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiosqlite: bump to
 version 0.22.1
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

On Sun, 28 Dec 2025 16:52:09 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-aiosqlite/python-aiosqlite.hash | 4 ++--
>  package/python-aiosqlite/python-aiosqlite.mk   | 4 ++--
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
