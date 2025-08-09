Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B162C87FCB
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 16:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48D294077F;
	Sat,  9 Aug 2025 16:42:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3032002b6q_E; Sat,  9 Aug 2025 16:42:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E31C40759
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E31C40759;
	Sat,  9 Aug 2025 16:42:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B239121B
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 16:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98CBB81985
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 16:42:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jsSNV80LuyNW for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 16:42:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CD85881975
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD85881975
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD85881975
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 16:42:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id E78EE2003C6;
 Sat,  9 Aug 2025 18:42:17 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 09 Aug 2025 18:42:17 +0200
MIME-Version: 1.0
Date: Sat, 09 Aug 2025 18:42:17 +0200
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250806150636.20937-1-maxime@leroys.fr>
References: <20250806150636.20937-1-maxime@leroys.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <20fec586f7c73770482452db638406b3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1754757739;
 bh=VIq6LMAAZ1qcLEu95eg1IyzxxNfWTQR2cGQ7GYr/x2c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SFHYy+2CTUIrRqEt1zL06OR78nLo/wOnUBJZjEQbccWUYbtk5BCT7iyDU53yTO81U
 GYR/uQuYnUPK15yDLtCUBnmMbc7XSa5YYAFEz4zGojJMCl5z7L3Tw2l3RFk7ocCfd2
 Oq+gQYTVqXvRN/dXu3mb6p9j4SSiVSj7B/0BMfi+M7zqtT7M1L5f4TKre8PpfFP7qg
 kIg7Lk7fkGBV++NpX6KDA9/GB9Ozg1cemWRE1lvvSdtaS4AlPp+MOR7FpQORPYNRpb
 SBz7lWxcWqwNegYFyB2A/6ToUfKUsyffAs3TJRLkn3e98XHNaYNEhs7+bdFf9BOPUv
 GAGlJCOsP6o7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SFHYy+2C
Subject: Re: [Buildroot] [PATCH 1/2] package/grout: add kernel TUN dependency
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

On 06/08/2025 17:06, Maxime Leroy wrote:
> Grout automatically creates a TUN interface at runtime, so the target
> kernel must have CONFIG_TUN enabled.  Add a fix-up to ensure that 
> option
> is selected.
> 
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
