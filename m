Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C584BC282DE
	for <buildroot@archiver.kernel.org>; Mon, 10 Mar 2025 20:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EBA340C99;
	Mon, 10 Mar 2025 20:27:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ExL1L1I059V6; Mon, 10 Mar 2025 20:27:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E06440CF7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E06440CF7;
	Mon, 10 Mar 2025 20:27:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C7DDF1C1
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 20:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB92A40CB0
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 20:27:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tfzgxL6EZTb7 for <buildroot@buildroot.org>;
 Mon, 10 Mar 2025 20:27:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B39E440DB5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B39E440DB5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B39E440DB5
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 20:27:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 9A18FB0053E;
 Mon, 10 Mar 2025 21:27:04 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 10 Mar 2025 21:27:04 +0100
MIME-Version: 1.0
Date: Mon, 10 Mar 2025 21:27:04 +0100
From: Julien Olivain <ju.o@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250310120831.4017937-1-fiona.klute@gmx.de>
References: <20250310120831.4017937-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.10
Message-ID: <bd6a28cc2eb82563bc54a182427c0ec5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741638426;
 bh=fSGFZlBXphNO1PQAvNz5M3Jx/WPcn7lLwJA3bIazEvw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OlQbyHAV104brKmz2rvGmsbKj7tw9Fl8qnrMFHWOZgF3mAJgkTpWYnvaXRL297ogw
 oRd/qMXlijaB4ekcmBaEtfXh6VEjzOi9QVbAuobGXQYE6GhQaUwPfHapAxrKe8lYkl
 DY6N73kjhb7pIBsSpIXOso3KgbmOK0lmhF3F15tiKVGoXgcaH9pAVodymA8MSHYLrA
 DRut5kDAOToECl/lpxdYEEAdGa2NLGzH749M7UplukZDsLllpO62P9nKP6F1ap78Hc
 VolAw+YSRXM915cmRXbeRFkvn8xt8ZNal2FKdxxUkP1Onqd1yuSI1+GoAKi1DNbEDm
 TDd7eo/ZL2gDw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=OlQbyHAV
Subject: Re: [Buildroot] [PATCH 1/1] package/raspberrypi-usbboot: bump
 version to 20250227-132106
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

On 10/03/2025 13:08, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> 32-bit mass-storage-gadget has been replaced with
> mass-storage-gadget64. Drop patch included upstream.
> 
> Upstream diff:
> https://github.com/raspberrypi/usbboot/compare/20240926-102326...20250227-132106
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
