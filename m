Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4976FEE4D4
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 14:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79529607E3;
	Sat, 28 Feb 2026 14:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EaoKPibrpFd0; Sat, 28 Feb 2026 14:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86A3E607FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772290729;
	bh=LTT5MlC4ose7TA/96om06KCogyjfwr11TcCCc4IJ2DI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rMRtplfmmP2BBpZvxYa0ayxf3fGf6teUEF676jlAPeT/7Daih6Y83px67LXr2Qb7A
	 5jP+60V4HyuQ9AR/bVqC6v31yOAAdcVX7GDIyszMCApoPhbASKmwkRgNMR1uyOWD2y
	 0n91lZHRft2DpPqx9rM4IKduD1utcJ7NlbMyoTYt26GNETQaoxKtJQzfd7ntzs4LD5
	 wEBCiidm7FMeMkrYUheyChd6dg+NXKIQMy1hlYxVw8Fd9S5wcKoC9cyPXFf6YmMIXb
	 4om7KBXQjBSDbxW/UDUjn82VXPZmMq82qyJ5FTY7Nj8RyHQp13l7Bg1bPsDQHgtVBa
	 jRwDpSaaFP0XQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86A3E607FC;
	Sat, 28 Feb 2026 14:58:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 365E11D3
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 14:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C4DA40226
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 14:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UL_Ac2wmaRsi for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 14:58:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 459B5400C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 459B5400C2
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 459B5400C2
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 14:58:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 301402003B4;
 Sat, 28 Feb 2026 15:58:43 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Feb 2026 15:58:43 +0100
MIME-Version: 1.0
Date: Sat, 28 Feb 2026 15:58:43 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Andr=C3=A9_Zwing?= <nerv@dawncrow.de>
In-Reply-To: <20260226202007.1873521-1-bernd@kuhls.net>
References: <20260226202007.1873521-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <2d26bfb626868defd5f1df54bd1bbfbb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772290725;
 bh=vFyqXOnFK4Nf58Sl7DlVvs69ELe0YgJ7Bfjh+gurNkk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Sxjt9+hLGDFS+eeUlNgKLQY3Yhn0AaP/VymNaDOoCmO3eu23nj81L5dC9M6DkqpAf
 RiqxXdSmg8ePBPEC3BMydaNpAgyyJn767gFQ4kfAuSEbzr7XRv18vfY//pPNiKMXmP
 2yLRGc/5LVm7riLb2D2Zpk9Gq6J72GefywHDNtSAiKuGZOelGqBZJetey9bl1M3OUJ
 0luXmrBkM9S7dS5NaaoPy3piRUQZd037zwyuqjxLcbHd0QN0WsaO9UmWSskqPK572q
 F/yBHgGTE1PjCa6210M3NBjyvWX7vIvCF73+KXJnRgA/Bo+unvJMYJtw4QV/fJ3vj7
 Zf5jWW0ZZIDfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Sxjt9+hL
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libkrb5: bump version to
 1.22.2
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

On 26/02/2026 21:20, Bernd Kuhls wrote:
> https://web.mit.edu/Kerberos/www/krb5-1.22/README-1.22.2.txt
> 
> Updated license hash due to copyright year bump:
> https://github.com/krb5/krb5/commit/21a2231e9e906f2f5e84694ec211755bb1980624
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
