Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEFEE6E80F
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 11:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC4A2406BF;
	Tue,  3 Feb 2026 11:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ib2ierWbTJDz; Tue,  3 Feb 2026 11:12:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01CB4406F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770117131;
	bh=4Zl5kIo8uWW1jZFhBwUopFwnzZ41hpCHtxNo28ETkTQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CN5x9RShHeBeWuoDGsXgyS4sIXBTM4Uw4Ef62Iwl/J+6iU8usEBLJPk0kQxDUHdTn
	 FdrEN9lgzyYK2ZuB5RFrMM5JLlF20okGXDGKMATkNlCKVuOUyBJ40WGHJrEWLvx/Rp
	 xU6DwZcyjrnPtqDsH4/aIEMHSnSSoGhesJiSNdFOsWCZ63EeFXdsfwHJqqpsZOWQrY
	 5XOBr2SNrL+Hm+5JRiT6U2QAB6JiO0CXH1o5hbNajDdE2oxYeO3uh8/Vs8pMR9RedG
	 Gm+L9x1OgoMFhERLI5F/I03MKWCNg9DcnvMTfyeYn7NTb/YFKp2vxLwfVtImy70Tox
	 CkS0ZFbW+pi9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01CB4406F7;
	Tue,  3 Feb 2026 11:12:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2577CF5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 11:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0876A6112B
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 11:12:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6bPJk6mTpA3V for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 11:12:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1D357610B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D357610B2
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D357610B2
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 11:12:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D4E761A2BBE;
 Tue,  3 Feb 2026 11:12:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9A3AD60728;
 Tue,  3 Feb 2026 11:12:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4A99F119A8891; Tue,  3 Feb 2026 12:12:01 +0100 (CET)
Date: Tue, 3 Feb 2026 12:11:59 +0100
To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <aYHXtmunYUm5W8Xy@windsurf>
References: <20250808133112.3212687-1-elmehdi.younes@smile.fr>
 <20250808133112.3212687-2-elmehdi.younes@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250808133112.3212687-2-elmehdi.younes@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770117122; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=jbY1igYRwKSGVYgqcGR7mJKWPzaZpa+ZRQPrRJnQB4k=;
 b=tK+aKpw5EvaL0oMi1lL0mPQGNuHWbJ285HSVbS0yK/f0oby0gJ9YzRWa2sA5k/o2m28x3y
 p6wQxuYNcikRXWMQIxUMS/fGbrQw8TKXPmIifacpfztSiikdBTz/eEt32yBiDI8np0G6Z2
 41GnQ3hADXaCtye2SFE1yeHZjEz+w7aYYTYQKsyiI7jzfnP+xx/xXBbkFA6yV1AqTHqfn8
 xDL3SvJCMm4vd1/KiW4TXwwFscfN65DinagdOIcylRCd2WYypTxMW0mhLPvovxNE2mxEuC
 bZxOpH25Ss11/6i1vj0ugitAMWaG7NQz1Tcci58eN1q9WwMpQt81/BPdtvIikg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=tK+aKpw5
Subject: Re: [Buildroot] [RFC PATCH 1/5] package/rust-bindgen: add
 host-clang dependency
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

Hello Mehdi,

Sorry for the long delay in getting back to you!

On Fri, Aug 08, 2025 at 03:31:08PM +0200, El Mehdi YOUNES via buildroot wrote:
> According to the official requirements, bindgen needs libclang to
> parse C/C++ headers. Until now the tool was used mainly by Mesa and
> worked, but Rust-for-Linux explicitly relies on bindgen + libclang,
> otherwise we can't activate Rust for linux.
> 
> See
> https://rust-lang.github.io/rust-bindgen/requirements.html
> 
> Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>

We have finally applied your patch! However, we improved the commit
log to clarify further what happens, why it worked today without any
issue, and we also added a comment in .mk explaining why we use a
build time dependency for what really is a run-time dependency.

See:

 https://gitlab.com/buildroot.org/buildroot/-/commit/34ed3bbf0a5f2576043ff627c76df584ea936a71

for the final commit.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
