Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779E5C2BA1B
	for <buildroot@archiver.kernel.org>; Tue, 11 Mar 2025 20:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BC2360B90;
	Tue, 11 Mar 2025 20:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zHnPbvyNopKb; Tue, 11 Mar 2025 20:11:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20F7C60B93
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20F7C60B93;
	Tue, 11 Mar 2025 20:11:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 09B941C8
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 20:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA34740916
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 20:11:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nSeyczF9i7Ve for <buildroot@buildroot.org>;
 Tue, 11 Mar 2025 20:11:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F44240983
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F44240983
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F44240983
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 20:11:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 651E4780375;
 Tue, 11 Mar 2025 21:11:31 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 11 Mar 2025 21:11:31 +0100
MIME-Version: 1.0
Date: Tue, 11 Mar 2025 21:11:31 +0100
From: Julien Olivain <ju.o@free.fr>
To: Kanak Shilledar <kanakshilledar@gmail.com>
Cc: buildroot@buildroot.org, Damien Le Moal <dlemoal@kernel.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250309130230.1520839-4-kanakshilledar@gmail.com>
References: <20250309130230.1520839-2-kanakshilledar@gmail.com>
 <20250309130230.1520839-4-kanakshilledar@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <704fcc5d132c37da06f4d21cf24b418f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741723894;
 bh=d1FKFxN/9/QwrHgyWn1QZki/HOlWb12kCjt8SfU3lvI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OrGdyuT96QBNfXl0oap4ucYhhKRz2CdPIm8exYPihGYmMWIH23jQYA/rXr9DTp5Ms
 UUgBlc40Z8lOMdUPFaIXIl2NZKJhW42nmAatSTYnAf1JOuw7eqfpOUIsdyRbvq38by
 1RIPujxffXMWbD6Eo78LeYxIRcw7bhML/ibp99J5Oq+6XAgVOViQ1pw+j6tbQl0UAQ
 xKxXSYMK18A/Wk0quWZbKC+hpACbZ6WwvMXCo2+J/XhEypS1AiPnj4dI0hC8J15YzB
 3lXWAW0vDlURRybdtH8S/E6QdZ4D7nLpV3unundRvjOWKJM/3GKpvMhll0kM6CZoG5
 zKSdvOJvayQCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=OrGdyuT9
Subject: Re: [Buildroot] [PATCH v2 1/2] package/sipeed-lpi4abin: add
 licheepi4a boot bins
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

Hi Kanak,

On 09/03/2025 14:02, Kanak Shilledar wrote:
> Sipeed LicheePi 4A requires some proprietary binaries
> for booting, these are provided in the th1520-boot-firmware
> repo [1]. These binaries are also required for the onboard
> sound and wifi.
> 
> [1] https://github.com/revyos/th1520-boot-firmware

I applied this patch series to next, thanks!

I was able to get access to this board, so I could actually runtime
test those patches. While doing so, I did few minor changes and added
extra information in the readme.txt.

See:
https://gitlab.com/buildroot.org/buildroot/-/commit/29861832a38976911d931256e8e5a3aad526e761
https://gitlab.com/buildroot.org/buildroot/-/commit/1ab37899ae7c7595d3fc1ab70b67388e67e70c33

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
