Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7EBC71157
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 18:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B77ED80FB2;
	Tue, 17 Jun 2025 18:58:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bb6iVC9_5ocH; Tue, 17 Jun 2025 18:58:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C25A80F34
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C25A80F34;
	Tue, 17 Jun 2025 18:58:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 711B6D79
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 18:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62E5360FAC
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 18:58:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sz9GNeB05voz for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 18:58:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7C50E60DB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C50E60DB7
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C50E60DB7
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 18:58:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 3C0B62003CA;
 Tue, 17 Jun 2025 20:58:04 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 17 Jun 2025 20:58:03 +0200
MIME-Version: 1.0
Date: Tue, 17 Jun 2025 20:58:03 +0200
From: Julien Olivain <ju.o@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20250617092107.417361-1-fiona.klute@gmx.de>
References: <20250617092107.417361-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <5f5883094fea0c52ef97c9daade0c51e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750186686;
 bh=yEQcnSDq1m7cI7ZZO3GB7ji/F7QzyPK5RxmvGSJiyl4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=J7ZE0fgCsrgTGnxYh2un4Fla2u/IWKpOResQESSUuoKZO9twxFrSOycmCE+YzmAjk
 l8YVleKWhL1AgJmuJ/ahPq+IWg52hnACsPT8CL+ShhUKfcof/FuirPYBC5EGzUv5ft
 tn2g3USreOR16BvHV8pejHwbho6WuLCVSkx4wXeiVOSACheiBcPM1E7tePO+tPq3QX
 NBy5iZmFlVCQb34Vseadk3xLOCE6NzGnD4gJC3pZ3uQtrjZzYryw/Tv8KG5e4GGgcN
 mNUnz+SyKQ/OyWh86qIa794DZR8ETogPYsvkypx4sn5PTbSGE1ZFEKdah5wHgZZh1q
 og2vUuX3iNQ5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=J7ZE0fgC
Subject: Re: [Buildroot] [PATCH 1/1] package/libglib2: security bump version
 to 2.84.3
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

On 17/06/2025 11:21, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Fixes CVE-2025-6052, see [1] (backport of "gstring: Fix overflow check
> when expanding the string" [2] to the stable 2.84 series).
> 
> [1] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4656
> [2] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4655
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
