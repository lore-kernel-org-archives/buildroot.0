Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD60E63CA8
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 23:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42A8240854;
	Sun, 25 Jan 2026 23:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wjWxfbtDYzC4; Sun, 25 Jan 2026 23:18:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FE4D40851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769383089;
	bh=XXzPNOP8RhmzbBfovv9q8ZP7Ny99iMiKed7v/9YsqdQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=C7wleIp3iOuKkEJ61P0JEWhhPUt2IxaCB35O/1nsuweJwz1NPUE863piAP2JAeV4J
	 83y79HKH3gLFhgGd6mgejzQckCCY7GdFIw+dZEQKY+bIqg2ZqB2f4pypoFIOlSZAla
	 ZC6On8LvCcQJqhawZyZYthLPRM7y2k0/DSjiLLDh2oFtxUzab9Qgk7qWVKqozoXYWU
	 VFzrKVImW1MoOXbwLuL8D0VZPbh4C6XoXdMo1M0+j/URE6mQDyPjnsTDvwYN0VachB
	 g2RhUqJYC+FmkQMg5qWFJWd5mjoUlP8wJXoyvKIAgtoZm3QQCeFMnqhlg/FS8Cgrca
	 h0GbgmrDkTEsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FE4D40851;
	Sun, 25 Jan 2026 23:18:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 18B881CE
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 23:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0816881CD0
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 23:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8JvpeOTmL_XP for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 23:18:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0F7D081C38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F7D081C38
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F7D081C38
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 23:18:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 91F0FB0054E;
 Mon, 26 Jan 2026 00:17:53 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 26 Jan 2026 00:17:53 +0100
MIME-Version: 1.0
Date: Mon, 26 Jan 2026 00:17:53 +0100
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, yann.morin@orange.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
In-Reply-To: <20260124115741.828751-1-neal.frager@amd.com>
References: <20260124115741.828751-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <deb3e4fb0f41355c6225888aeea89d5f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769383083;
 bh=PhnU0hga1Fk4HKadRMd8nfRTuyxqbRYDniTZFI3R7Ic=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=i9xe5uYXvMuHrXZvESn05WmixnqjCFDS9TISbDWIJ5adBT4iU+EHJOjv6qugUpjDZ
 PJdsHrfbdlcws8jKoOpd7tFE7WtMyObhblewlYG7W2swGaM9wsEy5ZnLzSV813KFp8
 g/SlNEg+p+k/ackR/zrd7kR5YofumC3nUBfU3Bok9qnBen6jmQF9mO8v/2kLRVs3Eq
 KDthoHlD7QaZFA5FCofy67htx0EXbBK4H+osOd0i0gH03MLQFPIfux3llJdQQoMdcO
 rNg3CLoRrA7Vzr1JRsxpN0OuycBbfT7/MexTlKIRlN2bFcu6DPpA+fGyiQeU+uaH9Q
 rKLWuMCD7qPFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=i9xe5uYX
Subject: Re: [Buildroot] [PATCH v1 1/1] package/newlib-bare-metal: bump to
 newlib 4.6.0
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

On 24/01/2026 12:57, Neal Frager via buildroot wrote:
> Bump newlib-bare-metal to version 4.6.0.20260123.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thanks.
For info, I added links to release notes. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/eb63637dd0ca3fdd3c45d79525c706ee64ec03d3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
