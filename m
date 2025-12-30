Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261B8E95A8C
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 13:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9D1460B39;
	Tue, 30 Dec 2025 13:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L7PcaaQLprUs; Tue, 30 Dec 2025 13:19:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3250607DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767100774;
	bh=yQYkYER4Rh86H/WB0GPuU6FZ7NZmch/Z0gJTWPTvQXo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CtCU7/GfZNxAwg8cEfk1FSMwCm8XgP0t/30BJzWChyVaWJWugwM3o6A3rRGFdLIFL
	 tnbv25v7M5TB6hzhGmr9DyarPonRQ8ACbNDm+7IvxyuwiQrg/FsvNoas8pVKkF37Yd
	 kFLUkEOHwUXyFvVKp3dQxUoPL2k8p5w4fnNfSGxbsTsts5xDS7lKzRhTtPe33WCVhP
	 bpHC7kZVV4A7o8+Idh7RXb8YournPAMIbwNnPYvW4949w41jME6ofj93hl9PNsEGy3
	 ZkpC1ONawYgcnMQdTQGxT3n57sofm38S8L8r3MZdSkiysaq735mPCl/dCKtmk33wrL
	 AWoxMW3Uab0ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3250607DE;
	Tue, 30 Dec 2025 13:19:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3766A177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 294B1810B5
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:19:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ucit1qc-hYu for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 13:19:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 42D1580FB0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42D1580FB0
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42D1580FB0
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:19:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 4A17CC1D734;
 Tue, 30 Dec 2025 13:18:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CADC06072C;
 Tue, 30 Dec 2025 13:19:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6BCBB113B0392; Tue, 30 Dec 2025 14:19:20 +0100 (CET)
Date: Tue, 30 Dec 2025 14:19:16 +0100
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>, Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20251230141916.67724e91@windsurf>
In-Reply-To: <20251207214849.757334-1-fiona.klute@gmx.de>
References: <20251207214849.757334-1-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767100762; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=5v9Ae6PrhblNwN9wL0nXYegzpRGGQwE4axZaO+LtsKk=;
 b=rnGdEAIP21JR1azTcZZ3BnYb8NoECqVFX9UgNnnqNdQ4utnDg4YRN4w8vjUsANanYrDIeD
 u2Zw0f5Wo+B+UgOgJU5/EBTVReps7dLZnS/3V0qy8RyRv6l/FD0WmnH3iNsizkyQef0vPg
 0a5V9d2SZF9hLkOxAKx1J7rpNtcSQNpDPZpmdyckZtLqb925rL6o1cRNW7b7VE5fzEghEs
 D2ZuOdouAe3WY84U/1rXZcZV6EZz7PnU0nnulUJGMAv7OLl9EacFJnkRDOEvM1RQPKOv5Y
 YhoNT6NrWqKkQcyTfpmC70WJgIm0DImnabIuXp7A3+dUyIBlW96wbsguKUeEBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=rnGdEAIP
Subject: Re: [Buildroot] [PATCH 1/2] package/apache: add config option to
 enable mod_md
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

On Sun,  7 Dec 2025 22:48:47 +0100
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> mod_md allows Apache httpd to automatically provision certificates for
> HTTPS via the ACME protocol (e.g. from Let's Encrypt), if configured
> to do so. The additional dependencies are non-obvious, so add a config
> option instead of only enabling the module if dependencies are met.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> ---
>  package/apache/Config.in | 12 ++++++++++++
>  package/apache/apache.mk |  9 +++++++++
>  2 files changed, 21 insertions(+)

Thanks, both patches applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
