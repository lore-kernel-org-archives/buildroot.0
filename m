Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC2FC369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 20:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C55381EC1;
	Tue, 15 Apr 2025 20:35:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UUhI9-rTjLOR; Tue, 15 Apr 2025 20:35:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5B1182020
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5B1182020;
	Tue, 15 Apr 2025 20:35:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B6D3200
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BF0B60AE1
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7accGEw8Lj6I for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 20:35:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 90CF760B97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90CF760B97
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 90CF760B97
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:35:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 2345C780368;
 Tue, 15 Apr 2025 22:35:16 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Apr 2025 22:35:16 +0200
MIME-Version: 1.0
Date: Tue, 15 Apr 2025 22:35:16 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20250415200913.2219800-1-thomas.petazzoni@bootlin.com>
References: <20250415200913.2219800-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <d25a58d8ab2a9e595dd14767a62d8eb5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744749318;
 bh=+J8gcsBke4B4AFfl3ujaH/tuj3qjt3HPCz0f9LXLQ04=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=owsv5l3MRJwpCtmle9koXc444DRk26qhYC7dDKDtIRjQYBwzxB6Dm35twnV+7TbR2
 mPawECP8ah0WFX6/cP7LngmW++2ud1d04prkn6ek7B9VlTHh1Mi6DpTNXBpA+47wQS
 oEpcPU1HmBP+DzZq2gzv3uso1e8eYsVLSz/gU559Q1Q73NTLsngNrgmEZKAxuwDZFy
 4Snmfnt7NkHFLuF/k6iVf0sPyYS698JeWX0DS3z4UFdmGWzoVw1AQxsCY9gRYQhSzL
 NgyfrTo+XXg6GVby386fOhiWk8O2+M3bLEUm9kC+DjIpb8CP4YFZbGsp7Gt75YM4+y
 IyaJQrX8kvQPQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=owsv5l3M
Subject: Re: [Buildroot] [PATCH] package/libcap: bump to version 2.76
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

On 15/04/2025 22:09, Thomas Petazzoni via buildroot wrote:
[...]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
