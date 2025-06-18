Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13709C7115A
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 20:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCF7860B60;
	Wed, 18 Jun 2025 20:23:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Od17e0v9Vf9b; Wed, 18 Jun 2025 20:23:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19B3160B01
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19B3160B01;
	Wed, 18 Jun 2025 20:23:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CE09516B
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 20:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B408D80EB7
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 20:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BXl2SoopVSEA for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 20:23:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EB05A80E13
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB05A80E13
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB05A80E13
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 20:23:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id A5FA0B00571;
 Wed, 18 Jun 2025 22:23:30 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 18 Jun 2025 22:23:30 +0200
MIME-Version: 1.0
Date: Wed, 18 Jun 2025 22:23:30 +0200
From: Julien Olivain <ju.o@free.fr>
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
In-Reply-To: <20250618095240.25712-1-maxime@leroys.fr>
References: <20250618095240.25712-1-maxime@leroys.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <8606649894b9e8acbf2fcd7427a40782@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750278212;
 bh=ee0efb7OGVYqUL8Ij+9/wlHKYpOG7ziPXNGhTZHslwk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ur4utUIjuEfzv3qAKwwrqqyUMPK7t2zmmRcosHgwraxWEy+E0PGt7cDwWVZcL1OLB
 XsvJ1p1+yLzwVISKdPY5KsW9bIdJlUMVpLUrz3ydkH75+JnvfOUrFW3sI3wQ21A3r4
 pMjRmMyU2th8HXTLYIbsCcc49p5XOVQdjU1CS96D08fTQuilSbdcy7LMZxy3BHkjJz
 RtM1VuVO8itFwJhSeReArdU+lKkGXrV4lknyzekRXgDCv1cJZHvix0wrgvqAgGRKql
 H2lawO2RipEF8Tsc+s/4z27FrO6RAcAG/0r13hNO224344XWkGZcvbfr7pyjObxrBG
 VvFARzVv7sAJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Ur4utUIj
Subject: Re: [Buildroot] [PATCH 1/2] package/grout: bump to 0.10.3 version
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

On 18/06/2025 11:52, Maxime Leroy wrote:
> See the release note of the new version:
> https://github.com/DPDK/grout/releases/tag/v0.10.3
> 
> Locale is not needed anymore for this new version, thus comment on
> BR2_GENERATE_LOCALE has been removed in consequence.
> 
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>

Patch applied to master, thanks.
I'll review the runtime test later.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
