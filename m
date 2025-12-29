Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D39E92733
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 16:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9A9F80B6E;
	Mon, 29 Dec 2025 16:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DULoVCGwhpUj; Mon, 29 Dec 2025 16:55:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33B988067F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767027358;
	bh=suwLrqTZs3/6IXWv5Ti5aTg/IByUB4dvZQP0mqyy2Qo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=L43p2EiwafexvyWkdXvY9mf23pnws7OHC29Hu4kkEhYSInxNF/qZJvUgBlC6G+hdz
	 cHn2OyeFWwFqwG/7Xr9tJdK+ySMPMB9bLXyhC1KN8eu17aZX0YBJuVUoB36J5/V6H8
	 pgKlJdJo5tSE5L5T24PG/xSxaT4N7VMh/x8QJZAbsGFlueIjPYB0HM7KSZZQW9tfjY
	 8tW4dXDEOU7RSs6Rpdg45V4tFIWgQkwXud+pMZKj8dVfItFmjeX2MCodb9iVYSUA0b
	 wDNdCql+6OzXBfF6GLEBf7EECrOo/Y5dr2xFzN1DS5MA7UacTJbG/eya8Mck1RBvsi
	 zERQag6MUMqUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33B988067F;
	Mon, 29 Dec 2025 16:55:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 02E47177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 16:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E90454036E
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 16:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XXxIZ3dk79bL for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 16:55:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0B1B5403D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B1B5403D8
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B1B5403D8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 16:55:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 14B5B1A2444;
 Mon, 29 Dec 2025 16:55:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D78F260725;
 Mon, 29 Dec 2025 16:55:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 47C3C113B0691; Mon, 29 Dec 2025 17:55:51 +0100 (CET)
Date: Mon, 29 Dec 2025 17:55:49 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, Christian
 Stewart <christian@aperture.us>, Marcus Folkesson
 <marcus.folkesson@gmail.com>
Message-ID: <20251229175549.0e48a830@windsurf>
In-Reply-To: <20250926100609.4158676-1-dario.binacchi@amarulasolutions.com>
References: <20250926100609.4158676-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767027353; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=GZm5Mr/7ndOHm/fqh5L/cFIPb2ew0ePX4zJIqHS+iZU=;
 b=BiNaUs99u0tfy1dmfdzD71HElH7ivlQZjcjFbz6YL/mJOi9ihpSeKLVF6v68BHJtF7TW5o
 xBXYDvlQ7/CgyylFVZ/7mGsEmHxhK42kVNeoxX+CyF48ZwI+/nwgFp/yDP6/CWqD/IXtvM
 lLrlsncZuOsIoblVziQUn2zy57Zsh1mtwudufecaCXYIoALV6rwdws059P2qQmcf3rqtAX
 JtYpZuOCHpIfgl208Ah4nG3uS2GaKDVlPfDi27f7MryfcGsOAGLnMaXI8Ze7RuYSHYwqiJ
 HgdOvxwR2mNzC83pt13vwLIl1ehdRL6+IgSab+rHamFhWBrXrRiXMXI8QbslBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=BiNaUs99
Subject: Re: [Buildroot] [PATCH 1/6] package/embiggen-disk: fix
 EMBIGGEN_DISK_VERSION
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

On Fri, 26 Sep 2025 12:06:04 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Make EMBIGGEN_DISK_VERSION compliant with release-monitoring.org.
> 
> Fixes: 4ae18c511a2a7e8b0b6cd7a2961ba4c0e395fe2a
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/embiggen-disk/embiggen-disk.hash | 2 +-
>  package/embiggen-disk/embiggen-disk.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
