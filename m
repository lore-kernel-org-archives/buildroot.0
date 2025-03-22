Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3EEC35FFC
	for <buildroot@archiver.kernel.org>; Sat, 22 Mar 2025 13:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC66883B6A;
	Sat, 22 Mar 2025 13:01:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PtiqDrMQoBo1; Sat, 22 Mar 2025 13:01:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2456383B45
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2456383B45;
	Sat, 22 Mar 2025 13:01:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2269D1A0
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 13:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1402283B45
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 13:01:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0iU2hmzxhjvR for <buildroot@buildroot.org>;
 Sat, 22 Mar 2025 13:01:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3863983B1B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3863983B1B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3863983B1B
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 13:01:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 3F090B00565;
 Sat, 22 Mar 2025 14:01:48 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Mar 2025 14:01:48 +0100
MIME-Version: 1.0
Date: Sat, 22 Mar 2025 14:01:48 +0100
From: Julien Olivain <ju.o@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Spenser Gilliland <spenser@gillilanding.com>,
 Romain Naour <romain.naour@smile.fr>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250310105350.2848707-1-fiona.klute@gmx.de>
References: <20250310105350.2848707-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.10
Message-ID: <2ea7c028003846aaeef3089141e45c92@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742648512;
 bh=xZ/O7aOpusjpxqCF5ykegO4lkt9ka4eWBtL8mBVSA1c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dWQ8zuHjc8w/lwxZ+XJIqnN1EIWa0OegYL3IPbR7kdNwkI96XmlDMbEfneCeenPzt
 71kbo45v9Y2uPCt5npiyPjdrTsB4R+mah/4NP7FDqJ214Q876zoXSv0lZgD1p4KSKT
 pZAhfIaLU3JGRdEkoJH9adcp09Yb4Bok1/eM8N0qtkcA35NuRQnADvcb6huiUE9jmQ
 Qz1muu+mEB+E8X2LhD2P5WC3b7CStPUXkLA0mgU+5wvB+vMDyNbeYoua3kyfoDbs4g
 ZqK1A7oH7YFyZ+V+bsn4q1MeIWXy6+DvmvLLEc9SozIYJ6VdDYXsFF1uMswg64Zw6l
 gKJuyModbsJHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dWQ8zuHj
Subject: Re: [Buildroot] [PATCH v3 1/2] package/mesa3d-demos: depend on
 vulkan-loader if enabled
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

On 10/03/2025 11:53, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Vulkan support in mesa3d-demos requires vulkan-loader. Without an
> explicit config flag it is autodetected, and may or may not be enabled
> depending on build order, leading to unpredictable results.
> 
> Fix this by explicitly enabling Vulkan support and depending on
> vulkan-loader if BR2_PACKAGE_VULKAN_LOADER=y, and disabling Vulkan
> support otherwise.
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
