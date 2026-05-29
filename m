Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4828CD6E43
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 10:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAE3B60F40;
	Fri, 29 May 2026 10:53:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1m0ws8_cDQZV; Fri, 29 May 2026 10:53:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BADF6088F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780051983;
	bh=cswCuCgtQfQcqYNmE6Gvdf0ow9UtknXR5RkCO/NmjCI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aDBfAIBvuntKRV+JJ6wKbJcViZ8ruCyOeR0g5M7qH4oHaIP8QGYAuedPqEsNMLaN9
	 9a/1hhLSi998bq0hg+vlE59XL7Z2mUfFHxmvjKdk7OXjnHhS9pcxLRIH6DbFh1eogU
	 XtiaC6AZ9BTvboz658t3/pmaVc/99Z5+4U8NAw+rt8FPcLlfjde1ZAjsKnCyl2SdYR
	 r2qQV+nBNovPhFfIM43DP1f3MKT5R4CJ8aUuQyX5wUK1LRqUhTS06ZZ09C4t9PsowP
	 TZsOpvWjJ32hsHvhcV/vP34Vo7hnHtJH0tBgMGvDNWKnf7N0YRn0tKO7iGB75XKQ7w
	 2ZUCWg/ua3EdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BADF6088F;
	Fri, 29 May 2026 10:53:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AD37AF4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 10:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7DAF61461
 for <buildroot@buildroot.org>; Fri, 29 May 2026 10:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id feqHipjPODAK for <buildroot@buildroot.org>;
 Fri, 29 May 2026 10:53:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A39FD6144C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A39FD6144C
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A39FD6144C
 for <buildroot@buildroot.org>; Fri, 29 May 2026 10:53:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E6CD04E42D88;
 Fri, 29 May 2026 10:52:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A0ADC601FA;
 Fri, 29 May 2026 10:52:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C312F1088805F; 
 Fri, 29 May 2026 12:52:55 +0200 (CEST)
Date: Fri, 29 May 2026 12:52:54 +0200
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Ismael Luceno <ismael@iodev.co.uk>, Romain Naour <romain.naour@gmail.com>
Message-ID: <ahlvrRhu_eSb3WIb@windsurf>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
 <20260424132326.825570-3-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260424132326.825570-3-jeanmichel.hautbois@yoseli.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780051977; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=c551C/dhxxwWPiXD3aHdWAc/5xjKyeA87aoZ54hpEi0=;
 b=I7/eb0uCCLZ+Qp/iOdfMnoo1Gowjwf97QTcC15opo8A3DbD8B+sZluQS3jPOGfo6rA0HyD
 KEYqNFSEJHb8iRlqdwX/0l1qN4D2xK0ptMEsjucm46gUdpRDnU40aeTHcDwx2KtOjyKjn3
 mSU69rixgeACxYOgezquEGnxcF+yKjbZqxP46pDZ5oPKMLOme43nu3FWawmN5fM9LKjRRx
 7p5ZkH36M2YlP9vuzehXYaqZ//p867Di5kApKrrFaItT7G0tsoLvziPBEpHeFAmG7ngTZU
 FHvzxLEw6H90pyAUZV+65jeqxUfdD7dHXZGKtZI4DC2yZJBNWDNX0CMVhNmjkw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=I7/eb0uC
Subject: Re: [Buildroot] [PATCH 02/11] package/gcc: force --with-arch=cf on
 m68k MCF5441x
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

Hello Jean-Michel,

Thanks for this work.

On Fri, Apr 24, 2026 at 03:23:17PM +0200, Jean-Michel Hautbois wrote:
> On m68k ColdFire V4e (MCF5441x) with BR2_USE_MMU selected, the
> host-gcc build fails during the multilib pass because the compiler
> cannot disambiguate between m68k and cf variants. It needs to be
> configured explicitly with --with-arch=cf.

I'm rather confused by "cannot disambiguate between m68k and cf
variants", isn't MCF5441x *only* a Coldfire processor?

Otherwise I think the change is OK, and the description is very
thorough and detailed.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
