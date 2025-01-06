Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97137E77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 22:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58FB381296;
	Mon,  6 Jan 2025 22:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X48ueeqT2AOb; Mon,  6 Jan 2025 22:54:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7033781298
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7033781298;
	Mon,  6 Jan 2025 22:54:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 46B06F1E
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33FF4406B1
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P4DBfRaH7lER for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 22:54:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1677F406AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1677F406AE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1677F406AE
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:54:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 29BCE13F86E;
 Mon,  6 Jan 2025 23:54:04 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:33870])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 06 Jan 2025 23:54:04 +0100
MIME-Version: 1.0
Date: Mon, 06 Jan 2025 23:54:04 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250106024626.151525-1-nemaakhilesh@gmail.com>
References: <20250106024626.151525-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <d7c115a2a0d39baa4ddce696257ac360@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736204045;
 bh=4xO9XSbT7hGczJXa6fmgmpaYqcBmyuFCtoiNTn0Wbvw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CuC8sKRHmCpw2xHvvXxtykWx1PY/jDitXzAttve2tY02poQ3tsetq0W711SABMSqP
 Za70sawlNhBkTNKWs3+ssiO16XOsL8Hy2tKtyJlVG1iHC/uuJrcRUDgfjn/Ct0Eppt
 G/6JR5M7OzSb3/fDnkpP8d0hiMBLNkC2KNtLKguf/VeFYcFwCGCmcg9uIDaXsFAoJp
 jNstM36TiT1Eac61AIpXeqfIzoX6NVC3U9UWR2x7sfujKtg+O17RX4rxIYdpO5jdRp
 0WTy17mRQ6yiFJMvf7voUQSYO7kDUCdaH4JAhmhyk/5E34PoRvUkZiOhlznFIJgl5k
 EF/jIRseZC0Bg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=CuC8sKRH
Subject: Re: [Buildroot] [PATCH 1/1] package/iperf3: security bump to
 version 3.18
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

Hi Akhilesh,

On 06/01/2025 03:46, Akhilesh Nema wrote:
> Fixes CVE-2024-26306.

You mention here "CVE-2024-26306". It seems this CVE was already fixed 
in
Buildroot commit:
https://gitlab.com/buildroot.org/buildroot/-/commit/9d9a0db3d8b471ccf1721312450337ff53ed4a35

> https://github.com/advisories/GHSA-2w89-5px3-fvx6
> 
> Release notes:
> https://github.com/esnet/iperf/releases/tag/3.18

The advisory and release note are actually referring "CVE-2024-53580".

> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Can you confirm it is a typo?  You can just confirm it's a typo (and 
I'll do the
fix while applying) or send a v2, at your convenience.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
