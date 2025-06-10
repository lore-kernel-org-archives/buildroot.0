Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1442DC677C4
	for <buildroot@archiver.kernel.org>; Tue, 10 Jun 2025 21:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD4E7420F6;
	Tue, 10 Jun 2025 21:53:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5lW_oYkevY-s; Tue, 10 Jun 2025 21:53:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C2B24206F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C2B24206F;
	Tue, 10 Jun 2025 21:53:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F7B6183
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 21:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05A3B60877
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 21:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AegT6_R71qMi for <buildroot@buildroot.org>;
 Tue, 10 Jun 2025 21:53:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4807D60866
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4807D60866
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4807D60866
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 21:53:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 06BC15FFB7;
 Tue, 10 Jun 2025 23:53:06 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 10 Jun 2025 23:53:06 +0200
MIME-Version: 1.0
Date: Tue, 10 Jun 2025 23:53:06 +0200
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com
In-Reply-To: <20250610150337.38247-1-neal.frager@amd.com>
References: <20250610150337.38247-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <7c8a82401d581dff82cd93631328aad4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749592394;
 bh=iBkA9WgTgweOUjs3qXDSKmf8NfkGYcne8sTUSkYMBiA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qBAp3xQuBrPo8so9MdTbR+f4awB0jbJfR7gSjQL9pNf/ZneizUKss9KMDINZUf+t+
 tgM9lSw0mMMAVw+6J50tDPAQxDyTOecmfTM8+uCSF6/s//LcTeDs2h452eRI+TmJ0p
 17or7Y8BqY1r2cpxMFMFlhgCo8RFsCSl2Ik4damgO/6zTZZKBvrJIRqvlE0bV/Y5aI
 LmYsmC7H+5Teeo2pcmew+SM09KwOZcmSMM0apyHE5fUIY77YVNu0nmKy0jWSaEOf3y
 lGFvEODcHSbR5po+xm9Gy8KUxM2dEmDupAmrZerg9z8/rKjUu5bqdidb3Uwa6Ew7n4
 /fzykE00r/BKA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qBAp3xQu
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_*: move to external
 Bootlin stable toolchain
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

On 10/06/2025 17:03, Neal Frager via buildroot wrote:
> This moves the zynqmp defconfigs to the Bootlin glibc stable external 
> toolchain
> as per[1].
> 
> [1]: 
> https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs
> 
> This patch has been run-tested on the zcu106 evaluation board.
> This patch has been run-tested on the kv260 starter kit.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
