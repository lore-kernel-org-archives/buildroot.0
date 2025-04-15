Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7944DC369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 21:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4987A40E38;
	Tue, 15 Apr 2025 21:49:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ERh9v5HU6X7; Tue, 15 Apr 2025 21:49:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BA98410DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BA98410DC;
	Tue, 15 Apr 2025 21:49:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AC6376B
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 21:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BE7F410DC
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 21:49:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5shM10BH_pnb for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 21:49:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 067DE40D95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 067DE40D95
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 067DE40D95
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 21:49:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 075022003CC;
 Tue, 15 Apr 2025 23:49:17 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Apr 2025 23:49:17 +0200
MIME-Version: 1.0
Date: Tue, 15 Apr 2025 23:49:17 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250415205643.2526615-1-thomas.petazzoni@bootlin.com>
References: <20250415205643.2526615-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <c689685fa2a779620a5e1f55f6120175@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744753760;
 bh=xzah4fzjNMPvga0vPUSqZSVj1hDWW6nkjJYBZnP9wZo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OXgWOrf8Obx/oo/nQ8T1GtJOJOzlQRxu4ve9SsiZtK8dkIHuhSk2aukVb4cq7ubPL
 kn/BNCTlSFsOfmyJsfb99hq3hIx5n1/EXlNroVmiMc0Pl0ArBwPlipdf2YMrgxk/au
 6Lj8rOevEabDIQLOr/dG7v3eMAiKawZV0hIXBCkwfgKIuVuZgwCwzczlq+uG4RaWQl
 AiU+lnK68FVnzZ7lWdVYNG6ASIeoFAocqR1rgkeLOLh9+IeTHD9+J2HFDQJu7FT7QS
 RftTtFUY2Ll6cVzF2LSrcfM6EyFzIL4qtyD5GfSR5oX/cvucClpYF95XJrBPmQLnmK
 RuPhux08p+P+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OXgWOrf8
Subject: Re: [Buildroot] [PATCH] package/python-qrcode: bump to 8.1
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

On 15/04/2025 22:56, Thomas Petazzoni via buildroot wrote:
> Changes since 8.0:
> 
> - Added support for Python 3.13
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

For info, I also fixed the _SITE url.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
