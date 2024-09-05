Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA4BCE7A9C
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 20:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BD9E400AE;
	Thu,  5 Sep 2024 20:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id itaitTqd0d0D; Thu,  5 Sep 2024 20:56:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCE8040391
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCE8040391;
	Thu,  5 Sep 2024 20:56:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 778CC1BF41B
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71485406DD
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CScYIhzJgCUs for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 20:56:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1AA004060B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AA004060B
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1AA004060B
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 20:56:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67491E0002;
 Thu,  5 Sep 2024 20:56:12 +0000 (UTC)
Date: Thu, 5 Sep 2024 22:56:11 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20240905225611.2c8f0855@windsurf>
In-Reply-To: <20240829131232.2132854-1-thomas@devoogdt.com>
References: <20240829131232.2132854-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725569774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Yk/w/GEhhq8wD+CV/9Vyi6JT82Q8rYWVeBmC/y+Z7E=;
 b=gpi0W3TIM6/cawk0yJzDiuoHG5kpmSYEWFnuYi7p5HrCuevNtocZSTyQAjahHRZoEjMIaD
 93b765NjQIjPAEbUYy3E/Hulse8OBGU4+CFJ091nv8Vrja2Hbx6jF3dBys+5H6gq1iql+F
 cpzNZbyO0wFSkZDUnSqVecqOoVyz1s7pYWHkTaelweLiG+u6gi2xkzMqFzbmE2ZWI4C9Lf
 24mb/UfddXPKdqxQzMz8cJOpyxakw9VQFiLLdaClNdSsz71aRKNQOep2RDNmisQgO0H34t
 OfwNnkSDcxdCiO+voO0Zfm6DXUxwY4eAbT2DX9HmoQBw9vw8Jvm3fUkUvOA+ww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gpi0W3TI
Subject: Re: [Buildroot] [PATCH v1] package/libsoup3: bump to 3.6.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 29 Aug 2024 15:12:28 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> 
> News:
>  - https://download.gnome.org/sources/libsoup/3.5/libsoup-3.5.2.news
>  - https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.0.news
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> ---
>  package/libsoup3/libsoup3.hash | 4 ++--
>  package/libsoup3/libsoup3.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
