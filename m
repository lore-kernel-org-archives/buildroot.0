Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4221C0218F
	for <buildroot@archiver.kernel.org>; Sun,  2 Feb 2025 11:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DFBD83A47;
	Sun,  2 Feb 2025 11:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qcbPkZaELWAP; Sun,  2 Feb 2025 11:43:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB66F83A3F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB66F83A3F;
	Sun,  2 Feb 2025 11:43:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2392912A
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 11:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0572B4072D
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 11:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t3eEmlVI3L1x for <buildroot@buildroot.org>;
 Sun,  2 Feb 2025 11:43:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 00CF240715
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00CF240715
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00CF240715
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 11:43:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 02320B0055E;
 Sun,  2 Feb 2025 12:43:02 +0100 (CET)
Received: from 2a01:e0a:485:b220:1449:f756:904c:bbad
 via 2a01:e0a:485:b220:1449:f756:904c:bbad by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Feb 2025 12:43:02 +0100
MIME-Version: 1.0
Date: Sun, 02 Feb 2025 12:43:02 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250202084429.259494-1-bernd@kuhls.net>
References: <20250202084429.259494-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <48a4c6b5680d64aa0a4e2920b2305517@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738496584;
 bh=ag6S3Dac5BvOOGNXlQrPXMCB6iHUUph0khpl7QXZZ2k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QhaFVdVYkAa6jfLCGd/D90C6ZbopD/6QX7N8XxKq8bYGRRgjQfkj/TJXL8tDD2iF0
 ORKWZ3IEmggZ1SrV64RsiUsdmMAApVyVNSBVWbaIDPc9ywlMta9bMqG7DXSzUhmb+o
 cW6DPDGR2JQ2B00gg2SmMEf6r5yLObDBlc6M69zzrBaE7BSeM9mMHSlK6at07juQB/
 ZQbbOLvc7ujwWOtUogST+SW+f1hHFv9US2ag4ccqBktg3f5yIOcr3Nf5yeXBLpzOhZ
 nB8yFsrAVED8DT2/LR2jskUGo99r2MZT9nJR33rugRMsZ7cYXSfw0gRYtTZk7VdaFl
 B3MLfTu701/4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QhaFVdVY
Subject: Re: [Buildroot] [PATCH 1/6] package/libsilk: switch to github
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 02/02/2025 09:44, Bernd Kuhls wrote:
> https://developer.signalwire.com/freeswitch/FreeSWITCH-Explained/Installation/Linux/Deprecated-Installation-Instructions/25460805/
> "FreeSWITCH project has been moved to GitHub"
> 
> Updated hash due to switch to github.
> 
> Fixes:
> https://autobuild.buildroot.org/results/4a18ee5fce77d0429a00a151cbd5ad1e48d35405/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
