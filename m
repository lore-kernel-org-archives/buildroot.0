Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60ECDEA71A1
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 21:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B80541036;
	Sun, 19 Apr 2026 21:23:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4uakkG6nXqmQ; Sun, 19 Apr 2026 21:23:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3814941034
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776633827;
	bh=Ac9dEP9+N6TMqDoPAPUVmtiF5rI19Eevg/gXc7q9fTo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PQuxD8UGTHUL74on5yQQtfiaK82JxXPgPYvmViEIRKJHGc4JADhViNGwVteIyH5Xt
	 CyY8+Fmp+096Hq4z2yH76xQBwpJVcsKMlo31+gOeQZCbUTSqnEXH/ubnlrSgj8XAuG
	 4wAqKEZvRYNzrkTmuvJUNr+8xYImTNgwpkWDaMawqeX4s6jchzDaeQ6KNSxHs2IV0O
	 fZK1jfX78zf+KLCeEBVutM35NCqnBzUZGlu++JIN/eHEbB2DT18b8SRGFFPUA896dD
	 Ug7hEbJ6w7TY7bGU9ggGpmRdMkiR/OS8IuxMs/wSqm6bvs3Viy3b7ifft3QOkKbGIk
	 J/oKdElLUpc0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3814941034;
	Sun, 19 Apr 2026 21:23:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 009AE24D
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 21:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA3CB61003
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 21:23:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IUGcFYQLHcJJ for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 21:23:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0C9A660FFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C9A660FFE
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C9A660FFE
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 21:23:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id ED12319F57B;
 Sun, 19 Apr 2026 23:23:41 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Apr 2026 23:23:41 +0200
MIME-Version: 1.0
Date: Sun, 19 Apr 2026 23:23:41 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260417080647.1404627-1-aperez@igalia.com>
References: <20260417080647.1404627-1-aperez@igalia.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <723065ddf01a03767bfbc201cb142187@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776633823;
 bh=lo5spjIO7xjw9+pYjSitg30dEOeHZPQigBSTb+Xw7V0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XulU4Q14IjmhVn8sQvujoVJGuERSrrl3kE/za+sc1ipBcdURNW4NZ3rJhMTkarkFc
 6IOCdzrhwH6DXg6FFptRR1AAvchyxnnHid1+J7sdoUwwMMqcuyWwnM8o+X8isQlFOO
 Uc7/omNfR4Ju52uCWhBAxQKu247rrsz8yCkHoWm/UApxJ1SgFKLWcSFJo11APSiXN4
 LV374efGp6ElVRg1jcaukO867p66gz7+qCHi3khUBnHUcobczsJv97QINlLBBtsE5n
 JEmWcBUWENJbUKgH0R8wM054zUDkaihWHf46TfRVo4PKMF75MGQ+2z6P1zwE/60TXj
 YiSW7ZxOQV2PA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XulU4Q14
Subject: Re: [Buildroot] [PATCH] package/libavif: bump version to 1.4.1
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

On 17/04/2026 10:06, Adrian Perez de Castro wrote:
> Release notes:
> 
>   https://github.com/AOMediaCodec/libavif/releases/tag/v1.4.0
>   https://github.com/AOMediaCodec/libavif/releases/tag/v1.4.1
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
