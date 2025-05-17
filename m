Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6FFC2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 17:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 069B88218B;
	Sat, 17 May 2025 17:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RoiFZbcJzE0G; Sat, 17 May 2025 17:19:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 353108281A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 353108281A;
	Sat, 17 May 2025 17:19:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 86300201
 for <buildroot@buildroot.org>; Sat, 17 May 2025 17:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BB8D40B51
 for <buildroot@buildroot.org>; Sat, 17 May 2025 17:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N8E1HLv5lpzm for <buildroot@buildroot.org>;
 Sat, 17 May 2025 17:19:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8333140554
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8333140554
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8333140554
 for <buildroot@buildroot.org>; Sat, 17 May 2025 17:19:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id F2C25780507;
 Sat, 17 May 2025 19:19:39 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 17 May 2025 19:19:39 +0200
MIME-Version: 1.0
Date: Sat, 17 May 2025 19:19:39 +0200
From: Julien Olivain <ju.o@free.fr>
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
In-Reply-To: <20250513085628.38864-1-maxime@leroys.fr>
References: <20250513085628.38864-1-maxime@leroys.fr>
User-Agent: Webmail Free/1.6.10
Message-ID: <5b48fabde46ee2a8572d3a20d98c4247@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747502382;
 bh=oQQaLccJyc+5hdYbYud61cpkAXmVx/Lw5Lwi3S9yut8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZjW92rVj43VLkBa/2gwi7ob8ESBPZiQpkwOgSO58/evVnDRznXKgQGuNmHqwWhSTH
 Essw2MB232QLcDru8xvBNi8SKwPimi587NsGOZfz3SoKmExSj5ujmk4a39j3Y0yTjy
 PC6Z4FWzA9L9GONCD74g87XyifafyTN/RWDOXKe42Y8qakjDX1g0YqdKzkSyYeoy2K
 2kffavvnyS61pHbx83CD3GgUDxXeprqyBqebvbj/3Qjk1wL73HToxkIh1ME7FtJ5qF
 hAq8x0nKim6Mg6RHxNRRHgkRwNMDhg/27EytKwx8/m1xurepljR0X/oOpjCfLlkqWL
 XObsDWac63i+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZjW92rVj
Subject: Re: [Buildroot] [PATCH 1/2] package/grout: bump to 0.10.0 version
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

On 13/05/2025 10:56, Maxime Leroy wrote:
> See the release note of the new version:
> https://github.com/DPDK/grout/releases/tag/v0.10.0
> 
> Libcap is not needed anymore for this new version, thus dependencies 
> has
> been updated in consequence.
> 
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>

Applied to master, thanks.

Note: I applied only this grout bump.  I'll review the runtime test 
separately.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
