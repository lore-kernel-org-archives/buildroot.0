Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D106C7115C
	for <buildroot@archiver.kernel.org>; Fri, 20 Jun 2025 16:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 037298217F;
	Fri, 20 Jun 2025 16:49:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 17v8mPpSq7Eo; Fri, 20 Jun 2025 16:49:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5177582196
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5177582196;
	Fri, 20 Jun 2025 16:49:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E995E154
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 16:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB99341793
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 16:49:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pkf4_nxGzYuh for <buildroot@buildroot.org>;
 Fri, 20 Jun 2025 16:49:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5643B402EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5643B402EA
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5643B402EA
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 16:49:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 763CD78050B;
 Fri, 20 Jun 2025 18:49:08 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 20 Jun 2025 18:49:08 +0200
MIME-Version: 1.0
Date: Fri, 20 Jun 2025 18:49:08 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250620062637.20844-1-bernd@kuhls.net>
References: <20250620062637.20844-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <9736ac90caa5b6321ba9e3f21bd0565f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750438149;
 bh=XKCqpF+ocCRCF+DB45ocndC8x6A8VWIwId55+zHi+3A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nIYFzRuY0N3/Vf4vbXvIKL4aTiGmGrcWp1MQJj+N+y+5BwYpdPQpnITy8tjlZaIyk
 a7wfuGFyCih5ye5eN4laoCNQ2vgyG2+kTMwYs4AUFJ7ZM3bkTXNIeUX+2mP+QvZMk8
 t+V2pjPzz3LVZgADhNZgHOYmLoLYVxvSe+pQK+c4UJYDq3kho2V6+pDTKVDbtChHd0
 ogJc2hhr4Rfs1jd9YlPsyAxdx4W3IVaJqkBt9ohWvx6sq+x+tziLPDsIMlIM2VzOpY
 oxWYBg6GrLb5SRjNqcw3C++LppN20K25Wz+UejAVlk1NPO0g3aQYt3N4pUuSXj5G/G
 YfUCSPBoo4qXQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nIYFzRuY
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{6, 12,
 15}.x series
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

On 20/06/2025 08:26, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
