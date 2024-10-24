Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156CED10376
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 21:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8D2B60D59;
	Thu, 24 Oct 2024 21:03:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bvEMYVbFP7el; Thu, 24 Oct 2024 21:03:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB3EB60D68
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB3EB60D68;
	Thu, 24 Oct 2024 21:03:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E6234960
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 21:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46F1D81347
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 21:03:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NoWQBryjwrD9 for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 21:03:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 372788134F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 372788134F
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 372788134F
 for <buildroot@busybox.net>; Thu, 24 Oct 2024 21:03:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 44537240003;
 Thu, 24 Oct 2024 21:03:23 +0000 (UTC)
Date: Thu, 24 Oct 2024 23:03:22 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
Message-ID: <20241024230322.3037de7d@windsurf>
In-Reply-To: <20241001193355.3966100-1-francois.perrad@gadz.org>
References: <20241001193355.3966100-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729803805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oaU2Jwhe4N5H3SKPiRTumE5QE+y2bDzvJOL2pWiGDwU=;
 b=j9vBEjNQ+DjPPbGYVFSerkaTsTAowUM+Rh7oNnK+nCV0Gf9qB4u4YFRNleU+GyOpRS2I6u
 dFxSjQrmkM6C8811xMXMCEpbmpnGSjEJBGwq94pZtuTq6apq9lFtM6Yjf9pWow4xKl+sjU
 HUdVfFyKClV7SqmkG3rqb9J+3+kpkoz2GYbcgYcraczX8pDWjEgCcH5PrkJjE3M3fUaEmb
 fCFQNPGGSNKK5GIAI2DB4wq2S/XVEa20IJKpuYhZBd954AJyf5Zi5DW5xrPpPf88UckKjA
 aUv8zl4Q3nJht9I1QPndlhQskQ5Ha7ecmQTs6vUMo48qLT5Kz7nO7iX83NoEEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j9vBEjNQ
Subject: Re: [Buildroot] [PATCH] package/perl: bump to version 5.40.0
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

On Tue,  1 Oct 2024 21:33:54 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> remove merged patch
> 
> diff README:
>     -Perl is Copyright (C) 1993 - 2024 by Larry Wall and others.
>     +Perl is Copyright (C) 1993 - 2023 by Larry Wall and others.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  ...ixup-regex-engine-build-under-Uusedl.patch | 554 ------------------
>  package/perl/perl.hash                        |  14 +-
>  package/perl/perl.mk                          |   6 +-
>  3 files changed, 10 insertions(+), 564 deletions(-)
>  delete mode 100644 package/perl/0001-regcomp-c-regexec-c-fixup-regex-engine-build-under-Uusedl.patch

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
