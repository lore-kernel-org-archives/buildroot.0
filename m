Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA87C71159
	for <buildroot@archiver.kernel.org>; Mon, 16 Jun 2025 21:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEC1D40A51;
	Mon, 16 Jun 2025 21:55:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NzWvV1NRFUsU; Mon, 16 Jun 2025 21:55:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 192E740A6A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 192E740A6A;
	Mon, 16 Jun 2025 21:55:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A30BD79
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 21:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 504C460A9F
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 21:55:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MG3FqqT8Fz4I for <buildroot@buildroot.org>;
 Mon, 16 Jun 2025 21:55:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3D2AD60909
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D2AD60909
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D2AD60909
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 21:55:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id D35085FFB1;
 Mon, 16 Jun 2025 23:55:15 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 16 Jun 2025 23:55:15 +0200
MIME-Version: 1.0
Date: Mon, 16 Jun 2025 23:55:15 +0200
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250616195603.2282692-1-giulio.benetti@benettiengineering.com>
References: <20250616195603.2282692-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <18f0a3cbf94a396ba9d19115e2edc89e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750110917;
 bh=96MotDGjTKeINHMXtdZAaHjCEU53VY41A9I05DwustM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZbIjsdZy0YunK9KOMyRpXmDENL9X3Qd8ciU1gLJ7npDHz4/113b68146A+Ol2EU3w
 dgJNMv20UIwevHOsoZPuThDutU+F9iMH7GyBfBckdpensffSeIlejtHbKkxNLRWFFS
 ZtWxdKSpo0BNHYg8pa7Wr9jSwYqb6VIYgO/ZJdGkgkAWdcLN16QV/BykOh6bDpwMRg
 8d/65TKkk/1iWz9S8elVC8M2glvdBrJlc525GldOWJOlQIVOZXJQfawROTm6xk2vsz
 DYW7wv1w7P2w7MNkiB/oXy+hXLN2qiFPns588JFaAcI2htNKvV2lX/UPIqsr6CxDvs
 CfiwhO709LoPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZbIjsdZy
Subject: Re: [Buildroot] [PATCH] package/esp-hosted: fix build with Linux
 6.15
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

On 16/06/2025 21:56, Giulio Benetti wrote:
> Add local patch committed upstream to fix building Linux 6.15.
> 
> Fixes:
> https://autobuild.buildroot.org/results/8cb7f1654b2bc5aa5dbcc5fc1474a4eebcdae8b2/
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
