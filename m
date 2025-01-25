Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C9DC0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 14:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8299A60EC5;
	Sat, 25 Jan 2025 14:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hxQk6RABgBUK; Sat, 25 Jan 2025 14:33:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CBEB6100D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CBEB6100D;
	Sat, 25 Jan 2025 14:33:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DABAD941
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8E22403D9
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:33:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WETCJJL0Jhsr for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 14:33:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2473E401D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2473E401D1
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2473E401D1
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:33:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id F2DB060128;
 Sat, 25 Jan 2025 15:33:20 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:54290])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 15:33:20 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 15:33:20 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250124183240.3786530-1-james.hilliard1@gmail.com>
References: <20250124183240.3786530-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <a2ec9c18404420d54a32c44f7010f61e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737815602;
 bh=s4PyFwyKCHWOxWML3ZgDrj8+cuiRwXaaVZPfhiEMS8s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DnGJsEEDHMA/v1r6rO2pLUJPmGgVvfvGw3A1UWJqcVSsHoNKTo7Gjrs0DzDR6yhBz
 A6Fk1J5ZROOTNyBAY5dYXOY0oW9a3QTBGx2oXN3jIAuHiuR4DuTZy59C2f2F+PoDQt
 6pSPMo+0YM9/oO6qoT9Xm+iRFZ7hX2dJ+FM3lCy5KmnfzEs9xRzzO88A25DvhvPEbv
 sJBOMiR4ljQTnJhw3fvxujOkA8wL2u//71dFG3EFzHTyGBaMl/sxTqVDhvKH9UjoG0
 Txdy7qS32drJzVjOTbXROIJigLBqC7AugfOBf0YpaiureVnT3XkJtOQf0jeaGpUz/o
 wZ5GwxIncvMFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DnGJsEED
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cachetools: bump to
 version 5.5.1
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

On 24/01/2025 19:32, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
