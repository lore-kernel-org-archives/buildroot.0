Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC949C61CE8
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 14:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 839C361363;
	Mon,  9 Jun 2025 14:59:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XIu38isZjl2a; Mon,  9 Jun 2025 14:59:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5919613BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5919613BB;
	Mon,  9 Jun 2025 14:59:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F41F1A4
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50FA4407FB
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JMrwNcBZzLns for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 14:59:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2B45E417F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B45E417F4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B45E417F4
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:59:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id B792F60139;
 Mon,  9 Jun 2025 16:59:42 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 09 Jun 2025 16:59:42 +0200
MIME-Version: 1.0
Date: Mon, 09 Jun 2025 16:59:42 +0200
From: Julien Olivain <ju.o@free.fr>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250608201006.1377973-1-petr.vorel@gmail.com>
References: <20250608201006.1377973-1-petr.vorel@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <484f73ac24cab368eebd8a413d0b2bd1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749481183;
 bh=/dq0FB3yNUAlCgKZW/IvYLeR+LW5Rsztwcy4WfhNoyg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BnaYRDPVD4dEl5NVf9fs612bCoWqTm7pLOrgzZrEomrIYx7KhR3Tmau4goYE3aFWd
 CGWTw0TBOs2HebYJqpqIy8XCGfKsx08UwJD9jan62ykqN9N05HvWUlsALxbuk/dd3B
 I0upgK/ew9T/dqWavGEvR51Vdcx4QySs63lgDcQry0S0u3eMrr8hNX4xp4U9Of5irS
 EVt4Z6NUjZ7PM6BcrcmPP9wl/N6YOfkz5bN2MTlBDGeunDUBGUgUqVCjyCaShBLewH
 pQud13wF7sv4t0puTcSABddTzPPUsL0puNyvY4hO2i7blSLJGoNG77lahdFScWhckz
 vfhG4Lat3PSJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=BnaYRDPV
Subject: Re: [Buildroot] [PATCH 1/1] package/iputils: bump version 20250605
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

On 08/06/2025 22:10, Petr Vorel wrote:
> Bugfix release:
> https://github.com/iputils/iputils/releases/tag/20250605
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
