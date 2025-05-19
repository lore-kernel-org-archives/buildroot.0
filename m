Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F767C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 19:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4D1B60FBC;
	Mon, 19 May 2025 19:03:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 42wm0MoWt-dy; Mon, 19 May 2025 19:03:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58DC460FBE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58DC460FBE;
	Mon, 19 May 2025 19:03:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C1E3E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 19:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D9F760FBC
 for <buildroot@buildroot.org>; Mon, 19 May 2025 19:03:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I4mCRcACv8ZB for <buildroot@buildroot.org>;
 Mon, 19 May 2025 19:03:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8FAAC60ABC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FAAC60ABC
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8FAAC60ABC
 for <buildroot@buildroot.org>; Mon, 19 May 2025 19:03:31 +0000 (UTC)
Received: from [192.168.178.42] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id C2E342C84458
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:03:28 +0200 (CEST)
Message-ID: <6521217e-0d5a-42ae-a315-c533f0f66909@bubu1.eu>
Date: Mon, 19 May 2025 21:03:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20250118133740.4001841-1-fiona.klute@gmx.de>
 <8eccd976-c4c1-4fdc-a3c5-340b4a7f979b@gmx.de>
Content-Language: en-US
In-Reply-To: <8eccd976-c4c1-4fdc-a3c5-340b4a7f979b@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1747681408; bh=E2aGCiqffN2Vqq+tq2/0YiPFHdvKJZ0al/FGyKSzzLY=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=bEaoU3ONrsWJed/JiUDW6PLfCTEeXNVf2Kn6gzlE5LQubY/EPs1fYa2AxkCaaEcuO
 AZoJwqPGGd2yglgkyTL/9VQoV6UPliBD82q9q7BaNOI6ppXzTthMoLxNOOGKV2FJil
 NgFM8sdpq7bqO8865r4CdYfOSx9Q5NAD7fKHJ37U4s8JaQFp2RjHzdwcf259/pLWTV
 gi9LyNvpngsHPlFGolImLzV4cxPm74IZcCdtaqn2RcODZGoa2Rhmcx+unr/B22t6gJ
 jnqWs55oODEeG6bVsQVod0CaWADhC/JT/uUXX2fBMQYL880fr72BmxrcPIgr6FLmFC
 qxqmQbjsKkNVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=bEaoU3ON
Subject: Re: [Buildroot] [PATCH 1/1] package/wireless-regdb: sysv init
 script to set regdomain
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fiona,

On 19.05.25 17:37, Fiona Klute via buildroot wrote:
> Hi everyone,
> 
> just want to check if there's any interest in merging this. It's trivial 
> enough to maintain in an external tree otherwise, I just figured it 
> might be useful for anyone who's also using a wireless setup that 
> doesn't have a built-in way to set the regulatory domain (namely, 
> NetworkManager).

We also use NetworkManager but systemd as our init system, so I ended up 
writing a udev rule that calls a script, that sets the regulatory 
domain. Would be nice to just universally have a solution for this, but 
I guess having a SysV initscript is better than not having it?


> 
> Best regards,
> Fiona
> 

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
