Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C978FEE4EF
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 16:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEF2660EC9;
	Sat, 28 Feb 2026 16:58:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ka3h5icMl8C; Sat, 28 Feb 2026 16:58:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E02D6081A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772297886;
	bh=dwnpdkmh3xm9+grz8pHywD6epc92OdqyXPg0i/SU+YM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Sd6IHalNRdvB3JFODc2dio5JK2gdwRH0X49x0vy4dhV+53uNuZJVzeROYt02pn3IW
	 C7BzvuXP3hl8EHOAGkeJTEN0nNVUR1PLyEs7/uyp89QfUto9W8aoc55Y0y3x34AOmj
	 urj7AZJ48VfZVIo6cluxg7GYeiazvvX0jdnexyz0YPQjRsWqGYP2v7pZOjMb6kRlS0
	 MZMr7B6GYfgIA5xoxgY7/mJ8YhqkzKd0iFfpkRH+lW4KMBC2bwxJUlt83SQ5/PypFh
	 R832GBmLz7UHt4SHKabBAuU6ONKDMN+lp1gOF6z84nfxsxgunhelzeWh2ptgAmRDPi
	 PsslQkMBAIk2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E02D6081A;
	Sat, 28 Feb 2026 16:58:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 37E8218D
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 16:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 299B740460
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 16:58:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MYRiP9x2_Y1f for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 16:58:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 694D640118
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 694D640118
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 694D640118
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 16:58:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 7F2EDB00572;
 Sat, 28 Feb 2026 17:57:59 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Feb 2026 17:57:59 +0100
MIME-Version: 1.0
Date: Sat, 28 Feb 2026 17:57:59 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Fabio Estevam <festevam@gmail.com>, Fabrice
 Goucem <fabrice.goucem@oss.nxp.com>
In-Reply-To: <20260226173524.2702621-1-giulio.benetti@benettiengineering.com>
References: <20260226173524.2702621-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <67fe7081f5c78a347bcce0a1d19cf5c3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772297882;
 bh=O/c1RrNTseYmLtUp1RAiArca9FUMT1v0eUdX+FEev6Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vE/Si0gmXDhxlYgEI6ozmz/VAlDd7XohmuJ4EU+7qjEtEtYMfmDhZah0g8hioh/ux
 Zwv2HMAtwD82+JdoFxFmpH2THvQgP5WrhKoAhdhAdqyUl2juFCn6M2dbkcdYBEDjv2
 O9hK7zemW6qixotizQwvIiSB2JDoP3O7t5wuFCIYV9QyC0cEKz6FrXoX4xxgaI7sh6
 yIbMhUJo5AABDQ+1CcY1TDN8aZIGtEzMme6b8ymwxdMyaAfU3kr4aEl+bhGXZXOz6K
 27Dgya51Gd/4Nb1ohgV0Op15OhYG4RGIZu51yd+5kDi2xb7z2w3f1nYPXH6ZNrZrbf
 orC+W7jyxgZkw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vE/Si0gm
Subject: Re: [Buildroot] [PATCH] configs/imx6ullevk: bump Linux to 6.18.8
 and U-Boot to 2026.01
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

On 26/02/2026 18:35, Giulio Benetti wrote:
> The patch:
> * bumps Linux kernel to version 6.18.8
> * bumps U-Boot to version 2026.01
> * forces check hashes
> * create a board/freescale/imx6ull-evk folder dedicated to upstream 
> Linux
>   and U-Boot to ease maintainance.
> * clean up both imx6ullevk and imx6ull-evk readme.txt files
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
