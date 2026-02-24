Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C80E9B269
	for <buildroot@archiver.kernel.org>; Tue, 24 Feb 2026 14:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E32A860BED;
	Tue, 24 Feb 2026 14:23:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0wGNOVs1P9tv; Tue, 24 Feb 2026 14:23:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09992608CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771943030;
	bh=cmbWIGGSGG56fZS+pRPUk3htnwQadnVbmPLJPCanv3E=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JeQ4YnnK0A5nRhkQUwM47Fc9g2W1ryofBab8Mc3u8HCzm22R4ohzGSxJQD1kJ5pNw
	 YT7yIfupRn+/EtsCVa+xp5SPJQku0cZ2BFid2Rz2K/EV5EPMBEBPxVG8xnDk0jCQZI
	 c0o2TciYwn42YV71X/bBe3BPIXEQ9R99omb7UczFTVAWcvn1cIWmv6UCJL9Zdem3Dh
	 PMVSBYbtOFBGw22rvVFt29uSGw0JF3MnRtPbOBPqdV7KPzLE5zl/WGzCAw/ejSUes2
	 rcFwFeaxEnJhJsgjRC4wd0jBMdBmwdULSVJOnZHbGRsHREL/oDhYPRnTuG7pBWPTeI
	 75leDZWAHpbaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09992608CB;
	Tue, 24 Feb 2026 14:23:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B5CD1B8
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 14:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5741608CB
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 14:23:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SNLi4qyHtF-P for <buildroot@buildroot.org>;
 Tue, 24 Feb 2026 14:23:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1291C608AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1291C608AC
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1291C608AC
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 14:23:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 4A2C3C143E4;
 Tue, 24 Feb 2026 14:23:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AC5CA5FD9D;
 Tue, 24 Feb 2026 14:23:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 59C45103690A4; Tue, 24 Feb 2026 15:23:41 +0100 (CET)
Date: Tue, 24 Feb 2026 15:23:40 +0100
To: Vincent Jardin <vjardin@free.fr>
Cc: Vincent Cruz <mooz@blockos.org>, buildroot@buildroot.org, 
 Heiko Thiery <heiko.thiery@gmail.com>,
 Jan =?utf-8?Q?Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Message-ID: <aZ20SDo5Dxnta4be@windsurf>
References: <20260218124726.120001-1-mooz@blockos.org>
 <aZ1Cc77UDKkaGWsM@L30177.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aZ1Cc77UDKkaGWsM@L30177.local>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1771943024; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=gei56f4LXlm0qZGIky2HtooGKGBNkH+pphGTJBEjT2o=;
 b=EcN1qQlcGXR3oeWgC+wyhppTgy6QQVZIIzpqnAR6Leb2lLzt+sw6NTgbn5VuK0v+Hs2HRu
 cWbHyoeauf8yf2U6HO28vRJxFdylob7vTqx3IBMEzE2tKACg+AxKngjVJO/KmPv6Y3vdwR
 AM3gjApHNoFswyTmIDizVh8DKZocYWNQB6TTKLZjQydR7/dMFTUNmrnFuM1tx8vNCpujhM
 cnhDYun1MUtHc6ur+yCmfWhjYJmWRtdw70I0v3mpnjD7P8EzAVhRVt8RrZLV97FTSROoqS
 wpKqs6783vsQmc54hTgvoLYI387HHPnhTy8kc21WGHAM8csYnl0jFuEHUjTxpQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=EcN1qQlc
Subject: Re: [Buildroot] [PATCH] package/sysrepo: fix build on riscv32
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

Vincent, Vincent,

On Tue, Feb 24, 2026 at 07:17:23AM +0100, Vincent Jardin wrote:

> @Thomas,
> 
> > 
> > Upstream: https://github.com/sysrepo/sysrepo/commit/a0661b7e6a7b2f784fe3222048066c31187c6f92
> 
> It should solve your comments:
>   https://lists.buildroot.org/pipermail/buildroot/2026-January/795342.html

Absolutely! Could you send an updated Buildroot patch, which
integrates this upstream sysrepo patch?

Thanks for the work on this topic!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
