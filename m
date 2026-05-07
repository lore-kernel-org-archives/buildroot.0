Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A90DCD37AA
	for <buildroot@archiver.kernel.org>; Thu,  7 May 2026 22:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A99083D65;
	Thu,  7 May 2026 22:32:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gTg2xhuS249J; Thu,  7 May 2026 22:32:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C092083D53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778193145;
	bh=Q4WdTDgMc2E/8nxkORskf0L6WuRnex+7/mzk93iqNpI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gUVKJE89GQYIDzmiPfIuLketV/mkOBJq3waqBcAQEutOpYHrmktWSGgpeO/Yb1dyE
	 4Tyzx1NX2YxzHXYQwJ1zydHu/ARMmrL2DfXE+t7mZnTRoVwgkOZ1aIpXaG2iJKU+yz
	 +jEnAvfD6iCdwdia9bz+OS3Rpo0CFciDCrhQZeEUrMUNjusMgoo9Wu3R2sJG034Y6x
	 3QjiVQG+knEuZ9HiL72zg+8SZdhYKHGONYSHapOjrYRHQ2p7mL5XOnq8ie/CBgTtjL
	 vEHiAQh53lAcZCo412HjKxMGUGpSvlv/CM0sOWAP0NdMaiQzaOLq9HH3ClF1/wwnpC
	 o0GZhgwb0yBHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C092083D53;
	Thu,  7 May 2026 22:32:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B8F22FA
 for <buildroot@buildroot.org>; Thu,  7 May 2026 22:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F129F40387
 for <buildroot@buildroot.org>; Thu,  7 May 2026 22:32:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fyXqcbUNDzdl for <buildroot@buildroot.org>;
 Thu,  7 May 2026 22:32:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 05B3D400A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05B3D400A2
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05B3D400A2
 for <buildroot@buildroot.org>; Thu,  7 May 2026 22:32:22 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 331382C84162;
 Fri, 08 May 2026 00:32:20 +0200 (CEST)
Message-ID: <a883cb9d-9d23-4a9a-b4e5-7c6e8b411724@bubu1.eu>
Date: Fri, 8 May 2026 00:32:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jasper van der Neut <jasper@isotopic.nl>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20260507161230.1986411-1-jasper@isotopic.nl>
Content-Language: en-US
In-Reply-To: <20260507161230.1986411-1-jasper@isotopic.nl>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1778193140; bh=n+DWUUNpTnOEofAPcQ7Fp+39LrD1tZynmEYt+DNUiOQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=NyFpmY75KVqhagtyPtB0H34j8YlsUmU3CMyZqYBzzSzorzKJ9elSM74Q4tSVQTGvy
 T+9YdQ2XyjVXyHz5pEzIKYO4RRTXvxk4IcJWGqXnhiiQTyGJCR3DeHQ0dobWNs9QHV
 pVmkJXu1XbiyO3B86gGVLeUhNUamfZ9Fxh5fJqtGU9B6kifTOw8gHI7gafxGXh6MuZ
 pcK7x2Zb2X1nfASXNjTkKdBNr40KaiRT2lmUldGl6ip5VR7IjacbWjNIc4NU2Hk/YN
 fzvAF5t9ZinYVdgSVx6KqSn1Hl1egkXVKqK7F1TNZhg+kk3Puuun7aTFMm7w+w3w37
 z6ni5QwUaFWdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=NyFpmY75
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/util-linux: fix
 loopdev-fl-nofollow patch
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

Hi Jasper,

On 5/7/26 18:12, Jasper van der Neut wrote:
> ul_canonicalize_path is not available in util-linux 2.40, so build will
> fail with an unresolved reference.
> 
> Signed-off-by: Jasper van der Neut <jasper@isotopic.nl>
> ---

I've sent a similar patch earlier today as well:
https://patchwork.ozlabs.org/project/buildroot/patch/20260507135455.980874-1-buildroot@bubu1.eu/

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
