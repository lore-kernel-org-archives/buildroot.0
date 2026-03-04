Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71629EFCE4B
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 21:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4343D81A4E;
	Wed,  4 Mar 2026 21:59:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qyRosinfZBv2; Wed,  4 Mar 2026 21:59:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 658E981780
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772661585;
	bh=5XFcFSVLMyOa1Gu40thH59JjUX1ZZom4ryY5K422BeU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aH8RzxyEWOYCXGuhVqtXW6ffDiLRp9jchpRU/0Zho/7/YdSZT2aEli0ty73j2IGC2
	 a2zpMFg1ySqhGSB8ixnfkGrmxm4ppYp3X3vFBPtSZm52ngJLCds6qUbRl32DxMLFw4
	 z2NvKHvLA3mVMMmc/SV8sf3+xqNym8Tx1qmU7d35DfkoMFunI0/XMqaoKFiUpP/44I
	 WwUZ/u2sfOPu0WPJDjmmubvr2zvi39FHfDiCo4XmDD4SHo91Fr5B7h1O4OwYPPXasr
	 Bhj6jPJY5suFbv04/Q2VRVL8uTrmo1H1jjqYjjesoZIZFz8SLJK3lpVTjXHPIL7+en
	 mWgFUJrPjYKhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 658E981780;
	Wed,  4 Mar 2026 21:59:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 158E0223
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0667F608E8
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:59:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WzQV-BnFHJtH for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 21:59:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3C005608A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C005608A4
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C005608A4
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:59:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 8EADD780371;
 Wed,  4 Mar 2026 22:59:39 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 04 Mar 2026 22:59:39 +0100
MIME-Version: 1.0
Date: Wed, 04 Mar 2026 22:59:39 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260304211346.618625-1-bernd@kuhls.net>
References: <20260304211346.618625-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <4e6a53d13bc79ea46ebb712925af5a66@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772661580;
 bh=f1RXvv/Pn2rdFaVoF/6EgIHcX776tJBPX6LBX4Ff1WQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=naqv+bpjC9gSa4cAkwGTzSS3yIrhIu1wSnvxygGj8X1QJ/5PlshQAftpUn/rb8fup
 j9nuKdqwcH+YanFX2W60HoorTVGUra/rDyMm1DIdBWoiuRfI9nbD5LaW2IK9eVakdD
 581TWjtc/qeC42BEB4mjs85PnrP25KVeMdm36AC227stKhPRmr9rTZZlX35K9Ph4q6
 LTE9DpL2Hhip2ANKItbh+AWUiJ2f6i42e0kJStTWeanJVySlkHiUZX1ky5u0muSUrT
 t4lEG9YS2CQ/96Nzn/w1OVrU+cgTz/1T69QPskX9MN4y+NIcpXpCxjFfvRVfJiZXmF
 7rMLP+JK2W41Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=naqv+bpj
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.{1, 6, 12, 18, 19}.x series
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

On 04/03/2026 22:13, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
