Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3BEFA3738
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 12:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A72C404B7;
	Fri,  2 Jan 2026 12:25:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SkKrGjuPVZzb; Fri,  2 Jan 2026 12:25:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B128F404EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767356727;
	bh=o3bzoSlb2BBt+Cvj9fNd3fgXvRj21lgwkvvvZn32MNI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jJJ2SiYMh5XGCdlHiLHhEpZDhFeOzmNbWyghqfq27cDx9C0RZbYIGKW7vdJzfEF0V
	 jdK3Ziv0f7Asp6HsGh9XZ3yKgmczeMFR4ghhJGe+lqkqfvygn8iBiupIrmxGlK9Nke
	 1X1N2L51zZmFibKvbhRkK64L4C2jd4vg7XGsf1Mfa5tdEmN+04oYdvG1vgw7o1rfzJ
	 L2iqXp1Y1Hj58Ro1A1p9erl/o+3J/vQbZjjSWvjlf7JMr4ldmtVkuhxS3ufMkBbcus
	 3/7kvsFLMsp3OpYHMI9x1/4cL5INWUFeaPqRKO6HcaAOd+0vqkQC0dZrbxDVuE8CSs
	 rOSPsahXKKi2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B128F404EF;
	Fri,  2 Jan 2026 12:25:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1245819D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 12:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FD964030D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 12:25:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7yZffTO5HFi3 for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 12:25:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 84C054007C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84C054007C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84C054007C
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 12:25:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 5C1BAB0053E;
 Fri,  2 Jan 2026 13:25:20 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 02 Jan 2026 13:25:20 +0100
MIME-Version: 1.0
Date: Fri, 02 Jan 2026 13:25:20 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20260102094708.365613-1-bernd@kuhls.net>
References: <20260102094708.365613-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <6f0411d89ab3261b29a591b24e047600@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767356722;
 bh=XDrcVx8rM2oAUTM4G8aCDLHrti6u4U1WUsFHLtAkJwQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BGAMDthv/PbjWuV1KK/c2ysIvoZBvFNcwKh2jfY+evBWAJ7RuxVr6ZedQqjzxm3qs
 kJriv9VHOpIbA/Zn9WXHAoMCH65t/PST030fvgO2tbFrhv4HOIcHfae/Zfx6CtQLO1
 XG397c1fXaILgW7yq6iwKT/m2rJMTSWQ+QWcDWBNFIGpxuFiuB5jLiB5C0EfqPjQzb
 txRGogMqsoi3zrDB2CHMX/ytbcjk9U1cShyiGyPrqsVnMi6n2iKHcwn28tgHETjO+F
 ceDRlHbdvrDTdMQlisDujf09KEhAaTF9ddy2v7dSmwFHpR39Pbp63sQVTOCCuv0vr6
 m5uEZJjYG890Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=BGAMDthv
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 25.3.3
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

On 02/01/2026 10:47, Bernd Kuhls wrote:
> https://lists.freedesktop.org/archives/mesa-announce/2026-January/000832.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
