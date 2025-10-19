Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDEFCCD183
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 15:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E7B141283;
	Sun, 19 Oct 2025 15:16:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OfSB7miL4gzu; Sun, 19 Oct 2025 15:16:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B56A341289
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B56A341289;
	Sun, 19 Oct 2025 15:16:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C083E1CC
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 15:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6F3441289
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 15:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id twyvFAtCHuJq for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 15:16:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ABF8541283
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABF8541283
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABF8541283
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 15:16:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id CBB9C2003C6;
 Sun, 19 Oct 2025 17:16:40 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Oct 2025 17:16:40 +0200
MIME-Version: 1.0
Date: Sun, 19 Oct 2025 17:16:40 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251018194620.3446578-1-bernd@kuhls.net>
References: <20251018194620.3446578-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <0393fb3c5d17a0c7e05b24c751958ea2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760887001;
 bh=EXx1zvXsozPde4ALJd7F76Cb8m0Sg2D/cFnTVHO9JuI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=icK6H7fnQpBJqRPUlWup9qiNToDI+LonKi3hfcWjRohqvekYMkvbWEk8yLWSBqlxx
 GOacsqmIdS21rJviyYmI2B3kvLrG7GUr4yjVLV8AxD5M11ULIXSklzrcp1GpyoUlJs
 irLxxZQtDDjsOG5tJX57v3w1yWRfRFKBhsv1TILOpOMnABRus1YPQ+u0Exk58CfRXt
 9d93sfDNO78BsaTChO77GVQpZKQic+i7+ySayhNBvwLurcHoF6HvxbM3m5BRPrP5Uo
 0S/LdYB4xlikEHoikmjLzOiKBH8RO8w9QVkBWOxtAMJ5Hfi6kT9nwsjooXc8ate1Bh
 1xtO1MmBubv+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=icK6H7fn
Subject: Re: [Buildroot] [PATCH 1/1] package/pound: bump version to 4.17
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

On 18/10/2025 21:46, Bernd Kuhls wrote:
> Removed patch 0001, upstream committed a different fix:
> https://github.com/graygnuorg/pound/pull/17#issuecomment-1757235640
> 
> Removed "--with-owner" and "--with-group" configure options:
> https://github.com/graygnuorg/pound/commit/6537e9c97bce1f84254ada0104f72264406a1d0d
> 
> Added optional dependency to libxcrypt for glibc needed due to commit:
> https://github.com/graygnuorg/pound/commit/32c32b248fe99650f3949b7ee7502a2ff5335f24
> 
> Updated pcre-related configure options due to commit:
> https://github.com/graygnuorg/pound/commit/a3d2b9e0d41c2d5c0487dba0ea5d5178cdfae9c7
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
