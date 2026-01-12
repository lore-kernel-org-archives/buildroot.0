Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61898CF45C0
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 18:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3134160C28;
	Mon, 12 Jan 2026 18:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eYBTxiWdjyLS; Mon, 12 Jan 2026 18:02:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A63160C14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768240971;
	bh=7IQAsaq3BbXAUSuolJxysRTe9SH5Sd7fNloqkYs/RP0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GcCO2YvJwUC9Iok3Shhvp6dQHKixlGU3quZtUgaym1JvdH7FcAb134gLwF+AaE03w
	 mblgPGfcSmmB9eI1U8nMKkjsCF5J6HoPCLAabJL6Ku8CacsCOX5j3+VwbIKpLqCCcr
	 hXnYkD2SZUSi37AsdKMNdQP0CJCPIPpL6dHRKriFWWRYx2LQ4ox/gB90VOde4Bx0QK
	 KaN2L3xUXhGwQ7/9Ig5eirR7bo20IGVo+gEOchXOSdyztY9nSEFU3CrNHK1b8RgkDy
	 sOWYBQXLjwPJC8nYhhvA6J5QY794kxu3Pc6K6HGMapQgen8Klx4cVK0Zy3aRPtFOQd
	 s2Cb+N3UBBGRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A63160C14;
	Mon, 12 Jan 2026 18:02:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CD8A18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 18:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2D1E83F02
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 18:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uDJDbbco8_8c for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 18:02:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A501483F4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A501483F4A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A501483F4A
 for <buildroot@busybox.net>; Mon, 12 Jan 2026 18:02:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9126219F73D;
 Mon, 12 Jan 2026 19:02:45 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 12 Jan 2026 19:02:45 +0100
MIME-Version: 1.0
Date: Mon, 12 Jan 2026 19:02:45 +0100
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20260112075809.710873-1-francois.perrad@gadz.org>
References: <20260112075809.710873-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.12
Message-ID: <aa15f083847fa9aabb99e7b2586e9f12@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768240966;
 bh=P2boH98I8ycKGp32dPqZCjS/SEKuVbHbhWme7HAKaDk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cwnZTxVa/Jx/4xBE/R+35YHRbiwH8aa2u+Z24lONKHSBqnn4AwMN8WywTtMNEafvO
 ZBAgzsLuSWEYCV7gx0H7EVGg3necf7BWjJMlyUO9S0n6OTyW69eX0liJsdUH3LfBgH
 yhSsvxbO798F0KZ1LluKpNkuugeUBGISrMcFHWuxw53LgXHgjbko1vXGNcRl9YvN/L
 0hZKzKYOZF32IaXyr5HXE0scpAkQTw20HtEkOjSqjp7yNqzB5gFni+Tkv8cHYbo3Ec
 uyIRekdYdQ9R8ByK/pgmlgoDDEHChfCAtUxqRs+N2LNTOdtlKRvEsMz97IrkxrEK/i
 lI3SbJejzVd+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cwnZTxVa
Subject: Re: [Buildroot] [PATCH] package/webp: bump to version 1.6.0
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

On 12/01/2026 08:58, Francois Perrad via buildroot wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
