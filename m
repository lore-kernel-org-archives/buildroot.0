Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E790CAC5AC
	for <buildroot@archiver.kernel.org>; Tue, 23 Sep 2025 16:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 237D081A15;
	Tue, 23 Sep 2025 16:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ErSJY2A3MN2b; Tue, 23 Sep 2025 16:33:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BB9081973
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BB9081973;
	Tue, 23 Sep 2025 16:33:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B33E2E7
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 16:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A1A8818CA
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 16:33:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AbXJvimR_2ev for <buildroot@buildroot.org>;
 Tue, 23 Sep 2025 16:33:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 951948175D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 951948175D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 951948175D
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 16:33:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 5EAFB5FFB4;
 Tue, 23 Sep 2025 18:33:51 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 23 Sep 2025 18:33:46 +0200
MIME-Version: 1.0
Date: Tue, 23 Sep 2025 18:33:46 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Martin Bark <martin@barkynet.com>
In-Reply-To: <20250923090220.875570-1-dario.binacchi@amarulasolutions.com>
References: <20250923090220.875570-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <3dbcfde5a5fe144db3263b200da35925@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758645233;
 bh=Qv/Hkn2qPCyCoPyJdR4tEpiHQbek9wBn4RMNcELlMUg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WGrAnaiapDAf5X65Lr0+QrjgahcwPBAprOgmecMehRjgDFNNbT79znxI7KtP6LsR6
 CiarKZVQazIJ0Qiblb5VDvHY5vLE6QJ52pkI+3cLvFtP7+4Uj//8ey/6dEA3yJLQtF
 HZ1MOfsRwoWpQE9F8IDxAFnZEKeAIwYW9NQlbTzOqual6Cz26/3sz9xCs4uRMyMh9E
 /vyrCBLL5qXzvGO82/GZzk2M19R6rFP1mPzYDkrRM5pRYHbikVyqqAoUk1De2WgRcc
 2UeO09G7x+S7MCOw22elFtrySvvnfYpUUEjI4tPq8i96EmnC2QILsXPSm+RVYTv3iG
 RqRX9y/VwURlw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WGrAnaia
Subject: Re: [Buildroot] [PATCH v2 1/1] package/connman: security bump to
 version 1.45
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

On 23/09/2025 11:02, Dario Binacchi wrote:
> This bump includes the security fixes for CVE-2025-32366 and
> CVE-2025-32743.
> 
> Release notes:
> - Fix issue with setting MFP optional for PSK.
> - Fix issue with comparison in timezone checking.
> - Fix issue with dnsproxy and empty lookup.
> 
> Fixes:
> https://www.cve.org/CVERecord?id=CVE-2025-32366
> https://www.cve.org/CVERecord?id=CVE-2025-32743
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
