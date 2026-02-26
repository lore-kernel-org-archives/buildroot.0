Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AB8FD9E07
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51B7660771;
	Thu, 26 Feb 2026 20:10:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 037ZFG4i2qXO; Thu, 26 Feb 2026 20:10:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6EDD60767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772136606;
	bh=+JZhGLOLVwsU3tz8XmKtQsba/qj8nj12qWpp0JwqGtU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FqKNZrMgTGf5rsDH8AeNd51CeA0CP+Rfw5ZJYchfKmkbNLPzqDCnJppnbFb/uFNQ2
	 z2AvKjQ77n+Cx+yMc2r5+T/Tbo0icELccM4L8fZnsws2dOqzhTT255ftiaaFELaN6A
	 UqpOFOIHV9zo4hyd9Le3macKlvsA58ha7zoHN626ptKuaUlwUBKKhskzDB1wY6y3qM
	 L5wcGDxu3Kw0gUJC0Z9x0tUTl0nDHk8wkzxP8QQT6rcJSpNCAQa0hzKfinHtml0PRa
	 tPOfHY9EBmLN2M5nt3obqzfE9SwSBwwNG3zkzr6K2dJcuQ5dynmm6BNNYf8cIa5/GM
	 EvjrnpPUM07Fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6EDD60767;
	Thu, 26 Feb 2026 20:10:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9ED63204
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 909EB81157
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:10:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S999ghlPBolY for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:10:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8CE2781168
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CE2781168
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8CE2781168
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:10:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id A3D645FFB4;
 Thu, 26 Feb 2026 21:10:00 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 26 Feb 2026 21:10:00 +0100
MIME-Version: 1.0
Date: Thu, 26 Feb 2026 21:10:00 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20260226080651.19171-1-thomas.perale@mind.be>
References: <20260226080651.19171-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.13
Message-ID: <736ac09605c2511121e9dd5b0e071a4c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772136601;
 bh=Zl5XiPdvW3032Oxh0BwFYN/mcjnFTbDxQ34friSbF8E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fIL+Goh5JjuP/cfF8raanrpBp7AEak40jPJHPFwS++auqApOG6x3EVhXkrvmwFti6
 pUKq4pLGnsRkaR3elbLomz26sSzu6d4rNzYovRYxteGeVbmI9GZ/H84raKJb2rXtc9
 9Gz2mSyEvskpE3z7ayKwzcltsITVUZeoRA0OVaVrCN0h4XytG3SUeNEEG1ICeyZshp
 9+l/hZV+ojQCPyDxdUdOhSr2VHSa/U19W5cHBYoUDhn91HR2Ou6W06f2eEKX3JE1s3
 5BDUY5XxWTees73RFBv5qzKTFFDgcNBrtGr2r4jz3HqQHfH22pHiXVOoqd8dxY5t0L
 cNS20LXBVY9qQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=fIL+Goh5
Subject: Re: [Buildroot] [PATCH] package/igmpproxy: add patch for
 CVE-2025-50681
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

On 26/02/2026 09:06, Thomas Perale via buildroot wrote:
> Fixes the following vulnerability:
> 
> - CVE-2025-50681:
>     igmpproxy 0.4 before commit 2b30c36 allows remote attackers to 
> cause a
>     denial of service (application crash) via a crafted IGMPv3 
> membership
>     report packet with a malicious source address. Due to insufficient
>     validation in the `recv_igmp()` function in src/igmpproxy.c, an
>     invalid group record type can trigger a NULL pointer dereference 
> when
>     logging the address using `inet_fmtsrc()`. This vulnerability can 
> be
>     exploited by sending malformed multicast traffic to a host running
>     igmpproxy, leading to a crash. igmpproxy is used in various 
> embedded
>     networking environments and consumer-grade IoT devices (such as 
> home
>     routers and media gateways) to handle multicast traffic for IPTV 
> and
>     other streaming services. Affected devices that rely on unpatched
>     versions of igmpproxy may be vulnerable to remote denial-of-service
>     attacks across a LAN .
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2025-50681
>   - 
> https://github.com/younix/igmpproxy/commit/2b30c36e6ab5b21defb76ec6458ab7687984484c
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
