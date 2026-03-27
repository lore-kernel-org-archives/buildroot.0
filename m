Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B3110F2865
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 18:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4196D83E3A;
	Fri, 27 Mar 2026 18:22:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ngvk4UIFirDC; Fri, 27 Mar 2026 18:22:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 851D983C14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774635735;
	bh=aHcW6TmI+XhSinls3OS2wOQatIE+JBqyzimHTFoL5/w=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pFB1y77aufJItnRRpnUj53iwHP/KUzgvsNkg4MO1I43ZPq4dmPvbX6VdSz9Gz10u8
	 DFrhAYAygw/wtZ2khVStWB1hwKETIsxotNjR+BqFb3B18w1SkaFzOR9sJRS8iwIBf+
	 8vODcVKoxHPQDrlukKrcYT/7YRNVAhcPkb/QbOtwu/tQ5FyHklBT+v7RKgZ1pe7EOZ
	 xeaoFhIL5EjiTu22w1G5Fedz/DCpMDDAYuaZaRwG/O/4qEt29UsOIhLAEqsNoHdwiK
	 +GrkBQWCv5EwE8ArcWTrsDs7bH9iiWJw2DzyIdnP9jPk5a1ORN2ukK0xrOXuYBcZ+g
	 /tCfWUzqIdKHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 851D983C14;
	Fri, 27 Mar 2026 18:22:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ED60B1D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 18:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC6614044D
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 18:22:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UeTkiNuSOg6p for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 18:22:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D8DAA403A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8DAA403A7
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8DAA403A7
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 18:22:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 3A51319F5AF;
 Fri, 27 Mar 2026 19:22:09 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Mar 2026 19:22:09 +0100
MIME-Version: 1.0
Date: Fri, 27 Mar 2026 19:22:09 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260326211631.3598817-1-bernd@kuhls.net>
References: <20260326211631.3598817-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <b5e574ac22f7184f91baac5b6adb556b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774635730;
 bh=NiQ/qaHY3b9ftpoGTSkQ8Kfqy+jDVt/HI5aGJsDVm30=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GUTOrNVet1W4lI1A192EELzjY1HuF1UwaUGKwJbDSHrfmjEMznoVH0YQoQPHcc6Ik
 KHuNf3Nz7G7hoEJbN2w5I5zOKfYNwQU5cudVcXgNcLtCdfiWVbrcpPoM65MlLuSrNn
 BIs2a8b914We29diGyowDxGa8+vryEqupsWImOmxlcD2pYk8q3HO6ONlIB043+pQhd
 C1ZzwANZV7Q1Liljur2msKE6k82+1s+aZL9rYn54AYxRhcgOyrCgAzMq2NaLo/NQIZ
 zTouJzKeeIwTqC5iAyiZmPf6slHxfBtazTazyUefZ7nWfHiSiRjhb6Dq9+8fw4Fa2D
 YrJ01zaUoMisQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GUTOrNVe
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.9.6
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

On 26/03/2026 22:16, Bernd Kuhls wrote:
> https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.6/ReleaseNotes
> 
> Fixes TROVE-2026-003 & TROVE-2026-004.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
