Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFC2CA0FE7
	for <buildroot@archiver.kernel.org>; Mon, 25 Aug 2025 22:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BC766F5F7;
	Mon, 25 Aug 2025 22:36:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3i4EmuKkmZ7c; Mon, 25 Aug 2025 22:36:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C71726F5F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C71726F5F4;
	Mon, 25 Aug 2025 22:36:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 235CFCD
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 22:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08F4541418
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 22:36:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I6ZXhhhlxskQ for <buildroot@buildroot.org>;
 Mon, 25 Aug 2025 22:36:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5ABAB413DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5ABAB413DE
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5ABAB413DE
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 22:36:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 2C16D2003C1;
 Tue, 26 Aug 2025 00:36:08 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 26 Aug 2025 00:36:08 +0200
MIME-Version: 1.0
Date: Tue, 26 Aug 2025 00:36:08 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20250712160622.1820322-1-dario.binacchi@amarulasolutions.com>
References: <20250712160622.1820322-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <768f22b013527ebbf2629771c8c61d81@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756161370;
 bh=MTpiE9P51vrys+KxmCfUchkTy7pW8V+iQAf68gyIZxA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JcGRKJJtSA6Pmj4AdtjEAIsA/AHTdQvb5zw/PE4kJaJxcOK2a5wbpURrMuDywaFX3
 uRRgBjcPSFW6zn/O71nRPPVyqv51VsM17iiOz8BNK3YqTUd4E9POVYcoGF1EybgHF4
 wfirMXwAQtlGCx7779aMTlKkIve2KDwD9ujTNs7wO+qhki+/eV6G/Hn0yOiQv1/jv/
 0ZQ37JQHelXKXwl+cShREcsJZK4zpDuhwPHdXvJK+UCVy/rQ9zDxwTT3IL3y98LkGm
 Sc67XM6tKhSLd6j6q7ITUvQej+97saESPYK/av4fwHYj8Ce0g2IkcLRK5tlx8RC0n4
 0XgXCQZZFCrXw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JcGRKJJt
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f769_disco_sd: bump Linux
 to 5.15.186 and U-Boot to 2025.07
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

On 12/07/2025 18:06, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 5.15.186 and U-Boot to
> version 2025.07.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
