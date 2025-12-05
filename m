Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A53D2F7EB
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 12:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FA8684464;
	Fri,  5 Dec 2025 12:35:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fz-zlYp4h8k8; Fri,  5 Dec 2025 12:35:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A40F84452
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764938135;
	bh=pWMi9WV6Dw8fm6cDLDtKFFGG+g76tIflIRgV2KJ7Nlg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VBEQRBteYMevqnxzq9ZcwPgpOKVsovQB5qGu40LWMsPaIV817g+Ykb/rPaGRNt1gT
	 XYih8JKhcrJELXhkPXlQP33m3o/tBRSiVI7sV8ZguzUcSR8VD4zLG/r2Vxlgn/ggoa
	 K02bxIShgzDbJM+rGoC0UFXPLjUWAxQ4k5JpnKC8N/fFdXknaE2Vxh/2/muWZjvz/d
	 8HdnbHHPOOqUREedQc5q/jb5iJjyYf6jUInT6MnTK8fveCIEGpFxi9BVGKOksyaNo7
	 8GwrhJfqYpqLpz5VwoWNnpdBVTrmkIiRzMM2kLgn8/YXau66qN92/d7i48kH3ly93e
	 T8LJmrJvjcSVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A40F84452;
	Fri,  5 Dec 2025 12:35:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B749C1A9
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 12:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8A6B84445
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 12:35:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YYQdPk6zip8Z for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 12:35:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 740B884428
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 740B884428
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 740B884428
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 12:35:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 477972003DE;
 Fri,  5 Dec 2025 13:35:28 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 05 Dec 2025 13:35:28 +0100
MIME-Version: 1.0
Date: Fri, 05 Dec 2025 13:35:28 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20251204163553.1326116-1-bernd@kuhls.net>
References: <20251204163553.1326116-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <b26b5923d07b149ca51f66a2dc4af447@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764938130;
 bh=CLGoFxE6L9UsLOPt40O3/M1OiAgJvdhCgrCwm2s+Eus=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LpPHPiSzc5JgdYQSTrS5pjSf9XUG43mzqq+RQ3VeXSzrw6WWBN1h/67lp7tPKymur
 gWFG3i7O9tmd5tH6/wTh0OFfHAn7cZqZksNIlHjjkCbVnfNQMWqIs5CQGu5jNW8qgY
 IAWSClF1Tf+OFouirMEdoI4rofzsngC1S5FugQDiT6szmmtzboZEKGKC9nnntMqROc
 dimTjutJ1x7LBotW3D/aaf4GTw6fiJOjWlg/IO9zFr+VEbpH/0w+0puxbKcuwK/aKq
 KbcgAP/L9ybbNwN8P+F3HNHNhCR9HtWLv2MRcCq4Uj9o/aBTRC5XTg4c265XnGJA4u
 eBBDpmlK9AO1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LpPHPiSz
Subject: Re: [Buildroot] [PATCH/next 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 25.3.1
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

On 04/12/2025 17:35, Bernd Kuhls wrote:
> Release notes:
> https://lists.freedesktop.org/archives/mesa-announce/2025-December/000829.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
