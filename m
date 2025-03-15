Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A479AC28B28
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 20:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 747E680E92;
	Sat, 15 Mar 2025 20:51:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTlqghKuhKUj; Sat, 15 Mar 2025 20:51:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D54983794
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D54983794;
	Sat, 15 Mar 2025 20:51:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E214761
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 20:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C594783777
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 20:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AO7p9KfxWOvL for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 20:51:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B7C6980E92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7C6980E92
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B7C6980E92
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 20:51:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0043813F879;
 Sat, 15 Mar 2025 21:50:55 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Mar 2025 21:50:55 +0100
MIME-Version: 1.0
Date: Sat, 15 Mar 2025 21:50:55 +0100
From: Julien Olivain <ju.o@free.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
In-Reply-To: <6f7da99f22b412afc8f202c8b8053e8fec0da9e7.1739615626.git.yann.morin.1998@free.fr>
References: <cover.1739615626.git.yann.morin.1998@free.fr>
 <6f7da99f22b412afc8f202c8b8053e8fec0da9e7.1739615626.git.yann.morin.1998@free.fr>
User-Agent: Webmail Free/1.6.10
Message-ID: <cdec34adf8964b6c139f5b7c805c88c3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742071859;
 bh=QjLruBoCqu2ocixQAmwg1RpZ1Ot+m4QrZCoVkkyye7U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aGgMb3lthn0OeP48tzDGTJJtboQMzT/LRR3Io183N8ebzyvAY7KUzb1UolDRtN5jw
 whlYle2cNYh6+icZJ8aHmX/mz9oFo98KUzKVQRWOkHZnFkL4GFR5N0lkYlI5KmwYRy
 FcK+RVE3kN/JIoWRK35FBQb1iVDWQwR/zPjUwKgU/BkVMgJViTFsITh6oSoFKgYNMR
 mLXAd0S/DTqGTZsT9I/wFZEjy1157098CPFmZtN31qIzEoDXbefZQ+wT2NI/wllFfJ
 I/3yUjH8Qlr2QqELxS3J3O8DyibQFXgeWMcX8i8fIj3s6FgC699pGjEtL+4Oft+oG2
 DcXEyMFMTpp3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=aGgMb3lt
Subject: Re: [Buildroot] [PATCH 1/4] package/docker-engine: carry the tini
 init symlink
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

On 15/02/2025 11:33, Yann E. MORIN wrote:
> tini can be used standalone, not just as an init injected by docker.
> As such, creating the docker-engine's init symlink does not belong to
> tini itself, but to docker-engine.
> 
> This will also help later, when we allow docker-engine to use another
> init alternative, catatonit (already paclkaged in Buildroot, but not
> integrated with docker).
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Christian Stewart <christian@aperture.us>
> Cc: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Series applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
