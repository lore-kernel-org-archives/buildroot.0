Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77B6C282EC
	for <buildroot@archiver.kernel.org>; Fri, 14 Mar 2025 21:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BEBD416CA;
	Fri, 14 Mar 2025 21:23:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YQYauwfPbH5N; Fri, 14 Mar 2025 21:23:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FC8242525
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FC8242525;
	Fri, 14 Mar 2025 21:23:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7541CC8
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 21:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6593A6FAC7
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 21:23:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Pv06UPB1U8E for <buildroot@buildroot.org>;
 Fri, 14 Mar 2025 21:23:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 781366F66E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 781366F66E
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 781366F66E
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 21:23:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 0C79119F593;
 Fri, 14 Mar 2025 22:23:29 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 14 Mar 2025 22:23:29 +0100
MIME-Version: 1.0
Date: Fri, 14 Mar 2025 22:23:29 +0100
From: Julien Olivain <ju.o@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org
In-Reply-To: <20250311214931.1558872-1-buildroot@bubu1.eu>
References: <20250311214931.1558872-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.10
Message-ID: <5e934c204ba115f6f59b233a9ace375b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741987411;
 bh=Ba+674ir4uisBWKPwL39ha2t3tdjkrMDd0rKJNggqdg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=c3w+xkp+rY4krNWgLs+pdmOIHNYXLNjuWr8jsgUiixTV8DmOWG+o9VqU4Me83SpKU
 Fve3g3jjF7E9VGiFTiE79uI/uDnkBMfvN7okD73AlnrYP7uFWSe2DNKa0IrblDlkHw
 ceWxzPAYJS9MfS1oi/hbjUjIqMMdH0k9v8IRJTtQ5G+cf+xGrwBMIPR0uYXQn9buaZ
 RNu8Gb2NXcZV6i5C+6/yqNyfQceQdOQJEVoRRIYLRN2b9itRVsJ1f6Oe6JDTBZBYo3
 9ZzvpObzJxWytTWOQLrhPQm4F42CQxM8EC4D7iO4J7t2wl55VZ4cyH2BfAnRPtTybs
 A0pTI8djPg6IQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=c3w+xkp+
Subject: Re: [Buildroot] [PATCH] package/libedit: bump to 20250104-3.1
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

On 11/03/2025 22:49, Marcus Hoffmann via buildroot wrote:
> Changelog:
> 
> 2025-01-04 Jess Thrysoee
> 
>    * all: sync with upstream source
> 
> 2024-08-08 Jess Thrysoee
> 
>    * all: sync with upstream source
> 
>    * doc/Makefile.am: fix regression. Name all manpage links as el_*
> 	(e.g. el_history.3) to avoid conflicts.
> 	Reported by Zopolis4
> 
> 2024-05-17 Jess Thrysoee
> 
>    * all: sync with upstream source
> 
> Upstream changes are theoretically viewable at [1] but not
> in a very readable form.
> 
> [1] http://cvsweb.netbsd.org/bsdweb.cgi/src/lib/libedit
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
