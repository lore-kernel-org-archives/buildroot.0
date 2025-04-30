Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2252BC369D9
	for <buildroot@archiver.kernel.org>; Wed, 30 Apr 2025 10:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA4508118A;
	Wed, 30 Apr 2025 10:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jz6_jb0VyKcu; Wed, 30 Apr 2025 10:08:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 756D681187
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 756D681187;
	Wed, 30 Apr 2025 10:08:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC9E5943
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 10:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA28A81495
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 10:08:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q1YL0CmoT5Kw for <buildroot@buildroot.org>;
 Wed, 30 Apr 2025 10:08:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B588E8118A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B588E8118A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B588E8118A
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 10:08:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 6D79519F5A7;
 Wed, 30 Apr 2025 12:08:36 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 30 Apr 2025 12:08:36 +0200
MIME-Version: 1.0
Date: Wed, 30 Apr 2025 12:08:36 +0200
From: Julien Olivain <ju.o@free.fr>
To: Christian Hitz <christian@klarinett.li>
Cc: buildroot@buildroot.org, Christian Hitz <christian.hitz@bbv.ch>,
 Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20250430080623.2391295-1-christian@klarinett.li>
References: <20250430080623.2391295-1-christian@klarinett.li>
User-Agent: Webmail Free/1.6.10
Message-ID: <2306451f32fd615e406aea5f3aca82d2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746007719;
 bh=YQJnWZH9rYhNUCwAew6uQGwdsy3XWgYajKawQ9oDi00=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JjqCsWUSZFx0szPhmAJ5SGqgJLg1Z+uyKZ0lDjyKDDfIOp/S90SvGjT+JZ8CSG2JN
 5q+FdZjPbp81VO7Euv43zv8JFVDYcuN8pv1z6umVvkXP1QZii1qVhSREiCUkLh+uTV
 faz9/mSX9cgK1S7MDNoHhihhJ8S2wRAJJ98erkkKjWKoVubHC+JGovR5NtETvIEBTl
 osk0eXTVrBevloOjwDuC/+Z6eUgpI2vzC2gg5JW/ry5Wc1cHcM7at9pmGcCg6SUspO
 jHmSsEpA/dus2xk6fXhuKIawL+vY4zosAevzvKn8DAkagfsSbKYtqGHcX5vGtU+Vu4
 xtI2MYhUONKGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=JjqCsWUS
Subject: Re: [Buildroot] [PATCH] package/libxml2: security bump to version
 2.13.8
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

On 30/04/2025 10:06, Christian Hitz via buildroot wrote:
> From: Christian Hitz <christian.hitz@bbv.ch>
> 
> Fixes the following security vulnerabilities:
> 
> [CVE-2025-32414] Buffer overflow when parsing text streams with Python 
> API
> https://gitlab.gnome.org/GNOME/libxml2/-/issues/889
> 
> [CVE-2025-32415] Heap-based Buffer Overflow in 
> xmlSchemaIDCFillNodeTables
> https://gitlab.gnome.org/GNOME/libxml2/-/issues/890
> 
> https://www.openwall.com/lists/oss-security/2025/04/17/3
> 
> Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
