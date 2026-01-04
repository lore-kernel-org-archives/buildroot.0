Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC80C2A062
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 14:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C284B80E1F;
	Sun,  4 Jan 2026 14:15:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AnL6vm3Q4W1i; Sun,  4 Jan 2026 14:15:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1F9C80E2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767536120;
	bh=Y85UfMIEMC72KlMLCD41gCEbEFnGGw5s6T3tq4AAVbQ=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=EvTI8azpgwGklMIsurkVU0Awv10ccUh6hAlf3aVqug8vHp/Yn7vtw4hvtxcKvH/tB
	 5RTvSTXH6k9exZgRDxCehMNCfmitskko3BKbBdp87z2Udl+lk964yg7N78X77AG6rB
	 ssERoXO7r7i10DgXWo12O/oC+jciWP75n6iUIirCYo6i6pL3GzI0NOltSuiPnnmTa4
	 HZdh8moYxFDAtLn6XJU2GcJE2pLLo9WOwd9oqUfEBR7v0buvpSsxgPMTq5oABafWLL
	 agsuhrkYtL5yzLQATRtPK3n9K6URjEt92DQxIxRnUK8q1CmtuvDC/rhUvvKrk0WevA
	 0rN/ArnGBFUVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1F9C80E2F;
	Sun,  4 Jan 2026 14:15:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 131E52DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED0EF60728
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:15:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9iWV6P0YeUmm for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 14:15:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D4C73606D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4C73606D6
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4C73606D6
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:15:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E8EDEC1C96B;
 Sun,  4 Jan 2026 10:39:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C4C8D6072B;
 Sun,  4 Jan 2026 10:39:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B07BF113B0449; Sun,  4 Jan 2026 11:39:26 +0100 (CET)
Date: Sun, 4 Jan 2026 11:39:24 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20260104113924.204d1799@windsurf>
In-Reply-To: <87wm1xn0sp.fsf@dell.be.48ers.dk>
References: <20250929092431.8974-1-fiona.klute@gmx.de>
 <20260101181830.35ccf7c3@windsurf>
 <87wm1xn0sp.fsf@dell.be.48ers.dk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767523168; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=96qa0xTZeSB9rYTFEbRWU89dEx6llgnXE0XL7wORHbc=;
 b=zNjWCNKZd69dfsExa565St3fMQ8Bhga+h5O01OPlXjNHLI1IwU7lLGU0LXutrsz0GtYZQW
 4qTTOhcGwEjmfpQsAUBEesFd/xUK6RkkA8RMBMTAFZLAea73LOx8cXjwgo5bcjFhgzq33H
 C7y6tQ6EsZVMmcSwAHQUlMLc0heVzgpFGfi/17Nv+D3AfV/jpw6D17ltjEgrSz0ZOKFI6M
 dWEsRX2jNlTjGPGAaOpAax7QrQ8lq0xPye5e53PaQqhMtr1UgLKQ9bmX2TPwj8LC7KMQ/4
 KEM2htMd7DHQUkdivRcFq9Jv54BRn8CZae4bZZ9O/aEh6VnQ0p9CoNxRVVh0Ow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=zNjWCNKZ
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: add check-package-external
 target
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
Cc: Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>,
 Romain Naour <romain.naour@smile.fr>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 04 Jan 2026 11:13:10 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Sorry, didn't look at the patch yet, but could we instead make 'make
> check-package' do the right thing if BR2_EXTERNAL is non-zero? E.G.
> iterate over the words in it (and pass --br2-external to check-package)?

There was some rationale in Fiona's patch about why it wasn't done like
this, though maybe this is something we want to challenge.

Here is the rationale:

"""

I've considered wrapping this into the existing check-package target,
but there are a few reasons not to:

1. Some people might not want to subject their external trees to
check-package at all, and would be annoyed by the warnings.

2. BR2_EXTERNAL support for utils/docker-run is still pending (see [1]).

3. The older shellcheck and flake8 versions in the Buildroot base
container image used by utils/docker-run produce some false positives
for my external trees, so I want to keep using the (newer) local
versions for checking those, but use the container for upstream
patches. That is more convenient with separate targets.
"""

Still maybe we should consider ensuring that check-package validates
BR2_EXTERNAL, and somehow address these concerns?

I think (1) is pretty moot, if you're not concerned about check-package
warnings, don't run it at all.

Regarding (2): probably a matter of merging BR2_EXTERNAL support for
docker-run.

Regarding (3): we could also update our Docker container.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
