Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4F0CD5BD1
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 17:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44FD760604;
	Mon,  1 Jun 2026 17:18:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HWO0PjNerBWW; Mon,  1 Jun 2026 17:18:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F87660608
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780334309;
	bh=RpPLmOPNI3QXsS7LL2/dns/03q4RcMMgXfztmPJByFY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cS+Te24Et+jLcMHSxPtTinqKfixlbgJSdt0njliWxUlMSepFHffZHza/0BRLa8cQS
	 n0FN3hw+0Yf8OvrAXJbcjmdilktxSElJ/5keG4UJ6Msfa5r4RuxmrQYnBvcl4NqI1C
	 DXdLX+b5U2ZmdpoG4IIyqDHlD12C+0+wMOJx8v0Je1IusmtP7dHd/mwTK/kmRz/KDi
	 v2zsxsX7yfcZ1tqYztBF13DX89yvwP/3enVHI4vT7RIu81z7wTczdWWsAleyfWz6LI
	 1MuuTEYK+g3C/nWU0PWHPvWhDI27wQ5CriVnCBLMJA5EkzEmcl8j3/Hq4ktIShDpE9
	 nvD3WRsUNt7cw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F87660608;
	Mon,  1 Jun 2026 17:18:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B733F5
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 17:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61AD540051
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 17:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p4EvMp9kmlNu for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 17:18:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DB6E24003D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB6E24003D
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB6E24003D
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 17:18:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 235CF78050A;
 Mon,  1 Jun 2026 19:18:22 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 01 Jun 2026 19:18:22 +0200
MIME-Version: 1.0
Date: Mon, 01 Jun 2026 19:18:22 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260531194738.1379915-1-romain.naour@smile.fr>
References: <20260531194738.1379915-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.14
Message-ID: <add864d9715a9e9537d099c108da0d4c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1780334303;
 bh=dKQU5ly2ZGth9TSFt0dR0IFaXoHddgtkpsKVZgjIF8U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=clj896HUsCjMj4JCyT05cLbo2Gtht0uZzsTxnGM1FHPfKtISncz9/PqFJrLqGSGPq
 nya/tecC9a5ugJtzrox4rcfznXWq1/Oqyf4C4+KgXaMKEJ8RVnkCFYb2jvZwimtYlI
 2VpgRFqPkcyZzllpSxyvPAU5py1jR6qdpmOfAqHrqwTWLIldiBBX6xwXhKwuaOBZc8
 JbgN8glSg5if6i0ldOz/zxC4HmZJpe5eGGgxJw+T7G5KcKcYVsY81fGi1oWNNyjtRe
 gDhKv0VNv7dvUT8y6+kSuhd54b3FTgAJ2CNaA1zHd8y6FGjaZJnpkZKsy2ReYH/UxX
 ROHA6N+3HeE8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=clj896HU
Subject: Re: [Buildroot] [PATCH] support/testing: TestXfs: fix build on
 Gitlab runners
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

On 31/05/2026 21:47, Romain Naour via buildroot wrote:
> Our CI uses "/builds/buildroot.org/buildroot" as build directory.
> Unlikely the xfsprogs build system misbehave when a directory in
> the path contain ".o".
> 
> While generating .ltdep, the sed command used to convert object file
> (.o) to libtool object(.lo) replace buildroot.org by buildroot.lorg.
> 
>   .ltdep: $(CFILES) $(HFILES)
>     $(Q)$(MAKEDEP) $(CFILES) | $(SED) -e 's,^\([^:]*\)\.o,\1.lo,' > 
> .ltdep
> 
> Building libfrog
>     [CC]     gen_crc32table
>     [GENERATE] crc32table.h
> gmake[4]: *** No rule to make target 
> '/builds/buildroot.lorg/buildroot/test-output/TestXfs/host/include/urcu.h', 
> needed by 'avl64.lo'.  Stop.
> 
> Update the sed command to avoid this effect.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/14607335648
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
