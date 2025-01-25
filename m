Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641B2C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 14:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3651A60BAB;
	Sat, 25 Jan 2025 14:34:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jyi084Fnkkba; Sat, 25 Jan 2025 14:34:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BBB560BC3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BBB560BC3;
	Sat, 25 Jan 2025 14:34:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C8D51183
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03D3D41375
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:34:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vqs9lU-jgnCk for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 14:34:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 30A9A40331
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30A9A40331
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 30A9A40331
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:34:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 7A8D0780372;
 Sat, 25 Jan 2025 15:33:58 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:54290])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 15:33:58 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 15:33:58 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250124184036.3791393-1-james.hilliard1@gmail.com>
References: <20250124184036.3791393-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <2d14c1aa7a463477fe2106211b045ccd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737815639;
 bh=7h8n4cp2J5tUXKDYFGoYUwfA0ePMTms+HLmravH45ys=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eKF5tRH30fM4HH9ESDSlEc6dAdVdOeDeW1Tzn0+eIDHXFA8+iEZ2qx9vdtdXghedc
 TuOJ6uViKIcM4HU1gJBylswzLyPJpElmJCH+JfD7J9ogITPjZA6GdK0WtK6uBajc/D
 vm2LZbKDkdXB6ViwBRRDJJpQYjt6bbg6se0LnO41t/Qtn3UDDTxcTo4qJ7FUampWY1
 Mi8B55wCcfmLY5lyT9/iPjJgiFbqqXLazbhpRMiF8716ceg2DFrPWwu2eTLBJ3kFdv
 Z4pRFkxX25SZZmhmw7oc6tGuszeA1gkFczkVq0RFFrUcbWmq0gc7UCf/GWXADk6kTB
 k6tL1kSVcPuIw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eKF5tRH3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-fastapi: bump to version
 0.115.7
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

On 24/01/2025 19:40, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
