Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D70CC4451C
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 19:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC49280B8F;
	Tue, 21 Jul 2026 19:47:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3GEaBgfjEKvp; Tue, 21 Jul 2026 19:47:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B8B780D5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784663220;
	bh=Z51jsCeR0RKAPOjfz7aisH0Ap2bCGj8/D+fuajxlNP4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=E38Y6suCqGlt1/0+a3tBnatMdg1k7abl1cZlXOdqtujg7ImmFJzye9Voptij6NZIb
	 CYcxONOaGU+CQ3cbOSVUfEHJGaoz2NWfx+LWnj1vWOHE69KnI6Z80c4fZz2X0Y1H5r
	 xEgGfOiCpBK8Q1lTsseAg/VMUjdX1D2rfTRAzGHzh5P2zM5ztZSdgNCYf5FQhoiTdr
	 swWXwL/nd2ECj48iEC4jZ5QSVlyP9+apT9hi83ZoA++Ya4012N1fFL5Tgl+w3yKSes
	 axkvtO5XjgUGJ9DQYarmwo91F1PX6PtUIHS9tvNULs2mQt+gq6qAlfePIH98fGnRSK
	 1g5yvh0RMSvdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B8B780D5B;
	Tue, 21 Jul 2026 19:47:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 35AF6EB
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 19:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B9586089D
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 19:46:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rMOvTCuPfJLU for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 19:46:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 096D26089B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 096D26089B
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 096D26089B
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 19:46:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A953A780372;
 Tue, 21 Jul 2026 21:46:54 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 21 Jul 2026 21:46:54 +0200
MIME-Version: 1.0
Date: Tue, 21 Jul 2026 21:46:54 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260721184316.3523325-1-bernd@kuhls.net>
References: <20260721184316.3523325-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <5f39afa856079fb0ad623a661f26685c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784663215;
 bh=wwJpTKeJPYRoLAbbgEyznNwK2WhN5bC+gjoYedzUASo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JILz3k9ocCRsfbg/FDfwxtCqOWE6NDIylgTFKqEQPNNbGQbjWcEZHfiHG5khIMEUh
 /IZJYd6DX+0PlSuw0MMwKA49HmbgSN6rcrPha2rFnGFzM9lJRpoCt8dbAiICi43lSs
 jcLQ1oJ44daGg7XYKueFpalYrM9M9N1Iu6MrVg4MjP0lc1M/iNHdT6h3m9v2R3QsQp
 btGO5vCSUaYOoBrlofC3RFgCGCrJg4WjHuvZaZbrX9G2Lvt9IHEjuBlaDkjpf89H6o
 +ya5bLw6gM5c9ja4530xKdJ3ZkBBoKldfmjmKaSCal6keVDgLvIC+HXJwz/mIvmKTy
 Ntx9iGGZySlXQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=JILz3k9o
Subject: Re: [Buildroot] [PATCH 1/1] package/libssh: security bump version
 to 0.12.1
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

On 21/07/2026 20:43, Bernd Kuhls wrote:
> https://gitlab.com/libssh/libssh-mirror/-/tags/libssh-0.12.1
> https://www.libssh.org/2026/07/21/libssh-0-12-1-and-0-11-5-security-releases/
> 
> Fixes the following security problems:
> 
> CVE-2026-15370: Stack buffer overflow in SFTP server longname 
> construction
> CVE-2026-59842: Information disclosure via short GSSAPI Curve25519 
> public key
> CVE-2026-59843: Denial of service via zero advertised channel packet 
> size
> CVE-2026-59844: Denial of service via oversized SFTP read length
> CVE-2026-59845: Denial of service via unchecked ProxyCommand fork() 
> failure
> CVE-2026-59846: Information disclosure via ProxyCommand %r username 
> expansion
> CVE-2026-59847: Integrity downgrade via OpenSSL AES-GCM tag 
> verification
> CVE-2026-59848: Denial of service via SFTP responses with unknown 
> request IDs
> CVE-2026-59849: Denial of service via automatic certificate 
> authentication loop
> CVE-2026-59850: Use-after-free via data callbacks on closed channels
> CVE-2026-59851: Authentication bypass via missing GSSAPI principal 
> check
> Zero-initialize every ssh_string
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
