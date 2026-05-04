Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F01FF885A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 20:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AEB4605A4;
	Mon,  4 May 2026 20:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 31K9ydJf09go; Mon,  4 May 2026 20:56:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C608600D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777928177;
	bh=8hynS75clKerYbycO7YB/kyDL9PhKzq0yCIJQ/0l+Ao=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZHvyM7b24nklj4iwjQ9Yk4TkjFEMh6FvSb3mB3vOklPBXC9pHEGglcs0QZYNu+MRm
	 aXEmk2lwTsZlbuVHci/PBSnalc9QDa75Vz0Pk6HvjmYDWCXt3Tw40hEfbfyqY0iDmW
	 STRkYyopRVAXljZWkr01bruhZrtyuz/1TET0jRfuahZDU0M7hHgx2XK0mnOXyhtqEq
	 s9szML05H3245QTbS3IAfDW1lPVyr1FqZMSn5QLA3qm6ALhtVsQ9xHDZyMc+GuyDgX
	 LBxr8QLxXTOw0QIX455S5y2YR7cU2zsMeeRDOSTUzZdJz5P2Iwt93IgAZT+hat8z8e
	 yJYicMp0NrFJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C608600D1;
	Mon,  4 May 2026 20:56:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A7547190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 20:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D00480460
 for <buildroot@buildroot.org>; Mon,  4 May 2026 20:56:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RPBdBHGGS1FD for <buildroot@buildroot.org>;
 Mon,  4 May 2026 20:56:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C127280453
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C127280453
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C127280453
 for <buildroot@buildroot.org>; Mon,  4 May 2026 20:56:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 8E4C6B00563;
 Mon,  4 May 2026 22:56:11 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 04 May 2026 22:56:11 +0200
MIME-Version: 1.0
Date: Mon, 04 May 2026 22:56:11 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260504192351.3971764-1-bernd@kuhls.net>
References: <20260504192351.3971764-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <a02c59bf24cd4fad3c23e6251654fc27@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777928172;
 bh=SCHWyukfuBnagSf61XE27iggi89NWlXgxxLWJPuIs8g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fD2HnSuUF2k4Lt5otCYYUpgVSp4Tn1UQoETaAyiCxLOXtcmDQJzxt+SWwIwf6lufI
 Tn7gqhXcTLcWAeV+Awi8DFadnCrT8bOTK+24vHFpEmVwUE9aLOQbOBwVCQdnC6NUfW
 cOd4UzO5QPmrfU3xFOij1lonBEz8qmzU9YWPr7sUc3BYRj6HlkPdwFk0zqyLnqTw5R
 CStu45OzSiFNS8qhHNAxfSJRYGZjCfoD1RTHvW7BXw+hLaaBw3UBJPgdW1FdvV/tnN
 HbQ0J6i+tSV+KtG7eT0Lp+Rg/2Mx2PNT8RHGPGp4lCdj4qPqNB17pNEWQVREexGIhL
 ZKiFAL2xmzBLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fD2HnSuU
Subject: Re: [Buildroot] [PATCH 1/1] package/apache: security bump version
 to 2.4.67
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

On 04/05/2026 21:23, Bernd Kuhls wrote:
> Changelog:
> https://downloads.apache.org/httpd/CHANGES_2.4.67
> 
> Fixes CVE-2026-23918, CVE-2026-24072, CVE-2026-28780, CVE-2026-29168,
> CVE-2026-29169, CVE-2026-33006, CVE-2026-33007, CVE-2026-33523,
> CVE-2026-33857, CVE-2026-34032 & CVE-2026-34059.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
