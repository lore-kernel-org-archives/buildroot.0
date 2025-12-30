Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEDEEE4992
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 18:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5DD5403AA;
	Tue, 30 Dec 2025 18:15:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eajIsLfz5LAg; Tue, 30 Dec 2025 18:15:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AED340425
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767118511;
	bh=VZ39HxfZIVLjCzKCAskOYc51sKkzIBjtX0SoNMyFNyI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fwgQMy5lMnv9bRWM49GYMuy7/kUYMp3ah3oY3+h41hvSs7Y7/692Ufi9pUvyPrnQr
	 gP0m2hKkOshHq2DE15TF4axU3Xyg6cfOOCyT9rTafiG+vZ/djUp3G9tTkdTtUJmrP5
	 rPzhUgY4qjNhWKFxiWXp8AbiHpfc6R4jglDuc/2uQWEyv5Id1hdmsbD5AHUxlIseD4
	 j5sPdMO/TeyiQK70Bsn8tjhJhhQpGF8jhuw9ZbTIZxW5IXnezxHkoUkE3yTrzzdzCF
	 FSvSE3PdjPSVZ561oxqgwunpzpZ90F/xBBGl1F9ejVy+04H6xo7SvgCLNt54HLjTw/
	 ctAM8VlN4S9lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AED340425;
	Tue, 30 Dec 2025 18:15:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9451D177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79E2480F83
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:15:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CaAAlSzOAa68 for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 18:15:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A4E0F80EE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4E0F80EE8
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4E0F80EE8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:15:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 27377C1D73F;
 Tue, 30 Dec 2025 18:14:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 92E956072C;
 Tue, 30 Dec 2025 18:15:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0B87F113B05B3; Tue, 30 Dec 2025 19:15:00 +0100 (CET)
Date: Tue, 30 Dec 2025 19:14:58 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Andreas Ziegler <br025@umbiko.net>, Angelo
 Compagnucci <angelo.compagnucci@gmail.com>, Fabrice Fontaine
 <fontaine.fabrice@gmail.com>, Mahyar Koshkouei
 <mahyar.koshkouei@gmail.com>, Matt Flax <flatmax@flatmax.org>, Romain Naour
 <romain.naour@gmail.com>, Simon Dawson <spdawson@gmail.com>, Woodrow
 Douglass <wdouglass@carnegierobotics.com>, Jan Heylen
 <jan.heylen@nokia.com>
Message-ID: <20251230191458.79bbaefc@windsurf>
In-Reply-To: <20251230114545.2236640-3-bernd@kuhls.net>
References: <20251230114545.2236640-1-bernd@kuhls.net>
 <20251230114545.2236640-3-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767118504; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=oAh/T8qJ/pt6S5uLOXdrM73hTzrm9DOH5dxu+jDxk5c=;
 b=2u4HbdRFnUZ+B96x3eTSBY6/lfGOfRNODaP4A/ONb65aDkdHcFLPsHpFiLnzez96F7kWU+
 laWf0tXCI3edwjVG3gqpVoqJ0Z+KN9AQqglG2Zenc0iXy4cp/pyGV7Y8RNIjJapWZev0hi
 rfCfSXhAOR9R4gJJgCjj99MxUZuzFGq8iKNS6NbnJcPDEbZs1A+iLW0G2EjfgDVE4d1tAx
 J+9dPDbuulKuTEVxUi08V+GIB7aNctHR8RR+mhe7QvYQOFl2A+gWAcG3uPNjzeRb87rIlW
 0QqhiIGZ9hypJM6mLd15KVE8kgYc3sC6wyWaXrBbwTHlgSAOhfAC8oywJPcMuw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=2u4HbdRF
Subject: Re: [Buildroot] [PATCH v9 02/19] package/opentracing-cpp: remove
 package
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

On Tue, 30 Dec 2025 12:45:23 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Quoting https://github.com/opentracing/opentracing-cpp
> "This library is DEPRECATED!"
> https://github.com/opentracing/specification/issues/163
> https://github.com/opentracing/opentracing.io/pull/460
> 
> The package is broken with cmake 4 and no other package depends on it.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Jan Heylen <jan.heylen@nokia.com>

I've added a reference to an autobuilder failure here.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
