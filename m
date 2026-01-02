Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D99EFA374F
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FC1F60843;
	Fri,  2 Jan 2026 15:31:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SIgxg6N93HqX; Fri,  2 Jan 2026 15:31:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 361C56062A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767367892;
	bh=IsGwfe8rLMa93p9EWMoyzVIDvgivbJKGVSZaQ6YADyE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jDwLULGXo52VK6JcZn3aVFNOCCt5dMqdnjRqegYz7Z6NMg9J7a0ART+s+bGHl1Hbn
	 s7Bl9FwVbj/4Lejn7FP9FAYHDaKhe1B+aWOgE6fHeJq1hZp9YQUfWkNIREbVJwHVgg
	 aXqVkZ6KwaqhX7S9sS0kKDPffGd/t8Po7oAWtVH9FDc0JQUkCydCI+C46RsWq5Jpb2
	 LVQ9cTRHdrU2Q6ooiO+rSEfmT5KwnAq5tfyUzBAa3LkN4JzGI/BqcPR23wFqp5TSPU
	 DPaPlvOf3t9xWTLUniaCoEaNWucFmx8L0tvw1AICcppC3BEvOBoRJtwNo+namqWyP6
	 VyZ6kyro814UQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 361C56062A;
	Fri,  2 Jan 2026 15:31:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1826619D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3C5D40629
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:31:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pSkEm1M8lhae for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:31:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0BBFC40628
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BBFC40628
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0BBFC40628
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:31:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 583CE4E41EFD;
 Fri,  2 Jan 2026 15:31:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 273FB606C7;
 Fri,  2 Jan 2026 15:31:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 001C9113B0726; Fri,  2 Jan 2026 16:31:25 +0100 (CET)
Date: Fri, 2 Jan 2026 16:31:24 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>
Message-ID: <20260102163124.7f539375@windsurf>
In-Reply-To: <20251221223000.184312-1-bernd@kuhls.net>
References: <20251221223000.184312-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767367886; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=keIyqSXrts43dRNpHm+7x9nItKd9nute4u0cF/pZ8xM=;
 b=FHGjdmaA25uvYoDu+r9ywjL3Ffb5xXaQTOWvqYoVt8F2hp0YWjBbYZ4t3gKfEA3muo/Z2M
 XxtfcQ8xGwaDMltWLNplyHvXg7bYlfjA54UreG+X0yF//9ocRlXrExdtCdZO35ozT55TyD
 RKKUG7E2SmeebYuD1SjkvDQDSfXrHbfuJ8yimVjpzbFZcHKx1iJuzAi+GbKdT8vjmwnQqF
 CeeD11SB8aYU1gxKdDSHbRjoC6VcAFayAAVNQ8NyL5jQCgGtjmr2xYlI1u2frE7IgzKZQX
 OPgEPNY/d54zQ4Kt7mp1Ra3bLGVA5KNeK2fBHM8LrLlX5Dpt1oC+Yql6VRqJlA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=FHGjdmaA
Subject: Re: [Buildroot] [PATCH 1/7] package/python-iwlib: bump version to
 1.7.0
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

On Sun, 21 Dec 2025 23:29:54 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> https://github.com/nhoad/python-iwlib/blob/1.7.0/README.rst
> "1.6: Added support for Python 3 (via migration to CFFI)"
> 
> Switched SITE to pypi.
> 
> Added dependency to python-cffi:
> https://github.com/nhoad/python-iwlib/commit/a7c14aff76a28004afb45e08bcf83be5948cb7c1
> 
> Updated package as computed by scanpypi.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/python-iwlib/Config.in         | 1 +
>  package/python-iwlib/python-iwlib.hash | 6 ++++--
>  package/python-iwlib/python-iwlib.mk   | 7 ++++---
>  3 files changed, 9 insertions(+), 5 deletions(-)

Applied patches 1/7 and 5/7 in the series. For the other patches,
unfortunately we merged similar bumps from James, even though they had
been submitted later (sorry about that).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
