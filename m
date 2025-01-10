Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1513EE77188
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 20:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7548405F8;
	Fri, 10 Jan 2025 20:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WABWn-KxiNpK; Fri, 10 Jan 2025 20:59:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B68664062B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B68664062B;
	Fri, 10 Jan 2025 20:59:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 773EA940
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 20:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72AB760B15
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 20:59:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AZZSbu5EhdjJ for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 20:59:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CBC3360ED4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBC3360ED4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBC3360ED4
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 20:59:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id B150860128;
 Fri, 10 Jan 2025 21:59:11 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35510])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Jan 2025 21:59:11 +0100
MIME-Version: 1.0
Date: Fri, 10 Jan 2025 21:59:11 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250109170326.34279-1-bernd@kuhls.net>
References: <20250109170326.34279-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <d3ad51d4fa068735758a77d3e1a919f7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736542752;
 bh=KUsR/rB/30r6tW/6wdH/ygpLIN3OXwdcvno50/c90/s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JQLpIkIrZsNzSk2mT20lUAzMYwjoO2LfmIAsB66cV9888GgroL31QwiyZldISMgH0
 ruBJUOeqSznEGWptaQ9VdRszHVAPZ+BxXTIT7iNFib8ML3NHesKzjqXDHcMKce92Gc
 XdJKmvLSUGFO6IU5f2GGDX86I78pCZhmsbGVNd/hU0kqW4pLuHcreiH/emVgiDw5y+
 hSt4mNiWNi/uVhj+KSg7Z8Xk+/SqbPJg+kknChw8iffzvZE+zRno7gPEZ55pgG/QlN
 v7tRMHW6h8hNmCr/q42faML83fl0HvCzUOopHBzdBGFSwcjsDqjdM62kjxvGGLPq4H
 a8iyjo0bB164A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=JQLpIkIr
Subject: Re: [Buildroot] [PATCH 1/3] package/kodi-peripheral-joystick: bump
 version to 21.1.20-Omega
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

On 09/01/2025 18:03, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
