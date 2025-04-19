Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4745C369C9
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 22:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6540280B9E;
	Sat, 19 Apr 2025 22:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5kO10ojhvsBD; Sat, 19 Apr 2025 22:22:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94E8680BBB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94E8680BBB;
	Sat, 19 Apr 2025 22:22:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EEF7522F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 22:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E05BA40594
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 22:22:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rw7OkmqFPyoY for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 22:22:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DA0194059A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA0194059A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA0194059A
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 22:22:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 00D9119F5A5;
 Sun, 20 Apr 2025 00:22:06 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 20 Apr 2025 00:22:06 +0200
MIME-Version: 1.0
Date: Sun, 20 Apr 2025 00:22:06 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Thomas Devoogdt <thomas.devoogdt@barco.com>
In-Reply-To: <20250418102922.13048-1-thomas@devoogdt.com>
References: <20250418102922.13048-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <e73f746213bbf27a1f1cdef44a12d735@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745101329;
 bh=6G5PH1f/QSuHyuMB7ux4fvDJ3+/pD4gDZa5QbvFcPLs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VnEkrOsXyyoyi4wH74xuffj4CJgbVbiXIdLrHXMYuW+PhobugKylo/X1E5kt+Y8hL
 BNQi6AgZXnEFoxSLmahoyCzJ+MtpXNuiVIFjbfzkI9ZSxx5sIENxpEDAxr9L22xFAS
 L9rAjHjraMx0MZpwyFl/nWg4t2LPfJfjBak4tt7in6df/mQE2L3winxc1cxAHqo+3q
 DElpWq0SG2HHdFokTKYwUB7LVZ+MD4Dke72h/aCBwa6bsvRMkq6Pg82erkI0qE/Mv7
 HlRSGUHuHdmr6blqyVP8/cV7BBNffFqtFWpu2sAakMF9mR/5bgaClzwTBxrDV2JCVS
 5mSaxjndxAXsw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=VnEkrOsX
Subject: Re: [Buildroot] [PATCH v1] package/fluent-bit: fix missing object
 runtime error
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

On 18/04/2025 12:29, Thomas Devoogdt wrote:
> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> 
> $ fluent-bit
> fluent-bit: error while loading shared libraries: libminiz.so.3: cannot 
> open shared object file: No such file or directory
> 
> Commit 527deef "package/fluent-bit: bump to 3.2.10",
> dropped the BUILD_SHARED_LIBS=OFF off part, because miniz uses
> static linking by default now, but runtime execution shows otherwise,
> so revert to fix.
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
