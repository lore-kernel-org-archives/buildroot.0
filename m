Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780EAC3ABB2
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 20:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4191240902;
	Wed, 28 May 2025 20:26:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nUrO-5iVaSkJ; Wed, 28 May 2025 20:26:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F0F6407B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F0F6407B7;
	Wed, 28 May 2025 20:26:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D2240B66
 for <buildroot@buildroot.org>; Wed, 28 May 2025 20:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62EAE60EFC
 for <buildroot@buildroot.org>; Wed, 28 May 2025 20:26:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id emGrLy_iyTm1 for <buildroot@buildroot.org>;
 Wed, 28 May 2025 20:26:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9E6B860EFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E6B860EFE
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E6B860EFE
 for <buildroot@buildroot.org>; Wed, 28 May 2025 20:26:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id B93FA78034D;
 Wed, 28 May 2025 22:25:57 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 28 May 2025 22:25:57 +0200
MIME-Version: 1.0
Date: Wed, 28 May 2025 22:25:57 +0200
From: Julien Olivain <ju.o@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org, Petr Vorel <petr.vorel@gmail.com>
In-Reply-To: <20250527201348.376435-1-kadambini.nema@gmail.com>
References: <20250527201348.376435-1-kadambini.nema@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <df1a2d0b89fd68373201955e4729a527@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748463960;
 bh=RR8BV1/HGP6hG998oECoQ+86c1tBsXid8zvm1/FqaSU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KuVP6/UYdNRYGHhzv743D2hnkVZjCNCbxGD4jKFqhOO+pkzJRpdwrbE9mtHDmsVRd
 yvALFu2XWkON8kugWL570wcE0Vl8QBP5HmM/kzxMteU13NFgTfOpBY9peOIOYRvokx
 l6PPoc2qASB2kg8z/XpHBfwiOrF3tsGphXOIX4Ogx2IuTo2sGx1oJiOqfkqRqlhAqL
 tOI367XTATuzHQ/uF+Mqm7aV9HkGBMMdQ0yTwd2oHSVQZBWl6/FOjDhZNCEYkOVLyu
 PstQpqZeBqC2vZPx9g2vyejmysvfasEWzAMmhtt8gLatIfBmFkgWvJIUSXDNi1r0um
 yMvO6GzHe9lcQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KuVP6/UY
Subject: Re: [Buildroot] [PATCH 1/1] package/iproute2: bump to version 6.15.0
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

On 27/05/2025 22:13, Kadambini Nema wrote:
> Release announcement:
> https://lore.kernel.org/netdev/20250526140140.38ba5578@hermes.local/
> 
> Changelog:
> https://github.com/iproute2/iproute2/compare/v6.14.0...v6.15.0
> 
> Drop 0001-nstat-NULL-Dereference-when-no-entries-specified.patch
> Upstream commit - 
> https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=866e1d107b7de68ca1fcd1d4d5ffecf9d96bff30
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
