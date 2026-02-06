Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66824EE6B68
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 21:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A828B41A2B;
	Fri,  6 Feb 2026 21:45:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cc3c9dEOMpwt; Fri,  6 Feb 2026 21:45:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FBC2419D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770414344;
	bh=sevzNxOZfewvf7x2X8/MxHyGaWt+fjCAth8ggG7LXU0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QMfyGc0g9IsWxEXZhAkJfru78NjnuvVEWII6tuxnbde9jtqKGH3vRQ1THO1GDExJf
	 toL31OVx0sj4hDFpTZeYWC+Rg+8pZD9IA/v9MBh9hEHrXfA3b9lJsD7AEcg52M3NXd
	 njHv0q2Bp1iuE82WlKZIYPHSMJTgwe3WasKVqGx5n7u74hgNPy+ILXf2nx5n/azsHZ
	 wQKr9uvSHlg/JuZ/hnZEtlrU4ytm80Ct/nzKO9KT4CrWejbwwRp47jRViXDQQG2IP1
	 7rx9FeS1nAZcvPogf1LDbK4XtpIrACOQvKepzwH7VGmKixlnPW/w/Pe1oXpqaPfARz
	 NxeG4L5haVY3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FBC2419D5;
	Fri,  6 Feb 2026 21:45:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 80BDA2C5
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 21:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65F1F4010C
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 21:45:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sqdwrU0G-blt for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 21:45:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 86A6B40105
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86A6B40105
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86A6B40105
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 21:45:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 5EA98780389;
 Fri,  6 Feb 2026 22:45:37 +0100 (CET)
Received: from 77.109.103.251.adsl.dyn.edpnet.net ([77.109.103.251:65136])
 via 77.109.103.251.adsl.dyn.edpnet.net ([77.109.103.251])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 06 Feb 2026 22:45:37 +0100
MIME-Version: 1.0
Date: Fri, 06 Feb 2026 22:45:37 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20260206213843.1031752-1-fiona.klute@gmx.de>
References: <20260206213843.1031752-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.12
Message-ID: <9d9d3615bc6001996d335a7a50edc517@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770414339;
 bh=TEyD5lV914W/tZpFAaMhO6JFJkP+7aGsVzja5s0HLqQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eekSy5A3nSgS/yDhLm8polXf6NXF5c+MSEJEr+k0e5cECikRZ2rQh+6PHMPUQaTsX
 Tn6rfQ7X+URDAoGd08lkEfjwkJED99cJPU1tFI3g5VrUJ/kUg0C6f7FTdOY/inm+x7
 HJkZkz/7Qr5jR+kFt/Iq39yODp9CStrbOmCSsh00osRaGDRrQB7iO5f3ocS19nWprf
 s+3ssPp2ZN3zwotuBPVFhft5IGq2cehsitAcANvPuzlhBBVT1w7zu05hdm/6DIxetR
 VB7yjc8LPmpKqrRBZR9tdk+wj2KzzJ1GLUejRboeL5qgQegu2IO07mnTc0/mBFIYcc
 L8vPQIjzywgaw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eekSy5A3
Subject: Re: [Buildroot] [PATCH 1/1] {linux,
 linux-headers}: fix hash dir links
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 06/02/2026 22:38, Fiona Klute via buildroot wrote:
> Since commit 0e3ddc9dc85e29cd00338cc79ea4be1d634a75ba "{linux,
> linux-headers}: split hash file in before and from 6.17" there are two
> hash file variants, and symlinks for the individual versions. These
> were not updated in 48186093fd355ede91151b2342e222cef303a6ca "bump
> 5.{10, 15}.x / 6.{1, 6, 12, 18}.x series".
> 
> Fixes: 48186093fd355ede91151b2342e222cef303a6ca
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
