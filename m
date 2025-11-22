Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45031CFC538
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 13:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A055F84406;
	Sat, 22 Nov 2025 13:28:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lHg-zLP3XeWb; Sat, 22 Nov 2025 13:28:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF528843A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF528843A6;
	Sat, 22 Nov 2025 13:28:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D05834E
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 13:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73BED60DB6
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 13:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vAUdbpfwtNoz for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 13:28:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7FA1C60DAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FA1C60DAB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7FA1C60DAB
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 13:28:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 5BCF213F89A;
 Sat, 22 Nov 2025 14:28:37 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Nov 2025 14:28:37 +0100
MIME-Version: 1.0
Date: Sat, 22 Nov 2025 14:28:37 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251122114713.3778269-1-bernd@kuhls.net>
References: <20251122114713.3778269-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <7994a60c67454dd7388beab0384ef5ca@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763818118;
 bh=jZw6WLEKpP1WntP7y1leMIUk19AydRdt45F9Clp5cjc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CqG77wDuU9+/ODAqIXb9ZaRhEq46vZ0WP+0D3rFhkWwfB3HxmzdHN4wZ3G5QLK2ah
 ZhrIL7AcwAVU/4LypkdUHVnTdPY9v6xO2SOEgstkNDTqSiOeJZd25TFIFFeIOk+kBQ
 r2g5Z9gD8nShXFAxCl+QzOfBVID4PZiCDQEE74vR1tXuOqP3ZsrKIVnnwHtRLOjp2O
 VnWrVhnzoO++C0VGqOX5VIxhe6SLpS7kupklQQg+U79hcFaI7YTgBbY59cN/gMIvmh
 dhqCXyaHmEZ7BzbLZ34ELeLtJKlEC3P/Xn133ql9RjcQFy+N9CXaI0JOSL4edTCDvv
 Wyn3t0DRQVfDA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CqG77wDu
Subject: Re: [Buildroot] [PATCH 1/1] package/uboot-tools: mkeficapsule needs
 gnutls
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

On 22/11/2025 12:47, Bernd Kuhls wrote:
> While buildroot commit 14a0169714cd5c35be40faadc066412f144bc1a6 forgot
> to add the reverse dependencies of gnutls the buildroot commit
> f94ba69770e5c5dc1342bf52657b3565b1a56e6d to fix that forgot to select
> gnutls.
> 
> Fixes:
> https://autobuild.buildroot.org/results/595e9af38fef4729ff3d6f32ad320d46c8c88594/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
