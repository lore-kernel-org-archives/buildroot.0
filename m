Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30DDE8FDB4
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 20:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 276054072F;
	Fri, 26 Dec 2025 20:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id taUgfcffYLZz; Fri, 26 Dec 2025 20:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EB57406DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766780995;
	bh=Zkc63TxLslFVE2MKt8WuDVBPSiLGa/TsHMRHknZeW/w=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hSZtx6T8B/kd+PR7pYQkZ9/9P56stw8MDtMbUIGOhUa1lkLYK8DIAFb9ALGYPoWyW
	 5A1Uwvirl5R8bvsAnTZH4kxfK+cmzcXuuLjMq7WfXDaIvxexMhMR8nEqKB27kGTMRP
	 hPqc5/IC4KHUrfgMb4Qg44Xdhc/ay4sxKgvLjl1qA5KSJNyBq8dzZs4rFQsFrG7k4m
	 Wut/zBH5iIaj6YsqmypNOvTKLmFhrv41nl/OkhBaMVT0az2IHasA22IO2aFciejcct
	 UlGoi7pd2wLB9D75ppkne/dAgfm291QDV5LwapP2Di2DkP8uknal1fOSyRKygLugka
	 p/64daFq2R3oA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EB57406DF;
	Fri, 26 Dec 2025 20:29:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B2ACB9
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BE5060A60
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RZBCM1AaTIPz for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 20:29:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 46DE16080F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46DE16080F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46DE16080F
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:29:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 4B4C55FFAF;
 Fri, 26 Dec 2025 21:29:49 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 26 Dec 2025 21:29:49 +0100
MIME-Version: 1.0
Date: Fri, 26 Dec 2025 21:29:49 +0100
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251222124050.77775-1-buildroot@bubu1.eu>
References: <20251222124050.77775-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.12
Message-ID: <4c3e5c645cf14af2e64bafd4a9e53779@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766780991;
 bh=f/iq1hwuWwalL1Ua0HYIcxCUFrMm2WJFxbDmUS6UQFo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QKIevilFmrXZYdkKiCxX2usVH1xqjPkrjnEoNhzaLd6PdoS4V2dw84+FMhUMwsJhx
 sdQsL9Ic5cXYZw1IXUGgkCBghSM2mjOoSOUgft1TqXxMLodcfzVFCROeo4bj6XbpqH
 ZTJu1olwqa2dEI8zSNMdE+Pnh92PZgRRdSbfdkcpB0RG4JsNdNaqoVTXleV6reQqJF
 M+sbd8jD9hlF3VOnrqH/KBf0cy5ozss5kz4cwt/d4imSfCf05wqOL+CejH2XCsFwq4
 B4+tW9gEWMb/dxau3H2IOeWZ1saFbO8GzsumEmmxNcqoJrfzXxoJvbarovKhdtCdoC
 AsXX7qJ0vYlEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QKIevilF
Subject: Re: [Buildroot] [PATCH] package/python-fastapi: bump to 0.127.0
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

On 22/12/2025 13:40, Marcus Hoffmann via buildroot wrote:
> Release notes:
> https://github.com/fastapi/fastapi/releases/tag/0.127.0
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
