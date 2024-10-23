Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A24CFA460
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 19:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F60F80E9B;
	Wed, 23 Oct 2024 19:23:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HxyG7pn5JQX7; Wed, 23 Oct 2024 19:23:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 637FF810B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 637FF810B0;
	Wed, 23 Oct 2024 19:23:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A7C727F2
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3852F810B0
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fcc3NgPLkhOP for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 19:23:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 206E280E9B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 206E280E9B
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 206E280E9B
 for <buildroot@busybox.net>; Wed, 23 Oct 2024 19:23:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3884A20002;
 Wed, 23 Oct 2024 19:23:26 +0000 (UTC)
Date: Wed, 23 Oct 2024 21:23:24 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
Message-ID: <20241023212324.7c319f4d@windsurf>
In-Reply-To: <20241023160014.568872-1-francois.perrad@gadz.org>
References: <20241023160014.568872-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729711407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YhexYvLAgyF0YFfa0K6RuQijlvRWldeKHqmgXqIjZm8=;
 b=TpzkUspFD+YbSa6np+wI3bIReFZiowKj6UTzf+DRfFwRRaSDizxUp5bf6VL4axnU6O3PqG
 LlkdAlCfH9HfWJqOGuE3tzi7aULdhnn11PrK+DH86BBQY7wskL4GJhBHZVjcPqg1BoBkIC
 il+asHyxzaZwDxR9MgLGd/H/5frAPEH7/idgVDLXbISyt6wDO3s/Jc/p0LNLsywJB6qCB6
 v0dAzj6P58WBMR3bFlbMJmlQrLa4jg16HIpUeSkdos6HFbC8HEbk/VPN44J3TgvQ9nBQX0
 0LSJ7wULyoDkAhMjCLR/9bHcgANZnUPONnL+zzv4W/jJ1ZPNewgBhpVG/c/bbQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TpzkUspF
Subject: Re: [Buildroot] [PATCH 1/7] package/perl-digest-hmac: bump to
 version 1.05
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

On Wed, 23 Oct 2024 18:00:08 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> diff LICENSE: use "The Perl Artistic License 1.0" and update millesime
>     see https://metacpan.org/release/ARODLAND/Digest-HMAC-1.05/diff/ARODLAND/Digest-HMAC-1.04#LICENSE
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/perl-digest-hmac/perl-digest-hmac.hash | 8 ++++----
>  package/perl-digest-hmac/perl-digest-hmac.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

Thanks, series applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
