Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA100E95A8D
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 13:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C16CE807A6;
	Tue, 30 Dec 2025 13:05:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zn1oIEr9DB9i; Tue, 30 Dec 2025 13:05:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBA71807B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767099947;
	bh=PpoWrt0FLGojYS2pcWrya3hLRDuxYp9CN92i3LQv59c=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=s+ezFgJSq1dn5Mzd1bBe1IHFJ5f+Lf2h2nVZDb5Nv9GuI7SIqHPTxFB0FAiDGOmWq
	 lGaLg0IPd2wNT3lj5tPgi6Z9druiXOm0tlRmScm6pCkz4LizzClUH7kAyyiH1XakYi
	 4q/KkJy1xLJ+oBsyqBMU81C1w+hmsT1zC8v0ShBcymmI+24Yjqoblvh56A+IUZwphz
	 RiDMWTfd/Ke/9wKBoA5fys8pyGOY1PQppOU7QpvSqF/6+NOuwEAn3C2tR0ktz5Tj+d
	 ugADieywh8CQbihQG61aQPbn+n9MD85GRY7k9Erht7pei9dtwNccl1tPLqqBRbKhqz
	 KpwtrxhPrhrIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBA71807B0;
	Tue, 30 Dec 2025 13:05:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 50AFA177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 304A580303
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:05:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o1EAteIrkhAU for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 13:05:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 26B8A81E9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26B8A81E9C
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26B8A81E9C
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:05:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 8998BC1D734
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:05:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 225BB6072C;
 Tue, 30 Dec 2025 13:05:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3C013113B0392; Tue, 30 Dec 2025 14:05:42 +0100 (CET)
Date: Tue, 30 Dec 2025 14:02:34 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Mauro Condarelli <mc5686@mclink.it>
Message-ID: <20251230140234.3eeeb8ca@windsurf>
In-Reply-To: <20251228223806.2791954-1-james.hilliard1@gmail.com>
References: <20251228223806.2791954-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767099942; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=NgKRxYIDFziLnKoPeJ4eI/wR3whAY64ZcuV5jIDyTG4=;
 b=KMqiIZbkhSdMglUhZcVbG5346qNpwlBTBcrMuRvdirt6Cs2dUcAgLPtizxJsB7GaSSnE2L
 hXaN86npZrbXZpbQszhz19KuUQUhbEDPvcW2DafaI6Zvn9Lmy5r80sSnNACvnwuDKSlMrr
 l7jIdokKhYTdJxp/IOi0sOwJnw4ieZbuHrNYpNLgOo2ixtDWnSYkxWD//9PLNQwHxXZNwF
 92cJB3b1yYJhpR1wag9QPm0l1Q7ldy/dYJv3Z7EsjPGOLnJVPt5E5zzG8BFYbSxxIGf10g
 2VE6gKUtyMQ2upbipvutKHbMkfScuLQzouMXQG6WpJECN0XRko4zI4QX43urfA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=KMqiIZbk
Subject: Re: [Buildroot] [PATCH 1/1] package/python-txaio: bump to version
 25.12.2
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

On Sun, 28 Dec 2025 15:38:05 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Migrate from setuptools to hatch build backend.
> 
> License hash changed due to formatting changes:
> https://github.com/crossbario/txaio/commit/9d1cb8a83964cb52643df4a105dc368c9c4f09ea
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-txaio/python-txaio.hash | 6 +++---
>  package/python-txaio/python-txaio.mk   | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)

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
