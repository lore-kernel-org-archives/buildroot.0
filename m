Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F338CCD184
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 19:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E929984069;
	Sun, 19 Oct 2025 19:50:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XMn8AsKp0AYz; Sun, 19 Oct 2025 19:50:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B91184056
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B91184056;
	Sun, 19 Oct 2025 19:50:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 73F59177
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6563184056
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:50:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WMN3mI8mOP9H for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 19:50:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9100481110
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9100481110
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9100481110
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:50:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id EB199B00565;
 Sun, 19 Oct 2025 21:50:32 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Oct 2025 21:50:31 +0200
MIME-Version: 1.0
Date: Sun, 19 Oct 2025 21:50:31 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251018165444.1197208-1-dario.binacchi@amarulasolutions.com>
References: <20251018165444.1197208-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <94c1501b968077d824050675d354e1db@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760903434;
 bh=9magdVdzSGMYTMyTHbdfEcfSLsAHnFBNVndekBlVH5Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ie9+CxrKStjUFAKs8DFaC/t4nrb6ziBZ0hswGKDQ32xAw5uRimf5r9AkjxHXgq5bF
 3KkIh3ao/ZmOAXOLPgPOSTImXH4dpoNTcKUgnv/OgyYQHg9tjEjtv3DtMdnry4gqss
 pGc0BpgMeuGQjW1Es+26Iyku8DsMzUkwP9f+VywzEfO9om83jTxSNCilJkvAKsN+z4
 6lE7+G8hxzJGTdT5ftA3uRNzptBsOyIDu4XDt1PQFLG7/SUXJNAlZVNWs0T0fiSkdh
 ddc3/NWRg02TiDsLyuN4zubQWUQZUXU+vQr3ekwYWDdvp3KzNAZwEROIKXgCW5C1ED
 eQwH9yBw8RO5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ie9+CxrK
Subject: Re: [Buildroot] [PATCH 1/2] package/less: bump to version 685
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

On 18/10/2025 18:54, Dario Binacchi wrote:
> Release notes since 661:
> https://www.greenwoodsoftware.com/less/news.668.html
> https://www.greenwoodsoftware.com/less/news.678.html
> https://www.greenwoodsoftware.com/less/news.679.html
> https://www.greenwoodsoftware.com/less/news.685.html
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
