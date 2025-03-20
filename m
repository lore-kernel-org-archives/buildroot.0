Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26715C28B30
	for <buildroot@archiver.kernel.org>; Thu, 20 Mar 2025 21:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C88F9838D3;
	Thu, 20 Mar 2025 21:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id the-kJ85FbOs; Thu, 20 Mar 2025 21:48:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A52F8392C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A52F8392C;
	Thu, 20 Mar 2025 21:48:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 827B71A4
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 21:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F5958392C
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 21:48:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tJpT8pRf8GoV for <buildroot@buildroot.org>;
 Thu, 20 Mar 2025 21:48:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E0BFA838D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0BFA838D3
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0BFA838D3
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 21:48:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 282662003DA;
 Thu, 20 Mar 2025 22:47:54 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 20 Mar 2025 22:47:54 +0100
MIME-Version: 1.0
Date: Thu, 20 Mar 2025 22:47:54 +0100
From: Julien Olivain <ju.o@free.fr>
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot@buildroot.org, Damien Le Moal <dlemoal@kernel.org>, Florian
 Fainelli <f.fainelli@gmail.com>, "Yann E . MORIN" <yann.morin@orange.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Niklas Cassel
 <cassel@kernel.org>
In-Reply-To: <20250218104807.2329338-1-Niklas.Cassel@wdc.com>
References: <20250218104807.2329338-1-Niklas.Cassel@wdc.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <602f3d12ccec71629b38dc385d84e3bf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742507281;
 bh=vGFFoLsOepYv/WkwGNpSvOnzV11K2PeptTFHND6zXQA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TPf5D3lqcFHYoRD7qlReZnCFHdMg6zbUgo6KliomolXj7dNy8S8UZtRLH3KDSBPxB
 8+5oZrvqyfDI/6P60Su5wsMNbWqwBKgZPdJOnQ0k92ixSVigOY9PInWiSGrYwXEn2D
 +vdWh7EalabXYxh/54l+DqVFIUguAWo9NTuWfgPKke6ZC7fqyWeOWwKdhw9uWspJMM
 4/BhbIe0WtrS2/VkRjtF9TMtbCKWLfAXcTOGT6VhqUQdCIH4puWazoH+CIKBUvXXy7
 ilOCwmfb9sVyxvsXPfien3QfmY53H2DbfTrlyMgTk6yS94A/xSFFgAkSAyOtDx3yY1
 Vky5rzc9TmeYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TPf5D3lq
Subject: Re: [Buildroot] [PATCH 1/2] package/linux-tools: perf: Fix
 _BIN_ARCH_EXCLUDE
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

On 18/02/2025 11:48, Niklas Cassel via buildroot wrote:
> From: Niklas Cassel <cassel@kernel.org>
[...]
> Signed-off-by: Niklas Cassel <cassel@kernel.org>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
