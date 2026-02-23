Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A2AEC112C
	for <buildroot@archiver.kernel.org>; Mon, 23 Feb 2026 20:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 834D060AD7;
	Mon, 23 Feb 2026 20:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4X6NjL-d27rM; Mon, 23 Feb 2026 20:24:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0417160AB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771878254;
	bh=kixubNJF56TZ+03WzgGLxB6eRoddVL8SVs/41qpRhZc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ctu4E2o9LlZbl1/PNJMH5o1tooryHDJhGuXBXpa+RAY8Xt3Kar090C8hRNhCVeT0c
	 s5VYScaitVaetsTpwXsyMXId2p4K1RysnYV0KJt3a2EmQIQU3ak+14Q0dDNnWfxh6C
	 qZ0G8OYNbYNfPvUp2VXpftx129Tu8Rj9ZALmbIP2BWKTTFVBP0zl7WSPzk1bg90Ces
	 MUAeREB9FwxUtzES/Yau9hL5T1GA44Gh3It/6wJpW2DInx02/koWaLaD153BaN3NJc
	 arVTiBxSpcUV9bmEa+8TpCLIb5zixHaoa+0xh0rOTrNGx+76xFD5XQJvZJAP1Cl5MM
	 OKR6KABv7nxEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0417160AB6;
	Mon, 23 Feb 2026 20:24:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B60FE237
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 20:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A769E810BD
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 20:24:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OuIfcWdztcz0 for <buildroot@buildroot.org>;
 Mon, 23 Feb 2026 20:24:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 697D88107F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 697D88107F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 697D88107F
 for <buildroot@busybox.net>; Mon, 23 Feb 2026 20:24:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 07C9C5FFAA;
 Mon, 23 Feb 2026 21:24:07 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 23 Feb 2026 21:24:07 +0100
MIME-Version: 1.0
Date: Mon, 23 Feb 2026 21:24:07 +0100
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20260223083040.327878-1-francois.perrad@gadz.org>
References: <20260223083040.327878-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.13
Message-ID: <8e0f20f951557ac61b1a96349244d16e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771878249;
 bh=4cEydCg3v2mT/hfwMaH7TNtxvaZUk9/FKEnmCQs/tFk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IOjMGvoQQUp/X19Tz+0I9b3F/EwFFL57NQLo+LxwusplakAzmSMAmrB40NhwKm+2K
 XvKTc5W1tW/N5s9KKcvPZdy+8WWdpR7yfgqLQg2lziQIs4wGs9ur7/6IS+4ldjfmux
 o0s5/yygFSTt8MbN+Ub7Mb9HEefpk/lRm/hGYMw9uiiwoavFhxMEcIqitqHm7RV4RX
 U/T5ZAKeuIk0OWqaMLR2ONxeQyi6qXY8R4ExLpgS7moQsuRA4ep+FabrKTdDjgHSLZ
 w9B5KVZpVZJ1/JrfcsaUNetu2iefKWR3XPZbw+HBAiS9wnzs7IDLoNv8H9GZeWpfLj
 t8oYpcfOHTIlg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=IOjMGvoQ
Subject: Re: [Buildroot] [PATCH] package/gawk: bump to version 5.4.0
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

On 23/02/2026 09:30, Francois Perrad via buildroot wrote:
> release notes:
> https://cgit.git.savannah.gnu.org/cgit/gawk.git/tree/NEWS?h=gawk-5.4.0
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
