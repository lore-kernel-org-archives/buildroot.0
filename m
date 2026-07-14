Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBDFC43458
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 08:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E0CF408EB;
	Tue, 14 Jul 2026 08:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fjMy4K0thAjl; Tue, 14 Jul 2026 08:42:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F18EF408CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784018553;
	bh=ke4SB2M+zBEW/8H3jXlF8J+T9MJ/iEKjQNDFtSh9v8E=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kL28eMq70ZK0JCeC162OZHrSqXGrSpdyUHgbNhGSBgmeW05rXWoGch11rj3X+OZlm
	 eQR/WCI10UUBSY8hALHKlHN/mICSeCi6V00A1R4XVgRdG788idJVShWsjDNet2mcA7
	 7l8DCT/yij2IZ1I/4vC1UKYUWPNEnUXeuTqxMCa+/E2XtiulRGbq57tuYGmIA6PhuK
	 SphZmznzxvdRfcZyg2Y1rIgSeYqNlzJP0q9VeBgyBWstL9DAiRCm5WHyTkL9tDLLzG
	 DmST+HfcOFoVYJyfIAuD+dgJ5VKpB/QKZ1ET5tXxqLfr59fhsYYQqu/MhuCACb1LU7
	 eeGE/zGU4bEsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F18EF408CA;
	Tue, 14 Jul 2026 08:42:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DF8F596C
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 08:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C539A408CA
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 08:42:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ImZ0leKhMPmq for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 08:42:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 00C89408B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00C89408B6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00C89408B6
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 08:42:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id C0F3513F8AE;
 Tue, 14 Jul 2026 10:42:27 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jul 2026 10:42:27 +0200
MIME-Version: 1.0
Date: Tue, 14 Jul 2026 10:42:27 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260710215456.2365392-1-bernd@kuhls.net>
References: <20260710215456.2365392-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <8dd33aa4348a47bcb00f7c8c905594b6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784018548;
 bh=zzyJXnm24uchZQQLBdT9BmJ6lPsrt4yxVZusVGFH96I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=T00rBlIYQVLewIZmSsHsHWi2UJ980gXkH4ScXHvqtxV6bY6NDkhXgpkcVT64bw7lR
 FJkeKuBUxKi3cZFVWUIaqhJLPyGi8Bgmdu1Tb07Y1QeByPuAFWVr9HbwC9yH656sQw
 o5frkdldi7dM6I3llwrQbCbisFNBrT+1lsjiBXm8iHtYUPMQRLQghDWTXmeftvN44R
 xhB9nCj7vToUb7Bwyv/ijLbg73u5M7jO8Ydx83bjUUj2ukBAUQYKypmMS/fZQlBDDM
 hYSpKX+KF6NYd9NejHxU3nGSP83deKxa6BmgJk5a4xygvB/A3H2akupYm79xxTlhHZ
 LRUplYLBMOMSQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=T00rBlIY
Subject: Re: [Buildroot] [PATCH 1/2] package/igt-gpu-tools: fix musl build
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

On 10/07/2026 23:54, Bernd Kuhls wrote:
> Buildroot commit f9a91bf60e35617157b950eea05fc6f6144d650c bumped the
> package to version 2.3 that includes upstream commit
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/6a8b33e353627187f1b530f33c4bd3f5282883f0
> which makes use of PATH_MAX causing build errors on musl.
> 
> Fixes:
> https://autobuild.buildroot.net/results/42a/42a6e9d9652c1eb97c8c49aed75d210bf2afc066/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
